function varargout = TrackUSFs(varargin)
%TRACKUSFS MATLAB code file for TrackUSFs.fig
%      TRACKUSFS, by itself, creates a new TRACKUSFS or raises the existing
%      singleton*.
%
%      H = TRACKUSFS returns the handle to a new TRACKUSFS or the handle to
%      the existing singleton*.
%
%      TRACKUSFS('Property','Value',...) creates a new TRACKUSFS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to TrackUSFs_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TRACKUSFS('CALLBACK') and TRACKUSFS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TRACKUSFS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TrackUSFs

% Last Modified by GUIDE v2.5 13-Dec-2018 13:47:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TrackUSFs_OpeningFcn, ...
                   'gui_OutputFcn',  @TrackUSFs_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TrackUSFs is made visible.
function TrackUSFs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for TrackUSFs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TrackUSFs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TrackUSFs_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%  Global parameters  %%%%%%%%%%%%%%%%%%%%%%%%
global AudiofileList
global AudioClustersfileList
global AudioFilesPath
global AudioClustersFilesPath
global tSNEResultFilePath
global tSNEResultFileList
global LastPathChoosen
global tSNEAudioGroup_A_FileList
global tSNEAudioGroup_A_FilePath
global tSNEAudioGroup_B_FileList
global tSNEAudioGroup_B_FilePath
global tSNEAudioGroup_C_FileList
global tSNEAudioGroup_C_FilePath
global tSNEAudioGroup_D_FileList
global tSNEAudioGroup_D_FilePath
global tSNEAudioGroup_E_FileList
global tSNEAudioGroup_E_FilePath
global tSNEAudioGroup_F_FileList
global tSNEAudioGroup_F_FilePath
global tSNEAudioGroup_G_FileList
global tSNEAudioGroup_G_FilePath
global tSNEAudioGroup_H_FileList
global tSNEAudioGroup_H_FilePath
global tSNEAudioGroup_I_FileList
global tSNEAudioGroup_I_FilePath
global tSNEAudioGroup_J_FileList
global tSNEAudioGroup_J_FilePath
global tSNEAudioGroup_K_FileList
global tSNEAudioGroup_K_FilePath
global tSNEAudioGroup_L_FileList
global tSNEAudioGroup_L_FilePath
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global tSNE_AnalysisData3D_figure
global tSNE_AnalysisData3D_Scatter3_Obj
global TimeFramesFor_tSNE_Analysis_for_Scatter3_obj
global AllClustersTimeFramesPerGroup
global AllClusters_tSNE_XYZCord
global AllClustersTimeFramesPerOriginalFile
global Cluster_tSNE_AnalysisData3D_Scatter3_Obj
global AllClustersTextObj
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

AudiofileList=[];
AudioClustersfileList=[];
AudioFilesPath=[];
AudioClustersFilesPath=[];
tSNEResultFilePath=[];
tSNEResultFileList=[];
LastPathChoosen=[];
tSNEAudioGroup_A_FileList=[];
tSNEAudioGroup_A_FilePath=[];
tSNEAudioGroup_B_FileList=[];
tSNEAudioGroup_B_FilePath=[];
tSNEAudioGroup_C_FileList=[];
tSNEAudioGroup_C_FilePath=[];
tSNEAudioGroup_D_FileList=[];
tSNEAudioGroup_D_FilePath=[];
tSNEAudioGroup_E_FileList=[];
tSNEAudioGroup_E_FilePath=[];
tSNEAudioGroup_F_FileList=[];
tSNEAudioGroup_F_FilePath=[];
tSNEAudioGroup_G_FileList=[];
tSNEAudioGroup_G_FilePath=[];
tSNEAudioGroup_H_FileList=[];
tSNEAudioGroup_H_FilePath=[];
tSNEAudioGroup_I_FileList=[];
tSNEAudioGroup_I_FilePath=[];
tSNEAudioGroup_J_FileList=[];
tSNEAudioGroup_J_FilePath=[];
tSNEAudioGroup_K_FileList=[];
tSNEAudioGroup_K_FilePath=[];
tSNEAudioGroup_L_FileList=[];
tSNEAudioGroup_L_FilePath=[];
PopAudioAlone_tSNE_AnalysisData2D=[]; 
PopAudioAlone_tSNE_AnalysisData3D=[];
FinalAudioGroupNameListFor_tSNE_Analysis=[];
MFCC_All_before_tSNE_analysis=[];
FinalAudioFullNameListAfterMFCC_tSNE_Analysis=[];
NumberOfTimeFramesForFiles_tSNE_Analysis=[];
TimeFramesFor_tSNE_Analysis=[];
labelFor_tSNE_Analysis=[];
tSNE_AnalysisData3D_figure=[];
tSNE_AnalysisData3D_Scatter3_Obj={};
TimeFramesFor_tSNE_Analysis_for_Scatter3_obj={};
AllClustersTimeFramesPerGroup={};
AllClusters_tSNE_XYZCord={};
AllClustersTimeFramesPerOriginalFile={};
Cluster_tSNE_AnalysisData3D_Scatter3_Obj={};
AllClustersTextObj={};
SessionAudioSpectrogramFigure=[];
CurrentSessionAudioClustersFileToPresent=[];
CurrentSessionAudioFileToPresent=[];
CurrentSessionAudioClustersFileDataToPresent=[];
CurrentSessionAudioFileDataToPresent=[];
CurrentSessionAudioAloneSecToPresent=[];
CurrentSessionAudioClustersFileNumToPresent=1;
CurrentSessionAudioFileNumToPresent=1;



