%
% Plots a list of straighers from vector (attribute) information.
%
% Analogous to p_CntFromVect
%
function [] = p_StrFromVect(STR) 

for i = 1:STR.nStr

    posV    = 1-STR.Pos.Vrt(i);     % vertical position (ij->Cartes.)
    posH    = STR.Pos.Hor(i);       % horizontal position
    ori     = STR.Ori(i);           % orientation angle
    les     = STR.Les(i);           % length
    %ctr     = STR.Ctr(i);           % contrast
        
    yrd     = sin(ori)*les/2;       % quasi radius
    xrd     = cos(ori)*les/2;
        
    % signs matter for transformation ij->Cartesian
    hl = line([posH-xrd posH+xrd], [posV+yrd  posV-yrd]); 

    % add color:
    red     = STR.RGB.Red(i);
    grn     = STR.RGB.Grn(i);
    blu     = STR.RGB.Blu(i);
    set(hl, 'color', [red grn blu]);
    
    % make linewidth proportional to contrast:
    %set(hl, 'linewidth', 0.2 + 2*ctr); % 0.2 is minimum width
    
end    
