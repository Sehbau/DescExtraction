% 
% Plots a list of bounding boxes with RGB values according to rgbOrIx and
% linewidth corresponding to Wlin.
%
% af p_BboxL
%
% IN  ABbox   list of bboxes      
%     rgbOrIx RGB value as scalar or array
%     Wlin    line width
%
function [] = p_BboxLpal(ABbox, rgbOrIx, Wlin)

if nargin==1,               % no color specified
    rgbOrIx = 3;            % then use beige
    Wlin    = [];
end
if nargin==2,
    Wlin    = [];
end

[nBox nPrm] = size(ABbox);
%assert(nPrm>4);

bJit   	= 1;

if isscalar(rgbOrIx)
    
    Col(1,:) = [255 255   0]; % yellow
    Col(2,:) = [255 128   0]; % orange
    Col(3,:) = [191 191   0]; % beige
    Col(4,:) = [255 0     0]; % rot
    Col(5,:) = [170 0   255]; % magenta
    Col(6,:) = [0   255 255]; % cyan
    Col(7,:) = [0   0   255]; % blue
    Col(8,:) = [255 255 255]; % white
    
    Col      = Col ./ 255;
    
    rgbOrIx  = Col(rgbOrIx,:); % overwrite itself
else
    %assert(length(rgbOrIx)==3); % must be rgb triplet then
end

bWgt    = 1;
liwi    = 1;                % default is linewidth = 1
if isempty(Wlin), bWgt = 0; end

for i = 1:nBox

    % wgt = Wgt(i);
    % rgb = [wgt wgt wgt];
    rgb     = rgbOrIx;
    
    if bWgt
        liwi = Wlin(i);
    end

    ABbox(i,5) = liwi;
    p_BoundBox1(ABbox(i,:), rgb, bJit, liwi);    
end

end

