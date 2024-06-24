%
% Plots a list of shapes from vector (attribute) information.
% 
% We plot as circles and ellipses only. 
%
% Analogous to p_RsgFromVect
%
function [] = p_ShpFromVect(SHP) 

for i = 1:SHP.nShp

    posV    = 1-SHP.Pos.Vrt(i);     % vertical position (ij->Cartes.)
    posH    = SHP.Pos.Hor(i);       % horizontal position
    ori     = SHP.GOL.Ori(i);       % orientation angle (from geometry)
    rds     = SHP.RAS(i,1);         % radius
    
    if rds==0                       % is possible if segments near
        rds=0.01;
    end
    %ctr     = STR.Ctr(i);           % contrast
        
    wth     = rds*2;                % default for circle
    hgt     = rds*2;

    % If NOT circle, then squeeze circle according to orientation angle.
    % This will make diagonal shapes smaller and therefore not reflect them
    % well.
    if 0 %~isnan(ori)
        wth     = sin(ori)*rds;       
        hgt     = cos(ori)*rds;
        if wth<0.01, wth = 0.01; end
        if hgt<0.01, hgt = 0.01; end
    end
    
    % signs matter for transformation ij->Cartesian
    hl = rectangle('position', [posH-rds  posV-rds wth hgt]);
    set(hl, 'curvature', [1 1]);

    % add color:
    red     = SHP.RGB.Red(i);
    grn     = SHP.RGB.Grn(i);
    blu     = SHP.RGB.Blu(i);
    set(hl, 'edgecolor', [red grn blu]);
    
    % make linewidth proportional to contrast:
    %set(hl, 'linewidth', 0.2 + 2*ctr); % 0.2 is minimum width
    
end    
