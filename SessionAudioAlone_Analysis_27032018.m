function SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles)

   %%%%%%%%%% Ploting the data
    
   if ~ishandle(SessionAudioSpectrogramFigure)
      SessionAudioSpectrogramFigure=figure('Name', 'Audio spectrogram viewer'); 
   elseif isempty(SessionAudioSpectrogramFigure)
      SessionAudioSpectrogramFigure=figure('Name', 'Audio spectrogram viewer'); 
   else
      figure(SessionAudioSpectrogramFigure); 
   end
   hold on;
   [S,F,T,P]=spectrogram(CurrentSessionAudioFileDataToPresent(Fs*(CurrentSessionAudioAloneSecToPresent-1)+1:CurrentSessionAudioAloneSecToPresent*Fs),2^9,[],[],Fs);
   imagesc(T+CurrentSessionAudioAloneSecToPresent-1,F,10*log10(P)); axis tight;
   xlim([min(T+CurrentSessionAudioAloneSecToPresent-1) max(T+CurrentSessionAudioAloneSecToPresent-1)])
   xlabel('Time (Seconds)'); ylabel('Hz');
   set(gca,'ydir','normal');
   title(join(['Audio file ' CurrentSessionAudioFileToPresent(max(find(CurrentSessionAudioFileToPresent=='\'))+1:end)...
         '            and time stamps file              ' CurrentSessionAudioClustersFileToPresent(max(find(CurrentSessionAudioClustersFileToPresent=='\'))+1:end)]));
   
   for ClusterNumber=1:length(CurrentSessionAudioClustersFileDataToPresent)
      try
         ScatterValues=[]; 
         CurrentClusterData=CurrentSessionAudioClustersFileDataToPresent{1,ClusterNumber}; 
         ScatterValues(1:length(find(CurrentClusterData>=CurrentSessionAudioAloneSecToPresent-1 & CurrentClusterData<=CurrentSessionAudioAloneSecToPresent)))=100; 
         CurrentClusterData=CurrentClusterData(find(CurrentClusterData>=CurrentSessionAudioAloneSecToPresent-1 & CurrentClusterData<=CurrentSessionAudioAloneSecToPresent));
         if ~isempty(ScatterValues)
            text(CurrentClusterData,ScatterValues,num2str(ClusterNumber),'FontSize',10);
         end
      end
   end
   hold off
   handles.MainStatusTextEditBox.String=['File:  ' num2str(CurrentSessionAudioFileToPresent(max(find(CurrentSessionAudioFileToPresent=='\'))+1:end))];
   set(handles.SessionAudioAloneSecNumEditBox,'String',num2str(CurrentSessionAudioAloneSecToPresent));

end
   

