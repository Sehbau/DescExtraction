%
% Plots contour pyramid into one figure.
%
function [] = PlotCntPyr(ACNT, figNo, titStr, BxNorm)

if (nargin==4), bBox = 1; else bBox = 0; end

hf = figure(figNo); 
clf; 
set(hf, 'name', ['Contours ' titStr]);

nLev   = length(ACNT);
if nLev>6, nLev=6; end

for lev = 1:nLev
    
    CNTlv = ACNT{lev};              % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_CntFromVect(CNTlv);           % in directory 'Vect'

    if bBox
        hr = rectangle('position', BxNorm); % x/y/w/h
        set(hr,'edgecolor',[0.5 0.5 0.5]);
    end
    
    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
end

end

