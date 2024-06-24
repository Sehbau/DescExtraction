%
% Plots a list of radial signature from vector (attribute) information.
% 
% We plot as circles and ellipses only. 
%
% Analogous to p_CntFromVect
%
function [] = p_RsgFromVect(RSG) 

for i = 1:RSG.nRsg

    posV    = 1-RSG.Pos.Vrt(i);     % vertical position (ij->Cartes.)
    posH    = RSG.Pos.Hor(i);       % horizontal position
    ori     = RSG.Ori(i);           % orientation angle
    rds     = RSG.Rds(i);           % radius
    %ctr     = STR.Ctr(i);           % contrast
        
    wth     = rds*2;                % default for circle
    hgt     = rds*2;
    
    % If NOT circle, then squeeze circle according to orientation angle.
    % This will make diagonal shapes smaller and therefore not reflect them
    % well.
    if ~isnan(ori)
        wth     = sin(ori)*rds;       
        hgt     = cos(ori)*rds;
        if wth<0.01, wth = 0.01; end
        if hgt<0.01, hgt = 0.01; end
    end
    
    % signs matter for transformation ij->Cartesian
    hl = rectangle('position', [posH-rds  posV-rds wth hgt]);
    set(hl, 'curvature', [1 1]);

    % add color:
    red     = RSG.Red(i);
    grn     = RSG.Grn(i);
    blu     = RSG.Blu(i);
    set(hl, 'edgecolor', [red grn blu]);
    
    % make linewidth proportional to contrast:
    %set(hl, 'linewidth', 0.2 + 2*ctr); % 0.2 is minimum width
    
end    
