%
% Reads tiefe (depth) values as saved under Tiefe.h-w_TifPts
% cf eg ReadCntAtt.m
% sa ReadAttPos/Rgb.m
%
function [T] = ReadAttTif(fileID, nDsc)

T       = [];

T.Ep1   = fread(fileID, nDsc, 'float=>single');
T.Ep2   = fread(fileID, nDsc, 'float=>single'); 
T.Btw   = fread(fileID, nDsc, 'float=>single'); 

end

