function [PopAudioAlone_tSNE_AnalysisData3D,MFCC_All,FinalAudioGroupNameListAfterMFCC,FinalAudioFullNameListAfterMFCC,NumberOfTimeFramesForFiles,...
         TimeFramesAfterNoiseRemover_All,label]=PopulationAudioAlone_tSNE_Analysis_07032018(... 
         tSNEAudioGroup_A_FileList,tSNEAudioGroup_A_FilePath,tSNEAudioGroup_B_FileList,tSNEAudioGroup_B_FilePath,...
         tSNEAudioGroup_C_FileList,tSNEAudioGroup_C_FilePath,tSNEAudioGroup_D_FileList,tSNEAudioGroup_D_FilePath,...
         tSNEAudioGroup_E_FileList,tSNEAudioGroup_E_FilePath,tSNEAudioGroup_F_FileList,tSNEAudioGroup_F_FilePath,...
         tSNEAudioGroup_G_FileList,tSNEAudioGroup_G_FilePath,tSNEAudioGroup_H_FileList,tSNEAudioGroup_H_FilePath,...
         tSNEAudioGroup_I_FileList,tSNEAudioGroup_I_FilePath,tSNEAudioGroup_J_FileList,tSNEAudioGroup_J_FilePath,...
         tSNEAudioGroup_K_FileList,tSNEAudioGroup_K_FilePath,tSNEAudioGroup_L_FileList,tSNEAudioGroup_L_FilePath,handles)
%%%%% The purpose of this analyzer is to extract audio signals from WAV
%%%%% files. First, the signals are detected by threshold, taking into account 15-100Khz only.
%%%%% Afterwards, the detected signals are passed through a mel frequency cepstral coefficients (MFCCs - from a speech signal)
%%%%% Finaly, the ceptral coefficients are passeed through a tSNE algorithm
%%%%% for presentation.

%%%%% It is based on original codes from Gili Weiss and roei dadush, 
%%%%% who wrote it as part of a project they did under the supervision of Prof' Koby Krammer (Technion) and Prof' Shlomo Wagner (Haifa university)  

PopAudioAlone_tSNE_AnalysisData3D=[];
MFCC_All=[];
FinalAudioGroupNameListAfterMFCC=[];
FinalAudioFullNameListAfterMFCC=[];
NumberOfTimeFramesForFiles=[];
TimeFramesAfterNoiseRemover_All=[];
label=[];

AddFileToFinalList=1;
FinalAudioFileList={};
FinalAudioPathsList={};
FinalAudionGroupNameListBeforeMFCC={};

if ~isempty(tSNEAudioGroup_A_FileList)
   for FileNum=1:length(tSNEAudioGroup_A_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_A_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_A_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_A_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_B_FileList)
   for FileNum=1:length(tSNEAudioGroup_B_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_B_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_B_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_B_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_C_FileList)
   for FileNum=1:length(tSNEAudioGroup_C_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_C_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_C_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_C_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_D_FileList)
   for FileNum=1:length(tSNEAudioGroup_D_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_D_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_D_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_D_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_E_FileList)
   for FileNum=1:length(tSNEAudioGroup_E_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_E_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_E_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_E_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_F_FileList)
   for FileNum=1:length(tSNEAudioGroup_F_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_F_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_F_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_F_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_G_FileList)
   for FileNum=1:length(tSNEAudioGroup_G_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_G_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_G_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_G_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_H_FileList)
   for FileNum=1:length(tSNEAudioGroup_H_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_H_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_H_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_H_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_I_FileList)
   for FileNum=1:length(tSNEAudioGroup_I_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_I_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_I_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_I_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_J_FileList)
   for FileNum=1:length(tSNEAudioGroup_J_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_J_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_J_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_J_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_K_FileList)
   for FileNum=1:length(tSNEAudioGroup_K_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_K_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_K_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_K_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end
if ~isempty(tSNEAudioGroup_L_FileList)
   for FileNum=1:length(tSNEAudioGroup_L_FileList) 
      FinalAudioFileList{AddFileToFinalList}=tSNEAudioGroup_L_FileList{FileNum};
      FinalAudioPathsList{AddFileToFinalList}=tSNEAudioGroup_L_FilePath;
      FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}=get(handles.tSNEAudioGroup_L_PopNameEditBox,'string');
      AddFileToFinalList=AddFileToFinalList+1;
   end
end

