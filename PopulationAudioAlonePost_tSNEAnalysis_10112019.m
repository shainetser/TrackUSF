function PopulationAudioAlonePost_tSNEAnalysis_10112019(AudioClustersFilesPath,AudioClustersfileList,AudioFilesPath,AudiofileList,handles)

%%%%%%% This function extracts audio data and the clusters detected by tSNE
%%%%%%% analysis and present it in various ways.
   
   Fs=250000;
   NumOfFiles=[length(AudioClustersfileList) length(AudiofileList)];
   NumOfFiles=NumOfFiles(find(NumOfFiles>0));
   if find(diff(NumOfFiles)>0)
      handles.MainStatusTextEditBox.String='The number of files of time stamps and audio is not equal'; 
      uiwait(msgbox('The number of files of time stamps and audio is not equal','Notic!!!','modal'));
      return;
   end
   
   NoiseClusters=str2num(get(handles.PopPost_tSNE_NoiseClusterEditBox,'string'));
   
   %%%%%% Extract number of clusters %%%%%%
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,1}];
   load(CurrentSessionAudioClustersFileToPresent);
   NumOfClusters=length(AllClustersForFile);
   AudioSegmentsPerClusterForCrossCorr{1,NumOfClusters}=[];
   AudioSegmentsPerClusterForAveragePSD{1,NumOfClusters}=[];
   ClustersHistAfterEachClusterDetection=cell(NumOfClusters);
   HalfMaxTimeValuesOwnClustersHistRepeatProbability=cell(1,NumOfClusters);
   if ~isempty(AudiofileList)
      NumberOfDetectionsPerCluster(min([length(AudioClustersfileList) length(AudiofileList)]),NumOfClusters+1)=0;
      TotalFileNum=min([length(AudioClustersfileList) length(AudiofileList)]);
   elseif isempty(AudiofileList)
      NumberOfDetectionsPerCluster(length(AudioClustersfileList),NumOfClusters+1)=0; 
      TotalFileNum=length(AudioClustersfileList);
   end
   CurrentClusterDataInBins{1,NumOfClusters}=[];
      
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   for FileNumber=1:TotalFileNum
      
      handles.MainStatusTextEditBox.String=['Analyzing file number ' num2str(FileNumber)];
      pause(1);
      
      %%%%%%%%%%% From TimesStampsfileList
      CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,FileNumber}];
      load(CurrentSessionAudioClustersFileToPresent);
      CurrentSessionAudioClustersFileDataToPresent={};
      CurrentSessionAudioClustersFileDataToPresent=AllClustersForFile;
   
      if handles.Audio_tSNE_ClustersProbabilityToOthersCheckbox.Value==1 || handles.PopAudio_tSNE_AverPSDSameClusterCheckbox.Value==1 || handles.PSD_AlUSFsExcludingNoiseCheckbox.Value==1    
         %%%%%%%%%%%%% From AudiofileList
         CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,FileNumber}];
         load(CurrentSessionAudioFileToPresent);
         CurrentSessionAudioFileDataToPresent=[];
         CurrentSessionAudioFileDataToPresent=TempAudioData(1:end); %%%% Removing 7 seconds at the beginning, as was done for finding the clusters.
      end
      
      %%%%%%%%%% Analyze the data  according to the function chosen in the main GUI %%%%%%
      if handles.Audio_tSNE_NumOfCallsPerClusterCheckbox.Value==1 || handles.PSD_AlUSFsExcludingNoiseCheckbox.Value==1 || handles.PopAudio_tSNE_AverPSDSameClusterCheckbox.Value==1 
         for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
            CurrentClusterTimePoints=CurrentSessionAudioClustersFileDataToPresent{1,ClusterNum}; 
            NumberOfDetectionsPerCluster(FileNumber,ClusterNum)=length(CurrentClusterTimePoints);
            if sum(NoiseClusters==ClusterNum)==0
               NumberOfDetectionsPerCluster(FileNumber,end)=NumberOfDetectionsPerCluster(FileNumber,end)+length(CurrentClusterTimePoints);
            end
         end  
      end

      if handles.Audio_tSNE_ClustersProbabilityToOthersCheckbox.Value==1
         Edges=-0.4960:0.006:0.4960;
         for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
            CurrentClusterTimePoints=CurrentSessionAudioClustersFileDataToPresent{1,ClusterNum}; 
            for y=1:length(CurrentClusterTimePoints)
               if CurrentClusterTimePoints(y)<length(CurrentSessionAudioFileDataToPresent)/Fs-0.4960 & CurrentClusterTimePoints(y)>0.4960 
                  for z=1:length(CurrentSessionAudioClustersFileDataToPresent) 
                     TempClustersAfterCurrentClusterDetection=...
                     CurrentSessionAudioClustersFileDataToPresent{1,z}...
                     (find(CurrentSessionAudioClustersFileDataToPresent{1,z}>CurrentClusterTimePoints(y)-0.4960 & ...
                     CurrentSessionAudioClustersFileDataToPresent{1,z}<CurrentClusterTimePoints(y)+0.4960)) ...
                     -CurrentClusterTimePoints(y); 
                     ClustersHistAfterEachClusterDetection{ClusterNum,z}=[ClustersHistAfterEachClusterDetection{ClusterNum,z}; ...
                     histcounts(TempClustersAfterCurrentClusterDetection,Edges)];
                  end
               end
            end
         end
      end
      
      if handles.PopAudioClustersNumAlongTimeCheckBox.Value==1
         Edges=0:1:15; 
         for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
            CurrentClusterData=[]; 
            CurrentClusterData=CurrentSessionAudioClustersFileDataToPresent{1,ClusterNum}/60; 
            [CurrentClusterDataInBinsTemp,Edges]=histcounts(CurrentClusterData,Edges);
            CurrentClusterDataInBins{1,ClusterNum}=[CurrentClusterDataInBins{1,ClusterNum};CurrentClusterDataInBinsTemp];
         end  
      end
      
      if handles.PopAudio_tSNE_AverPSDSameClusterCheckbox.Value==1 || handles.PSD_AlUSFsExcludingNoiseCheckbox.Value==1
         for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
            CurrentClusterTimePoints=CurrentSessionAudioClustersFileDataToPresent{1,ClusterNum}; 
            for l=1:length(CurrentClusterTimePoints)
               if CurrentClusterTimePoints(l)*Fs<length(CurrentSessionAudioFileDataToPresent)-0.1*Fs & CurrentClusterTimePoints(l)*Fs>0.1*Fs 
                  tempPSD=[]; PSD_Frequencies=[];
                  [S,PSD_Frequencies,T,tempPSD]=spectrogram(CurrentSessionAudioFileDataToPresent(round(CurrentClusterTimePoints(l)*Fs-0.1*Fs):round(CurrentClusterTimePoints(l)*Fs+0.1*Fs)),2^9,[],[],Fs);
                  if isempty(AudioSegmentsPerClusterForAveragePSD{1,ClusterNum})
                     AudioSegmentsPerClusterForAveragePSD{1,ClusterNum}= ...
                     (mean(tempPSD(32:206,98:104),2)-mean(mean(tempPSD(32:206,98:104),2)))/max(mean(tempPSD(32:206,98:104),2)-mean(mean(tempPSD(32:206,98:104),2)));
                  else
                     AudioSegmentsPerClusterForAveragePSD{1,ClusterNum}=[AudioSegmentsPerClusterForAveragePSD{1,ClusterNum}, ...
                     (mean(tempPSD(32:206,98:104),2)-mean(mean(tempPSD(32:206,98:104),2)))/max(mean(tempPSD(32:206,98:104),2)-mean(mean(tempPSD(32:206,98:104),2)))];
                  end
               end
            end
         end  
      end
      
      disp(['File number ' num2str(FileNumber) ' out of ' num2str(TotalFileNum) ' was analyzed'])
   end 
   
   %%%%%%%%%% Plot the data  according to the function chosen in the main GUI %%%%%%
   
   if handles.Audio_tSNE_ClustersProbabilityToOthersCheckbox.Value==1   
      NumOfSubplot=size(ClustersHistAfterEachClusterDetection,1);
      NumOfSubplot=ceil(sqrt(NumOfSubplot));
      figure('Name','Population Post-tSNE clusters analysis - probability and repeatability  of clusters');
      for ClusterNum=1:size(ClustersHistAfterEachClusterDetection,1)
         subplot(NumOfSubplot,NumOfSubplot,ClusterNum);
         hold on;
         for l=1:size(ClustersHistAfterEachClusterDetection,1)   
            if ~isempty(ClustersHistAfterEachClusterDetection{ClusterNum,l}) 
               Edges=-0.4960:0.006:0.4960; 
               plot(Edges(1:end-1),mean(ClustersHistAfterEachClusterDetection{ClusterNum,l},1));
               MaxPoint=max(mean(ClustersHistAfterEachClusterDetection{ClusterNum,l},1)); 
               if MaxPoint(1,1)>0
                  TextX_Value=Edges(find(mean(ClustersHistAfterEachClusterDetection{ClusterNum,l},1)==MaxPoint(1,1))); 
                  text(TextX_Value(1,1),MaxPoint(1,1)+0.05,num2str(l));
                  if ClusterNum==l
                     TempHalfMaxValues=[]; SortedValues=[]; IndexOfSortedValues=[]; HalfMaxTimeValuesNegative=[]; HalfMaxTimeValuesPositive=[];
                     TempHalfMaxValues=MaxPoint/2;
                     [SortedValues,IndexOfSortedValues]=sort(abs(mean(ClustersHistAfterEachClusterDetection{ClusterNum,l},1)-TempHalfMaxValues));
                     IndexOfSortedValues=IndexOfSortedValues-83;
                     if IndexOfSortedValues(1)<0
                        HalfMaxTimeValuesNegative=IndexOfSortedValues(1); 
                        HalfMaxTimeValuesPositive=IndexOfSortedValues(find(IndexOfSortedValues>0)); 
                        HalfMaxTimeValuesPositive=HalfMaxTimeValuesPositive(1);
                        HalfMaxTimeValuesOwnClustersHistRepeatProbability{1,ClusterNum}=[HalfMaxTimeValuesNegative HalfMaxTimeValuesPositive];
                     elseif IndexOfSortedValues(1)>0
                        HalfMaxTimeValuesPositive=IndexOfSortedValues(1); 
                        HalfMaxTimeValuesNegative=IndexOfSortedValues(find(IndexOfSortedValues<0)); 
                        HalfMaxTimeValuesNegative=HalfMaxTimeValuesNegative(1);
                        HalfMaxTimeValuesOwnClustersHistRepeatProbability{1,ClusterNum}=[HalfMaxTimeValuesPositive*0.006 HalfMaxTimeValuesPositive*0.006]; 
                     end
                  end
               end
            else
               plot(Edges(1:end-1),zeros(1,length(Edges(1:end-1)))); 
            end 
         end
         title({['Cluster ' num2str(ClusterNum) ' n=' num2str(size(ClustersHistAfterEachClusterDetection{ClusterNum,l},1))];...
         ['Repeatablility duration (HalfMax width) = ' num2str(HalfMaxTimeValuesPositive*0.01-HalfMaxTimeValuesNegative*0.01) ' sec']})
         ylim([0 1])
         if ClusterNum==1
            legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17',...
                   '18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36' ,'37' ,'38' ,'39' ,'40' ,'41' ,'42' ,'43' ,'45' )
            xlabel('Time (Sec)');
            ylabel('Probability');
         end
      end 
   end
   
   if handles.Audio_tSNE_NumOfCallsPerClusterCheckbox.Value==1
       
      NumOfSubplot=size(NumberOfDetectionsPerCluster,2)-1+4;
      NumOfSubplot=ceil(sqrt(NumOfSubplot)); 
      
      figure('Name','Population Post-tSNE clusters analysis - Number of USFs');
      subplot(NumOfSubplot,NumOfSubplot,1)
      hold on;
      for i=1:size(NumberOfDetectionsPerCluster,2)      
         errorbar(i,mean(NumberOfDetectionsPerCluster(:,i),1),std(NumberOfDetectionsPerCluster(:,i),0,1)/sqrt(size(NumberOfDetectionsPerCluster(:,i),1)),...
         '*b','MarkerEdgeColor','b','MarkerFaceColor','b');
         ScatterPointsValue(1:length(NumberOfDetectionsPerCluster(:,i)))=rand(1,length(NumberOfDetectionsPerCluster(:,i)))/4+i;
         scatter(ScatterPointsValue,NumberOfDetectionsPerCluster(:,i),'k')
      end
      xlabel('Cluster number');
      ylabel('Number of USFs');
      xlim([0 size(NumberOfDetectionsPerCluster,2)+1]);
      ylim([0 max(max(NumberOfDetectionsPerCluster))+100]);
      ax = gca;
      ax.XTick=1:1:(size(NumberOfDetectionsPerCluster,2));
      clear TempXLabels
      TempXLabels{1,size(NumberOfDetectionsPerCluster,2)}=[];
      for i=1:(size(NumberOfDetectionsPerCluster,2)-1)
         TempXLabels{1,i}=num2str(i);
      end
      TempXLabels{1,i+1}='All(without Noise)';
      ax.XTickLabel = (TempXLabels);
      title('Number of USFs per cluster')
      hold off; 
      
      subplot(NumOfSubplot,NumOfSubplot,2)
      hold on;
      Edges=[]; NumOfSessions=[];
      Edges=[0 200 400 600 800 1000 1200 1400 1600 1800 2000 30000];
      [NumOfSessions,Edges]=histcounts(NumberOfDetectionsPerCluster(:,end),Edges);
      X_Values=[1:1:(length(Edges)-1)];
      bar(X_Values,NumOfSessions);
      ax = gca;
      ax.TickDir='out';
      xticks(X_Values);
      xticklabels({'200','400','600','800','1000','1200','1400','1600','1800','2000','>2000'});
      ylim([0 max(NumOfSessions)+2]);
      xlabel('Number of USFs');
      ylabel('Number of sessions');
      title({'Number of sessions per number of USFs';'(excluding noise)'});
      hold off; 
      
      subplot(NumOfSubplot,NumOfSubplot,3)
      hold on;
      Edges=[]; NumOfSessions=[];
      Edges=[0 50 100 150 200 250 300 350 400 450 500 600 700 30000];
      [NumOfSessions,Edges]=histcounts(NumberOfDetectionsPerCluster(:,end),Edges);
      labels = {['0-50 ' '(n=' num2str(NumOfSessions(1)) ')'],['50-100 ' '(n=' num2str(NumOfSessions(2)) ')'],['100-150 ' '(n=' num2str(NumOfSessions(3)) ')'],...
                  ['150-200 ' '(n=' num2str(NumOfSessions(4)) ')'],['200-250 ' '(n=' num2str(NumOfSessions(5)) ')'],['250-300 ' '(n=' num2str(NumOfSessions(6)) ')'],...
                  ['300-350 ' '(n=' num2str(NumOfSessions(7)) ')'],['350-400 ' '(n=' num2str(NumOfSessions(8)) ')'],['400-450 ' '(n=' num2str(NumOfSessions(9)) ')'],...
                  ['450-500 ' '(n=' num2str(NumOfSessions(10)) ')'],['500-600 ' '(n=' num2str(NumOfSessions(11)) ')'],['600-700 ' '(n=' num2str(NumOfSessions(12)) ')'],...
                  ['>700 ' '(n=' num2str(NumOfSessions(13)) ')']};
      pie(NumOfSessions,labels);
      text(-1,1.3,['Total number of sessions: ' num2str(sum(NumOfSessions))])
      title({'Number of sessions per number of total USFs'; '(excluding noise)'})
      xlim([-1.05 1.05]);
      ylim([-1.5 1.5]);
