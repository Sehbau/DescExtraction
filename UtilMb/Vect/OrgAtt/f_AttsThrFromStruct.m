%
% Thresholds the values in the individual fields and determines indices.
%
function [IX] = f_AttsThrFromStruct( ATT, thr )

aFldNa  = fieldnames( ATT );
nFld    = length( aFldNa );

IX = struct;
for i = 1:nFld
    fn          = aFldNa{i};
    IX.(fn)    = int32( find( ATT.(fn) > thr ) );
end
    
end

