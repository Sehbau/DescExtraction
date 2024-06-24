%
% Reads bivariate contour histograms as saved under CntIO.h-w_CntHimd
%
% cf LoadDescHist.m
%
function [Hcat H Nbin] = ReadArcHbiv(fileID)

H    = struct;
Nbin = struct;

%% =====    # of bins   =====
Nbin.LK     = fread(fileID, 1,  'int=>int');
Nbin.LD     = fread(fileID, 1,  'int=>int');

Nbin.LKD    = fread(fileID, 1,  'int=>int');

%% =====   Histograms  =====
H.LK        = fread(fileID, Nbin.LK, 'int=>int');
H.LD        = fread(fileID, Nbin.LD, 'int=>int');

H.LKD       = fread(fileID, Nbin.LKD, 'int=>int');


Hcat = [H.LK' H.LD' H.LKD'];

end