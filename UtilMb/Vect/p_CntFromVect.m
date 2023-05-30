%
% Plots a list of contours from vector (attribute) information.
%
% Since we have only the midpoint (of the two endpoints), we need to
% estimate the two endpoints using the orientation angle and the segment
% length.
%
% Watch the signs: we need to transform from matrix dimensions (ij) to
% Cartesian coordinates (xy)!
%
function [] = p_CntFromVect(CNT) 

for i = 1:CNT.nCnt

    posV    = 1-CNT.PosV(i);        % vertical position (ij->Cartes.)
    posH    = CNT.PosH(i);          % horizontal position
    ori     = CNT.Ori(i);           % orientation angle
    les     = CNT.Les(i);           % length
    ctr     = CNT.Ctr(i);           % contrast
        
    yrd     = sin(ori)*les/2;       % quasi radius
    xrd     = cos(ori)*les/2;
        
    % signs matter for transformation ij->Cartesian
    hl = line([posH-xrd posH+xrd], [posV+yrd  posV-yrd]); 

    % add color:
    red     = CNT.Red(i);
    grn     = CNT.Grn(i);
    blu     = CNT.Blu(i);
    set(hl, 'color', [red grn blu]);
    
    % make linewidth proportional to contrast:
    set(hl, 'linewidth', 0.2 + 2*ctr); % 0.2 is minimum width
    
end    
