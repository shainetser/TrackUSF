function [tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj]=...
   PopulationAudioAlone_tSNE_results_OpenGraph(PopAudioAlone_tSNE_AnalysisData2D,PopAudioAlone_tSNE_AnalysisData3D,...
   FinalAudioGroupNameListFor_tSNE_Analysis,TimeFramesFor_tSNE_Analysis,labelFor_tSNE_Analysis)

%%%%%%% The purpose of this function is to enable marking and saving of clusters of vocalizations
%%%%%%% on a figure with -tSNE results for population audio alone analysis.  
  

   try
      close(tSNE_AnalysisData2D_figure)
   end
   try
      close(tSNE_AnalysisData3D_figure)
   end
   
   if ~isempty(PopAudioAlone_tSNE_AnalysisData2D) & ~isempty(FinalAudioGroupNameListFor_tSNE_Analysis)...
           & ~isempty(TimeFramesFor_tSNE_Analysis) & ~isempty(labelFor_tSNE_Analysis)
      %%%%% Plot 2D-tSNE results
      FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis);
      tSNE_AnalysisData2D_figure=figure('Name','Population analysis for ultra-sonic vocalizations (audio) ');
      hold on; 
      title('2D tSNE results, Perplexity=500');
      gscatter(PopAudioAlone_tSNE_AnalysisData2D(1:end, 1), PopAudioAlone_tSNE_AnalysisData2D(1:end, 2),labelFor_tSNE_Analysis(1:end), 'kbrgmy' ,'xoxxxoo');
      legend(FinalGroupsNamesForPresentation); 
      grid;
      hold off;
      tSNE_AnalysisData3D_figure=[]; %%%% for returning a parameter although the analysis was on 2D t-SNE
      
   elseif ~isempty(PopAudioAlone_tSNE_AnalysisData3D) & ~isempty(FinalAudioGroupNameListFor_tSNE_Analysis)...
           & ~isempty(TimeFramesFor_tSNE_Analysis) & ~isempty(labelFor_tSNE_Analysis)
      if ~isempty(findobj('Name','Population analysis for ultra-sonic vocalizations (audio) '))
         tSNE_AnalysisData3D_figure=findobj('Name','Population analysis for ultra-sonic vocalizations (audio) '); 
         close(tSNE_AnalysisData3D_figure)
      end
      %%%%% Plot tSNE results
      FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis);
      tSNE_AnalysisData3D_figure=figure('Name','Population analysis for ultra-sonic vocalizations (audio) ');
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
      tSNE_AnalysisData2D_figure=[]; %%%% for returning a parameter although the analysis was on 3D t-SNE
   else
      No_tSNE_result_Dialog=warndlg('No t-SNE results file was uploaded, please choose a t-SNE results file".mat" file','!! Notice !!'); 
      tSNE_AnalysisData2D_figure=[]; %%%% for returning a parameter although the analysis was on 3D t-SNE
      tSNE_AnalysisData3D_figure=[]; %%%% for returning a parameter although the analysis was on 2D t-SNE
      tSNE_AnalysisData3D_Scatter3_Obj=[];
      TimeFramesFor_tSNE_Analysis_for_Scatter3_obj={};
      return;
   end
   
end

 
       

 