% --- Executes on button press in tSNEAudioGroup_A_PopPushbutton.
function tSNEAudioGroup_A_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_A_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_A_FileList
global tSNEAudioGroup_A_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_A_FileList, tSNEAudioGroup_A_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_A_FilePath;
   try
     if tSNEAudioGroup_A_FileList==0
        tSNEAudioGroup_A_FileList=[];
     end
   end
   if ischar(tSNEAudioGroup_A_FileList)
      Temp=tSNEAudioGroup_A_FileList; 
      tSNEAudioGroup_A_FileList={};
      tSNEAudioGroup_A_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_A_FileList, tSNEAudioGroup_A_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_A_FileList)
      Temp=tSNEAudioGroup_A_FileList; 
      tSNEAudioGroup_A_FileList={};
      tSNEAudioGroup_A_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_A_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_A_FilePath; 
   else
      tSNEAudioGroup_A_FileList=[];
      tSNEAudioGroup_A_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_A_EditBox.String=num2str(length(tSNEAudioGroup_A_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_A_FileList)) ' audio files were chosen'];



function NumOfAudioFiles_tSNEGroup_A_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_A_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_A_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_A_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_A_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_A_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_A_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_A_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_A_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_A_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_A_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_A_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_B_PopPushbutton.
function tSNEAudioGroup_B_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_B_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_B_FileList
global tSNEAudioGroup_B_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_B_FileList, tSNEAudioGroup_B_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_B_FilePath;
   try
      if tSNEAudioGroup_B_FileList==0
         tSNEAudioGroup_B_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_B_FileList)
      Temp=tSNEAudioGroup_B_FileList; 
      tSNEAudioGroup_B_FileList={};
      tSNEAudioGroup_B_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_B_FileList, tSNEAudioGroup_B_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_B_FileList)
      Temp=tSNEAudioGroup_B_FileList; 
      tSNEAudioGroup_B_FileList={};
      tSNEAudioGroup_B_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_B_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_B_FilePath; 
   else
      tSNEAudioGroup_B_FileList=[];
      tSNEAudioGroup_B_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_B_EditBox.String=num2str(length(tSNEAudioGroup_B_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_B_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_B_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_B_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_B_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_B_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_B_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_B_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_B_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_B_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_B_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_B_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_B_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_B_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_C_PopPushbutton.
function tSNEAudioGroup_C_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_C_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_C_FileList
global tSNEAudioGroup_C_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_C_FileList, tSNEAudioGroup_C_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_C_FilePath;
   try
      if tSNEAudioGroup_C_FileList==0
         tSNEAudioGroup_C_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_C_FileList)
      Temp=tSNEAudioGroup_C_FileList; 
      tSNEAudioGroup_C_FileList={};
      tSNEAudioGroup_C_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_C_FileList, tSNEAudioGroup_C_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_C_FileList)
      Temp=tSNEAudioGroup_C_FileList; 
      tSNEAudioGroup_C_FileList={};
      tSNEAudioGroup_C_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_C_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_C_FilePath; 
   else
      tSNEAudioGroup_C_FileList=[];
      tSNEAudioGroup_C_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_C_EditBox.String=num2str(length(tSNEAudioGroup_C_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_C_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_C_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_C_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_C_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_C_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_C_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_C_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_C_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_C_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_C_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_C_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_C_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_C_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_D_PopPushbutton.
function tSNEAudioGroup_D_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_D_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_D_FileList
global tSNEAudioGroup_D_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_D_FileList, tSNEAudioGroup_D_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_D_FilePath;
   try
      if tSNEAudioGroup_D_FileList==0
         tSNEAudioGroup_D_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_D_FileList)
      Temp=tSNEAudioGroup_D_FileList; 
      tSNEAudioGroup_D_FileList={};
      tSNEAudioGroup_D_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_D_FileList, tSNEAudioGroup_D_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_D_FileList)
      Temp=tSNEAudioGroup_D_FileList; 
      tSNEAudioGroup_D_FileList={};
      tSNEAudioGroup_D_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_D_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_D_FilePath; 
   else
      tSNEAudioGroup_D_FileList=[];
      tSNEAudioGroup_D_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_D_EditBox.String=num2str(length(tSNEAudioGroup_D_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_D_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_D_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_D_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_D_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_D_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_D_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_D_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_D_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_D_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_D_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_D_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_D_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_D_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_E_PopPushbutton.
function tSNEAudioGroup_E_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_E_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_E_FileList
global tSNEAudioGroup_E_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_E_FileList, tSNEAudioGroup_E_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_E_FilePath;
   try
      if tSNEAudioGroup_E_FileList==0
         tSNEAudioGroup_E_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_E_FileList)
      Temp=tSNEAudioGroup_E_FileList; 
      tSNEAudioGroup_E_FileList={};
      tSNEAudioGroup_E_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_E_FileList, tSNEAudioGroup_E_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_E_FileList)
      Temp=tSNEAudioGroup_E_FileList; 
      tSNEAudioGroup_E_FileList={};
      tSNEAudioGroup_E_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_E_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_E_FilePath; 
   else
      tSNEAudioGroup_E_FileList=[];
      tSNEAudioGroup_E_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_E_EditBox.String=num2str(length(tSNEAudioGroup_E_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_E_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_E_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_E_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_E_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_E_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_E_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_E_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_E_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_E_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_E_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_E_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_E_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_E_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_F_PopPushbutton.
function tSNEAudioGroup_F_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_F_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_F_FileList
global tSNEAudioGroup_F_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_F_FileList, tSNEAudioGroup_F_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_F_FilePath;
   try
      if tSNEAudioGroup_F_FileList==0
         tSNEAudioGroup_F_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_F_FileList)
      Temp=tSNEAudioGroup_F_FileList; 
      tSNEAudioGroup_F_FileList={};
      tSNEAudioGroup_F_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_F_FileList, tSNEAudioGroup_F_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_F_FileList)
      Temp=tSNEAudioGroup_F_FileList; 
      tSNEAudioGroup_F_FileList={};
      tSNEAudioGroup_F_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_F_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_F_FilePath; 
   else
      tSNEAudioGroup_F_FileList=[];
      tSNEAudioGroup_F_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_F_EditBox.String=num2str(length(tSNEAudioGroup_F_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_F_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_F_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_F_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_F_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_F_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_F_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_F_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_F_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_F_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_F_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_F_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_F_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_F_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_G_PopPushbutton.
function tSNEAudioGroup_G_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_G_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_G_FileList
global tSNEAudioGroup_G_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_G_FileList, tSNEAudioGroup_G_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_G_FilePath;
   try
      if tSNEAudioGroup_G_FileList==0
         tSNEAudioGroup_G_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_G_FileList)
      Temp=tSNEAudioGroup_G_FileList; 
      tSNEAudioGroup_G_FileList={};
      tSNEAudioGroup_G_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_G_FileList, tSNEAudioGroup_G_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_G_FileList)
      Temp=tSNEAudioGroup_G_FileList; 
      tSNEAudioGroup_G_FileList={};
      tSNEAudioGroup_G_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_G_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_G_FilePath; 
   else
      tSNEAudioGroup_G_FileList=[];
      tSNEAudioGroup_G_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_G_EditBox.String=num2str(length(tSNEAudioGroup_G_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_G_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_G_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_G_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_G_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_G_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_G_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_G_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_G_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_G_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_G_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_G_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_G_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_G_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_H_PopPushbutton.
function tSNEAudioGroup_H_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_H_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_H_FileList
global tSNEAudioGroup_H_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_H_FileList, tSNEAudioGroup_H_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_H_FilePath;
   try
      if tSNEAudioGroup_H_FileList==0
         tSNEAudioGroup_H_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_H_FileList)
      Temp=tSNEAudioGroup_H_FileList; 
      tSNEAudioGroup_H_FileList={};
      tSNEAudioGroup_H_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_H_FileList, tSNEAudioGroup_H_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_H_FileList)
      Temp=tSNEAudioGroup_H_FileList; 
      tSNEAudioGroup_H_FileList={};
      tSNEAudioGroup_H_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_H_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_H_FilePath; 
   else
      tSNEAudioGroup_H_FileList=[];
      tSNEAudioGroup_H_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_H_EditBox.String=num2str(length(tSNEAudioGroup_H_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_H_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_H_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_H_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_H_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_H_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_H_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_H_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_H_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_H_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_H_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_H_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_H_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_H_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_I_PopPushbutton.
function tSNEAudioGroup_I_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_I_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_I_FileList
global tSNEAudioGroup_I_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_I_FileList, tSNEAudioGroup_I_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_I_FilePath;
   try
      if tSNEAudioGroup_I_FileList==0
         tSNEAudioGroup_I_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_I_FileList)
      Temp=tSNEAudioGroup_I_FileList; 
      tSNEAudioGroup_I_FileList={};
      tSNEAudioGroup_I_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_I_FileList, tSNEAudioGroup_I_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_I_FileList)
      Temp=tSNEAudioGroup_I_FileList; 
      tSNEAudioGroup_I_FileList={};
      tSNEAudioGroup_I_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_I_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_I_FilePath; 
   else
      tSNEAudioGroup_I_FileList=[];
      tSNEAudioGroup_I_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_I_EditBox.String=num2str(length(tSNEAudioGroup_I_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_I_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_I_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_I_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_I_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_I_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_I_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_I_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_I_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_I_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_I_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_I_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_I_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_I_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_J_PopPushbutton.
function tSNEAudioGroup_J_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_J_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_J_FileList
global tSNEAudioGroup_J_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_J_FileList, tSNEAudioGroup_J_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_J_FilePath;
   try
      if tSNEAudioGroup_J_FileList==0
         tSNEAudioGroup_J_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_J_FileList)
      Temp=tSNEAudioGroup_J_FileList; 
      tSNEAudioGroup_J_FileList={};
      tSNEAudioGroup_J_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_J_FileList, tSNEAudioGroup_J_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_J_FileList)
      Temp=tSNEAudioGroup_J_FileList; 
      tSNEAudioGroup_J_FileList={};
      tSNEAudioGroup_J_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_J_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_J_FilePath; 
   else
      tSNEAudioGroup_J_FileList=[];
      tSNEAudioGroup_J_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_J_EditBox.String=num2str(length(tSNEAudioGroup_J_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_J_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_J_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_J_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_J_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_J_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_J_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_J_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_J_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_J_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_J_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_J_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_J_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_J_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_K_PopPushbutton.
function tSNEAudioGroup_K_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_K_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_K_FileList
global tSNEAudioGroup_K_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_K_FileList, tSNEAudioGroup_K_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_K_FilePath;
   try
      if tSNEAudioGroup_K_FileList==0
         tSNEAudioGroup_K_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_K_FileList)
      Temp=tSNEAudioGroup_K_FileList; 
      tSNEAudioGroup_K_FileList={};
      tSNEAudioGroup_K_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_K_FileList, tSNEAudioGroup_K_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_K_FileList)
      Temp=tSNEAudioGroup_K_FileList; 
      tSNEAudioGroup_K_FileList={};
      tSNEAudioGroup_K_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_K_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_K_FilePath; 
   else
      tSNEAudioGroup_K_FileList=[];
      tSNEAudioGroup_K_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_K_EditBox.String=num2str(length(tSNEAudioGroup_K_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_K_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_K_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_K_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_K_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_K_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_K_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_K_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_K_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_K_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_K_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_K_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_K_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_K_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNEAudioGroup_L_PopPushbutton.
function tSNEAudioGroup_L_PopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_L_PopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LastPathChoosen
global tSNEAudioGroup_L_FileList
global tSNEAudioGroup_L_FilePath

if isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEAudioGroup_L_FileList, tSNEAudioGroup_L_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on');
   LastPathChoosen=tSNEAudioGroup_L_FilePath;
   try
      if tSNEAudioGroup_L_FileList==0
         tSNEAudioGroup_L_FileList=[];
      end
   end
   if ischar(tSNEAudioGroup_L_FileList)
      Temp=tSNEAudioGroup_L_FileList; 
      tSNEAudioGroup_L_FileList={};
      tSNEAudioGroup_L_FileList{1}=Temp;
   end  
else
   [tSNEAudioGroup_L_FileList, tSNEAudioGroup_L_FilePath] = uigetfile('*.WAV','Select audio files for group:','MultiSelect', 'on',LastPathChoosen);
   if ischar(tSNEAudioGroup_L_FileList)
      Temp=tSNEAudioGroup_L_FileList; 
      tSNEAudioGroup_L_FileList={};
      tSNEAudioGroup_L_FileList{1}=Temp;
   end  
   if tSNEAudioGroup_L_FilePath~=0 
      LastPathChoosen=tSNEAudioGroup_L_FilePath; 
   else
      tSNEAudioGroup_L_FileList=[];
      tSNEAudioGroup_L_FilePath=[]; 
   end           
end
handles.NumOfAudioFiles_tSNEGroup_L_EditBox.String=num2str(length(tSNEAudioGroup_L_FileList));
handles.MainStatusTextEditBox.String=[num2str(length(tSNEAudioGroup_L_FileList)) ' audio files were chosen'];


function NumOfAudioFiles_tSNEGroup_L_EditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_L_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFiles_tSNEGroup_L_EditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFiles_tSNEGroup_L_EditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFiles_tSNEGroup_L_EditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFiles_tSNEGroup_L_EditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tSNEAudioGroup_L_PopNameEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_L_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioGroup_L_PopNameEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioGroup_L_PopNameEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioGroup_L_PopNameEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioGroup_L_PopNameEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ThreeDtSNEAudioAnalysisPopCheckbox.
function ThreeDtSNEAudioAnalysisPopCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to ThreeDtSNEAudioAnalysisPopCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ThreeDtSNEAudioAnalysisPopCheckbox



function tSNEAudioAnalysisThresholdPopEditbox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEAudioAnalysisThresholdPopEditbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEAudioAnalysisThresholdPopEditbox as text
%        str2double(get(hObject,'String')) returns contents of tSNEAudioAnalysisThresholdPopEditbox as a double


% --- Executes during object creation, after setting all properties.
function tSNEAudioAnalysisThresholdPopEditbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEAudioAnalysisThresholdPopEditbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Choose_tSNE_ResultFilePushbutton.
function Choose_tSNE_ResultFilePushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Choose_tSNE_ResultFilePushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global tSNEResultFilePath
global tSNEResultFileList
global LastPathChoosen
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis

if ~isempty(LastPathChoosen) | LastPathChoosen==0
   [tSNEResultFileList, tSNEResultFilePath] = uigetfile('*.mat','Select a 3D-tSNE data file:','MultiSelect', 'off');
   LastPathChoosen=tSNEResultFilePath;
   if ischar(tSNEResultFileList)
      PopAudioAlone_tSNE_AnalysisData3D=[]; 
      try
         load([tSNEResultFilePath, tSNEResultFileList]);
         FinalAudioGroupNameListFor_tSNE_Analysis=FinalAudioGroupNameListAfterMFCC;
         NumberOfTimeFramesForFiles_tSNE_Analysis=NumberOfTimeFramesForFiles;
         TimeFramesFor_tSNE_Analysis=TimeFramesAfterNoiseRemover_All;
         labelFor_tSNE_Analysis=label;
         MFCC_All_before_tSNE_analysis=MFCC_All;
         FinalAudioFullNameListAfterMFCC_tSNE_Analysis=FinalAudioFullNameListAfterMFCC;  
         handles.MainStatusTextEditBox.String='3D-tSNE result data was uploaded';
      catch
         handles.MainStatusTextEditBox.String='3D-tSNE result data was not uploaded';
         warning('3D-tSNE result data was not uploaded'); 
      end
   end
else
   [tSNEResultFileList, tSNEResultFilePath] = uigetfile('*.mat','Select a 3D-tSNE data file:','MultiSelect', 'off',LastPathChoosen); 
   if ischar(tSNEResultFileList)
      PopAudioAlone_tSNE_AnalysisData3D=[]; 
      try
         load([tSNEResultFilePath, tSNEResultFileList]);
         FinalAudioGroupNameListFor_tSNE_Analysis=FinalAudioGroupNameListAfterMFCC;
         NumberOfTimeFramesForFiles_tSNE_Analysis=NumberOfTimeFramesForFiles;
         TimeFramesFor_tSNE_Analysis=TimeFramesAfterNoiseRemover_All;
         labelFor_tSNE_Analysis=label;
         MFCC_All_before_tSNE_analysis=MFCC_All;
         FinalAudioFullNameListAfterMFCC_tSNE_Analysis=FinalAudioFullNameListAfterMFCC;  
         handles.MainStatusTextEditBox.String='Audio files were uploaded';
      catch
         handles.MainStatusTextEditBox.String='3D-tSNE result data was not uploaded';
         warning('3D-tSNE result data was not uploaded'); 
      end
   end
end


% --- Executes on button press in tSNEOpenGraphVocalGroupAudioPopPushbutton.
function tSNEOpenGraphVocalGroupAudioPopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEOpenGraphVocalGroupAudioPopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global tSNE_AnalysisData2D_figure
global tSNE_AnalysisData3D_figure
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global tSNE_AnalysisData3D_Scatter3_Obj
global TimeFramesFor_tSNE_Analysis_for_Scatter3_obj
global AllClustersTimeFramesPerGroup
global AllClusters_tSNE_XYZCord
global AllClustersTimeFramesPerOriginalFile
global Cluster_tSNE_AnalysisData3D_Scatter3_Obj
global AllClustersTextObj

tSNE_AnalysisData3D_Scatter3_Obj={};
TimeFramesFor_tSNE_Analysis_for_Scatter3_obj={};
AllClustersTimeFramesPerGroup={};
AllClusters_tSNE_XYZCord={};
AllClustersTimeFramesPerOriginalFile={};
Cluster_tSNE_AnalysisData3D_Scatter3_Obj={};
AllClustersTextObj={};

[tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj]=...
PopulationAudioAlone_tSNE_results_OpenGraph(PopAudioAlone_tSNE_AnalysisData2D,PopAudioAlone_tSNE_AnalysisData3D,...
FinalAudioGroupNameListFor_tSNE_Analysis,TimeFramesFor_tSNE_Analysis,labelFor_tSNE_Analysis);
handles.MainStatusTextEditBox.String='tSNE data was opened';

% --- Executes on button press in tSNEMarkVocalGroupAudioPopPushbutton.
function tSNEMarkVocalGroupAudioPopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEMarkVocalGroupAudioPopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global tSNE_AnalysisData2D_figure
global tSNE_AnalysisData3D_figure
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global tSNE_AnalysisData3D_Scatter3_Obj
global TimeFramesFor_tSNE_Analysis_for_Scatter3_obj
global AllClustersTimeFramesPerGroup
global AllClusters_tSNE_XYZCord
global AllClustersTimeFramesPerOriginalFile
global Cluster_tSNE_AnalysisData3D_Scatter3_Obj
global AllClustersTextObj

handles.MainStatusTextEditBox.String='Please mark audio clusters';
[tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
PopulationAudioAlone_tSNE_results_Add_Cluster(FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
NumberOfTimeFramesForFiles_tSNE_Analysis,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,...
tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,AllClustersTextObj);


% --- Executes on button press in tSNEDeleteVocalGroupAudioPopPushbutton.
function tSNEDeleteVocalGroupAudioPopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEDeleteVocalGroupAudioPopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global tSNE_AnalysisData2D_figure
global tSNE_AnalysisData3D_figure
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global tSNE_AnalysisData3D_Scatter3_Obj
global TimeFramesFor_tSNE_Analysis_for_Scatter3_obj
global AllClustersTimeFramesPerGroup
global AllClusters_tSNE_XYZCord
global AllClustersTimeFramesPerOriginalFile
global Cluster_tSNE_AnalysisData3D_Scatter3_Obj
global AllClustersTextObj

[tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,tSNE_AnalysisData3D_Scatter3_Obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,AllClustersTextObj]=...
PopulationAudioAlone_tSNE_results_DeleteCluster(FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
NumberOfTimeFramesForFiles_tSNE_Analysis,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,...
tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,AllClustersTextObj,handles);
handles.MainStatusTextEditBox.String='Audio cluster was deleted';


function tSNEDeleteVocalGroupNumAudioPopEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to tSNEDeleteVocalGroupNumAudioPopEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tSNEDeleteVocalGroupNumAudioPopEditBox as text
%        str2double(get(hObject,'String')) returns contents of tSNEDeleteVocalGroupNumAudioPopEditBox as a double


% --- Executes during object creation, after setting all properties.
function tSNEDeleteVocalGroupNumAudioPopEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tSNEDeleteVocalGroupNumAudioPopEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tSNESaveVocalGroupsAudioPopPushbutton.
function tSNESaveVocalGroupsAudioPopPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tSNESaveVocalGroupsAudioPopPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global tSNE_AnalysisData2D_figure
global tSNE_AnalysisData3D_figure
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global tSNE_AnalysisData3D_Scatter3_Obj
global TimeFramesFor_tSNE_Analysis_for_Scatter3_obj
global AllClustersTimeFramesPerGroup
global AllClusters_tSNE_XYZCord
global AllClustersTimeFramesPerOriginalFile
global Cluster_tSNE_AnalysisData3D_Scatter3_Obj
global AllClustersTextObj

PopulationAudioAlone_tSNE_results_SaveClusters(FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
NumberOfTimeFramesForFiles_tSNE_Analysis,tSNE_AnalysisData3D_Scatter3_Obj,TimeFramesFor_tSNE_Analysis_for_Scatter3_obj,...
AllClustersTimeFramesPerGroup,AllClusters_tSNE_XYZCord,AllClustersTimeFramesPerOriginalFile,Cluster_tSNE_AnalysisData3D_Scatter3_Obj,...
tSNE_AnalysisData2D_figure,tSNE_AnalysisData3D_figure,AllClustersTextObj,handles);
handles.MainStatusTextEditBox.String='Clusters data was saved';


% --- Executes on button press in ChooseaudioFilesPushbutton.
function ChooseaudioFilesPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseaudioFilesPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudiofileList
global AudioFilesPath
global LastPathChoosen

if isempty(LastPathChoosen) | LastPathChoosen==0
   [AudiofileList, AudioFilesPath] = uigetfile('*.mat','Select a .mat Audio data file:','MultiSelect', 'on');
   LastPathChoosen=AudioFilesPath;
   try
      if AudiofileList==0
         AudiofileList=[];
      end
   end
   if ischar(AudiofileList)
      Temp=AudiofileList; 
      AudiofileList={};
      AudiofileList{1}=Temp;
   end  
else
   [AudiofileList, AudioFilesPath] = uigetfile('*.mat','Select a .mat Audio data file:','MultiSelect', 'on',LastPathChoosen);
   if ischar(AudiofileList)
      Temp=AudiofileList; 
      AudiofileList={};
      AudiofileList{1}=Temp;
   end  
   if AudioFilesPath~=0 
      LastPathChoosen=AudioFilesPath; 
   else
      AudiofileList=[];
      AudioFilesPath=[]; 
   end     
end
handles.NumOfAudioFilesChosenEditBox.String=num2str(length(AudiofileList));
handles.MainStatusTextEditBox.String='Audio .mat files were uploaded';


function NumOfAudioFilesChosenEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFilesChosenEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioFilesChosenEditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioFilesChosenEditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioFilesChosenEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioFilesChosenEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ChooseAudioClustersFilesPushbutton.
function ChooseAudioClustersFilesPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseAudioClustersFilesPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudioClustersfileList
global AudioClustersFilesPath
global LastPathChoosen

if isempty(LastPathChoosen) | LastPathChoosen==0
   [AudioClustersfileList, AudioClustersFilesPath] = uigetfile('*.mat','Select a Audio clusters data file:','MultiSelect', 'on');
   LastPathChoosen=AudioClustersFilesPath;
   try
      if AudioClustersfileList==0
         AudioClustersfileList=[];
      end
   end
   if ischar(AudioClustersfileList)
      Temp=AudioClustersfileList; 
      AudioClustersfileList={};
      AudioClustersfileList{1}=Temp;
   end  
else
   [AudioClustersfileList, AudioClustersFilesPath] = uigetfile('*.mat','Select a Audio clusters data file:','MultiSelect', 'on',LastPathChoosen);
   if ischar(AudioClustersfileList)
      Temp=AudioClustersfileList; 
      AudioClustersfileList={};
      AudioClustersfileList{1}=Temp;
   end  
   if AudioClustersFilesPath~=0 
      LastPathChoosen=AudioClustersFilesPath; 
   else
      AudioClustersfileList=[];
      AudioClustersFilesPath=[]; 
   end     
end
handles.NumOfAudioClustersFilesChosenEditBox.String=num2str(length(AudioClustersfileList));
handles.MainStatusTextEditBox.String='Audio clusters files were uploaded';


function NumOfAudioClustersFilesChosenEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfAudioClustersFilesChosenEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumOfAudioClustersFilesChosenEditBox as text
%        str2double(get(hObject,'String')) returns contents of NumOfAudioClustersFilesChosenEditBox as a double


% --- Executes during object creation, after setting all properties.
function NumOfAudioClustersFilesChosenEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumOfAudioClustersFilesChosenEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SessionAudioAloneNextFilePushbutton.
function SessionAudioAloneNextFilePushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to SessionAudioAloneNextFilePushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudioClustersfileList
global AudioClustersFilesPath
global AudiofileList
global AudioFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

try
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,CurrentSessionAudioClustersFileNumToPresent+1}];
   handles.MainStatusTextEditBox.String='Loading data...';
   pause(1);
   load(CurrentSessionAudioClustersFileToPresent);
   CurrentSessionAudioClustersFileDataToPresent=AllClustersForFile;
   CurrentSessionAudioClustersFileNumToPresent=CurrentSessionAudioClustersFileNumToPresent+1;
catch
   warning('No more file to forward, please go back');
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,CurrentSessionAudioClustersFileNumToPresent-1}];
   handles.MainStatusTextEditBox.String='No more file to forward, please go back';
   return;
