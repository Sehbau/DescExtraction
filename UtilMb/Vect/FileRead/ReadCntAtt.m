%
% Reads contour attributes as saved under CntIO.h-w_CntAtt
% cf LoadCntxSpc.m
%
function [S nCnt] = ReadCntAtt(fileID)

S       = [];

%%  ====================   Header   ====================
Hed     = ReadDescAttHead(fileID);
nCnt    = Hed.nDsc;
S.nCnt  = nCnt;

%%  ====================   Data   ====================

% =====   Geometry   =====
S.Les   = fread(fileID, nCnt, 'float=>single'); % length
S.Str   = fread(fileID, nCnt, 'float=>single'); % straightness

% =====   Position   =====
S.Ori   = fread(fileID, nCnt, 'float=>single'); % orientation angle

S.Pos   = ReadAttPos(fileID);

if Hed.bTif
    S.Tif  = ReadAttTif(fileID, nCnt); % depth/range (from sensor)
end

% =====   Appearance   =====
S.RGB   = ReadAttRgb(fileID, nCnt);
S.Ctr   = fread(fileID, nCnt, 'float=>single'); % contrast

% =====   Trailer   =====
idf    = fread(fileID, 1, 'int16=>int');
assert(idf==1111);


end

