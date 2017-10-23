function varargout = question6_advance(varargin)
% QUESTION6_ADVANCE MATLAB code for question6_advance.fig
%      QUESTION6_ADVANCE, by itself, creates a new QUESTION6_ADVANCE or raises the existing
%      singleton*.
%
%      H = QUESTION6_ADVANCE returns the handle to a new QUESTION6_ADVANCE or the handle to
%      the existing singleton*.
%
%      QUESTION6_ADVANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUESTION6_ADVANCE.M with the given input arguments.
%
%      QUESTION6_ADVANCE('Property','Value',...) creates a new QUESTION6_ADVANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before question6_advance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to question6_advance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help question6_advance

% Last Modified by GUIDE v2.5 02-Oct-2017 23:12:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @question6_advance_OpeningFcn, ...
                   'gui_OutputFcn',  @question6_advance_OutputFcn, ...
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


% --- Executes just before question6_advance is made visible.
function question6_advance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to question6_advance (see VARARGIN)

% Choose default command line output for question6_advance
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes question6_advance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = question6_advance_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nInput_Callback(hObject, eventdata, handles)
% hObject    handle to nInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nInput as text
%        str2double(get(hObject,'String')) returns contents of nInput as a double


% --- Executes during object creation, after setting all properties.
function nInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = str2double(get(handles.nInput,'string'));
imgTrainDatas = load('imgTrainImagesAll.mat');
imgTrainLabels = load('lblTrainLabelsAll.mat');
imgTrainAll = imgTrainDatas.imgTrainImagesAll;
lblTrainAll = imgTrainLabels.lblTrainLabelsAll;

Mdl = fitcknn(imgTrainAll' , lblTrainAll);

imgTrainDatas = load('imgTestImagesAll.mat');
imgTrainLabels = load('lblTestLabelsAll.mat');
imgTestAll = imgTrainDatas.imgTestImagesAll;
lblTestAll = imgTrainLabels.lblTestLabelsAll;
imgTest = imgTestAll(:, n);
lblPredictTest = predict(Mdl, imgTest');
lblImageTest = lblTestAll(n);

img2D = reshape(imgTest, 112, 92);
imshow(img2D,'Parent',handles.showimage);
strLabelImage = 'Ban dau ';
strLabelImage = [strLabelImage, num2str(lblImageTest), '.'];
strLabelImage = [strLabelImage, ' Du doan: '];
strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];

if(lblPredictTest == lblImageTest)
    strLabelImage = [strLabelImage, ' Nhan dang dung.'];
else
    strLabelImage = [strLabelImage, ' Nhan dang sai.'];
end
set(handles.result,'string',strLabelImage);
