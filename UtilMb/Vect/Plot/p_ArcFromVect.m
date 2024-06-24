%
% Plots a list of arcs from vector (attribute) information.
%
% Plots only peak point, not the entire segment.
% I need to estimate endpoints. Or perhaps include them in output.
%
% Analogous to p_CntFromVect
%
function [] = p_ArcFromVect(ARC) 

for i = 1:ARC.nArc

    posV    = 1-ARC.Pos.Vrt(i);     % vertical position (ij->Cartes.)
    posH    = ARC.Pos.Hor(i);       % horizontal position
    dir     = ARC.Dir(i);           % orientation angle
    les     = ARC.Les(i);           % length
    %ctr     = STR.Ctr(i);           % contrast
        
    %yrd     = sin(ori)*les/2;       % quasi radius
    %xrd     = cos(ori)*les/2;
    yrd      = les/2;
    xrd      = les/2;

    %hl = rectangle('position',[posH-xrd  posV-yrd  les*0.8  les*0.8]); 
    hl = plot(posH, posV, 'o');

    % add color:
    red     = ARC.RGB.Red(i);
    grn     = ARC.RGB.Grn(i);
    blu     = ARC.RGB.Blu(i);
    % set(hl, 'edgecolor', [red grn blu]);
    set(hl, 'color', [red grn blu]);
    %set(hl, 'color', [1 0 0]);
    
    % make linewidth proportional to contrast:
    %set(hl, 'linewidth', 0.2 + 2*ctr); % 0.2 is minimum width
    
end    
