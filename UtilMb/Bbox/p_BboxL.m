% 
% Plots a list of bounding boxes.
%
% IN   ABbox   list of bboxes
%      rgbOrIx rgb triplet or index
%
function [] = p_BboxL( ABbox, rgbOrIx )


%% ----------   Color   ----------
if nargin==1, 
    rgbOrIx = 3;        % if no color specified then take beige
end

if isscalar(rgbOrIx) % we use as index
    
    % first generate the palette
    Col(1,:) = [255 255   0]; % yellow
    Col(2,:) = [255 128   0]; % orange
    Col(3,:) = [191 191   0]; % beige
    Col(4,:) = [255 0     0]; % rot
    Col(5,:) = [170 0   255]; % magenta
    Col(6,:) = [0   255 255]; % cyan
    Col(7,:) = [0   0   255]; % blue
    Col(8,:) = [255 255 255]; % white
    
    Col      = Col ./ 255;
    
    % now select by inputted index
    rgbOrIx  = Col(rgbOrIx,:); % overwrites itself
else
    assert(length(rgbOrIx)==3); % must be rgb triplet then
end

%% ==========   Plot   ==========
nBox    = size(ABbox,1);
bJit   	= 1;
for i = 1:nBox
    p_BoundBox1(ABbox(i,:), rgbOrIx, bJit);    
end

end