%       axis off;
      hold off; 
      
      for ClusterNum=1:(size(NumberOfDetectionsPerCluster,2)-1)
         subplot(NumOfSubplot,NumOfSubplot,ClusterNum+3);
         hold on; 
         Edges=[]; NumOfSessions=[];
         Edges=[0 50 100 150 200 250 300 350 400 450 500 600 700 30000];
         [NumOfSessions,Edges]=histcounts(NumberOfDetectionsPerCluster(:,ClusterNum),Edges);
         labels = {['0-50 ' '(n=' num2str(NumOfSessions(1)) ')'],['50-100 ' '(n=' num2str(NumOfSessions(2)) ')'],['100-150 ' '(n=' num2str(NumOfSessions(3)) ')'],...
                  ['150-200 ' '(n=' num2str(NumOfSessions(4)) ')'],['200-250 ' '(n=' num2str(NumOfSessions(5)) ')'],['250-300 ' '(n=' num2str(NumOfSessions(6)) ')'],...
                  ['300-350 ' '(n=' num2str(NumOfSessions(7)) ')'],['350-400 ' '(n=' num2str(NumOfSessions(8)) ')'],['400-450 ' '(n=' num2str(NumOfSessions(9)) ')'],...
                  ['450-500 ' '(n=' num2str(NumOfSessions(10)) ')'],['500-600 ' '(n=' num2str(NumOfSessions(11)) ')'],['600-700 ' '(n=' num2str(NumOfSessions(12)) ')'],...
                  ['>700 ' '(n=' num2str(NumOfSessions(13)) ')']};
         pie(NumOfSessions,labels);
         title({'#sessions per #USFs'; ['cluster ' num2str(ClusterNum)]})
         xlim([-1.05 1.05]);
         ylim([-1.5 1.5]);
