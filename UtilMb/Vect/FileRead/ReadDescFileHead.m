%
% Reads descriptor file header, namely struct fhedVect in
% E_DESC/UtilIO/DescFileAnf.h.
%
% cf LoadDescVect.m, LoadFocVect.m 
%
function [H] = ReadDescFileHead( fileID, idfExp )

nLev   = fread(fileID, 1,  'int=>int');      % # of pyramid levels
szV    = fread(fileID, 1,  'int=>int');      % vertical image size
szH    = fread(fileID, 1,  'int=>int');      % horizontal image size
ntDsc  = fread(fileID, 1,  'int=>int');      % # of total desc
idfLod = fread(fileID, 1,  'uint8=>uint8');  % file identifier

% flags (unsigned char)
bGrp   = fread(fileID, 1,  'uint8=>uint8');  % groups
bFlg2  = fread(fileID, 1,  'uint8=>uint8');  % not used at the moment
bFlg3  = fread(fileID, 1,  'uint8=>uint8');  % not used at the moment
bFlg4  = fread(fileID, 1,  'uint8=>uint8');  % not used at the moment
bFlg5  = fread(fileID, 1,  'uint8=>uint8');  % not used at the moment

vers   = fread(fileID, 1,  'int16=>int16');  % version

assert(idfLod==idfExp,'file idf not correct: %d, expected %d', idfLod, idfExp);
assert(nLev>0 && nLev<12,'nLev not correct: %d', nLev);
assert(szV>0 && szV<5000, 'szV unreasonable: %d', szV);
assert(szH>0 && szH<5000, 'szH unreasnoable: %d', szH);

H.nLev  = nLev;
H.szV   = szV;
H.szH   = szH;
H.ntDsc = ntDsc;


end

