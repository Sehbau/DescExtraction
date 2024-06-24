%
% Descriptor type as short strings.
% 
% sa u_LabDscTyp.m
%
function S = o_DescTypes( )

S.aDty    = {'Cnt' 'Rsg' 'Arc' 'Str' 'Shp'};
S.aDtySkl = {'Skl' 'Rsg' 'Arc' 'Str' 'Shp'};

S.aCRAS   = {'Skl' 'Rsg' 'Arc' 'Str'};
S.nCRAS   = 4;


S.nDty    = length(S.aDty);


end

