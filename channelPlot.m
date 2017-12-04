function varargout =  channelPlot(rgb, varargin)
    names = {'rgb', 'hsv', 'lab', 'sqrt(xyz)', 'ntsc', 'ycbcr'};
    imData{1} = rgb;
    imData{2} = rgb2hsv(rgb);
    imData{3} = rgb2lab(rgb);
    imData{4} = sqrt(rgb2xyz(rgb));
    imData{5} = rgb2ntsc(rgb);
    imData{6} = rgb2ycbcr(rgb);

    if nargin == 2 && ~ischar(varargin{1}) && all(class(varargin{1}) == 'function_handle')
        imData = cellfun(varargin{1}, imData, 'UniformOutput', false);
        names = {'f(rgb)', 'f(hsv)', 'f(lab)', 'f(sqrt(xyz))', 'f(ntsc)', 'f(ycbcr)'};
    elseif nargin > 1 && strcmp(varargin{end}, 'oneplot')
        figure;
        runsum = 1;
        for ii = length(imData):-1:1
            data = imData{ii};
            ch = size(data, 3);
            for jj = 1:ch
                subplot(length(imData), 3, runsum)
                imsc(data(:, :, jj));
                title(sprintf('%s(%d)', names{ii}, jj))
                runsum = runsum + 1;
            end
        end
        return
    end

    for ii = length(imData):-1:1
        data = imData{ii};
        ch = size(data, 3);
        for jj = 1:ch
            figure;
            imsc(data(:, :, jj));
            title(sprintf('%s(%d)', names{ii}, jj))
        end
    end




end
