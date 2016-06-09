classdef UpdateView < appbox.View
    
    events
        Install
        Later
    end
    
    properties (Access = private)
        titleLabel
        bodyText
        releaseNotesText
        installButton
        laterButton
    end
    
    methods
        
        function createUi(obj)
            import appbox.*;
            
            set(obj.figureHandle, ...
                'Name', 'Software Update', ...
                'Position', screenCenter(450, 250));
            
            mainLayout = uix.VBox( ...
                'Parent', obj.figureHandle, ...
                'Padding', 11, ...
                'Spacing', 11);
            
            updateLayout = uix.VBox( ...
                'Parent', mainLayout, ...
                'Spacing', 7);
            obj.titleLabel = Label( ...
                'Parent', updateLayout, ...
                'String', '');
            obj.bodyText = TextArea( ...
                'Parent', updateLayout, ...
                'String', '');
            Label( ...
                'Parent', updateLayout, ...
                'String', '<html><b>Release Notes:</b></html>');
            obj.releaseNotesText = TextArea( ...
                'Parent', updateLayout, ...
                'Scrollable', true);
            set(updateLayout, 'Heights', [16, 32, 16, -1]);
            
            % Install/Later controls.
            controlsLayout = uix.HBox( ...
                'Parent', mainLayout, ...
                'Spacing', 7);
            uix.Empty('Parent', controlsLayout);
            obj.installButton = uicontrol( ...
                'Parent', controlsLayout, ...
                'Style', 'pushbutton', ...
                'String', 'Install', ...
                'Interruptible', 'off', ...
                'Callback', @(h,d)notify(obj, 'Install'));
            obj.laterButton = uicontrol( ...
                'Parent', controlsLayout, ...
                'Style', 'pushbutton', ...
                'String', 'Later', ...
                'Interruptible', 'off', ...
                'Callback', @(h,d)notify(obj, 'Later'));
            set(controlsLayout, 'Widths', [-1 75 75]);

            set(mainLayout, 'Heights', [-1 23]);
            
            % Set add button to appear as the default button.
            try %#ok<TRYNC>
                h = handle(obj.figureHandle);
                h.setDefaultButton(obj.installButton);
            end
        end
        
        function setTitle(obj, t)
            set(obj.titleLabel, 'String', ['<html><b>' t '</b></html>']);
        end
        
        function setBody(obj, t)
            set(obj.bodyText, 'String', t);
        end
        
        function setReleaseNotes(obj, n)
            set(obj.releaseNotesText, 'String', n);
        end
        
    end
    
end

