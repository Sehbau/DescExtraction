%
% Loads the ensemble of line pattern as saved under s_PatEns in PatEnsIO.h
%
function Ens = LoadPatEns(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

Ens.Rdg = ReadPatLin(fileID);
Ens.Riv = ReadPatLin(fileID);
Ens.Edg = ReadPatLin(fileID);

Ens.Arc = ReadPatLin(fileID);
Ens.Str = ReadPatLin(fileID);

fclose(fileID);

