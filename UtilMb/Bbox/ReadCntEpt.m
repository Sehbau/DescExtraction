%
% Reads contour attributes as saved under CntIO.h-w_CntAtt
%
% cf LoadCntxSpcEpt.m
%
function [S] = ReadCntEpt(fileID)

S = [];

nCnt  = fread(fileID, 1,  'int=>int');

% =====   Keypoints  =====
S.Ep1 = fread(fileID, nCnt*2, 'float=>single');
S.Ep2 = fread(fileID, nCnt*2, 'float=>single');
S.Mip = fread(fileID, nCnt*2, 'float=>single');

S.Ep1 = reshape(S.Ep1, [2 nCnt])';
S.Ep2 = reshape(S.Ep2, [2 nCnt])';
S.Mip = reshape(S.Mip, [2 nCnt])';

% =====   Trailer   =====
idf = fread(fileID, 1, 'int=>int');

assert(idf==977);

S.nCnt = nCnt;

end

