%
% Reads contour attributes as saved under CntIO.h-w_CntAtt
% cf LoadCntxSpc.m
%
function [S nRsg] = ReadRsgAtt(fileID)

S = [];

nRsg  = fread(fileID, 1,  'int=>int');

% =====   Geometry   =====
S.Rds  = fread(fileID, nRsg, 'float=>single');
S.Cir  = fread(fileID, nRsg, 'float=>single');
S.EloR = fread(fileID, nRsg, 'float=>single');
S.Cncv = fread(fileID, nRsg, 'float=>single');

S.Bis1 = fread(fileID, nRsg, 'float=>single');
S.Bis2 = fread(fileID, nRsg, 'float=>single');
S.Bis3 = fread(fileID, nRsg, 'float=>single');
S.Bis4 = fread(fileID, nRsg, 'float=>single');
S.Bis5 = fread(fileID, nRsg, 'float=>single');

S.Star = fread(fileID, nRsg, 'float=>single');
S.Dent = fread(fileID, nRsg, 'float=>single');

% =====   Position   =====
S.Ori  = fread(fileID, nRsg, 'float=>single');
S.Pos  = ReadAttPos(fileID);

%S.Tif  = fread(fileID, nRsg, 'float=>single'); % depth/range (from sensor)

% =====   Appearance   =====
S.Red  = fread(fileID, nRsg, 'float=>single');
S.Grn  = fread(fileID, nRsg, 'float=>single');
S.Blu  = fread(fileID, nRsg, 'float=>single');

% =====   Trailer   =====
idf    = fread(fileID, 1, 'int16=>int');
assert(idf==2222);

S.nRsg = nRsg;

end
