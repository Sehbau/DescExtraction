%
% Loads the descriptor histogram as saved under si_DescHist
%
function [HFU HFB HSP Nfu Nbiv Nspa] = LoadDescHist(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% -----  regional histograms
bReg    = fread(fileID, 1,  'uint8=>uint8'); % not used at the moment

%% =====  flat univariate histograms  =====
[HFU.Rdg Nfu.Rdg] = ReadCntHist(fileID);
[HFU.Riv Nfu.Riv] = ReadCntHist(fileID);
[HFU.Edg Nfu.Edg] = ReadCntHist(fileID);

[HFU.Rsg Nfu.Rsg] = ReadRsgHist(fileID);

[HFU.Arc Nfu.Arc] = ReadArcHist(fileID);

[HFU.Str Nfu.Str] = ReadCntHist(fileID); % same params as Cnt

%% =====  flat bivariate histograms   =====
[HFB.Rdg HBIV.Rdg Nbiv.Rdg] = ReadCntHbiv(fileID);
[HFB.Riv HBIV.Riv Nbiv.Riv] = ReadCntHbiv(fileID);
[HFB.Edg HBIV.Edg Nbiv.Edg] = ReadCntHbiv(fileID);

[HFB.Rsg HBIV.Rsg Nbiv.Rsg] = ReadRsgHbiv(fileID);

[HFB.Arc HBIV.Arc Nbiv.Arc] = ReadArcHbiv(fileID);

[HFB.Str HBIV.Str Nbiv.Str] = ReadCntHbiv(fileID);

%% =====  spatial histograms, uni & biv   ======
[HSP.CntUni  Nspa.cntUni]   = ReadHistSpa(fileID);
[HSP.CntBiv  Nspa.cntBiv]   = ReadHistSpa(fileID);

[HSP.RsgUni  Nspa.rsgUni]   = ReadHistSpa(fileID);
[HSP.RsgBiv  Nspa.rsgBiv]   = ReadHistSpa(fileID);

[HSP.ArcUni  Nspa.arcUni]   = ReadHistSpa(fileID);
[HSP.ArcBiv  Nspa.arcBiv]   = ReadHistSpa(fileID);

[HSP.StrUni  Nspa.strUni]   = ReadHistSpa(fileID);
[HSP.StrBiv  Nspa.strBiv]   = ReadHistSpa(fileID);

%% =====  trailer/idf   ======
idf    = fread(fileID, 1,  'int=>int'); % identifier
assert(idf==999);

fclose(fileID);





