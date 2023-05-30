%
% Reads bivariate contour histograms as saved under CntIO.h-w_CntHimd
%
% cf LoadDescHist.m
%
function [Hcat H Nbin] = ReadRsgHbiv(fileID)

H    = struct;
Nbin = struct;

%% =====    # of bins   =====
Nbin.RO     = fread(fileID, 1,  'int=>int');
Nbin.RE     = fread(fileID, 1,  'int=>int');
Nbin.RC     = fread(fileID, 1,  'int=>int');

Nbin.RV     = fread(fileID, 1,  'int=>int');
Nbin.R1     = fread(fileID, 1,  'int=>int');
Nbin.R2     = fread(fileID, 1,  'int=>int');
Nbin.R3     = fread(fileID, 1,  'int=>int');
Nbin.R4     = fread(fileID, 1,  'int=>int');
Nbin.R5     = fread(fileID, 1,  'int=>int');

Nbin.REO    = fread(fileID, 1,  'int=>int');

%% =====   Histograms  =====
H.RO        = fread(fileID, Nbin.RO, 'int=>int');
H.RE        = fread(fileID, Nbin.RE, 'int=>int');
H.RC        = fread(fileID, Nbin.RC, 'int=>int');

H.RV        = fread(fileID, Nbin.RV, 'int=>int');
H.R1        = fread(fileID, Nbin.R1, 'int=>int');
H.R2        = fread(fileID, Nbin.R2, 'int=>int');
H.R3        = fread(fileID, Nbin.R3, 'int=>int');
H.R4        = fread(fileID, Nbin.R4, 'int=>int');
H.R5        = fread(fileID, Nbin.R5, 'int=>int');

H.REO       = fread(fileID, Nbin.REO, 'int=>int');


Hcat = [H.RO' H.RE' H.RC'  H.RV' H.R1' H.R2' H.R3' H.R4' H.R5' H.REO'];

end

