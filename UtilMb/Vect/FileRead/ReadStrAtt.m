%
% Reads straighter attributes as saved under StrIO.h-w_StrAtt
% cf LoadDescVect.m
%
function [S nStr] = ReadStrAtt(fileID)

S       = [];

Hed     = ReadDescAttHead(fileID);
nStr    = Hed.nDsc;

% =====   Geometry   =====
S.Les   = fread(fileID, nStr, 'float=>single');
S.Str   = fread(fileID, nStr, 'float=>single');
S.Smo   = fread(fileID, nStr, 'float=>single');

% =====   Appearance   =====
S.RGB   = ReadAttRgb(fileID, nStr);
%S.Ctr  = fread(fileID, nStr, 'float=>single'); % contrast

% =====   Position   =====
S.Ori   = fread(fileID, nStr, 'float=>single');
S.Pos   = ReadAttPos(fileID);

%S.Tif  = fread(fileID, nStr, 'float=>single'); % depth/range (from sensor)

% =====   Origin   =====
S.OrgCrv = fread(fileID, nStr, 'int=>int'); 
S.OrgDth = fread(fileID, nStr, 'uint8=>uint8'); 

% =====   Trailer   =====
idf    = fread(fileID, 1, 'int16=>int');
assert(idf==4444);

S.nStr = nStr;

%% ---- Further verification
if S.nStr
    assert(max(S.OrgDth)<6); % more than 5 depths is unfeasible
end

end

