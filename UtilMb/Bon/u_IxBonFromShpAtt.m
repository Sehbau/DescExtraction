%
% Boundary indices from lists of shape attribute indices.
%
function [IXBON] = u_IxBonFromShpAtt( IXATT, IxBon )

aAttNa  = fieldnames( IXATT );
nAtt    = length( aAttNa );
%nIx     = length( IxBon );

IXBON = struct;
for i = 1:nAtt

    fn          = aAttNa{i};
    IXBON.(fn)  = IxBon( IXATT.(fn) ); 
end

end % SUB