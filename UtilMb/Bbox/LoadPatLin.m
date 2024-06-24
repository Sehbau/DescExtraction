%
% Loads line pattern as saved under s_PatLin in PatIO.h
%
% af LoadCntxSpc
%
function Pat = LoadPatLin(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

Pat = ReadPatLin(fileID);

fclose(fileID);