if isempty(tSNEAudioGroup_A_FileList) & isempty(tSNEAudioGroup_B_FileList) & isempty(tSNEAudioGroup_C_FileList) & isempty(tSNEAudioGroup_D_FileList) & ...
   isempty(tSNEAudioGroup_E_FileList) & isempty(tSNEAudioGroup_F_FileList) & isempty(tSNEAudioGroup_G_FileList) & isempty(tSNEAudioGroup_H_FileList) & ...
   isempty(tSNEAudioGroup_I_FileList) & isempty(tSNEAudioGroup_J_FileList) & isempty(tSNEAudioGroup_K_FileList) & isempty(tSNEAudioGroup_L_FileList)
   if ~isempty(AudiofileList)
      for FileNum=1:length(AudiofileList) 
         FinalAudioFileList{AddFileToFinalList}=AudiofileList{FileNum};
         FinalAudioPathsList{AddFileToFinalList}=AudioFilesPath;
         FinalAudionGroupNameListBeforeMFCC{AddFileToFinalList}='All';
         AddFileToFinalList=AddFileToFinalList+1;
      end 
   end
end

%%%%%%%%%%%%%%%%%%%%% Remove Noise and get the MFCC analysis data, including timestamps of each segment of the data that cross an arbitrary threshold %%%%    
   MFCC_All=[];
   TimeFramesAfterNoiseRemover_All=[];
   NumberOfTimeFramesForFiles=[];
   FinalAudioGroupNameListAfterMFCC=cell(1,length(FinalAudionGroupNameListBeforeMFCC));
   FinalAudioFullNameListAfterMFCC=cell(1,length(FinalAudionGroupNameListBeforeMFCC));
   
   handles.MainStatusTextEditBox.String='Please choose a folder name and location for saving the results';
   TimeAndDate=datetime('now','TimeZone','local','Format','yyyy-MM-dd');
   [SaveDataFileName,SaveDataPath] = uiputfile('Audio_tSNE_results.mat','Please choose a folder name and location for saving the results');
   if SaveDataFileName==0
      return;
   end
   NewFolderName=join([SaveDataPath 'Audio_tSNE_results_' string(TimeAndDate)],"");
   mkdir (char(NewFolderName)) 
   
   handles.MainStatusTextEditBox.String='Starting analysis';
   pause(1);
   ParralelPool = gcp(); %%%%%%%%%% Activate a parallel pool process and get the current parallel pool
   for FileNum=1:length(FinalAudioFileList)
      FileIndex(FileNum)=parfeval(ParralelPool,@GetMFCC_from_data,2,FinalAudioPathsList{FileNum}, FinalAudioFileList{FileNum},NewFolderName,handles);
   end
   
   FileNumComplitedOrder=1;
   for FileNum=1:length(FinalAudioFileList)
      Temp_MFCCs=[]; 
      TempTimeFramesAfterNoiseRemover=[];
      % fetchNext blocks until next results are available.
      [completedIdx,Temp_MFCCs,TempTimeFramesAfterNoiseRemover] = fetchNext(FileIndex);
      MFCC_All=[MFCC_All Temp_MFCCs];
      TimeFramesAfterNoiseRemover_All=[TimeFramesAfterNoiseRemover_All; TempTimeFramesAfterNoiseRemover];
      NumberOfTimeFramesForFiles=[NumberOfTimeFramesForFiles, length(TempTimeFramesAfterNoiseRemover)];
      FinalAudioGroupNameListAfterMFCC{FileNumComplitedOrder}=FinalAudionGroupNameListBeforeMFCC{completedIdx};
      FinalAudioFullNameListAfterMFCC{FileNumComplitedOrder}=FinalAudioFileList{completedIdx};
      FileNumComplitedOrder=FileNumComplitedOrder+1;
      disp(['Got and save results of file - ' FinalAudioFileList{completedIdx}]);
      handles.MainStatusTextEditBox.String=['Got and save results of file - ' FinalAudioFileList{completedIdx}];
   end
   
   %%%%% save MFCC analysis data for cases when the matlab crash....
   TimeAndDate=datetime('now','TimeZone','local','Format','yyyy-MM-dd');
   filename=join(['\Temp_MFCC_results' string(TimeAndDate)]);
   save(join([NewFolderName filename],""),'MFCC_All','FinalAudioGroupNameListAfterMFCC','FinalAudioFullNameListAfterMFCC','NumberOfTimeFramesForFiles','TimeFramesAfterNoiseRemover_All')
   disp('MFCC data was saved');
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% run 3D t-SNE  %%%%%%%%%%%%
   handles.MainStatusTextEditBox.String='Performing 3D-tSNE on the data, this may take a lot of time........ (even hours or days)';
   pause(1);
   disp('Performing 3D-tSNE on the data, this may take a lot of time........ (even hours or days)');
   PopAudioAlone_tSNE_AnalysisData3D = tsne(MFCC_All','Perplexity',500, 'NumDimensions',3);

   %%%%%% Make labels vector for tSNE presentation %%%%%%
   label=ones(1,size(PopAudioAlone_tSNE_AnalysisData3D,1));
   LabelNum=1;
   FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListAfterMFCC);
   for CurrentGroupForLabels=1:length(FinalAudioGroupNameListAfterMFCC) %length(NumberOfTimeFramesForFiles)
      for GroupNameOptions=1:length(FinalGroupsNamesForPresentation) 
         if strcmp(FinalAudioGroupNameListAfterMFCC{CurrentGroupForLabels},FinalGroupsNamesForPresentation{GroupNameOptions})
            label(LabelNum:LabelNum+NumberOfTimeFramesForFiles(CurrentGroupForLabels)-1)=GroupNameOptions;
            LabelNum=LabelNum+NumberOfTimeFramesForFiles(CurrentGroupForLabels);
         end
      end
   end
      
   %%%%% Plot tSNE results
   figure('Name','Population analysis for ultra-sonic vocalizations (audio) ');
   hold on; 
   title('3D tSNE results, Perplexity=500');
   for GroupNum=1:length(FinalGroupsNamesForPresentation)
      scatter3(PopAudioAlone_tSNE_AnalysisData3D(find(label==GroupNum), 1), PopAudioAlone_tSNE_AnalysisData3D(find(label==GroupNum), 2),PopAudioAlone_tSNE_AnalysisData3D(find(label==GroupNum), 3), 10,label(find(label==GroupNum)),'filled','DisplayName',char(FinalGroupsNamesForPresentation{GroupNum}));
      legend('show');
   end
   view(40,35)
   grid;
   hold off; 
     
   %%%%%%%% save 3D-tSNE analyzed data to file
   TimeAndDate=datetime('now','TimeZone','local','Format','yyyy-MM-dd');
   filename=join(['\3D_tSNE_results' string(TimeAndDate)]);
   save(join([NewFolderName filename],""),'PopAudioAlone_tSNE_AnalysisData3D','MFCC_All','FinalAudioGroupNameListAfterMFCC','FinalAudioFullNameListAfterMFCC','NumberOfTimeFramesForFiles','TimeFramesAfterNoiseRemover_All','label');
   disp('3D-tSNE data was saved');
   handles.MainStatusTextEditBox.String='3D-tSNE data was saved';
