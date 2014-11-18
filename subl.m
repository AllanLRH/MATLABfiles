%% subl: Open file in Sublime Text <3
% How to use it:
%                subl filename
%        or
%                subl('filename')
%
% ... if you insist on doing it the hard way.
%
% Put the file somewhere in you MATLAB path, like "username"/Documents/MATLAB.
% The filename should be "subl.m"
%
% This assumes that the Sublime Text executeable is symlinked as "subl"
% An BTW, there's no Windows support :/
function subl(varargin)

    % Prompt for filename if none is given
    if isempty(varargin)
        fprintf('====================================================\nNo file specified\n');
        fprintf('Getting list of open files...\n');
        editor = matlab.desktop.editor.getAll;
        fileNames = {editor.Filename};
        fprintf('Please input a number correspinding to a filename\n----------------------------------------------------\n\n');
        for ii = 1:length(fileNames)
            [~, name, ext] = fileparts(fileNames{ii});
            fprintf('   %d:\t%s%s\n', ii, name, ext);
        end
        fprintf('\n   q:\tARGH!! Give my back my prompt!\n\n----------------------------------------------------\n');
        varargin{1} = '';
        while isempty(varargin{1}) % Keep prompting until ivalid input is given
            userInput = input('  What to do?  ', 's');
            disp('')
            if strcmpi(strtrim(userInput), 'q')
                fprintf('\n  Here you go :)\n====================================================\n\n')
                return
            elseif str2num(userInput)
                varargin{1} = fileNames{str2num(userInput)};
            end
        end
    end

    fullPath = which(varargin{1});
    if isempty(fullPath)
        % error('File not found!')
        % http://www.mathworks.com/matlabcentral/fileexchange/24093-cprintf-display-formatted-colored-text-in-the-command-window
        cprintf('error', ['Could not find the file "' varargin{1} '" in path :''(\n'])
    elseif isunix
        [~, name, ext] = fileparts(varargin{1});
        fprintf(['\nOpening file ' name ext ' in Sublime Text <3\n====================================================\n\n'])
        if ismac
            system(['open -a "Sublime Text" ' fullPath]);
        else
            system(['subl ' fullPath]);
        end
    else
        error('Sorry, no windows support... don''t know how to write the terminal command :/');
    end
end

