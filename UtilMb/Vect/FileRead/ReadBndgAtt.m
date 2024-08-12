%
% Reads bundle attributes as saved under BndgIO.h-w_BndgAtt
% cf LoadCntxSpc.m
%
function [S nBndg] = ReadBndgAtt(fileID)

S       = [];

%%  ====================   Header   ====================
Hed     = ReadDescAttHead(fileID);
nBndg   = Hed.nDsc;
S.nBndg = nBndg;

%%  ====================   Data   ====================

% =====   Geometry   =====
S.Les   = fread(fileID, nBndg, 'float=>single'); % length
S.Agx   = fread(fileID, nBndg, 'float=>single'); % angle
S.Tig   = fread(fileID, nBndg, 'float=>single'); % tightness
S.Dns   = fread(fileID, nBndg, 'float=>single'); % denseness

% =====   Position   =====
S.Ori   = fread(fileID, nBndg, 'float=>single'); % orientation angle

S.Pos   = ReadAttPos(fileID);

%Hed.bTif
if Hed.bTif
    S.Tif  = ReadAttTif(fileID, nBndg); % depth/range (from sensor)
end

% =====   Appearance   =====
S.RGB   = ReadAttRgb(fileID, nBndg);
%S.Ctr   = fread(fileID, nBndg, 'float=>single'); % contrast

% =====   Trailer   =====
idf    = fread(fileID, 1, 'int16=>int');
assert(idf==8888);


end

