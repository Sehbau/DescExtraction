%
% Reads space of shape attributes as saved under ...
%
function [ASHP Nshp] = ReadShpSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Nshp  = zeros(nLev,1);
ASHP  = cell(nLev,1);
for l = 1:nLev
    [ASHP{l} Nshp(l)] = ReadShpAtt(fid);
end

end