end

%%%%%%%%% Extracting Audio data from the file
try
   Fs=250000; 
   CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,CurrentSessionAudioFileNumToPresent+1}];
   load(CurrentSessionAudioFileToPresent);
   CurrentSessionAudioFileDataToPresent=TempAudioData;
   CurrentSessionAudioFileNumToPresent=CurrentSessionAudioFileNumToPresent+1;
catch
   warning('No more file to forward, please go back'); 
   CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,CurrentSessionAudioFileNumToPresent-1}];
   handles.MainStatusTextEditBox.String='No more file to forward, please go back';
   return;
end
   
SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
   CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
   CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 


% --- Executes on button press in SessionAudioAlonePreviousFilePushbutton.
function SessionAudioAlonePreviousFilePushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to SessionAudioAlonePreviousFilePushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudioClustersfileList
global AudioClustersFilesPath
global AudiofileList
global AudioFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

try
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,CurrentSessionAudioClustersFileNumToPresent-1}];
   handles.MainStatusTextEditBox.String='Loading data...';
   pause(1);
   load(CurrentSessionAudioClustersFileToPresent);
   CurrentSessionAudioClustersFileDataToPresent=AllClustersForFile;
   CurrentSessionAudioClustersFileNumToPresent=CurrentSessionAudioClustersFileNumToPresent-1;
