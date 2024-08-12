%
% Descriptor type as short strings.
% 
% sa u_LabDscTyp.m
%
function [aDty nDty] = o_DescTypes( typ )

if strcmp( typ, 'crasshp' )

    aDty    = {'Cnt' 'Rsg' 'Arc' 'Str' 'Shp'};

elseif strcmp( typ, 'crassb' )

    aDty    = {'Skl' 'Rsg' 'Arc' 'Str' 'Shp' 'Bnd'};

elseif strcmp( typ, 'sklrasshp' )

    aDty    = {'Skl' 'Rsg' 'Arc' 'Str' 'Shp'};

elseif strcmp( typ, 'cras' )

    aDty    = {'Skl' 'Rsg' 'Arc' 'Str'};
else
    
    fprintf('typ %s not implemented', typ);
end
    

nDty    = length(aDty);


end

