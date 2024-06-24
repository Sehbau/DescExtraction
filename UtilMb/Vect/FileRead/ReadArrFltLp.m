%
% Reads an array of array of floats with dimensions specified as arguments.
%
% Returns array either as block (3 arguments) or as a struct with
% fieldnames as specified in aFieldNames (4th argument).
%
function [ARR] = ReadArrFltLp(fid, nDsc, nFld, aFieldNames)

%% ----------   Single block   ----------
ARR = fread(fid, nDsc * nFld, 'float=>single'); % [nDsc nFld]

ARR = reshape(ARR, [nDsc nFld]);

%% ----------   As Struct   ----------
if nargin==4
    nFn = length(aFieldNames);
    assert( nFn==nFld );

    TMP = ARR;
    ARR = struct;
    for i = 1:nFn
        ARR.(aFieldNames{i}) = TMP(:,i);
    end
end

end

