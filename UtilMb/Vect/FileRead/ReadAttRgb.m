%
% Reads rgb values as saved under Rgb.h-w_RgbArrF
% cf eg ReadCntAtt.m
% sa ReadAttPos.m
%
function [C] = ReadAttRgb(fileID, nDsc)

C       = [];

C.Red   = fread(fileID, nDsc, 'float=>single');
C.Grn   = fread(fileID, nDsc, 'float=>single');
C.Blu   = fread(fileID, nDsc, 'float=>single');

end

