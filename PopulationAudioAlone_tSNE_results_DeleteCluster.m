function [tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,...
   AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
   PopulationAudioAlone_tSNE_results_DeleteCluster(tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,...
   AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,tSNE_AnalysisData3D_figure,AllClustersTextObj,handles)

%%%%%%% The purpose of this function is to enable marking and saving of clusters of vocalizations
%%%%%%% on a figure with -tSNE results for population audio alone analysis.  
  
  try
     ClusterToDelete=str2num(get(handles.tSNEDeleteVocalGroupNumAudioPopEditBox,'String'));
     if ClusterToDelete<=length(AllClustersTextObj)
        %%% Do nothing and continue with the analysis
     else
        handles.MainStatusTextEditBox.String='No valid cluster to delete, please choose a valid cluster to delete'; 
        No_Cluster_to_Delete_Dialog=warndlg('No valid cluster to delete, please choose a valid cluster to delete','!! Notice !!');  
        return;
     end
  catch
      
  end
   if isempty(tSNE_AnalysisData3D_Scatter3_Obj)
      handles.MainStatusTextEditBox.String='No t-SNE results are open, please choose a t-SNE results file and open it';  
      No_Cluster_to_Delete_Dialog=warndlg('No t-SNE results are open, please choose a t-SNE results file and open it','!! Notice !!'); 
      tSNE_AnalysisData3D_figure=[];
      AllClustersTimeFramesPerGroup={};
      AllClusters_tSNE_XYZCord={};
      AllClustersTimeFramesPerOriginalFile={};
      return; 
   end
   
   if ~isempty(tSNE_AnalysisData3D_Scatter3_Obj)
       
      axes(handles.RightAxes); 
      hold on;
      delete(Cluster_tSNE_AnalysisData3D_Scatter3_Obj{ClusterToDelete})
      Cluster_tSNE_AnalysisData3D_Scatter3_Obj=Cluster_tSNE_AnalysisData3D_Scatter3_Obj(find([1:length(Cluster_tSNE_AnalysisData3D_Scatter3_Obj)]~=ClusterToDelete));
      delete(AllClustersTextObj{ClusterToDelete})
      AllClustersTextObj=AllClustersTextObj(find(1:length(AllClustersTextObj)~=ClusterToDelete));
      
      if iscell(AllClusters_tSNE_XYZCord)
         AllClusters_tSNE_XYZCord=AllClusters_tSNE_XYZCord(find([1:length(AllClusters_tSNE_XYZCord)]~=ClusterToDelete));
         for i=1:length(AllClustersTimeFramesPerOriginalFile)
            AllClustersTimeFramesPerOriginalFile{i}=AllClustersTimeFramesPerOriginalFile{i}(find([1:length(AllClustersTimeFramesPerOriginalFile{i})]~=ClusterToDelete));
         end
         for i=1:length(Cluster_tSNE_AnalysisData3D_Scatter3_Obj)
            Cluster_tSNE_AnalysisData3D_Scatter3_Obj{i}.DisplayName=['Cluster ' num2str(i)];
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
      hold off;
   end
end  

 
       

 