catch
   warning('No more file to go back, please go forward');
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,CurrentSessionAudioClustersFileNumToPresent+1}];
   handles.MainStatusTextEditBox.String='No more file to go back, please go forward';
   return;
end
      
%%%%%%%%% Extracting Audio data from the file
try
   Fs=250000; 
   CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,CurrentSessionAudioFileNumToPresent-1}];
   load(CurrentSessionAudioFileToPresent);
   CurrentSessionAudioFileDataToPresent=TempAudioData;
   CurrentSessionAudioFileNumToPresent=CurrentSessionAudioFileNumToPresent+1;
catch
   warning('No more file to go back, please go forward'); 
   CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,CurrentSessionAudioFileNumToPresent+1}];
   handles.MainStatusTextEditBox.String='No more file to go back, please go forward';
   return;
end
   
SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
   CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
   CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 


% --- Executes on button press in SessionAudioAlonePreviousSecPushbutton.
function SessionAudioAlonePreviousSecPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to SessionAudioAlonePreviousSecPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudioClustersfileList
global AudioClustersFilesPath
global AudiofileList
global AudioFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

Fs=250000; 
CurrentSessionAudioAloneSecToPresent=CurrentSessionAudioAloneSecToPresent-1;

try
   SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
   CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
   CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 
catch
   CurrentSessionAudioAloneSecToPresent=1;  
   warning('No more sec, please go forward'); 
   handles.MainStatusTextEditBox.String='No more sec, please go forward';
   return;
