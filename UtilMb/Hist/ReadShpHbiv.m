%
% Reads bivariate shape histograms as saved under ShpIO.h-w_ShpHbiv
%
% cf LoadDescHist.m
%
function [H nBin] = ReadShpHbiv(fileID)

[H Dim] = ReadHistArr(fileID);

nBin = Dim.nDty * Dim.nBin;

end