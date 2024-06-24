%
% Reads the kolumn histograms as saved under w_KOLM
%
% cf LoadCntItgrSal.m
%
function [KOLM] = ReadKOLM(fileID)

Dim = struct;

%% =====    # of kols/bins   =====
Dim.nKol  = fread( fileID, 1,  'int=>int');
Dim.nBin  = fread( fileID, 1,  'int=>int');

fprintf('nKol/nBin  [%d %d]\n', Dim.nKol, Dim.nBin );

%% =====   Kolumns   =====
KOLM.H    = fread( fileID, Dim.nKol * Dim.nBin, 'int16=>int16');

KOLM.H    = reshape( KOLM.H, Dim.nBin, Dim.nKol );
KOLM.H    = KOLM.H' ;

KOLM.Dim  = Dim;

end

