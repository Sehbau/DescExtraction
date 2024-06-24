%
% Reads space of radsig attributes as saved under RsgIO.h-w_RsgSpc
%
function [ASTR Nstr] = ReadStrSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Nstr  = zeros(nLev,1);
ASTR  = cell(nLev,1);
for l = 1:nLev
    
    [ASTR{l} Nstr(l)] = ReadStrAtt(fid);
    
end

end

