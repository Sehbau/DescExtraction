%
% Reads arc attributes as saved under ArcIO.h-w_ArcAtt
% cf LoadDescVect.m
%
function [S nArc] = ReadArcAtt(fileID)

S = [];

nArc  = fread(fileID, 1,  'int=>int');

% =====   Geometry   =====
S.Krv  = fread(fileID, nArc, 'float=>single');
S.Les  = fread(fileID, nArc, 'float=>single');

S.Spz  = fread(fileID, nArc, 'float=>single'); % limitedly useful
S.Eck  = fread(fileID, nArc, 'float=>single'); % limitedly useful

S.Smo  = fread(fileID, nArc, 'float=>single'); % smoothness
S.Am1  = fread(fileID, nArc, 'float=>single'); % limitedly useful
S.Am2  = fread(fileID, nArc, 'float=>single'); % limitedly useful

% =====   Appearance   =====
S.Red  = fread(fileID, nArc, 'float=>single');
S.Grn  = fread(fileID, nArc, 'float=>single');
S.Blu  = fread(fileID, nArc, 'float=>single');
%S.Ctr  = fread(fileID, nCnt, 'float=>single'); % contrast

% =====   Position   =====
S.Dir   = fread(fileID, nArc, 'float=>single');
S.PosV  = fread(fileID, nArc, 'float=>single');
S.PosH  = fread(fileID, nArc, 'float=>single');
S.TifE1 = fread(fileID, nArc, 'float=>single'); % depth/range (from sensor)
S.TifE2 = fread(fileID, nArc, 'float=>single'); 
S.TifPk = fread(fileID, nArc, 'float=>single'); 

% =====   Origin   =====
S.OrgCrv = fread(fileID, nArc, 'int=>int');     % boundary index/label
S.OrgDth = fread(fileID, nArc, 'uint8=>uint8'); % depth map

% =====   Trailer   =====
nGeo    = fread(fileID, 1, 'int=>int');
nApp    = fread(fileID, 1, 'int=>int');

assert(nGeo==2);
assert(nApp==3);

S.nArc = nArc;
if nArc==0, return; end

%% ---- Further verification
assert(max(S.OrgDth)<6); % more than 5 depths is unfeasible

end
