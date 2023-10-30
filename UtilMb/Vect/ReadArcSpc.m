%
% Reads space of arc attributes as saved under ArcIO.h-w_ArcSpc
%
function [AARC Narc] = ReadArcSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Narc  = zeros(nLev,1);
AARC  = cell(nLev,1);
for l = 1:nLev
    
    [AARC{l} Narc(l)] = ReadArcAtt(fid);
    
end

end

