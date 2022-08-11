classdef Goruntuisleme < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        figure1      matlab.ui.Figure
        pushbutton1  matlab.ui.control.Button
        pushbutton3  matlab.ui.control.Button
        pushbutton4  matlab.ui.control.Button
        Hyperlink2   matlab.ui.control.Hyperlink
        Hyperlink    matlab.ui.control.Hyperlink
        edit1        matlab.ui.control.EditField
        text1        matlab.ui.control.Label
        text3        matlab.ui.control.Label
        uipanel2     matlab.ui.container.Panel
        pushbutton8  matlab.ui.control.Button
        pushbutton7  matlab.ui.control.Button
        pushbutton6  matlab.ui.control.Button
        pushbutton5  matlab.ui.control.Button
        pushbutton2  matlab.ui.control.Button
        uipanel1     matlab.ui.container.Panel
        text2        matlab.ui.control.Label
        Image        matlab.ui.control.Image
        axes2        matlab.ui.control.UIAxes
        axes1        matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function Goruntu_isleme_OpeningFcn(app, varargin)

            movegui(app.figure1, 'onscreen');
            
          
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app); 
            

            handles.output = hObject;
            

            guidata(hObject, handles);
        end

        % Button pushed function: pushbutton1
        function pushbutton1_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); 

            [filename pathname]=uigetfile('*.jpg;*.bmp;*.jpeg;*.png;','Resim seç');
            imgname=[pathname filename];
            axes(handles.axes1)
            imshow(imgname);title('Orjinal Resim')
            set(handles.text3,'string',imgname)
        end

        % Button pushed function: pushbutton2
        function pushbutton2_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event);

            oimg=getimage(handles.axes1);
            grayimg=rgb2gray(oimg);
            axes(handles.axes2)
            imshow(grayimg);title('Gri Tonlama')
        end

        % Button pushed function: pushbutton3
        function pushbutton3_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event);

            conf=questdlg('Çıkmak istediğine emin misin?','Kapat','Evet','Hayır','Hayır');
            switch conf
                case 'Evet'
                    close(gcf)
                case 'Hayır'
                    return
            end
        end

        % Button pushed function: pushbutton4
        function pushbutton4_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event);

            img_name=get(handles.edit1,'string');
            pro_img=getimage(handles.axes2);
            imwrite(pro_img,[img_name,'.jpg'],'jpg')
            msgbox('Başarıyla Kaydedildi')
        end

        % Button pushed function: pushbutton5
        function pushbutton5_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); 

            oimg=getimage(handles.axes1);
            H=fspecial('motion',20,45);
            motion_img=imfilter(oimg,H,'replicate');
            axes(handles.axes2)
            imshow(motion_img);title('Bulanıklaştırma')
        end

        % Button pushed function: pushbutton6
        function pushbutton6_Callback(app, event)
            %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); 

            oimg=getimage(handles.axes1);
            H=fspecial('unsharp');
            sharpd_img=imfilter(oimg,H,'replicate');
            axes(handles.axes2);
            imshow(sharpd_img);title('Keskinleştirme')
        end

        % Button pushed function: pushbutton7
        function pushbutton7_Callback(app, event)
             %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); 
            
           
            oimg=getimage(handles.axes1);
            H = fspecial('disk',10);
            blurred = imfilter(oimg,H,'replicate'); 
            axes(handles.axes2)
            imshow(blurred);title('Disk Blur')
        end

        % Button pushed function: pushbutton8
        function pushbutton8_Callback(app, event)
             %  
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); 

            oimg=getimage(handles.axes1);
            H = fspecial('sobel')
            log_img=imfilter(oimg,H,'replicate');
            axes(handles.axes2)
            imshow(log_img);title('Negatif')
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create figure1 and hide until all components are created
            app.figure1 = uifigure('Visible', 'off');
            app.figure1.Color = [1 1 1];
            app.figure1.Colormap = [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0];
            app.figure1.Position = [520 274 1014 563];
            app.figure1.Name = 'Görüntü İşleme';
            app.figure1.Resize = 'off';
            app.figure1.HandleVisibility = 'callback';
            app.figure1.Tag = 'figure1';

            % Create axes1
            app.axes1 = uiaxes(app.figure1);
            app.axes1.Colormap = [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0];
            app.axes1.XTick = zeros(1,0);
            app.axes1.YTick = zeros(1,0);
            app.axes1.FontSize = 13.3333333333333;
            app.axes1.NextPlot = 'replace';
            app.axes1.Box = 'on';
            app.axes1.Tag = 'axes1';
            app.axes1.Position = [65 158 362 340];

            % Create axes2
            app.axes2 = uiaxes(app.figure1);
            app.axes2.Colormap = [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0];
            app.axes2.XTick = zeros(1,0);
            app.axes2.YTick = zeros(1,0);
            app.axes2.FontSize = 13.3333333333333;
            app.axes2.NextPlot = 'replace';
            app.axes2.Box = 'on';
            app.axes2.Tag = 'axes2';
            app.axes2.Position = [598 158 369 340];

            % Create Image
            app.Image = uiimage(app.figure1);
            app.Image.Position = [426 253 173 203];
            app.Image.ImageSource = 'dpu-logo1.png';

            % Create uipanel1
            app.uipanel1 = uipanel(app.figure1);
            app.uipanel1.BackgroundColor = [0 0.2196 1];
            app.uipanel1.Tag = 'uipanel1';
            app.uipanel1.FontSize = 10.6666666666667;
            app.uipanel1.Position = [0 512 1015 51];

            % Create text2
            app.text2 = uilabel(app.uipanel1);
            app.text2.Tag = 'text2';
            app.text2.HorizontalAlignment = 'center';
            app.text2.VerticalAlignment = 'top';
            app.text2.WordWrap = 'on';
            app.text2.FontSize = 17.3333333333333;
            app.text2.FontWeight = 'bold';
            app.text2.Position = [278 4 460 42];
            app.text2.Text = {'Burak Kaan Şahin'; 'Sistem Programlama Final Ödevi'};

            % Create uipanel2
            app.uipanel2 = uipanel(app.figure1);
            app.uipanel2.BackgroundColor = [0 0.2196 1];
            app.uipanel2.Tag = 'uipanel2';
            app.uipanel2.FontSize = 10.6666666666667;
            app.uipanel2.Position = [0 44 1015 51];

            % Create pushbutton2
            app.pushbutton2 = uibutton(app.uipanel2, 'push');
            app.pushbutton2.ButtonPushedFcn = createCallbackFcn(app, @pushbutton2_Callback, true);
            app.pushbutton2.Tag = 'pushbutton2';
            app.pushbutton2.Position = [73 6 113 37];
            app.pushbutton2.Text = 'Gri Tonlama';

            % Create pushbutton5
            app.pushbutton5 = uibutton(app.uipanel2, 'push');
            app.pushbutton5.ButtonPushedFcn = createCallbackFcn(app, @pushbutton5_Callback, true);
            app.pushbutton5.Tag = 'pushbutton5';
            app.pushbutton5.Position = [278 6 113 37];
            app.pushbutton5.Text = 'Bulanıklaştır';

            % Create pushbutton6
            app.pushbutton6 = uibutton(app.uipanel2, 'push');
            app.pushbutton6.ButtonPushedFcn = createCallbackFcn(app, @pushbutton6_Callback, true);
            app.pushbutton6.Tag = 'pushbutton6';
            app.pushbutton6.Position = [451 6 113 37];
            app.pushbutton6.Text = 'Keskinleştirme';

            % Create pushbutton7
            app.pushbutton7 = uibutton(app.uipanel2, 'push');
            app.pushbutton7.ButtonPushedFcn = createCallbackFcn(app, @pushbutton7_Callback, true);
            app.pushbutton7.Position = [636 6 125 37];
            app.pushbutton7.Text = 'Disk Bulanıklaştırma';

            % Create pushbutton8
            app.pushbutton8 = uibutton(app.uipanel2, 'push');
            app.pushbutton8.ButtonPushedFcn = createCallbackFcn(app, @pushbutton8_Callback, true);
            app.pushbutton8.Position = [828 6 139 37];
            app.pushbutton8.Text = 'Negatif Tonlama';

            % Create text3
            app.text3 = uilabel(app.figure1);
            app.text3.Tag = 'text3';
            app.text3.HorizontalAlignment = 'center';
            app.text3.VerticalAlignment = 'top';
            app.text3.WordWrap = 'on';
            app.text3.FontSize = 10.6666666666667;
            app.text3.Position = [30 138 431 16];
            app.text3.Text = '...';

            % Create text1
            app.text1 = uilabel(app.figure1);
            app.text1.Tag = 'text1';
            app.text1.HorizontalAlignment = 'center';
            app.text1.VerticalAlignment = 'top';
            app.text1.WordWrap = 'on';
            app.text1.FontSize = 10.6666666666667;
            app.text1.Position = [598 115 101 22];
            app.text1.Text = 'Farklı Kaydet';

            % Create edit1
            app.edit1 = uieditfield(app.figure1, 'text');
            app.edit1.Tag = 'edit1';
            app.edit1.HorizontalAlignment = 'center';
            app.edit1.FontSize = 10.6666666666667;
            app.edit1.Placeholder = 'Dosya adı giriniz...';
            app.edit1.Position = [700 116 224 23];

            % Create Hyperlink
            app.Hyperlink = uihyperlink(app.figure1);
            app.Hyperlink.URL = 'https://www.linkedin.com/in/burakkaan/';
            app.Hyperlink.Position = [478 476 54 22];
            app.Hyperlink.Text = 'Linkedin';

            % Create Hyperlink2
            app.Hyperlink2 = uihyperlink(app.figure1);
            app.Hyperlink2.URL = 'https://github.com/wazzapsenk';
            app.Hyperlink2.Position = [482 455 45 22];
            app.Hyperlink2.Text = 'GitHub';

            % Create pushbutton4
            app.pushbutton4 = uibutton(app.figure1, 'push');
            app.pushbutton4.ButtonPushedFcn = createCallbackFcn(app, @pushbutton4_Callback, true);
            app.pushbutton4.Tag = 'pushbutton4';
            app.pushbutton4.Position = [278 1 113 37];
            app.pushbutton4.Text = 'Kaydet';

            % Create pushbutton3
            app.pushbutton3 = uibutton(app.figure1, 'push');
            app.pushbutton3.ButtonPushedFcn = createCallbackFcn(app, @pushbutton3_Callback, true);
            app.pushbutton3.Tag = 'pushbutton3';
            app.pushbutton3.Position = [636 1 113 37];
            app.pushbutton3.Text = 'Çıkış';

            % Create pushbutton1
            app.pushbutton1 = uibutton(app.figure1, 'push');
            app.pushbutton1.ButtonPushedFcn = createCallbackFcn(app, @pushbutton1_Callback, true);
            app.pushbutton1.Tag = 'pushbutton1';
            app.pushbutton1.Position = [193 94 105 36];
            app.pushbutton1.Text = 'Resim Seç';

            % Show the figure after all components are created
            app.figure1.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Goruntuisleme(varargin)

            runningApp = getRunningApp(app);

            % Check for running singleton app
            if isempty(runningApp)

                % Create UIFigure and components
                createComponents(app)

                % Register the app with App Designer
                registerApp(app, app.figure1)

                % Execute the startup function
                runStartupFcn(app, @(app)Goruntu_isleme_OpeningFcn(app, varargin{:}))
            else

                % Focus the running singleton app
                figure(runningApp.figure1)

                app = runningApp;
            end

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.figure1)
        end
    end
end