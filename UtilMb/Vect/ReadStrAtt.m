%
% Reads straighter attributes as saved under StrIO.h-w_StrAtt
% cf LoadDescVect.m
%
function [S nStr] = ReadStrAtt(fileID)

S = [];

nStr  = fread(fileID, 1,  'int=>int');

% =====   Geometry   =====
S.Les = fread(fileID, nStr, 'float=>single');
S.Str = fread(fileID, nStr, 'float=>single');
S.Smo = fread(fileID, nStr, 'float=>single');

% =====   Appearance   =====
S.Red  = fread(fileID, nStr, 'float=>single');
S.Grn  = fread(fileID, nStr, 'float=>single');
S.Blu  = fread(fileID, nStr, 'float=>single');
%S.Ctr  = fread(fileID, nStr, 'float=>single'); % contrast

% =====   Position   =====
S.Ori  = fread(fileID, nStr, 'float=>single');
S.PosV = fread(fileID, nStr, 'float=>single');
S.PosH = fread(fileID, nStr, 'float=>single');
%S.Tif  = fread(fileID, nStr, 'float=>single'); % depth/range (from sensor)

% =====   Origin   =====
S.OrgCrv = fread(fileID, nStr, 'int=>int'); 
S.OrgDth = fread(fileID, nStr, 'uint8=>uint8'); 

% =====   Trailer   =====
nGeo    = fread(fileID, 1, 'int=>int');
nPos    = fread(fileID, 1, 'int=>int');

assert(nGeo==2);
assert(nPos==3);

S.nStr = nStr;

%% ---- Further verification
assert(max(S.OrgDth)<6); % more than 5 depths is unfeasible

end

