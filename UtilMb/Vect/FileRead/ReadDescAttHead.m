%
% Reads attributes header ( A_ANF/Desc/DescIOanf.h )
%
% cf Read{Dsc}Att.m, ie ReadCntAtt.
%
function [H] = ReadDescAttHead( fileID )

H = [];

% =====   Geometry   =====
H.nDsc = fread( fileID, 1, 'int=>single'); % # descriptors
H.bTif = fread( fileID, 1, 'uint8=>uint8'); % depth info (boolean)
%H.bCol = fread(fileID, 1, 'uint8=>uint8'); % color info (boolean)

end

