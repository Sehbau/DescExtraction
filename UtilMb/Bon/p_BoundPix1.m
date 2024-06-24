%
% Plots a single boundary. Plots row coordinates inverted (szV-rw).
%
function hp = p_BoundPix1(Pix, szV, col, bJit, ctr)

if nargin==2, bJit=0;  ctr=0; end % if jitter not specified, then OFF
if nargin==3, ctr=0; end   % if contrast not specified, then set to OFF

% add some jitter to avoid overlap 
if bJit>0, off = rand(1) * 0.2;
else       off = 0; end
    
% from zero to one-indexing adding 1.0
hp = plot( Pix.Cl+1, szV-Pix.Rw+1, '-');

set(hp, 'color', col);          % default color. might be overwritten

%% --------   Contrast   ----------
if ctr>0
    liwi = ceil(ctr/50);
    set(hp, 'linewidth', liwi);
end


end

