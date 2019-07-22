# MATLAB_barlabel
This function writes the value of bars in bar graphs over figures in MATLAB.

Docstring is as follows:
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

Free for non-commercial and educational use.
Basic concept pulled from this StackOverflow thread: https://www.mathworks.com/matlabcentral/answers/40629-bar-plot-value-on-top
Expanded upon here.