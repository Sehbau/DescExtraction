%
% Turns an array of attributes Arr [nDsc nAtt] into a struct with fields
% as specified by aFieldNames.
%
% ai cc_ovoT.m, f_Shp
%
% IN   Arr        [nDsc nAtt]
%      aAttNames  attribute names, ie. 'Vrt', 'Hor', ...
% OUT  S          struct with fields .Vrt, .Hor, ...each one [nDsc 1]
%
function [S] = u_AttsArrToStruct( Arr, aAttNames )

[nDsc nAtt] =  size(Arr);
nFld        = length(aAttNames);
assert( nAtt==nFld, 'nAtts/nFlds not matching: %d <> %d', nAtt, nFld );

S = struct;
for i = 1:nFld
    S.( aAttNames{i} ) = Arr(:,i);
end
    
end

