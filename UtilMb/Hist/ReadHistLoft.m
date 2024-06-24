%
% Reads a local features histogram. It's the same as ReadHistSpa.
%
% cf LoadDescHist.m
%
function [Hloft nBin] = ReadHistLoft(fileID)

%% =====    # of bins   =====
nBin        = fread(fileID, 1,  'int=>int');

%% =====   Histogram   =====
Hloft       = fread(fileID, nBin, 'int=>int');

end