end
   

function [Temp_MFCCs,TempTimeFramesAfterNoiseRemover]=GetMFCC_from_data(AudioBehavioralpath, AudioBehavioralfile, NewFolderName,handles)
   TempAudioData=[];
   TempNewSignal=[];
   TempTimeFramesAfterNoiseRemover=[];
   [TempAudioData,Fs] = audioread([AudioBehavioralpath AudioBehavioralfile]);
   save(join([NewFolderName '\' AudioBehavioralfile(1:end-4) '.mat'],""),'TempAudioData')
   disp(['Data was read for file name: ' AudioBehavioralfile])
   [TempNewSignal, TempTimeFramesAfterNoiseRemover]=noise_remover_15K_FINAL(TempAudioData,Fs,handles); 
   disp(['Noise was removed and vocalizations were detected for file name: ' AudioBehavioralfile])
   [Temp_MFCCs, ~, ~ ] = MFCC_Gili_15K(TempNewSignal, Fs);
end


   
function [new_signal, time_frames] = noise_remover_15K_FINAL(signal, Fs,handles)

   Threshold=str2double(get(handles.tSNEAudioAnalysisThresholdPopEditbox,'String'));
   signal=signal(1:end);
   thresh = 0; % make sure there's something recorded
   frame_duration = 0.006;
   frame_len = Fs*frame_duration;
   N = length(signal);
   num_frames = floor(N/frame_len);

   new_signal = []; 
   time_frames = [];
   for k = 1:num_frames
      frame = signal( (k-1)*frame_len + 1 : k*frame_len);
      max_val = max(frame);

      if (max_val > thresh)
         spectrum = abs(fftshift(fft(frame)));
         if max(spectrum(838:1500)) > Threshold %% **threshold chosen qualitively**
            %1 % check only after f = 15 Khz, 
            new_signal = [ new_signal; frame];
            added_time = (k*frame_duration); % in [sec]
            time_frames = [time_frames; added_time];
         end
      end
   end
end