end

% --- Executes on button press in SessionAudioAloneNextSecPushbutton.
function SessionAudioAloneNextSecPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to SessionAudioAloneNextSecPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudioClustersfileList
global AudioClustersFilesPath
global AudiofileList
global AudioFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

try
   Fs=250000; 
   CurrentSessionAudioAloneSecToPresent=CurrentSessionAudioAloneSecToPresent+1;
   SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
   CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
   CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 
catch
   CurrentSessionAudioAloneSecToPresent=CurrentSessionAudioAloneSecToPresent-1; 
   warning('No more sec, please go back'); 
   handles.MainStatusTextEditBox.String='No more sec, please go back';
   return;
end


function SessionAudioAloneSecNumEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to SessionAudioAloneSecNumEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SessionAudioAloneSecNumEditBox as text
%        str2double(get(hObject,'String')) returns contents of SessionAudioAloneSecNumEditBox as a double

global AudioClustersfileList
global AudioClustersFilesPath
global AudiofileList
global AudioFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

Fs=250000; 
CurrentSessionAudioAloneSecToPresent=str2double(get(hObject,'String'));

try
   SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
   CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
   CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 
catch
   CurrentSessionAudioAloneSecToPresent=1;  
   warning('No more sec, please go forward'); 
   handles.MainStatusTextEditBox.String='No more sec, please go forward';
   return;
