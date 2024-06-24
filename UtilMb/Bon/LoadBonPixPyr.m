%
% Loads as saved under B_BON/Util/BonIO.h-s_BonAspPyr().
%
function [APIX Nbon SzM] = LoadBonPixPyr(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% ----- nLev
nLev  = fread(fileID, 1, 'int=>single');
fprintf('[nLev %d] ', nLev);

%% -----  Count -> Nlevs
Nbon = zeros(nLev,1);

%% =====  BoundingBoxes
APIX = cell(nLev,1);
SzM  = zeros(nLev,2);
Pix  = struct;
for l = 1:nLev

    %% ====  sizes  ====
    nBon     = fread(fileID, 1, 'int=>single');
    SzM(l,:) = fread(fileID, 2, 'int=>single');

    Nbon(l) = nBon;
    fprintf('%4d ', nBon);
    
    %% ====  arrays  ====
    APix = cell(nBon,1);
    Org  = zeros(nBon,1);  % not returned. 
    for b = 1:nBon
        
        nPx     = fread(fileID, 1, 'int=>single');
        Org(b)  = fread(fileID, 1, 'uint8=>single');
        
        Pix.Rw  = fread(fileID, nPx, 'int16=>single');
        Pix.Cl  = fread(fileID, nPx, 'int16=>single');
        
        APix{b} = Pix;
    end
    
    idf     = fread(fileID, 1, 'int=>single');
    assert(idf==626);
    
    APIX{l} = APix;
    
end

id = fread(fileID, 1, 'int=>single');

fclose(fileID);

assert(id==333);

fprintf('\n');

