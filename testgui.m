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

    % Last Modified by GUIDE v2.5 21-Nov-2017 21:04:59

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
    reset_button_Callback(hObject, eventdata, handles);
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

% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
    % hObject    handle to reset_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
%     plot(handles.axes1, x, sin(x*1));
    
    global savanna;
    global hurricane_i;
    global HURRICANE;
    global age;
    savanna = generate_savanna(0.32, 0.34);
    image(handles.axes1, get_pic(savanna));
    
    HURRICANE = [intmax(), 20, 10, 5, 1];
    hurricane_i = 2;
    set(handles.hurricane_slider, 'Value', 2);
    set(handles.hurricane_edittext, 'String', num2str(2));
    set_year(handles, 0);
    age = 0;
end


% --- Executes on slider movement.
function hurricane_slider_Callback(hObject, eventdata, handles)
    % hObject    handle to hurricane_slider (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global hurricane_i;
    index = get(handles.hurricane_slider, 'Value');
    index = uint8(index);
    hurricane_i = index;
    set(handles.hurricane_edittext, 'String', num2str(index));
    
    % Hints: get(hObject,'Value') returns position of slider
    %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function hurricane_slider_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to hurricane_slider (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [.9 .9 .9]);
    end
end


function hurricane_edittext_Callback(hObject, eventdata, handles)
    % hObject    handle to hurricane_edittext (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of hurricane_edittext as text
    %        str2double(get(hObject,'String')) returns contents of hurricane_edittext as a double
end

% --- Executes during object creation, after setting all properties.
function hurricane_edittext_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to hurricane_edittext (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end
end

% --- Executes on button press in hurricane_button.
function hurricane_button_Callback(hObject, eventdata, handles)
    % hObject    handle to hurricane_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global hurricane_i;
    index = get(handles.hurricane_edittext, 'String');
    if (str2num(index) <= 5 && str2num(index) >= 1)
        index = uint8(str2num(index));
        set(handles.hurricane_slider, 'Value', index);
        hurricane_i = index;
    end
end


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global savanna;
    global hurricane_i;
    global HURRICANE;
    global age;
    set(handles.reset_button, 'Enable','off');
    ages = get(handles.ages_edittext,'String');
    ages = double(uint64(str2num(ages)));
    if ages < 1 || ages > 1000
        ages = 100;
    end
    for i = 1:ages
        set_year(handles, age+i);
        savanna = step(savanna); % growing of savanna
        if rem(i, HURRICANE(hurricane_i)) == 0
            savanna = hurricane_step(savanna);
        end
        image(handles.axes1, get_pic(savanna));
        drawnow;
    end
    age = age + ages;
    set(handles.reset_button, 'Enable','on');
end

function set_year(handles, year)
    set(handles.year_text, 'String', ['Year: ' int2str(year)]);
end

function ages_edittext_Callback(hObject, eventdata, handles)
% hObject    handle to ages_edittext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ages_edittext as text
%        str2double(get(hObject,'String')) returns contents of ages_edittext as a double
end

% --- Executes during object creation, after setting all properties.
function ages_edittext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ages_edittext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

