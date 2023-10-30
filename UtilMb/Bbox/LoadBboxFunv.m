%
% Loads bounding boxes of CCs {nLev}{depth} as saved under
% FunvIO.h:s_FunvBboxAll. For demo purposes only. 
%
% Bounding boxes are NOT scaled: they correspond to the pyramid size.
% Use LoadBonBboxPyr for upscaled coordinates.
%
% OUT   ABbox   {nLev}{depth} pyramid of bboxes
%       Nflk    [nLev][depth] the count per map
%
function [ABbox Nflk]= LoadBboxFunv(lfn) 

fileID   = fopen(lfn, 'r');
    
%% ----- nLev/depth
nLev  = fscanf(fileID, '%d', 1);    
depth = fscanf(fileID, '%d', 1);    
fprintf('[nLev %d, depth %d]\n', nLev, depth);

%% -----  Count -> Nflks
Nflk = zeros(nLev,depth);
for l = 1:nLev
    for d=1:depth
        Nflk(l,d) = fscanf(fileID, '%d', 1);
        fprintf('%4d ', Nflk(l,d));
    end
    fprintf('\n');
end
fprintf('\n');

%% =====  BoundingBoxes
ABbox = cell(nLev,depth);

for l = 1:nLev
    for d = 1:depth
        nCC = Nflk(l,d);
        PRM = zeros(nCC, 6, 'single');
        %fprintf('%4d ', nCC);
        
        for c = 1:nCC
            Row = fscanf(fileID, '%d', 6);

            PRM(c,:) = Row; 
            fscanf(fileID,'\n');
        end
        ABbox{l,d} = PRM;
    end
    
    %fprintf('\n');
end

id = fscanf(fileID, '%d', 1);
fclose(fileID);

assert(id==222);

end


