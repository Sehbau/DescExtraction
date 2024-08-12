%
% Reads space of bundles attributes as saved under BndgIO.h-w_BndgSpc
%
function [ABND Nbnd] = ReadBndgSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Nbnd  = zeros(nLev,1);
ABND  = cell(nLev,1);
for l = 1:nLev

    [ABND{l} Nbnd(l)] = ReadBndgAtt(fid);
    
end

end

