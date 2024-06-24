%
% Reads an array of histograms [nDty nBin] as saved under w_HistArr.
%
% cf LoadDescHist.m
%
function [Harr Dim] = ReadHistArr(fileID)

%% =====    # of bins   =====
nDty        = fread(fileID, 1,  'int=>int');
nBin        = fread(fileID, 1,  'int=>int');

%% =====   Histogram   =====
Harr        = fread(fileID, nDty*nBin, 'int=>int');

Dim.nDty    = nDty;
Dim.nBin    = nBin;

end

