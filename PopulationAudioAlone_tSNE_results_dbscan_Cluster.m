function [tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,...
   AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
   PopulationAudioAlone_tSNE_results_dbscan_Cluster(PopAudioAlone_tSNE_AnalysisData3D,labelFor_tSNE_Analysis,TimeFramesFor_tSNE_Analysis,...
   FinalAudioGroupNameListFor_tSNE_Analysis,NumberOfTimeFramesForFiles_tSNE_Analysis,...
   tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,AllClustersTimeFramesPerGroup,...
   AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj,handles)



   %%%%%%% The purpose of this function is to automatically cluster vocalizations
   %%%%%%% on a figure with -tSNE results for population audio alone analysis.  
  

   if isempty(tSNE_AnalysisData3D_Scatter3_Obj)
      No_tSNE_result_Dialog=warndlg('No t-SNE results are open, please choose a t-SNE results file and open it','!! Notice !!'); 
      FinalAudioGroupNameListFor_tSNE_Analysis=[];
      AllClustersTimeFramesPerGroup={};
      AllClusters_tSNE_XYZCord={};
      AllClustersTimeFramesPerOriginalFile={};
      AllClustersTextObj={};
      return; 
   end
   
   if ~isempty(tSNE_AnalysisData3D_Scatter3_Obj)
      
      AllClustersTimeFramesPerGroup={}; %%% leave empty just for sending something back. No use for this variable anyhow...
      dbscanIDX=[];
      minpts=50;
      epsilon=1.5;
      dbscanIDX=dbscan([PopAudioAlone_tSNE_AnalysisData3D],epsilon,minpts); %%% ,((labelFor_tSNE_Analysis*max(max(PopAudioAlone_tSNE_AnalysisData3D)))*0.04)'

      FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis); 
      CurrentTimeFrameInGroupOfTimeFrames=0; 
      for FileNumberInAllGroups=1:length(FinalAudioGroupNameListFor_tSNE_Analysis) 
         dbscanIDX_ForCurrentFile=[]; 
         dbscanIDX_ForCurrentFile=dbscanIDX(CurrentTimeFrameInGroupOfTimeFrames+1:CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups));
         TimeFramesFor_tSNE_Analysis_ForCurrentFile=[];
         TimeFramesFor_tSNE_Analysis_ForCurrentFile=TimeFramesFor_tSNE_Analysis(CurrentTimeFrameInGroupOfTimeFrames+1:CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups));
         for CurrentClusterNumber=1:max(dbscanIDX) 
            AllClustersTimeFramesPerOriginalFile{FileNumberInAllGroups}{CurrentClusterNumber}=...
            TimeFramesFor_tSNE_Analysis_ForCurrentFile(dbscanIDX_ForCurrentFile==CurrentClusterNumber);
         end
         CurrentTimeFrameInGroupOfTimeFrames=CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups);
      end
     
      %%%%% Plot tSNE results
      FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis);
      axes(handles.LeftAxes);
      cla reset;
      set(handles.LeftAxes,'box','on','Visible','on')
      hold on;  
      title('3D tSNE results, Perplexity=500');
      for GroupNum=1:length(FinalGroupsNamesForPresentation)
         tSNE_AnalysisData3D_Scatter3_Obj{GroupNum} = scatter3(PopAudioAlone_tSNE_AnalysisData3D(find(labelFor_tSNE_Analysis==GroupNum), 1), ...
                  PopAudioAlone_tSNE_AnalysisData3D(find(labelFor_tSNE_Analysis==GroupNum), 2), ...
                  PopAudioAlone_tSNE_AnalysisData3D(find(labelFor_tSNE_Analysis==GroupNum), 3), ...
                  10,labelFor_tSNE_Analysis(find(labelFor_tSNE_Analysis==GroupNum)),'filled','DisplayName',char(FinalGroupsNamesForPresentation{GroupNum}));
         legend('show');
         TimeFramesFor_tSNE_Analysis_for_Scatter3_obj{GroupNum}=TimeFramesFor_tSNE_Analysis(find(labelFor_tSNE_Analysis==GroupNum));
      end
      view(40,35)
      grid;
      hold off; 
      handles.LeftAxes.Toolbar.Visible = 'on';
    
      axes(handles.RightAxes);
      cla reset;
      set(handles.RightAxes,'box','on','Visible','on')
      title('3D-tSNE plot with automatic dbscan clustered data');
      hold on; 
      for CurrentClusterNumber=1:max(dbscanIDX)
         Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj=[]; 
         Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj=[...
            PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),1), ...  %%%%% X cord
            PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),2), ...  %%%%% Y cord
            PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),3)];     %%%%% Z cord
         AllClusters_tSNE_XYZCord{CurrentClusterNumber}=Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj; 
          
         CurrentClusterColor=[]; CurrentClusterColor(1:length(PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),1)))=CurrentClusterNumber; 
         Cluster_tSNE_AnalysisData3D_Scatter3_Obj{CurrentClusterNumber}=...
            scatter3(PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),1), ...
                     PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),2), ...
                     PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),3), ...
                     10,CurrentClusterColor,'DisplayName',['Cluster ' num2str(CurrentClusterNumber)]);
         legend('show');
         ClusterTextObj=text(mean(PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),1)),...
                             mean(PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),2)),...
                             mean(PopAudioAlone_tSNE_AnalysisData3D(find(dbscanIDX==CurrentClusterNumber),3)),...
                             ['Cl ' num2str(CurrentClusterNumber)],'FontSize',20,'Color','r');
         AllClustersTextObj{CurrentClusterNumber}=ClusterTextObj;
      end
      handles.RightAxes.CameraPosition=handles.LeftAxes.CameraPosition;
      handles.RightAxes.View=handles.LeftAxes.View;
      handles.RightAxes.XLim=handles.LeftAxes.XLim;
      handles.RightAxes.YLim=handles.LeftAxes.YLim;
      handles.RightAxes.ZLim=handles.LeftAxes.ZLim;
      grid;
      hold off; 
      handles.RightAxes.Toolbar.Visible = 'on';
   end
end

 
       

 