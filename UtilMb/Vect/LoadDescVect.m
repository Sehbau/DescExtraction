%
% Loads the descriptor histogram as saved under si_DescHist
%
function [V Kt] = LoadDescVect(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% -----  header
nLev  = fread(fileID, 1,  'int=>int');      % # of pyramid levels
szV   = fread(fileID, 1,  'int=>int');      % vertical image size
szH   = fread(fileID, 1,  'int=>int');      % horizontal image size
bGrp  = fread(fileID, 1,  'uint8=>uint8'); % not used at the moment


assert(nLev<12,'nLev too large: %d', nLev);
assert(szV<5000, 'szV unreasonable: %d', szV);
assert(szH<5000, 'szH unreasnoable: %d', szH);

%% =====  Spaces  =====
[V.ACNT Kt.Ncnt] = ReadCntSpc(fileID);
[V.ARSG Kt.Nrsg] = ReadRsgSpc(fileID);
[V.AARCfll Kt.NarcFll] = ReadArcSpc(fileID); % full set
[V.ASTRfll Kt.NstrFll] = ReadStrSpc(fileID);

% order reversed!?
[V.ASTRgst Kt.NstrGst] = ReadStrSpc(fileID); % gerust
[V.AARCgst Kt.NarcGst] = ReadArcSpc(fileID);

Kt.Ncnt
Kt.nLev    = double(nLev);          % its easier in Matlab with double

%% =====  trailer/idf   ======
%idf    = fread(fileID, 1,  'int=>int'); % identifier
%assert(idf==888);

fclose(fileID);






