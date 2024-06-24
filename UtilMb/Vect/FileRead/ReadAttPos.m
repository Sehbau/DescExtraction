%
% Reads contour attributes as saved under CntIO.h-w_CntAtt
% cf ReadCntAtt.m
%
function [P] = ReadAttPos(fileID)

P       = [];

P.nPos  = fread(fileID, 1, 'int=>single'); % # descriptors
nPos    = P.nPos;

P.Vrt   = fread(fileID, nPos, 'float=>single'); % vertical position
P.Hor   = fread(fileID, nPos, 'float=>single'); % horizontal position 

end

