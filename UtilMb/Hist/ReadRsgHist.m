%
% Reads radsig histogramsas saved under RsgIO.h-w_RsgHist
%
% cf LoadDescHist.m
%
function [Hcat Nbin] = ReadRsgHist(fileID)

H    = struct;
Nbin = struct;

% =====    # of bins   =====
Nbin.rds  = fread(fileID, 1,  'int=>int');
Nbin.elo  = fread(fileID, 1,  'int=>int');
Nbin.cir  = fread(fileID, 1,  'int=>int');
Nbin.ori  = fread(fileID, 1,  'int=>int');
Nbin.crm  = fread(fileID, 1,  'int=>int');

Nbin.cncv = fread(fileID, 1,  'int=>int');
Nbin.bis1 = fread(fileID, 1,  'int=>int');
Nbin.bis2 = fread(fileID, 1,  'int=>int');
Nbin.bis3 = fread(fileID, 1,  'int=>int');
Nbin.bis4 = fread(fileID, 1,  'int=>int');
Nbin.bis5 = fread(fileID, 1,  'int=>int');

% =====   Histograms  =====
Hrds   = fread(fileID, Nbin.rds, 'int=>int');
Helo   = fread(fileID, Nbin.elo, 'int=>int');
Hcir   = fread(fileID, Nbin.cir, 'int=>int');
Hori   = fread(fileID, Nbin.ori, 'int=>int');

Hred   = fread(fileID, Nbin.crm, 'int=>int');
Hgrn   = fread(fileID, Nbin.crm, 'int=>int');
Hblu   = fread(fileID, Nbin.crm, 'int=>int');

H.Cncv  = fread(fileID, Nbin.cncv, 'int=>int');
H.Bis1  = fread(fileID, Nbin.bis1, 'int=>int');
H.Bis2  = fread(fileID, Nbin.bis2, 'int=>int');
H.Bis3  = fread(fileID, Nbin.bis3, 'int=>int');
H.Bis4  = fread(fileID, Nbin.bis4, 'int=>int');
H.Bis5  = fread(fileID, Nbin.bis5, 'int=>int');

Hcat = [Hrds' Helo' Hcir' Hori' Hred' Hgrn' Hblu'];
Hcat = [Hcat H.Cncv' H.Bis1' H.Bis2' H.Bis3' H.Bis4' H.Bis5'];

end

