%% getFields: Get fields matching input from struct.
%
% inStruct:   Struct from which fields is to be extracted.
% inString:   String with the field text. A '$' is used as
%             a placeholder for the elements in 'specifier'.
% specifier:  Vector with values to replace the '$' in 'inString'.
%
% RETURNS: Cell-array or Matrix (if all output is numeric).
%
function [out] = getFields(inStruct, inString, specifier)
    out = cell(1, length(specifier));
    isDouble = true;
    for ii = 1:length(specifier)
        field = strrep( strtrim(inString), '$', num2str(specifier(ii)) );
        try
            out{ii} = inStruct.(field);
        catch
            try
                out{ii} = inStruct.(['MARS_' field]);
                warning(['No field named, ' field ', trying to prepend string ''MARS_''!'])
            catch
                error(['No field in struct named ''' field ''' or ''MARS_' field '.']);
            end
            isDouble = isDouble && isa(out{ii}, 'double');
        end
    end
    if isDouble
        out = cell2mat(out);
    end
end