%          axis off;
         hold off;
      end
      
      clear VarNames
      VarNames{1,size(NumberOfDetectionsPerCluster,2)}=[];
      for i=1:(size(NumberOfDetectionsPerCluster,2)-1)
         VarNames{1,i}=['Cluster_' num2str(i)]; 
      end
      VarNames{1,size(NumberOfDetectionsPerCluster,2)}='Sum_of_all_clusters_without_noise';
      VarNames=string(VarNames);
      DataForExcelTable=[]; DataForExcelTable=NumberOfDetectionsPerCluster;
      DataForExcelTable=[VarNames; DataForExcelTable];
      T = table([{'File name'}, AudiofileList]',DataForExcelTable);
      T.Properties.VariableNames = {'Name','Cluster'};
      fileID='TrackUSF_NumberOfFragmentsResults.xlsx';
      writetable(T,fileID);
   
   end  
   
   if handles.PopAudioClustersNumAlongTimeCheckBox.Value==1
      try
         figure('Name','Population Post-tSNE clusters analysis - number of USFs along time');
         NumOfSubplotsRows=ceil(size(CurrentClusterDataInBins,2)/3);
         CurrentSubplot=1;
         for ClusterNumber=1:size(CurrentClusterDataInBins,2)
            subplot(NumOfSubplotsRows,3,CurrentSubplot); 
            hold on;
            bar(1:1:size(CurrentClusterDataInBins{1,ClusterNumber},2),mean(CurrentClusterDataInBins{1,ClusterNumber},1),0.4,'b');
            errorbar(1:1:size(CurrentClusterDataInBins{1,ClusterNumber},2),mean(CurrentClusterDataInBins{1,ClusterNumber},1),...
            std(CurrentClusterDataInBins{1,ClusterNumber},0,1)/sqrt(size(CurrentClusterDataInBins{1,ClusterNumber},1)),'b','LineStyle','none');
            xlim([0 16])
            xlabel('Time (1 min bin)');
            ylabel('Num of USFs');
            title(['Cluster ' num2str(ClusterNumber)]);
            hold off; 
            CurrentSubplot=CurrentSubplot+1;
         end
      end
   end
   
   if handles.PopAudio_tSNE_AverPSDSameClusterCheckbox.Value==1
      figure('Name','Population Post-tSNE clusters analysis - mean PSD per cluster');
      hold on;
      for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
         TempMeanAudioDetection=mean(AudioSegmentsPerClusterForAveragePSD{1,ClusterNum},2);
         try
            plot(PSD_Frequencies(32:206),TempMeanAudioDetection,'DisplayName',['Cluster ' num2str(ClusterNum) ' n=' num2str(sum(NumberOfDetectionsPerCluster(:,ClusterNum)))]);
            if max(TempMeanAudioDetection)>0
               MaxPointLocation=find(TempMeanAudioDetection==max(TempMeanAudioDetection)); 
               text(PSD_Frequencies(MaxPointLocation(1)+32),max(TempMeanAudioDetection),num2str(ClusterNum));
            end
         end
      end
      xlim([15100 100000]);
      xlabel('Frequency (Hz)'); 
      ylabel('Normalized power');
      title('Population Post-tSNE clusters analysis - mean PSD per cluster')
      legend('show')
   end
   
   if handles.PSD_AlUSFsExcludingNoiseCheckbox.Value==1
      figure('Name','Population Post-tSNE clusters analysis - mean PSD per cluster');
      hold on;
      FinalMeanPSDAllCLusters=[];
      for ClusterNum=1:length(CurrentSessionAudioClustersFileDataToPresent)
         TempMeanAudioDetection=mean(AudioSegmentsPerClusterForAveragePSD{1,ClusterNum},2);
         if sum(NoiseClusters==ClusterNum)==0
            TempMeanAudioDetection=TempMeanAudioDetection*sum(NumberOfDetectionsPerCluster(:,ClusterNum))/sum(NumberOfDetectionsPerCluster(:,end));
            FinalMeanPSDAllCLusters=[FinalMeanPSDAllCLusters,TempMeanAudioDetection];
         end
      end
      plot(PSD_Frequencies(32:206),sum(FinalMeanPSDAllCLusters,2));
      xlim([15100 100000]);
      xlabel('Frequency (Hz)'); 
      ylabel('Normalized power');
      title({'Population Post-tSNE clusters analysis'; 'Mean normalized sum of all clusters'});
       
   end
     
end



 




