% sa p_BoundBoxPyr1Lv

function [] = p_BboxL(ABbox, ixCol)

if nargin==1, ixCol=3; end

nBox    = size(ABbox,1);

bJit   	= 1;

Col(1,:) = [255 255   0]; % yellow
Col(2,:) = [255 128   0]; % orange
Col(3,:) = [191 191   0]; % beige
Col(4,:) = [255 0     0]; % rot
Col(5,:) = [170 0   255]; % magenta
Col(6,:) = [0   255 255]; % cyan
Col(7,:) = [0   0   255]; % blue
Col(8,:) = [255 255 255]; % white

Col      = Col ./ 255;

for i = 1:nBox
    p_BoundBox(ABbox(i,:), Col(ixCol,:), bJit);    
end

end

