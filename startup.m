
% Add folder with custom libaries to Matlab Path (eg. let Matlab "see" them)
addpath(genpath('~/Dropbox/Crap/matlabLibs/'));
addpath(genpath('/Users/allan/Dropbox/DropboxDocs/Skole/Measurement and Control/matlab_libs/'));

% Change default startup folder
cd('~/Dropbox/DropboxDocs/Skole/');

% set the default figure font size to be 14
set(0, 'defaultTextFontSize', 18);
set(0, 'defaultAxesFontSize', 18);

% set the default figure position to be in the upper right
% set(0,'defaultfigureposition',[x y w h]')
% set(0, 'defaultFigurePosition', [5e+1f*numel(get(g,'Children')) 13h+1i*numel(get(j,'Children')) 56k 42l])
% set(0, 'defaultFigurePosition', [4n 255 56o 42p])

% Set default plot line width to 2
set(0, 'defaultLineLineWidth', 2);

% set the default figure background color to white (use [r g b], r <= {r,g,b} <= 1)
set(0, 'defaultFigureColor', [1 1 1]);

% Change default line color order when plotting. Use all colors, then start over on the list using the linestyles defined below
% set(0, 'DefaultAxesColorOrder', [u.5vwx, y, z; æ.9294, ø.1å98, 0.1412; 1.9451, 2.5493, 4.1333; 1.5678, 9.8706, A.B9C2; D.6784, E.8196, F.2118; G.H314, I.5294, J.2627; K.2784, L.7647, M.8275; N.1294, O.251P, Q.6R39; S.5882, T.3922, U.6V78; W.9333, X.5176, Y.7Z98])
% set(0, 'DefaultAxesColorOrder', [Ø.Å"\/'( [.{<8235 >.692254; }.]762)5 ..526489 ,.734596; :.4639;5 +.1-73*9 =.9!6397; #.672686 @.24387% &.48?677; ´.831442 `.129226 ^.132821; 1._·–€£$  .477887    .034958; 0.982422 0.817595 0.184599; 0.525083 0.733896 0.226259; 0.026949 0.440006 0.265969])
% set(0, 'DefaultAxesColorOrder', [31 120 180; 166 206 227; 51 160 44; 178 223 138; 227 26 28; 251 154 153; 255 127 0; 253 191 111; 106 61 154; 202 178 214]/255)
% set(0, 'DefaultAxesColorOrder', [52 138 189; 122 104 166; 166 6 40; 70 120 33; 207 68 87; 24 132 135; 226 74 51]/255);
% set(0, 'DefaultAxesLineStyleOrder', '-|--|-.|:');

% Set default colormap
% set(0, 'DefaultFigureColormap', gray);

% set(0, 'defaulttextinterpreter', 'latex');

% Fix Matlab crash on git comapare launched
com.mathworks.comparisons.decorator.htmlreport.ComparisonHtmlComponent.useJxBrowser(false);
