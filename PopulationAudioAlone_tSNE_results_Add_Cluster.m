function [tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,...
   AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
   PopulationAudioAlone_tSNE_results_Add_Cluster(FinalAudioGroupNameListFor_tSNE_Analysis,NumberOfTimeFramesForFiles_tSNE_Analysis,...
   tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,AllClustersTimeFramesPerGroup,...
   AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj,handles)

%%%%%%% The purpose of this function is to enable marking and saving of clusters of vocalizations
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
 
      axes(handles.LeftAxes); 
      hold on;
      tSNE_AnalysisData3D_figure=handles.figure1;
      FinalGroupsNamesForPresentation=unique(FinalAudioGroupNameListFor_tSNE_Analysis); 
      CurrentClusterNumber=length(AllClustersTimeFramesPerGroup)+1;
      AddMoreClusterflag=1; 
      while(AddMoreClusterflag==1) 
         BrushObject = brush(tSNE_AnalysisData3D_figure);
         set(BrushObject, 'ActionPostCallback', @(tSNE_AnalysisData3D_figure,s) BrushPostAction(tSNE_AnalysisData3D_figure,s,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj),'enable','on');
         ContinueButton = uicontrol(tSNE_AnalysisData3D_figure,'Position',...
            [450 50 100 20],'String','Continue','Callback','uiresume(gcbf)');
         uiwait(gcf); 
         Cluster_TimeFramesIndxPerGroupFor_tSNE_Analysis_Scatter3_obj=tSNE_AnalysisData3D_figure.Parent.UserData{1};
         Cluster_brushed_XCord_tSNE_Analysis_for_Scatter3_obj=tSNE_AnalysisData3D_figure.Parent.UserData{2};
         Cluster_brushed_YCord_tSNE_Analysis_for_Scatter3_obj=tSNE_AnalysisData3D_figure.Parent.UserData{3};
         Cluster_brushed_ZCord_tSNE_Analysis_for_Scatter3_obj=tSNE_AnalysisData3D_figure.Parent.UserData{4};
         Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj=[Cluster_brushed_XCord_tSNE_Analysis_for_Scatter3_obj, ...
         Cluster_brushed_YCord_tSNE_Analysis_for_Scatter3_obj, Cluster_brushed_ZCord_tSNE_Analysis_for_Scatter3_obj];
         brush off
         SaveClusterChoice = questdlg('Whould you like to save the cluster you chose?', ...
                              'Choosing cluster', ...
                              'Yes','No','Yes');
         hold off; %%% from handles.LeftAxes
                          
         switch SaveClusterChoice
            case 'Yes'
               AllClustersTimeFramesPerGroup{CurrentClusterNumber}=Cluster_TimeFramesIndxPerGroupFor_tSNE_Analysis_Scatter3_obj;
               AllClusters_tSNE_XYZCord{CurrentClusterNumber}=Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj;
               
               for GroupNum=1:length(FinalGroupsNamesForPresentation) 
                  CurrentTimeFrameInGroupOfTimeFrames=0; 
                  for FileNumberInAllGroups=1:length(FinalAudioGroupNameListFor_tSNE_Analysis) 
                     if strcmp(FinalAudioGroupNameListFor_tSNE_Analysis(FileNumberInAllGroups),FinalGroupsNamesForPresentation(GroupNum)) 
                        File_TimeFramesFor_tSNE_Analysis_for_Scatter3_obj=TimeFramesFor_tSNE_Analysis_for_Scatter3_obj{1,GroupNum}(CurrentTimeFrameInGroupOfTimeFrames+1:CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups));
                        AllClustersTimeFramesPerOriginalFile{FileNumberInAllGroups}{CurrentClusterNumber}=...
                        File_TimeFramesFor_tSNE_Analysis_for_Scatter3_obj(Cluster_TimeFramesIndxPerGroupFor_tSNE_Analysis_Scatter3_obj{1,GroupNum}(CurrentTimeFrameInGroupOfTimeFrames+1:CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups)));
                        CurrentTimeFrameInGroupOfTimeFrames=CurrentTimeFrameInGroupOfTimeFrames+NumberOfTimeFramesForFiles_tSNE_Analysis(FileNumberInAllGroups);
                     end
                  end
               end
               
               axes(handles.RightAxes); 
               handles.RightAxes.CameraPosition=handles.LeftAxes.CameraPosition;
               handles.RightAxes.View=handles.LeftAxes.View;
               handles.RightAxes.XLim=handles.LeftAxes.XLim;
               handles.RightAxes.YLim=handles.LeftAxes.YLim;
               handles.RightAxes.ZLim=handles.LeftAxes.ZLim;
               grid;
               handles.RightAxes.Toolbar.Visible = 'on';
               
               
               hold on;
               CurrentClusterColor=[]; CurrentClusterColor(1:length(Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 1)))=CurrentClusterNumber;
               Cluster_tSNE_AnalysisData3D_Scatter3_Obj{CurrentClusterNumber} = scatter3(...
                  Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 1), ...
                  Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 2), ...
                  Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 3), ...
                  10,CurrentClusterColor,'DisplayName',['Cluster ' num2str(CurrentClusterNumber)]);
               legend('show');
               ClusterTextObj=text(mean(Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 1)),mean(Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 2)),...
                   mean(Cluster_brushed_XYZCord_tSNE_Analysis_for_Scatter3_obj(:, 3)),['Cl ' num2str(CurrentClusterNumber)],'FontSize',20,'Color','r');
               AllClustersTextObj{CurrentClusterNumber}=ClusterTextObj;
               hold off;
            case 'No'
               CurrentClusterNumber=CurrentClusterNumber-1;  
         end
         
         AddMoreClusterChoice = questdlg('Whould you like to add an another cluster?', ...
                              'Add additional cluster', ...
                              'Yes','No','Yes');
         switch AddMoreClusterChoice
            case 'Yes'
               AddMoreClusterflag=1;
               CurrentClusterNumber=CurrentClusterNumber+1;  
            case 'No'
               AddMoreClusterflag=0;
         end
      end
   end  
end

 function  BrushPostAction(tSNE_AnalysisData3D_figure,s,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj) 
    brushed_XCord=[];
    brushed_YCord=[];
    brushed_ZCord=[];
    for GroupNum=1:length(tSNE_AnalysisData3D_Scatter3_Obj)
       brushIdx{GroupNum} = logical(get(tSNE_AnalysisData3D_Scatter3_Obj{GroupNum}, 'BrushData'));
       Temp_TimeFramesFor_tSNE_Analysis_for_Scatter3_obj=TimeFramesFor_tSNE_Analysis_for_Scatter3_obj{1,GroupNum};
       Cluster_TimeFramesIndxFor_tSNE_Analysis_for_Scatter3_obj{GroupNum}=(brushIdx{1,GroupNum});
       xd = get(tSNE_AnalysisData3D_Scatter3_Obj{GroupNum}, 'XData');
       yd = get(tSNE_AnalysisData3D_Scatter3_Obj{GroupNum}, 'YData');
       zd = get(tSNE_AnalysisData3D_Scatter3_Obj{GroupNum}, 'ZData');
       brushed_XCord = [brushed_XCord; xd(brushIdx{GroupNum})'];
       brushed_YCord = [brushed_YCord; yd(brushIdx{GroupNum})'];
       brushed_ZCord = [brushed_ZCord; zd(brushIdx{GroupNum})'];
    end 
    tSNE_AnalysisData3D_figure.Parent.UserData = {Cluster_TimeFramesIndxFor_tSNE_Analysis_for_Scatter3_obj,brushed_XCord,brushed_YCord,brushed_ZCord};
    
 end

 
       

 