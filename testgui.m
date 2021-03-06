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

    % Last Modified by GUIDE v2.5 05-Dec-2017 13:14:08

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
    global HURRICANE;
    global LIGHTNING;
    global BURNING;
    HURRICANE = [intmax(), 20, 10, 5, 1];
    LIGHTNING = [0, 1, 10, 100, 1000];
    BURNING = [0.1, 1, 1.2, 1.5, 2];
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
    global lightning_i;
    global burning_i;
    global field_distr;
    global age;
    
    % texts and sliders
    age = 0;
    set_year(handles, 0);
    hurricane_i = 2;
    lightning_i = 2;
    burning_i = 2;
    set(handles.hurricane_slider, 'Value', 2);
    set(handles.hurricane_edittext, 'String', num2str(2));
    set(handles.lightning_slider, 'Value', 2);
    set(handles.lightning_edittext, 'String', num2str(2));
    set(handles.burning_slider, 'Value', 2);
    set(handles.burning_edittext, 'String', num2str(2));
    set(handles.ages_edittext, 'String', 115);
    
    % axes 1
    savanna = generate_savanna(0.32, 0.34);
    axes(handles.axes1)
    image(handles.axes1, get_pic(savanna, zeros(size(savanna))));
    
    % axes 2
    field_distr = zeros(1,3);
    axes(handles.axes2); % Make averSpec the current axes.
    cla reset; % Do a complete and total reset of the axes.
    update_distr(handles, 1);
    handles.axes2.YLim = [0, 1]; 
    handles.axes2.XLim = [0, age+1];
    legend('grass','pine','hardwood','Orientation','horizontal');
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
    if (str2double(index) <= 5 && str2double(index) >= 1)
        index = uint8(str2double(index));
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
    global HURRICANE;
    global hurricane_i;
    global LIGHTNING;
    global lightning_i;
    global BURNING;
    global burning_i;
    global field_distr;
    global age;
    
    set(handles.reset_button, 'Enable','off');
    
    ages = get(handles.ages_edittext,'String');
    ages = double(uint64(str2double(ages)));
    if ages < 1 || ages > 1000
        ages = 100;
        set(handles.ages_edittext, 'String', 100);
    end
    
    field_distr(age+1:age+ages+1, :) = zeros(ages+1, 3);
    update_distr(handles, 1);
    handles.axes2.XLim = [0, age+ages];
    
    for i = 1:ages
        set_year(handles, age+i);
        burning_table = lightning_step(savanna, LIGHTNING(lightning_i)); % lightning
        burning_table = burning_step(savanna, burning_table, BURNING(burning_i)); % burning
        savanna = step(savanna, burning_table); % growing of savanna
        if rem(age+i, HURRICANE(hurricane_i)) == 0  % hurricane
            savanna = hurricane_step(savanna);
        end
        image(handles.axes1, get_pic(savanna, burning_table));
        update_distr(handles, i+1);
        drawnow;
    end
    
    age = age + ages;
    set(handles.reset_button, 'Enable','on');
end

function update_distr(handles, ages)
    global savanna;
    global field_distr;
    global age;
    field_distr(age+ages,:) = calc_distr(savanna);
    X = 1:age+ages;
    Y = field_distr(1:age+ages,:);
    hold on;
    plot(handles.axes2, X, Y(:,1), 'Color', [158/255, 149/255, 56/255], 'LineWidth', 1);
    plot(handles.axes2, X, Y(:,2), 'Color', [0, 0.6, 0], 'LineWidth', 1);
    plot(handles.axes2, X, Y(:,3), 'Color', [0, 0, 0.6], 'LineWidth', 1);
    hold off;
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

% --- Executes on slider movement.
function lightning_slider_Callback(hObject, eventdata, handles)
% hObject    handle to lightning_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    global lightning_i;
    index = get(handles.lightning_slider, 'Value');
    index = uint8(index);
    lightning_i = index;
    set(handles.lightning_edittext, 'String', num2str(index));
end

% --- Executes during object creation, after setting all properties.
function lightning_slider_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to lightning_slider (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

function lightning_edittext_Callback(hObject, eventdata, handles)
% hObject    handle to lightning_edittext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lightning_edittext as text
%        str2double(get(hObject,'String')) returns contents of lightning_edittext as a double
end

% --- Executes during object creation, after setting all properties.
function lightning_edittext_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to lightning_edittext (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on button press in lightning_button.
function lightning_button_Callback(hObject, eventdata, handles)
    % hObject    handle to lightning_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    global lightning_i;
    index = get(handles.lightning_edittext, 'String');
    if (str2double(index) <= 5 && str2double(index) >= 1)
        index = uint8(str2double(index));
        set(handles.lightning_slider, 'Value', index);
        lightning_i = index;
    end
end

% --- Executes on slider movement.
function burning_slider_Callback(hObject, eventdata, handles)
    % hObject    handle to burning_slider (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'Value') returns position of slider
    %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global burning_i;
    index = get(handles.burning_slider, 'Value');
    index = uint8(index);
    burning_i = index;
    set(handles.burning_edittext, 'String', num2str(index));
end

% --- Executes during object creation, after setting all properties.
function burning_slider_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to burning_slider (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

function burning_edittext_Callback(hObject, eventdata, handles)
    % hObject    handle to burning_edittext (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of burning_edittext as text
    %        str2double(get(hObject,'String')) returns contents of burning_edittext as a double
end

% --- Executes during object creation, after setting all properties.
function burning_edittext_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to burning_edittext (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on button press in burning_button.
function burning_button_Callback(hObject, eventdata, handles)
    % hObject    handle to burning_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    global burning_i;
    index = get(handles.burning_edittext, 'String');
    if (str2double(index) <= 5 && str2double(index) >= 1)
        index = uint8(str2double(index));
        set(handles.burning_slider, 'Value', index);
        burning_i = index;
    end
end

