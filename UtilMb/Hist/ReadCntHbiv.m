%
% Reads bivariate contour histograms as saved under CntIO.h-w_CntHimd
%
% cf LoadDescHist.m
%
function [Hcat H Nbin] = ReadCntHbiv(fileID)

H    = struct;
Nbin = struct;

%% =====    # of bins   =====
Nbin.LS     = fread(fileID, 1,  'int=>int');
Nbin.LO     = fread(fileID, 1,  'int=>int');

%% =====   Histograms  =====
H.LS        = fread(fileID, Nbin.LS, 'int=>int');
H.LO        = fread(fileID, Nbin.LO, 'int=>int');

Hcat = [H.LS' H.LO'];

end

