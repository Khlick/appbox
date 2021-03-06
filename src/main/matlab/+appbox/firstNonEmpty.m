function out = firstNonEmpty(varargin)
    % firstNonEmpty([], 'hi') => 'hi'
    % firstNonEmpty([1 2], [3 4]) => [1 2]
    % firstNonEmpty() => []
    
    out = [];
    for i = 1:numel(varargin)
        if ~isempty(varargin{i})
            out = varargin{i};
            break;
        end
    end
end

