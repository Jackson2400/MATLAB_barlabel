function varargout = barlabel(varargin)
%Adds the value of the bar on top of the bar for the active figure, ignoring 
%bars with a value of zero. Autmatically pulls bar height data from the
%figure. Accepts up to three variable arguments in any order:
%    rotation is the angle of the text (default zero)
%    textoption is the formatspec string (default '%.0f')
%   ignorezero is a logical indicating if bars with a value of zero are
%   labeled (default true)
%
%    Example usage:
%   bar([2 6 7])
%   h  =  barlabel
%   h  =  
%   Figure (1) with properties:
%   ...
%
%   bar([3 98 65])
%   barlabel(false,45);
%   Labels all bars (including zeros) and rotates text 45 degrees
%
%
%
    narginchk(0,3)
    if ~ishandle(1)
        error('No figure containing a bar graph is currently active.')
    end
    %assign user inputs
    rotation = 0; textopt = '%.0f'; ignorezero = true;
    for i  =  1:nargin
        usrin = varargin{i};
        if isa(usrin,'double')
            rotation = usrin;
        elseif ischar(usrin)
            textopt = usrin;
        elseif islogical(usrin)
            ignorezero = usrin;
        end
    end
    myfig  =  gcf;
    delete(findall(gcf,'type','text'))
    temp = findobj(myfig,'-property','YData');
    ydata = temp(1).YData;
    for i  =  1:size(ydata,2)
        z = ydata(i);
        %ignore empty 
        if z ~= 0 && ignorezero
            txt = sprintf(num2str(z,textopt));
            p = text(i,z,txt,'vert','bottom','horiz','center'); 
            set(p,'Rotation',rotation)
            box off
        end
    end
    if nargout == 1
        %return the figure if requested
        varargout{1} = myfig;
    end
end