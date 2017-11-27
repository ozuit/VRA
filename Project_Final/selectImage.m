function varargout = selectImage(varargin)
% Begin initialization
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selectImage_OpeningFcn, ...
                   'gui_OutputFcn',  @selectImage_OutputFcn, ...
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


% --- Executes just before selectImage is made visible.
function selectImage_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for selectImage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = selectImage_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;



function image_path_Callback(hObject, eventdata, handles)

function image_path_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function btn_select_image_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
if (filename)
    image = strcat(pathname, filename);
    fileinfo = imfinfo(image);
    filesize = fileinfo.FileSize(1,1);
    sizew = fileinfo.Width(1,1);
    sizeh = fileinfo.Height(1,1);
    axes(handles.axes_show_image);
    imshow(image);
    set(handles.image_path,'string',[pathname filename]);
    set(handles.image_demension,'string',[num2str(sizew) 'x' num2str(sizeh)]);
    set(handles.image_size,'string',filesize);
end


function image_label_Callback(hObject, eventdata, handles)


function image_label_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function image_demension_Callback(hObject, eventdata, handles)

function image_demension_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function image_size_Callback(hObject, eventdata, handles)

function image_size_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function btn_store_image_Callback(hObject, eventdata, handles)
image_label = get(handles.image_label,'string');
image_path = get(handles.image_path,'string');
croped_images = cropFace(image_path);
storeNewFace(croped_images, image_label);
% Show face
img2D = reshape(croped_images(:,1),112,92);
figure;
imshow(img2D);
