function [tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,...
   AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
   PopulationAudioAlone_tSNE_results_DeleteCluster(FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
   NumberOfTimeFramesForFiles_tSNE_Analysis,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,...
   AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,...
   tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,AllClustersTextObj,handles)

%%%%%%% The purpose of this function is to enable marking and saving of clusters of vocalizations
%%%%%%% on a figure with -tSNE results for population audio alone analysis.  
  
  try
     ClusterToDelete=str2num(get(handles.tSNEDeleteVocalGroupNumAudioPopEditBox,'String'));
     if ClusterToDelete<=length(AllClustersTimeFramesPerGroup)
        %%% Do nothing and continue with the analysis
     else
        handles.MainStatusTextEditBox.String='No valid cluster to delete, please choose a valid cluster to delete'; 
        No_Cluster_to_Delete_Dialog=warndlg('No valid cluster to delete, please choose a valid cluster to delete','!! Notice !!');  
        return;
     end
  catch
      
  end
   if isempty(find([ishandle(tSNE_AnalysisData2D_figure)  ishandle(tSNE_AnalysisData3D_figure)]))
      handles.MainStatusTextEditBox.String='No t-SNE results figure open, please choose a t-SNE results file and open it';  
      No_Cluster_to_Delete_Dialog=warndlg('No t-SNE results figure open, please choose a t-SNE results file and open it','!! Notice !!'); 
      tSNE_AnalysisData2D_figure=[];
      tSNE_AnalysisData3D_figure=[];
      FinalAudioGroupNameListFor_tSNE_Analysis=[];
      FinalAudioFullNameListAfterMFCC_tSNE_Analysis=[];
      AllClustersTimeFramesPerGroup={};
      AllClusters_tSNE_XYZCord={};
      AllClustersTimeFramesPerOriginalFile={};
      return; 
   end
   
   if ~isempty(tSNE_AnalysisData2D_figure)
      
       FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis); 
       
       %%%%%%%%% Continue from here.........
       
       %%%%[x,y] = ginput;
       
   elseif ~isempty(tSNE_AnalysisData3D_figure)
       
      figure(tSNE_AnalysisData3D_figure);
      hold on; 
      delete(Cluster_tSNE_AnalysisData3D_Scatter3_Obj{ClusterToDelete})
      Cluster_tSNE_AnalysisData3D_Scatter3_Obj=Cluster_tSNE_AnalysisData3D_Scatter3_Obj(find([1:length(Cluster_tSNE_AnalysisData3D_Scatter3_Obj)]~=ClusterToDelete));
      delete(AllClustersTextObj{ClusterToDelete})
      AllClustersTextObj=AllClustersTextObj(find(1:length(AllClustersTextObj)~=ClusterToDelete));
      
      figure(tSNE_AnalysisData3D_figure); 
      if iscell(AllClustersTimeFramesPerGroup{1})
         AllClustersTimeFramesPerGroup=AllClustersTimeFramesPerGroup(find(1:length(AllClustersTimeFramesPerGroup)~=ClusterToDelete));
         AllClusters_tSNE_XYZCord=AllClusters_tSNE_XYZCord(find([1:length(AllClusters_tSNE_XYZCord)]~=ClusterToDelete));
         for i=1:length(AllClustersTimeFramesPerOriginalFile)
            AllClustersTimeFramesPerOriginalFile{i}=AllClustersTimeFramesPerOriginalFile{i}(find([1:length(AllClustersTimeFramesPerOriginalFile{i})]~=ClusterToDelete));
         end
         for i=1:length(Cluster_tSNE_AnalysisData3D_Scatter3_Obj)
            Cluster_tSNE_AnalysisData3D_Scatter3_Obj{i}.DisplayName=['Added cluster ' num2str(i)];
         end
         for i=1:length(AllClustersTextObj)
            AllClustersTextObj{i}.String=['CI ' num2str(i)];
         end
      else
         AllClustersTimeFramesPerGroup={};
         AllClusters_tSNE_XYZCord={};
         AllClustersTimeFramesPerOriginalFile={}; 
         AllClustersTextObj={};
      end 
   end
end  

 
       

 