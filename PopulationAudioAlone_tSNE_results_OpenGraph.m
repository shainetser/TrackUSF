function [tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj]=...
   PopulationAudioAlone_tSNE_results_OpenGraph(PopAudioAlone_tSNE_AnalysisData3D,...
   FinalAudioGroupNameListFor_tSNE_Analysis,TimeFramesFor_tSNE_Analysis,labelFor_tSNE_Analysis,handles)

%%%%%%% The purpose of this function is to enable marking and saving of clusters of vocalizations
%%%%%%% on a figure with -tSNE results for population audio alone analysis.  
  
   try
      axes(handles.LeftAxes);
      cla reset;
      set(handles.LeftAxes,'box','on','Visible','on')
   end
   
   if ~isempty(PopAudioAlone_tSNE_AnalysisData3D) & ~isempty(FinalAudioGroupNameListFor_tSNE_Analysis)...
           & ~isempty(TimeFramesFor_tSNE_Analysis) & ~isempty(labelFor_tSNE_Analysis)
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
      axes(handles.RightAxes); 
      handles.RightAxes.CameraPosition=handles.LeftAxes.CameraPosition;
      handles.RightAxes.View=handles.LeftAxes.View;
      handles.RightAxes.XLim=handles.LeftAxes.XLim;
      handles.RightAxes.YLim=handles.LeftAxes.YLim;
      handles.RightAxes.ZLim=handles.LeftAxes.ZLim;
      grid;
      handles.RightAxes.Toolbar.Visible = 'on';
      
   else
      No_tSNE_result_Dialog=warndlg('No t-SNE results file was uploaded, please choose a t-SNE results file".mat" file','!! Notice !!'); 
      tSNE_AnalysisData3D_Scatter3_Obj=[];
      TimeFramesFor_tSNE_Analysis_for_Scatter3_obj={};
      return;
   end
   
end

 
       

 