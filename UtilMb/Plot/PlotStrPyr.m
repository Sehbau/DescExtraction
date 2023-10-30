%
% Plots straighter (segment) pyramid into one figure.
%
function [] = PlotStrPyr(ASTR, figNo, titStr, BxNorm)

if (nargin==4), bBox = 1; else bBox = 0; end

hf = figure(figNo); 
clf; 
set(hf, 'name', ['Str ' titStr]);

nLev   = length(ASTR);
if nLev>6, nLev=6; end

for lev = 1:nLev
    
    STRlv = ASTR{lev};              % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_StrFromVect(STRlv);           % in directory 'Vect'

    if bBox
        hr = rectangle('position', BxNorm); % x/y/w/h
        set(hr,'edgecolor',[0.5 0.5 0.5]);
    end
    
    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
end

end

