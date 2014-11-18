%% normImage: Normalizes an image
% img: Image to be normalized
% INput (img) will be converted to double for the normalization,
% and converted back to the original datatype before the function returns
% varargin:
%           imgMin: Minimum value for normalized image
%           imgMax: Maximum value for normalized image
function out = normImage(img, varargin)
    inClass = class(img);  % Save for later
    img = double(img);
    % Determine min and max from call arguments
    if length(varargin) == 2
        imgMin = varargin{1};
        imgMax = varargin{2};
    elseif isempty(varargin)
        imgMin = 0;
        imgMax = 1;
    else
        error('Call as normImage(img) or normImage(img, min, max).')
    end
    % Perform normalization
    out = (img - min(img(:)))*(imgMax - imgMin)/(max(img(:)) - min(img(:))) + imgMin;

    % Determine, and cast back to, original datatype
    if strcmp(inClass, 'double')
        return
    else
        switch inClass
            case 'int8'
                out =int8(out);
            case 'int16'
                out =int16(out);
            case 'int32'
                out =int32(out);
            case 'int64'
                out =int64(out);
            case 'uint8'
                out =uint8(out);
            case 'uint16'
                out =uint16(out);
            case 'uint32'
                out =uint32(out);
            otherwise
                out = uint64(out);
        end  % switch
    end  % else

end  % function
