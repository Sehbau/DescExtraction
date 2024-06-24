%
% Reads contour histograms as saved under CntIO.h-w_CntHist
%
% cf LoadDescHist.m
%
function [Hcat Nbin] = ReadCntHist(fileID)

Nbin = struct;

%% =====    # of bins   =====
Nbin.len  = fread(fileID, 1,  'int=>int');
Nbin.str  = fread(fileID, 1,  'int=>int');
Nbin.ori  = fread(fileID, 1,  'int=>int');
Nbin.crm  = fread(fileID, 1,  'int=>int');

%% =====   Histograms  =====
Hlen   = fread(fileID, Nbin.len, 'int=>int');
Hstr   = fread(fileID, Nbin.str, 'int=>int');
Hori   = fread(fileID, Nbin.ori, 'int=>int');

Hred   = fread(fileID, Nbin.crm, 'int=>int');
Hgrn   = fread(fileID, Nbin.crm, 'int=>int');
Hblu   = fread(fileID, Nbin.crm, 'int=>int');

Hcat = [Hlen' Hstr' Hori' Hred' Hgrn' Hblu'];

end

