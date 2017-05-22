function varargout = EngagementRecognitionSystem(varargin)
% ENGAGEMENTRECOGNITIONSYSTEM MATLAB code for EngagementRecognitionSystem.fig
%      ENGAGEMENTRECOGNITIONSYSTEM, by itself, creates a new ENGAGEMENTRECOGNITIONSYSTEM or raises the existing
%      singleton*.
%
%      H = ENGAGEMENTRECOGNITIONSYSTEM returns the handle to a new ENGAGEMENTRECOGNITIONSYSTEM or the handle to
%      the existing singleton*.
%
%      ENGAGEMENTRECOGNITIONSYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENGAGEMENTRECOGNITIONSYSTEM.M with the given input arguments.
%
%      ENGAGEMENTRECOGNITIONSYSTEM('Property','Value',...) creates a new ENGAGEMENTRECOGNITIONSYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EngagementRecognitionSystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EngagementRecognitionSystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EngagementRecognitionSystem

% Last Modified by GUIDE v2.5 16-May-2017 16:39:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EngagementRecognitionSystem_OpeningFcn, ...
                   'gui_OutputFcn',  @EngagementRecognitionSystem_OutputFcn, ...
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


% --- Executes just before EngagementRecognitionSystem is made visible.
function EngagementRecognitionSystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EngagementRecognitionSystem (see VARARGIN)

% Choose default command line output for EngagementRecognitionSystem
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EngagementRecognitionSystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EngagementRecognitionSystem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openFileButton.
function openFileButton_Callback(hObject, eventdata, handles)
% hObject    handle to openFileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName, pathName] = uigetfile({'*.csv'}, 'File Selector');
fullPathName = strcat(pathName, fileName); 
data = dlmread(fullPathName);
 
% Pass the data to Feature Extraction
feature = FeatureExtraction(data);

% Pass the data to Classifier
result = RecognitionClassifier (feature);
% Get the results from Classifer
 
% Show the results
set(handles.engagedResult, 'String', result);
set(handles.boredResult, 'String', '18%');


% --- Executes on button press in StartRecognition.
function StartRecognition_Callback(hObject, eventdata, handles)
% hObject    handle to StartRecognition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