end

% --- Executes during object creation, after setting all properties.
function SessionAudioAloneSecNumEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SessionAudioAloneSecNumEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in StartThreeDtSNE_AnalysisPushbutton.
function StartThreeDtSNE_AnalysisPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to StartThreeDtSNE_AnalysisPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global TimeStampsfileList
global VideoBehavioralfileList
global PiezoElectricfileList
global LFPfileList
global SpikesfileList
global AudiofileList
global AudioClustersfileList
global TimeStempsFilesPath
global VideoBehavioralpath
global PiezoElectricFilesPath
global LFPFilesPath
global SpikesFilesPath
global AudioFilesPath
global AudioClustersFilesPath
global tSNEAudioGroup_A_FileList
global tSNEAudioGroup_A_FilePath
global tSNEAudioGroup_B_FileList
global tSNEAudioGroup_B_FilePath
global tSNEAudioGroup_C_FileList
global tSNEAudioGroup_C_FilePath
global tSNEAudioGroup_D_FileList
global tSNEAudioGroup_D_FilePath
global tSNEAudioGroup_E_FileList
global tSNEAudioGroup_E_FilePath
global tSNEAudioGroup_F_FileList
global tSNEAudioGroup_F_FilePath
global tSNEAudioGroup_G_FileList
global tSNEAudioGroup_G_FilePath
global tSNEAudioGroup_H_FileList
global tSNEAudioGroup_H_FilePath
global tSNEAudioGroup_I_FileList
global tSNEAudioGroup_I_FilePath
global tSNEAudioGroup_J_FileList
global tSNEAudioGroup_J_FilePath
global tSNEAudioGroup_K_FileList
global tSNEAudioGroup_K_FilePath
global tSNEAudioGroup_L_FileList
global tSNEAudioGroup_L_FilePath
global LastPathChoosen
global Stimulus1Name
global Stimulus2Name
global PiezoLargeMoveAmplitudeFromMax
global PiezoStabilityMoveAmplitudeFromMax
global PiezoLargeMoveMinimalInterval
global PiezoStabilityMinimalDuration
global LowFreqRangeForLFP_Min
global LowFreqRangeForLFP_Max
global HighFreqRangeForLFP_Min
global HighFreqRangeForLFP_Max
global PopAudioAlone_tSNE_AnalysisData2D 
global PopAudioAlone_tSNE_AnalysisData3D
global FinalAudioGroupNameListFor_tSNE_Analysis
global MFCC_All_before_tSNE_analysis
global FinalAudioFullNameListAfterMFCC_tSNE_Analysis
global NumberOfTimeFramesForFiles_tSNE_Analysis
global TimeFramesFor_tSNE_Analysis
global labelFor_tSNE_Analysis
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

