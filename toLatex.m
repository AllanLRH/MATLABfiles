function [varargout] = toLatex(inMat, decimals, varargin)
%% toLatex: Convert matrix to LaTeX code
%           inMat: Matix which is to be expressed as a LaTeX matrix.
%           decimals: number of decimals to be included. If it's a matrix of size 2, where the second entry evalueates to true, the first entry will be used as significant digits instead of decimal places.
%           optional inputs: decorate, matrixtype, indentation:
%                   decorate:    'decorate' or true|false. Sets wether the output is readdy to be included into LaTeX source code.
%                   matrixtype:  if decorate, set matrix type to "matrixtype". Default is 'pmatrix'.
%                   indentation: speify string which is to be used to indent lines of matrix. Default is '  '.
%
%           Returns string intended to be printed if function return value is assigned in call ( varargout == 1).
%           Prints LaTeX code if output is not assigned (varargout == 0).

% BUG: Crashes if number of digits before decimal operator is greater than significant digits
% BUG: Account for leading zeroes

    [nRows, nCols] = size(inMat);

    useSignificantDigits = false;
    if length(decimals) == 2 && decimals(2)
        useSignificantDigits = true;
    end

    % Determine if output should be decorated
    decorateOutput = false;
    if nargin > 2
        if strcmp(varargin{1}, 'decorate') || true
            decorateOutput = true;
        end
    end

    % Set matrix type
    matrixtype = 'pmatrix';
    if nargin > 3
        matrixtype = varargin{2};
    end

    % Set indentation
    indentation = '';
    if nargin > 4 && decorateOutput
        indentation = varargin{3};
    elseif decorateOutput
        indentation = '  ';
    end


    % Create cell array with numbers as strings. Record the length of the longest string.
    outStr                = indentation;
    maxStringNumberLength = 0;
    stringNumberArray     = cell(nRows, nCols);
    for r = 1:nRows
        for c = 1:nCols
            if useSignificantDigits
                stringNumber         = num2str(inMat(r,c), 16);
                decimalPointPosition = strfind(stringNumber, '.');
                % decimalPointRemoved  = strrep(stringNumber, '.', '');
                decimalPointRemoved  = [stringNumber(1:decimalPointPosition-1) stringNumber(decimalPointPosition+1:end)];
                chosenDigits         = decimalPointRemoved(1:decimals(1));
                if str2double(decimalPointRemoved( decimals(1)+1 )) >= 5
                    chosenDigits = num2str(str2double(chosenDigits)+1);
                end
                roundedNumber = [ chosenDigits(1:decimalPointPosition-1) '.' chosenDigits(decimalPointPosition:end) ];
                stringNumberArray{r,c} = roundedNumber;
                fprintf('%f --> %s\n', inMat(r,c), roundedNumber);
            else % Significant digits
                stringNumberArray{r,c} = sprintf([ '%.' num2str(decimals) 'f' ], inMat(r,c));
            end
            if length(stringNumberArray{r,c}) > maxStringNumberLength
                maxStringNumberLength = length(stringNumberArray{r,c});
            end
        end
    end

    % Construct the matrix-string
    for r = 1:nRows
        for c = 1:nCols
            outStr = [ outStr repmat(' ', [1 maxStringNumberLength-length(stringNumberArray{r,c})]) stringNumberArray{r,c} ];
            if c == nCols && c*r ~= numel(inMat)
                outStr = [outStr ' \\\\\n'];
                if decorateOutput
                    outStr = [outStr indentation];
                end
            elseif c*r == numel(inMat)
                outStr = [outStr '\n'];
            else
                outStr = [outStr ' & '];
            end
        end
    end

    % Decorate if that option is set.
    if decorateOutput
        outStr = [ '\\begin{' matrixtype '}\n' outStr '\\end{' matrixtype '}\n' ];
    end

    % Determine if LaTeX code should be returned or printed
    if nargout > 0
        varargout = {outStr};
    else
        fprintf(['\n' outStr '\n']);
    end

end


% \[ \begin{pmatrix}
% a_{11} & a_{12} & a_{13} & a_{14} \\
% a_{21} & a_{22} & a_{23} & a_{24} \\
% a_{31} & a_{32} & a_{33} & a_{34}
% \end{pmatrix} \]
