%
% Reads space of radsig attributes as saved under RsgIO.h-w_RsgSpc
%
function [ARSG Nrsg] = ReadRsgSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Nrsg  = zeros(nLev,1);
ARSG  = cell(nLev,1);
for l = 1:nLev
    
    [ARSG{l} Nrsg(l)] = ReadRsgAtt(fid);
    
end

end

