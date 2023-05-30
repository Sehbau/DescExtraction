%
% Reads contour histogramsas saved under CntIO.h-w_CntHist
%
% cf LoadDescHist.m
%
function [Hcat Nbin] = ReadArcHist(fileID)

H    = struct;
Nbin = struct;

%% =====    # of bins   =====
Nbin.len  = fread(fileID, 1,  'int=>int');
Nbin.krv  = fread(fileID, 1,  'int=>int');
Nbin.dir  = fread(fileID, 1,  'int=>int');
Nbin.crm  = fread(fileID, 1,  'int=>int');

%% =====   Histograms  =====
H.Len   = fread(fileID, Nbin.len, 'int=>int');
H.Krv   = fread(fileID, Nbin.krv, 'int=>int');
H.Dir   = fread(fileID, Nbin.dir, 'int=>int');

H.Red   = fread(fileID, Nbin.crm, 'int=>int');
H.Grn   = fread(fileID, Nbin.crm, 'int=>int');
H.Blu   = fread(fileID, Nbin.crm, 'int=>int');

Hcat = [H.Len' H.Krv' H.Dir' H.Red' H.Grn' H.Blu'];

end

