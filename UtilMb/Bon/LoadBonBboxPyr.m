%
% Loads boundary bounding boxes with 6 parameters:
%   [top bot lef rit contrast depth]
% They are saved per level with gray-scale variability at the end of each
% level list:
%   {level 0} [2]
%   {level 1} [2]
%     ....
%   {level top} [2]
%
% Loads as saved under B_BON/Util/BonIO.h-s_BonBboxPyr().
% Bounding boxes are already scaled to original image resolution.
%
function [ABbox Nbon IxX] = LoadBonBboxPyr(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% ----- nLev
nLev  = fscanf(fileID, '%d', 1);    
fprintf('[nLev %d] ', nLev);

%% -----  Count -> Nlevs
Nbon=zeros(nLev,1);
for l = 1:nLev
    Nbon(l)   = fscanf(fileID, '%d', 1);
    fprintf('%4d ', Nbon(l));
    %fprintf('\n');
end
fprintf('\n');

%% =====  BoundingBoxes
nEnt  = 6;                   % number of parameters per bbox
ABbox = cell(nLev,1);
for l = 1:nLev
    
    nBon    = Nbon(l);
    PRM     = zeros(nBon, nEnt,'single');
    %fprintf('%4d ', nCC);
    
    % -------   BoundingBoxes   -------
    for c = 1:nBon
        Row = fscanf(fileID, '%d', nEnt);
        if length(Row)<nEnt, 
            warning('Row not completely read.');
            break; 
        end
        fscanf(fileID,'\n');
        PRM(c,:) = Row;
    end
    ABbox{l} = PRM;
    
    % ------   Extrema   -------
    IxX = fscanf(fileID, '%d', 2); % indices of extrema
    % IxX
    fscanf(fileID, '\n');
    
end

id = fscanf(fileID, '%d', 1);
assert(id==222);

fclose(fileID);

end

