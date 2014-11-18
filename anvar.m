%% mianx: returns min and max of reshaped multidimmensional matrix
function anvar(in, varargin)
    if not(isnumeric(in))
        disp('anvar only handles numeric data')
    else
        reshapedData = reshape(in, [1 numel(in)]);
        sizeCell = regexpi(mat2str(size(in)), '\s+', 'split');
        sizeString = '';
        for ii = 1:length(sizeCell)-1
            sizeString = [sizeString sizeCell{ii} '   '];
        end
        sizeString = [sizeString sizeCell{end}];
        sizeString = strrep(sizeString, '[', '');
        sizeString = strrep(sizeString, ']', '');
        disp(sprintf('\nmin          max          minabs       maxabs       mean         std\n%.3e    %.3e    %.3e    %.3e    %.3e    %.3e',...
            min(reshapedData), max(reshapedData), min(abs(reshapedData)), max(abs(reshapedData)), mean(reshapedData), std(reshapedData)));
        disp(sprintf('\n%d elements in shape: \n%s\n\n\n', numel(reshapedData), sizeString));
        if numel(in) > 1 && isempty(varargin)
            figure();
            if ndims(in) == 2
                [r c] = size(in);
                if r > c
                    plot(in)
                else
                    plot(in')
                end
            else
                plot(reshapedData)
            end
            grid on
            box off
            set(gcf, 'name', 'anvar plot');
        end
    end
end
