%
% Bounding box from endpoints
%
% af p_CntFromVect.m
%
function [Bbx] = f_BboxFromEndPts( Ept ) 

Ep1         = Ept.Ep1;
Ep2         = Ept.Ep2;
[nDsc nDim] = size(Ep1);
assert(nDim==2);

Bbx         = zeros(nDsc,4,'single');
for i = 1:nDsc

    ep1    = Ep1(i,:);
    ep2    = Ep2(i,:);
    if ep1(1) < ep2(1), 
        top = ep1(1);
        bot = ep2(1);
    else
        top = ep2(1);
        bot = ep1(1);
    end

    if ep1(2) < ep2(2), 
        lef = ep1(2);
        rit = ep2(2);
    else
        lef = ep2(2);
        rit = ep1(2);
    end
    
    Bbx(i,:) = [top bot lef rit];
end    
