%
% Reads space of contour attributes as saved under CntIO.h-w_CntSpc
%
function [ACNT Ncnt] = ReadCntSpc(fid)

nLev  = fread(fid, 1, 'int=>int');      % # of pyramid levels

Ncnt  = zeros(nLev,1);
ACNT  = cell(nLev,1);
for l = 1:nLev
    
    [ACNT{l} Ncnt(l)] = ReadCntAtt(fid);
    
end

end

