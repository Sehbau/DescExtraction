%
% Reads a spatial histogram. It's simply an array of integers.
%
% cf LoadDescHist.m
%
function [Hspa nBin] = ReadHistSpa(fileID)

%% =====    # of bins   =====
nBin        = fread(fileID, 1,  'int=>int');

%% =====   Histogram   =====
Hspa        = fread(fileID, nBin, 'int=>int');

end

