%
% Plots a list of bounding boxes as loaded by LoadBboxFunv.m
%
% sa p_BboxZigs
function [] = p_BoundBox(PRM, col, bJit, bCtr)

if nargin==2, bJit=0;  bCtr=0; end
if nargin==3, bCtr=0; end 

for i = 1:size(PRM,1)
    
    Bbox = PRM(i,:);
    
    if bJit>0, off = rand(1) * 0.2;
    else       off = 0; end
    % from zero to one-indexing adding 1.0
    % to increase area=1 values: decrease UL by 0.25 and LR by 0.25
    top	 = Bbox(1) + off + 0.75;
    bot	 = Bbox(2) + off + 1.25;    	
    lef	 = Bbox(3) + off + 0.75;
    rit	 = Bbox(4) + off + 1.25; 
    
    wth  = rit-lef;     % will be 0.5 for area=0 
    hgt  = bot-top;     %   "   " 0.5  "    "

    hr = rectangle('position', [lef top wth hgt], 'edgecolor', col);

    %% --------   Contrast   ----------
    if bCtr                 
        ctr  = Bbox(5);
        if ctr==0, 
            warning('contrast=0');
            ctr=1;
        end
        liwi = ceil(ctr/50);
        set(hr, 'linewidth', liwi); 
    end
end

end

