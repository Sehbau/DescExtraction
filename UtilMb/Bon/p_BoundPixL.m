%
% Plots a list of boundaries.
%
function [] = p_BoundPixL( APix, szV, col, liwiAnf)

nBon = length(APix);

bJit = 0;
ctr  = 0;
if nargin==4
    ctr = 1;
end

for b = 1:nBon

    Pix    = APix{b};

    % uninvert row axis (p_BoundPix1 plots inverted)
    Pix.Rw = szV - Pix.Rw; 

    if ctr==0
        p_BoundPix1( Pix, szV, col, bJit, ctr );
    else
        ctr = liwiAnf-2*b;
        p_BoundPix1( Pix, szV, col, bJit, ctr );
    end
end


end