handles.MainStatusTextEditBox.String='Start the analysis...';

[PopAudioAlone_tSNE_AnalysisData3D,MFCC_All_before_tSNE_analysis,...
FinalAudioGroupNameListFor_tSNE_Analysis,FinalAudioFullNameListAfterMFCC_tSNE_Analysis,...
NumberOfTimeFramesForFiles_tSNE_Analysis,TimeFramesFor_tSNE_Analysis,labelFor_tSNE_Analysis]= ...
PopulationAudioAlone_tSNE_Analysis_07032018(... 
tSNEAudioGroup_A_FileList,tSNEAudioGroup_A_FilePath,tSNEAudioGroup_B_FileList,tSNEAudioGroup_B_FilePath,...
tSNEAudioGroup_C_FileList,tSNEAudioGroup_C_FilePath,tSNEAudioGroup_D_FileList,tSNEAudioGroup_D_FilePath,...
tSNEAudioGroup_E_FileList,tSNEAudioGroup_E_FilePath,tSNEAudioGroup_F_FileList,tSNEAudioGroup_F_FilePath,...
tSNEAudioGroup_G_FileList,tSNEAudioGroup_G_FilePath,tSNEAudioGroup_H_FileList,tSNEAudioGroup_H_FilePath,...
tSNEAudioGroup_I_FileList,tSNEAudioGroup_I_FilePath,tSNEAudioGroup_J_FileList,tSNEAudioGroup_J_FilePath,...
tSNEAudioGroup_K_FileList,tSNEAudioGroup_K_FilePath,tSNEAudioGroup_L_FileList,tSNEAudioGroup_L_FilePath,handles);
handles.MainStatusTextEditBox.String='Analysis done';

