%
% Reads line pattern as under PatIO.h-w_PatLin
%
% cf LoadPatLin.m
%
function [S] = ReadPatLin(fileID)

S = [];

nLin  = fread(fileID, 1,  'int=>int');

% =====   Keypoints  =====
S.Ep1 = fread(fileID, nLin*2, 'float=>single');
S.Ep2 = fread(fileID, nLin*2, 'float=>single');
S.Mip = fread(fileID, nLin*2, 'float=>single');

S.Ep1 = reshape(S.Ep1, [2 nLin])';
S.Ep2 = reshape(S.Ep2, [2 nLin])';
S.Mip = reshape(S.Mip, [2 nLin])';

S.Ori = fread(fileID, nLin, 'float=>single');
S.Len = fread(fileID, nLin, 'float=>single');

S.Wgt = fread(fileID, nLin, 'float=>single');

S.Typ = fread(fileID, nLin, 'uint8=>single');
S.Lev = fread(fileID, nLin, 'uint8=>single');

% =====   Trailer   =====
idf = fread(fileID, 1, 'int=>int');

assert(idf==99999);

S.nLin = nLin;

end

