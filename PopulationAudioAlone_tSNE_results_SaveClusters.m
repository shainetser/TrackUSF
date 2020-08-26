function PopulationAudioAlone_tSNE_results_SaveClusters(FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
NumberOfTimeFramesForFiles_tSNE_Analysis,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,...
AllClustersTextObj,handles)

%%%%%%% The purpose of this function is to save the clusters of
%%%%%%% vocalizations already marked on a figure with -tSNE results for population audio alone analysis.  
  
   if isempty(tSNE_AnalysisData3D_Scatter3_Obj)
      handles.MainStatusTextEditBox.String='No t-SNE results for saving, please load and analyze a t-SNE results file'; 
      No_Cluster_to_Delete_Dialog=warndlg('No t-SNE results for saving, please load and analyze a t-SNE results file','!! Notice !!'); 
      FinalAudioGroupNameListFor_tSNE_Analysis=[];
      FinalAudioFullNameListAfterMFCC_tSNE_Analysis=[];
      AllClustersTimeFramesPerGroup={};
      AllClusters_tSNE_XYZCord={};
      AllClustersTimeFramesPerOriginalFile={};
      return; 
   end
   
  if ~isempty(tSNE_AnalysisData3D_Scatter3_Obj)
       TimeAndDate=datetime('now','TimeZone','local','Format','yyyy-MM-dd');
       [FileName,path] = uiputfile('Audio_tSNE_clusters_results.mat','Please choose a file name for saving the results');
       FileNameForFigureFile=FileName;
       if FileName==0
          return;
       end
   
       NewFolderName=join([path 'Audio_tSNE_clusters_results_per_file_' string(TimeAndDate)],"");
       mkdir (char(NewFolderName)) 
       for i=1:length(FinalAudioFullNameListAfterMFCC_tSNE_Analysis)
          FileName=FinalAudioFullNameListAfterMFCC_tSNE_Analysis{1,i}(1:end-4);
          AudioGroupName_tSNE_ClusterAnalysis=FinalAudioGroupNameListFor_tSNE_Analysis{1,i};
          AudioFullName_tSNE_ClusterAnalysis=FinalAudioFullNameListAfterMFCC_tSNE_Analysis{1,i};
          AllClustersForFile=AllClustersTimeFramesPerOriginalFile{1,i};
          save(join([NewFolderName '\tSNE_Clusters_' FileName '.mat'],""),'AudioGroupName_tSNE_ClusterAnalysis','AudioFullName_tSNE_ClusterAnalysis','AllClustersForFile')
       end
       save(join([NewFolderName '\' FileNameForFigureFile],""),'FinalAudioGroupNameListFor_tSNE_Analysis','FinalAudioFullNameListAfterMFCC_tSNE_Analysis',...
       'NumberOfTimeFramesForFiles_tSNE_Analysis','tSNE_AnalysisData3D_Scatter3_Obj','TimeFramesFor_tSNE_Analysis_for_Scatter3_obj',...
       'AllClustersTimeFramesPerGroup','AllClusters_tSNE_XYZCord','AllClustersTimeFramesPerOriginalFile','Cluster_tSNE_AnalysisData3D_Scatter3_Obj',...
       'AllClustersTextObj');
       
       ax_old = handles.LeftAxes;
       FigureForSaving=figure('name','tSNE with different groups');
       ax_new=copyobj(ax_old,FigureForSaving);
       set(ax_new,'Position','default');
       savefig(FigureForSaving,char(join([NewFolderName '\tSNE with different groups.fig'],"")));
       close(FigureForSaving);
       delete(FigureForSaving);
       
       ax_old = handles.RightAxes;
       FigureForSaving=figure('name','tSNE with different clusters');
       ax_new=copyobj(ax_old,FigureForSaving);
       set(ax_new,'Position','default');
       savefig(FigureForSaving,char(join([NewFolderName '\tSNE with different clusters.fig'],"")));
       close(FigureForSaving);
       delete(FigureForSaving);
   end
end  


 
 
       

 