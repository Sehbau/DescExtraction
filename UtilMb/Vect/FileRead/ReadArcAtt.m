%
% Reads arc attributes as saved under ArcIO.h-w_ArcAtt
% cf LoadDescVect.m
%
function [S nArc] = ReadArcAtt(fileID)

S = [];

Hed     = ReadDescAttHead(fileID);
nArc    = Hed.nDsc;

% =====   Geometry   =====
S.Krv  = fread(fileID, nArc, 'float=>single');
S.Les  = fread(fileID, nArc, 'float=>single');

S.Spz  = fread(fileID, nArc, 'float=>single'); % limitedly useful
S.Eck  = fread(fileID, nArc, 'float=>single'); % limitedly useful

S.Smo  = fread(fileID, nArc, 'float=>single'); % smoothness
S.Am1  = fread(fileID, nArc, 'float=>single'); % limitedly useful
S.Am2  = fread(fileID, nArc, 'float=>single'); % limitedly useful

% =====   Appearance   =====
S.RGB   = ReadAttRgb(fileID, nArc);
%S.Ctr  = fread(fileID, nCnt, 'float=>single'); % contrast

% =====   Position   =====
S.Dir   = fread(fileID, nArc, 'float=>single');
S.Pos   = ReadAttPos(fileID);

if Hed.bTif
    S.Tif  = ReadAttTif(fileID, nArc); % depth/range (from sensor)
end

% =====   Origin   =====
S.OrgCrv = fread(fileID, nArc, 'int=>int');     % boundary index/label
S.OrgDth = fread(fileID, nArc, 'uint8=>uint8'); % depth map

% =====   Trailer   =====
idf    = fread(fileID, 1, 'int16=>int');
assert(idf==3333);

S.nArc = nArc;
if nArc==0, return; end

%% ---- Further verification
assert(max(S.OrgDth)<6); % more than 5 depths is unfeasible

end
