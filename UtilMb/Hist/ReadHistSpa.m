%
% Reads a spatial histogram as saved under w_HistSpa
%
% cf LoadDescHist.m
%
function [Hspa nBin] = ReadHistSpa(fileID)

%% =====    # of bins   =====
nBin        = fread(fileID, 1,  'int=>int');

%% =====   Histogram   =====
Hspa        = fread(fileID, nBin, 'int=>int');

end

