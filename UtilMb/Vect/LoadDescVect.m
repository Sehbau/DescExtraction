%
% Loads the descriptor histogram as saved under si_DescHist
%
function [ACNT Kt] = LoadDescVect(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% -----  header
nLev  = fread(fileID, 1,  'int=>int');      % # of pyramid levels
szV   = fread(fileID, 1,  'int=>int');      % vertical image size
szH   = fread(fileID, 1,  'int=>int');      % horizontal image size
bGrp  = fread(fileID, 1,  'uint8=>uint8'); % not used at the moment


assert(nLev<12,'nLev too large: %d', nLev);
assert(szV<5000, 'szV unresoable: %d', szV);
assert(szH<5000, 'szH unresoable: %d', szH);

%% =====  Spaces  =====
[ACNT Kt.Ncnt] = ReadCntSpc(fileID);

% not implemented yet
% [ARSG Kt.Nrsg] = ReadRsgSpc(fileID);
% [AARC Kt.Narc] = ReadArcSpc(fileID);
% [ASTR Kt.Nstr] = ReadStrSpc(fileID);

Kt.Ncnt
Kt.nLev    = nLev;

%% =====  trailer/idf   ======
%idf    = fread(fileID, 1,  'int=>int'); % identifier
%assert(idf==888);

fclose(fileID);