% --- Executes on button press in StartAudioSessionAnalysisPushbutton.
function StartAudioSessionAnalysisPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to StartAudioSessionAnalysisPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AudiofileList
global AudioClustersfileList
global AudioFilesPath
global AudioClustersFilesPath
global SessionAudioSpectrogramFigure
global CurrentSessionAudioClustersFileToPresent
global CurrentSessionAudioFileToPresent
global CurrentSessionAudioClustersFileDataToPresent
global CurrentSessionAudioFileDataToPresent
global CurrentSessionAudioAloneSecToPresent
global CurrentSessionAudioClustersFileNumToPresent
global CurrentSessionAudioFileNumToPresent

handles.MainStatusTextEditBox.String='Loading...';

NumOfFiles=[length(AudioClustersfileList) length(AudiofileList)];
NumOfFiles=NumOfFiles(find(NumOfFiles>0));
if find(diff(NumOfFiles)>0)
   uiwait(msgbox('The number of files of audio clusters and Audio data files is not equal','Notic!!!','modal'));
   handles.MainStatusTextEditBox.String='The number of files of audio clusters and Audio data files is not equal';
end 
try
   CurrentSessionAudioClustersFileToPresent=[AudioClustersFilesPath,AudioClustersfileList{1,1}];
   handles.MainStatusTextEditBox.String='Loading data...';
   pause(1);
   load(CurrentSessionAudioClustersFileToPresent);
   CurrentSessionAudioClustersFileDataToPresent=AllClustersForFile;
   CurrentSessionAudioAloneSecToPresent=1;
   CurrentSessionAudioClustersFileNumToPresent=1;
   handles.MainStatusTextEditBox.String='Audio cluster data was uploaded';
catch
   handles.MainStatusTextEditBox.String='Audio .mat files or cluster data files were not uploaded';
   warning('Audio .mat files or cluster data files were not uploaded');
   return;
end
      
%%%%%%%%% Extracting Audio data from the file
try
   Fs=250000; 
   CurrentSessionAudioFileToPresent=[AudioFilesPath,AudiofileList{1,1}];
   load(CurrentSessionAudioFileToPresent);
   CurrentSessionAudioFileDataToPresent=TempAudioData;
   CurrentSessionAudioFileNumToPresent=1;
   handles.MainStatusTextEditBox.String='Audio data was uploaded';
catch
   handles.MainStatusTextEditBox.String='Audio data was not uploaded'; 
   warning('Audio data was not uploaded'); 
end
SessionAudioSpectrogramFigure=SessionAudioAlone_Analysis_27032018(CurrentSessionAudioClustersFileToPresent,CurrentSessionAudioFileToPresent,...
CurrentSessionAudioClustersFileDataToPresent,CurrentSessionAudioFileDataToPresent,...
CurrentSessionAudioAloneSecToPresent,SessionAudioSpectrogramFigure,Fs,handles); 


function MainStatusTextEditBox_Callback(hObject, eventdata, handles)
% hObject    handle to MainStatusTextEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MainStatusTextEditBox as text
%        str2double(get(hObject,'String')) returns contents of MainStatusTextEditBox as a double


% --- Executes during object creation, after setting all properties.
function MainStatusTextEditBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainStatusTextEditBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
