function varargout = demo(varargin)
% DEMO MATLAB code for demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo

% Last Modified by GUIDE v2.5 27-Nov-2017 23:45:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_OutputFcn, ...
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


% --- Executes just before demo is made visible.
function demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo (see VARARGIN)

% Choose default command line output for demo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_all_image.
function load_all_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_all_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.load_all_image, 'Enable', 'off');
set(handles.add_new_image, 'Enable', 'off');
set(handles.extract_hog_feature, 'Enable', 'off');
set(handles.extract_lbp_feature, 'Enable', 'off');
set(handles.build_model_knn, 'Enable', 'off');
set(handles.build_model_svm, 'Enable', 'off');
set(handles.predict_image, 'Enable', 'off');
readManyImage();
set(handles.load_all_image, 'Enable', 'on');
set(handles.add_new_image, 'Enable', 'on');
set(handles.extract_hog_feature, 'Enable', 'on');
set(handles.extract_lbp_feature, 'Enable', 'on');
set(handles.build_model_knn, 'Enable', 'on');
set(handles.build_model_svm, 'Enable', 'on');
set(handles.predict_image, 'Enable', 'on');


% --- Executes on button press in add_new_image.
function add_new_image_Callback(hObject, eventdata, handles)
% hObject    handle to add_new_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectImage;


% --- Executes on button press in extract_lbp_feature.
function extract_lbp_feature_Callback(hObject, eventdata, handles)
% hObject    handle to extract_lbp_feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Load Data Train
[imgDataTrain,lblDataTrain] = loadData();
% Extract feature
featuresDataTrain = extractFeaturesLBP(imgDataTrain);
% Save feature data
if exist('FeatureDataHIST.mat', 'file')
    delete FeatureDataHIST.mat;
end
if exist('FeatureDataHOG.mat', 'file')
    delete FeatureDataHOG.mat;
end
if exist('FeatureDataLBP.mat', 'file')
    delete FeatureDataLBP.mat;
end
save('FeatureDataLBP.mat', 'featuresDataTrain');
msgbox('Extract LBP features completed','Success');



% --- Executes on button press in extract_hog_feature.
function extract_hog_feature_Callback(hObject, eventdata, handles)
% hObject    handle to extract_hog_feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Load Data Train
[imgDataTrain,lblDataTrain] = loadData();
% Extract feature
featuresDataTrain = extractFeaturesHOG(imgDataTrain);
% Save feature data
if exist('FeatureDataHIST.mat', 'file')
    delete FeatureDataHIST.mat;
end
if exist('FeatureDataHOG.mat', 'file')
    delete FeatureDataHOG.mat;
end
if exist('FeatureDataLBP.mat', 'file')
    delete FeatureDataLBP.mat;
end
save('FeatureDataHOG.mat', 'featuresDataTrain');
msgbox('Extract HOG features completed','Success');



% --- Executes on button press in predict_image.
function predict_image_Callback(hObject, eventdata, handles)
% hObject    handle to predict_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
if (filename)
    set(handles.load_all_image, 'Enable', 'off');
    set(handles.add_new_image, 'Enable', 'off');
    set(handles.extract_hog_feature, 'Enable', 'off');
    set(handles.extract_lbp_feature, 'Enable', 'off');
    set(handles.build_model_knn, 'Enable', 'off');
    set(handles.build_model_svm, 'Enable', 'off');
    set(handles.predict_image, 'Enable', 'off');
    image_path = strcat(pathname, filename);
    detectFace(image_path);
    set(handles.load_all_image, 'Enable', 'on');
    set(handles.add_new_image, 'Enable', 'on');
    set(handles.extract_hog_feature, 'Enable', 'on');
    set(handles.extract_lbp_feature, 'Enable', 'on');
    set(handles.build_model_knn, 'Enable', 'on');
    set(handles.build_model_svm, 'Enable', 'on');
    set(handles.predict_image, 'Enable', 'on');
end


% --- Executes on button press in extract_hist_feature.
function extract_hist_feature_Callback(hObject, eventdata, handles)
% hObject    handle to extract_hist_feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Load Data Train
[imgDataTrain,lblDataTrain] = loadData();
% Extract feature
featuresDataTrain = extractFeaturesHIST(imgDataTrain);
% Save feature data
if exist('FeatureDataHIST.mat', 'file')
    delete FeatureDataHIST.mat;
end
if exist('FeatureDataHOG.mat', 'file')
    delete FeatureDataHOG.mat;
end
if exist('FeatureDataLBP.mat', 'file')
    delete FeatureDataLBP.mat;
end
save('FeatureDataHIST.mat', 'featuresDataTrain');
msgbox('Extract HIST features completed','Success');


% --- Executes on button press in build_model_knn.
function build_model_knn_Callback(hObject, eventdata, handles)
% hObject    handle to build_model_knn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)set(handles.load_all_image, 'Enable', 'off');
buildModelKNN();


% --- Executes on button press in build_model_svm.
function build_model_svm_Callback(hObject, eventdata, handles)
% hObject    handle to build_model_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
buildModelSVM();
