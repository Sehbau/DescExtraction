%
% Loads boundary aspects such as 
%    - chromatic values: red, green, blue
%    - coverage: proportion area of image
%    - perimeter: of boundary (absolute values)
%
% Loads as saved under B_BON/Util/BonIO.h-s_BonAspPyr().
%
function [AASP Nbon] = LoadBonAspPyr(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% ----- nLev
nLev    = fread(fileID, 1, 'int=>single');
fprintf('[nLev %d] ', nLev);

%% =====  BoundingBoxes
Nbon    = zeros(nLev,1);
AASP    = cell(nLev,1);
Asp     = struct;
for l = 1:nLev

    nBon    = fread(fileID, 1, 'int=>single');
    Nbon(l) = nBon;
    fprintf('%4d ', nBon);
    
    %Bon.nBon    = fread(fileID, 1, 'int=>single');
    Asp.RGB.Red = fread(fileID, nBon, 'uint8=>single');
    Asp.RGB.Grn = fread(fileID, nBon, 'uint8=>single');
    Asp.RGB.Blu = fread(fileID, nBon, 'uint8=>single');

    %Asp.Cvrg    = fread(fileID, nBon, 'float=>single');     % coverage
    Asp.Bord    = fread(fileID, nBon, 'uint8=>single');     % border info

    Asp.ArePix  = fread(fileID, nBon, 'int=>single');       % area pixels
    Asp.AreBon  = fread(fileID, nBon, 'float=>single');     % area boundary
    Asp.Peri    = fread(fileID, nBon, 'float=>single');     % perimeter
    Asp.Cwd     = fread(fileID, nBon, 'int32=>single');     % perimeter
    
    AASP{l} = Asp;
end

id = fread(fileID, 1, 'int=>single');

fclose(fileID);

assert(id==333);

fprintf('\n');

