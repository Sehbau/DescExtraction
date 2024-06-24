%
% Loads the descriptor histogram as saved under si_DescHist
%
% IN    lfn     file path
% OUT   UNF     univariate, flat
%       BIF     bivariate, flat
%       SPA     spatial histograms, univariate & bivariate
%       Nunf    count for UNF
%       Nbif    count for BIF
%       Nspa    count for SPA
%
function [UNF BIF SPA Nunf Nbif Nspa] = LoadDescHist(lfn) 

HISTIOIDF = 8888888;


fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% -----  regional histograms
bReg    = fread(fileID, 1,  'uint8=>uint8'); % not used at the moment

%% =====  flat univariate histograms  =====
[UNF.Rdg Nunf.Rdg] = ReadCntHist(fileID);
[UNF.Riv Nunf.Riv] = ReadCntHist(fileID);
[UNF.Edg Nunf.Edg] = ReadCntHist(fileID);

[UNF.Skl Nunf.Skl] = ReadCntHist(fileID);

[UNF.Rsg Nunf.Rsg] = ReadRsgHist(fileID);

[UNF.Arc Nunf.Arc] = ReadArcHist(fileID);

[UNF.Str Nunf.Str] = ReadCntHist(fileID); % same params as Cnt

[UNF.Shp Nunf.Shp] = ReadShpHist(fileID); 

[UNF.Lof Nunf.Lof] = ReadHistLoft(fileID); % local feature histogram

idf    = fread(fileID, 1,  'int=>int'); % identifier
assert(idf==HISTIOIDF, 'Univariate falsch');


%% =====  flat bivariate histograms   =====
[BIF.Rdg HBIV.Rdg Nbif.Rdg] = ReadCntHbiv(fileID);
[BIF.Riv HBIV.Riv Nbif.Riv] = ReadCntHbiv(fileID);
[BIF.Edg HBIV.Edg Nbif.Edg] = ReadCntHbiv(fileID);

[BIF.Skl HBIV.Skl Nbif.Skl] = ReadCntHbiv(fileID);

[BIF.Rsg HBIV.Rsg Nbif.Rsg] = ReadRsgHbiv(fileID);

[BIF.Arc HBIV.Arc Nbif.Arc] = ReadArcHbiv(fileID);

[BIF.Str HBIV.Str Nbif.Str] = ReadCntHbiv(fileID);

[BIF.Shp          Nbif.Shp] = ReadShpHbiv(fileID);

idf    = fread(fileID, 1,  'int=>int'); % identifier
assert(idf==HISTIOIDF, 'Bivariate falsch');


%% =====  spatial histograms, uni & biv   ======
[SPA.CntUni  Nspa.cntUni]   = ReadHistSpa(fileID);
[SPA.CntBiv  Nspa.cntBiv]   = ReadHistSpa(fileID);

[SPA.SklUni  Nspa.sklUni]   = ReadHistSpa(fileID);
[SPA.SklBiv  Nspa.sklBiv]   = ReadHistSpa(fileID);

[SPA.RsgUni  Nspa.rsgUni]   = ReadHistSpa(fileID);
[SPA.RsgBiv  Nspa.rsgBiv]   = ReadHistSpa(fileID);

[SPA.ArcUni  Nspa.arcUni]   = ReadHistSpa(fileID);
[SPA.ArcBiv  Nspa.arcBiv]   = ReadHistSpa(fileID);

[SPA.StrUni  Nspa.strUni]   = ReadHistSpa(fileID);
[SPA.StrBiv  Nspa.strBiv]   = ReadHistSpa(fileID);

[SPA.ShpUni  Nspa.shpUni]   = ReadHistSpa(fileID);

%% =====  trailer/idf   ======
idf    = fread(fileID, 1,  'int=>int'); % identifier
assert(idf==HISTIOIDF, 'Spatial falsch');

fclose(fileID);





