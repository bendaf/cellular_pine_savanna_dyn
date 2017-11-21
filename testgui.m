function varargout = testgui(varargin)
    % TESTGUI MATLAB code for testgui.fig
    %      TESTGUI, by itself, creates a new TESTGUI or raises the existing
    %      singleton*.
    %
    %      H = TESTGUI returns the handle to a new TESTGUI or the handle to
    %      the existing singleton*.
    %
    %      TESTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in TESTGUI.M with the given input arguments.
    %
    %      TESTGUI('Property','Value',...) creates a new TESTGUI or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before testgui_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to testgui_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help testgui

    % Last Modified by GUIDE v2.5 21-Nov-2017 11:55:00

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @testgui_OpeningFcn, ...
                       'gui_OutputFcn',  @testgui_OutputFcn, ...
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
end

% --- Executes just before testgui is made visible.
function testgui_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to testgui (see VARARGIN)

    % Choose default command line output for testgui
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes testgui wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
%     plot(handles.axes1, x, sin(x*get(handles.slider1, 'Value')))
    global savanna;
    savanna = generate_savanna(0.32,0.34);
    image(handles.axes1, get_pic(savanna));
end

% --- Outputs from this function are returned to the command line.
function varargout = testgui_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on button press in resetbutton.
function resetbutton_Callback(hObject, eventdata, handles)
    % hObject    handle to resetbutton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
%     plot(handles.axes1, x, sin(x*1));
    global savanna;
    savanna = generate_savanna(0.32,0.34);
    image(handles.axes1, get_pic(savanna));
%     set(handles.slider1, 'Value', 1);
%     frekv = get(handles.slider1, 'Value');
%     write_text = ['f(x)=sin(', num2str(frekv), ')*x'];
%     set(handles.edit1, 'String', num2str(frekv));
%     set(handles.text2, 'String', write_text);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
    % hObject    handle to slider1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global savanna;
    frekv = get(handles.slider1, 'Value');
%     plot(handles.axes1, x, sin(x*frekv))
    image(handles.axes1, get_pic(savanna));
    set(handles.edit1, 'String', num2str(frekv));
    write_text = ['f(x)=sin(', num2str(frekv), ')*x'];
    set(handles.text2, 'String', write_text);
    % Hints: get(hObject,'Value') returns position of slider
    %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to slider1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [.9 .9 .9]);
    end
end


function edit1_Callback(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of edit1 as text
    %        str2double(get(hObject,'String')) returns contents of edit1 as a double
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global savanna;
    frekv = get(handles.edit1, 'String');
    if (str2num(frekv) <= 10 && str2num(frekv) >= 1)
        set(handles.slider1, 'Value', str2num(frekv));
        write_text = ['f(x)=sin(', frekv, ')*x'];
%         plot(handles.axes1, x, sin(x*str2num(frekv)))
        image(handles.axes1, get_pic(savanna));
    end
end


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global savanna;
    for i = 1:100
        set(handles.text2, 'String', int2str(i));
        savanna = step(savanna);
        image(handles.axes1, get_pic(savanna));
        drawnow;
    end
end