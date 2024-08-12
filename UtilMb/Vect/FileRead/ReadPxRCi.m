%
% Reads data as saved under w_PxRCi
%
function S = ReadPxRCi(fileID)

%% ----- Read 
S.nCo    = fread(fileID,     1, 'int=>int');    
S.szM    = fread(fileID,     2, 'int=>int');    
S.Rw     = fread(fileID, S.nCo, 'int=>int')+1;    
S.Cl     = fread(fileID, S.nCo, 'int=>int')+1;  

%% ----- Rearrange
S.Pt     = [S.Rw S.Cl];

end