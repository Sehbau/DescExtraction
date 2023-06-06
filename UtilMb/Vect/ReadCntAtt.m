%
% Reads contour attributes as saved under CntIO.h-w_CntAtt
% cf LoadCntxSpc.m
%
function [S nCnt] = ReadCntAtt(fileID)

S = [];

nCnt  = fread(fileID, 1,  'int=>int');

% =====   Geometry   =====
S.Les = fread(fileID, nCnt, 'float=>single'); % length
S.Str = fread(fileID, nCnt, 'float=>single'); % straightness

% =====   Position   =====
S.Ori  = fread(fileID, nCnt, 'float=>single'); % orientation angle
S.PosV = fread(fileID, nCnt, 'float=>single'); % vertical position
S.PosH = fread(fileID, nCnt, 'float=>single'); % horizontal position 
S.Tif  = fread(fileID, nCnt, 'float=>single'); % depth/range (from sensor)

% =====   Appearance   =====
S.Red  = fread(fileID, nCnt, 'float=>single');
S.Grn  = fread(fileID, nCnt, 'float=>single');
S.Blu  = fread(fileID, nCnt, 'float=>single');
S.Ctr  = fread(fileID, nCnt, 'float=>single'); % contrast

% =====   Trailer   =====
nGeo = fread(fileID, 1, 'int=>int');
nPos = fread(fileID, 1, 'int=>int');

assert(nGeo==2);
assert(nPos==3);

S.nCnt = nCnt;

end

