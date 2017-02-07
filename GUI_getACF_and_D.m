function varargout = GUI_getACF_and_D(varargin)
% GUI_GETACF_AND_D MATLAB code for GUI_getACF_and_D.fig
%      GUI_GETACF_AND_D, by itself, creates a new GUI_GETACF_AND_D or raises the existing
%      singleton*.
%
%      H = GUI_GETACF_AND_D returns the handle to a new GUI_GETACF_AND_D or the handle to
%      the existing singleton*.
%
%      GUI_GETACF_AND_D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GETACF_AND_D.M with the given input arguments.
%
%      GUI_GETACF_AND_D('Property','Value',...) creates a new GUI_GETACF_AND_D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_getACF_and_D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_getACF_and_D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_getACF_and_D

% Last Modified by GUIDE v2.5 24-Jan-2017 16:47:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_getACF_and_D_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_getACF_and_D_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before GUI_getACF_and_D is made visible.
function GUI_getACF_and_D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_getACF_and_D (see VARARGIN)

% Choose default command line output for GUI_getACF_and_D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_getACF_and_D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_getACF_and_D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calculate ACF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edit_selectDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_selectDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function edit_selectDirectory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_selectDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_imagePrefix_Callback(hObject, eventdata, handles)
% hObject    handle to edit_imagePrefix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit_imagePrefix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_imagePrefix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editRmin_value_ACF_Callback(hObject, eventdata, handles)
% hObject    handle to editRmin_value_ACF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function editRmin_value_ACF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRmin_value_ACF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_selectDirectory.
function pushbutton_selectDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_selectDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
set(handles.edit_selectDirectory, 'String',folder_name)

% --- Executes on button press in checkbox_SNR.
function checkbox_SNR_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit_ACF_saveFileName_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ACF_saveFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function edit_ACF_saveFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ACF_saveFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton_calculateACF.
function pushbutton_calculateACF_Callback(hObject, eventdata, handles)
directory = get(handles.edit_selectDirectory, 'String');
prefix    = get(handles.edit_imagePrefix, 'String');
SNR       = get(handles.checkbox_SNR,'Value');
Rmin      = str2double(get(handles.editRmin_value_ACF,'String'));
saveName  = get(handles.edit_ACF_saveFileName,'String');
get_ACF (directory, prefix, SNR, Rmin,saveName);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Calculate D %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edit_SavedACFname_Callback(hObject, eventdata, handles)
% hObject    handle to edit_SavedACFname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function edit_SavedACFname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_SavedACFname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editRmin_value_D_Callback(hObject, eventdata, handles)
% hObject    handle to editRmin_value_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function editRmin_value_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRmin_value_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_D_saveFileName_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D_saveFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function edit_D_saveFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D_saveFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_selectSavedACF.
function pushbutton_selectSavedACF_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_selectSavedACF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[savedACF,directory,~] = uigetfile;
set(handles.edit_SavedACFname, 'String',[directory,savedACF])
% --- Executes on button press in pushbutton_calculateD.
function pushbutton_calculateD_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_calculateD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rmin      = str2double(get(handles.editRmin_value_D,'String'));
SavedACF  = get(handles.edit_SavedACFname, 'String');
saveName  = get(handles.edit_D_saveFileName,'String');
get_D (SavedACF,Rmin,saveName);

