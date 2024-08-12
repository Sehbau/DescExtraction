%
% Loads the descriptor vectors (attributes) as saved under si_DescVect
%
function [V Kt] = LoadDescVect(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% -----  header
Hed     = ReadDescFileHead( fileID, 44 );

%% =====  Spaces  =====
[V.ACNT Kt.Ncnt]        = ReadCntSpc(fileID);
[V.ARSG Kt.Nrsg]        = ReadRsgSpc(fileID);
[V.AARCfll Kt.NarcFll]  = ReadArcSpc(fileID); % full set
[V.ASTRfll Kt.NstrFll]  = ReadStrSpc(fileID);
[V.ASHP  Kt.Nshp]       = ReadShpSpc(fileID); % shape

idfSpc    = fread(fileID, 1,  'int=>int');    % identifier
if (idfSpc~=66666) 
    error('Spaces not properly read (see si_DescVect');
end

% order reversed!?
[V.ASTRgst Kt.NstrGst]  = ReadStrSpc(fileID); % gerust
[V.AARCgst Kt.NarcGst]  = ReadArcSpc(fileID);

idfGst    = fread(fileID, 1,  'int=>int');    % identifier
if (idfGst~=77777) 
    error('Gerust not properly read (see si_DescVect');
end

[V.ABNDG Kt.Nbndg]      = ReadBndgSpc(fileID); % bundles

%% -----  Labels  -----
V.LabShpScors = ReadAttLab( fileID, size(V.ASHP{1}.STR,2) );
V.LabShpSfine = ReadAttLab( fileID, size(V.ASHP{1}.SFI,2) );

%% =====  trailer/idf   ======
idf    = fread(fileID, 1,  'int=>int'); % identifier

%% =====  ImgZug   ======
%size_t    = fread(fileID, 2,  'uint32=>int'); % size_t of C
%size_t

fclose(fileID);

if (idf~=99999)
    fprintf('file identifier not correct %d. Expected 99999\n', idf);
    V.ASHP
    Kt.Nshp
    pause('pausing in LoadDescVect');
end

%% ------   A2S   -------
%Kt.Ncnt
Kt.nLev    = double(Hed.nLev);      % its easier in Matlab with double
Kt.szV     = double(Hed.szV);
Kt.szH     = double(Hed.szH);
Kt.ntDsc   = double(Hed.ntDsc);

