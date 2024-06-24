%
% Plots a single bounding box.
%
function hr = p_BoundBox1(Prm, col, bJit, bCtr)

if nargin==2, bJit=0;  bCtr=0; end % if jitter not specified, then OFF
if nargin==3, bCtr=0; end   % if contrast not specified, then set to OFF

% add some jitter to avoid overlap of box sides
if bJit>0, off = rand(1) * 0.2;
else       off = 0; end
    
% from zero to one-indexing adding 1.0
% to increase area=1 values: decrease UL by 0.25 and LR by 0.25
top	 = Prm(1) + off + 0.75;
bot	 = Prm(2) + off + 1.25;
lef	 = Prm(3) + off + 0.75;
rit	 = Prm(4) + off + 1.25;

wth  = rit-lef;             % will be 0.5 for area=0
hgt  = bot-top;             %   "   " 0.5  "    "

hr = rectangle('position', [lef top wth hgt]); 

set(hr, 'edgecolor', col);

%% --------   Contrast (or other attribute)  ----------
% Expects values E [0,255]
if bCtr
    ctr  = Prm(5);
    if ctr==0,
        warning('contrast=0');
        ctr = 1;
    end

    %liwi = ceil( ctr / 50 );
    liwi = ctr / 50;
    set(hr, 'linewidth', liwi);
    
end

end

