%
% Estimates (normalized) contour endpoints from parameters length,
% orientation and center point (midpoint).
%
% af p_CntFromVect.m
%
function [Pts] = f_CntEptFromVect( CNT, szI ) 

Pts.Ep1  = zeros( CNT.nCnt, 2, 'single');
Pts.Ep2  = Pts.Ep1;
for i = 1:CNT.nCnt

    posV    = CNT.Pos.Vrt(i);       % vertical position (ij->Cartes.)
    posH    = CNT.Pos.Hor(i);       % horizontal position
    ori     = CNT.Ori(i);           % orientation angle
    les     = CNT.Les(i);           % length
        
    radV    = sin(ori) * les/2;     % quasi radius
    radH    = cos(ori) * les/2;
    
    % line([posH-xrd posH+xrd], [posV+yrd  posV-yrd]); 
    top1    = posV - radV; if  top1<0,    top1 = 0;   end
    lef1    = posH - radH; if  lef1<0,    lef1 = 0;   end
    bot1    = posV + radV; if  bot1>0.99, bot1 = 0.99; end
    rit1    = posH + radH; if  rit1>0.99, rit1 = 0.99; end
    
    Pts.Ep1(i,:) = [ top1   lef1 ];
    Pts.Ep2(i,:) = [ bot1   rit1 ];
    
end    

if nargin==1,               % no image size provided
    return;                 % return immediately
end

%% =======   upscale by szI   =======
% we floor to produce zero-indexing for C
Pts.Ep1(:,1) = floor( Pts.Ep1(:,1) * szI(1) );
Pts.Ep1(:,2) = floor( Pts.Ep1(:,2) * szI(2) );
Pts.Ep2(:,1) = floor( Pts.Ep2(:,1) * szI(1) );
Pts.Ep2(:,2) = floor( Pts.Ep2(:,2) * szI(2) );

end
