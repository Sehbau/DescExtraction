%
% Plots shape pyramid into one figure.
%
% af PlotRsgPyr.m
%
function [] = PlotShpPyr(ASHP, figNo, titStr, BxNorm)

if (nargin==4), bBox = 1; else bBox = 0; end

hf = figure(figNo); 
clf; 
set(hf, 'name', ['Shape ' titStr]);

nLev   = length(ASHP);
if nLev>6, nLev=6; end

for lev = 1:nLev
    
    SHPlv = ASHP{lev};              % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    %fprintf(['---- lev' num2str(lev) '\n']);
    p_ShpFromVect(SHPlv);           % in directory 'Vect'

    if bBox
        hr = rectangle('position', BxNorm); % x/y/w/h
        set(hr,'edgecolor',[0.5 0.5 0.5]);
    end
    
    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
end

end

