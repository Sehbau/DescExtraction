%
% Reads an array of array of floats with dimensions read from a header.
%
% Either as block (1 argument) or as a struct with fieldnames as specified
% in aFieldNames (2nd argument).
%
function [ARR szD] = ReadArrFltLh(fid, aFieldNames)

%% ----------   Header   ----------
nFld = fread(fid, 1, 'int=>int'); % number of fields
nElm = fread(fid, 1, 'int=>int'); % number of elements

%% ----------   Single block   ----------
ARR = fread(fid, nElm * nFld, 'float=>single'); % [nDsc nFld]

ARR = reshape(ARR, [nElm nFld]);

szD.nFld = nFld;
szD.nElm = nElm;

%% ----------   As Struct   ----------
if nargin==2
    nFn = length(aFieldNames);
    assert( nFn==nFld, 'nFields not matching: %d <> %d', nFn, nFld );

    TMP = ARR;
    ARR = struct;
    for i = 1:nFn
        ARR.(aFieldNames{i}) = TMP(:,i);
    end
end

end

