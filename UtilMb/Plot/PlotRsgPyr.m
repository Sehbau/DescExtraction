%
% Plots radsig pyramid into one figure.
%
function [] = PlotRsgPyr(ARSG, figNo, titStr, BxNorm)

if (nargin==4), bBox = 1; else bBox = 0; end

hf = figure(figNo); 
clf; 
set(hf, 'name', ['RadSig ' titStr]);

nLev   = length(ARSG);
if nLev>6, nLev=6; end

for lev = 1:nLev
    
    RSGlv = ARSG{lev};              % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_RsgFromVect(RSGlv);           % in directory 'Vect'

    if bBox
        hr = rectangle('position', BxNorm); % x/y/w/h
        set(hr,'edgecolor',[0.5 0.5 0.5]);
    end
    
    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
end

end

