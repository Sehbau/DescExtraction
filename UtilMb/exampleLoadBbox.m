%
% Loads and plots bounding boxes for regions and for contours as generated
% by the program 'dscx' (descriptor extraction).
%
% Note that this does not exactly correspond to the IoU values as described
% in the paper. You need to enlarge the bounding boxes by a small amount
% corresponding to its (pyramidal) level.
%
clear;

% Works if you run Matlab in directory UtilMb (otherwise change paths)
Irgb        = imread('../Imgs/img1.jpg');
%Irgb        = imread('../Imgs/aachen.png');
[ABbox Ncc] = LoadBboxFunv('../Desc/img1.Bbox');
[CNT Ncnt]  = LoadCntxSpcEpt('../Desc/img1.CntEpt');

%% -----   Parameters   -----
[nLev depth] = size(Ncc);   % # of pyramid levels. depth of segmentation

[nr nc]  = deal(ceil(nLev/2), 2);     % # of rows/cols for subplots

%% -----   Plot Bboxes   ------
figure(1); clf;

IxCol = [1 5 6 2 3 4 8];   % gelb/magn/zyan, see p_BboxL

for l = 1:nLev
    
    subplot(nr, nc, l);
    imagesc( imresize(Irgb, 1 / 2^(l-1)) );
    
    for d = 1:depth
        p_BboxL(ABbox{l,d}, IxCol(d));
    end
    
    set(gca,'fontsize',5);
    
end

%% -----   Plot Contours   -----
% note that these are the endpoints only.
figure(2); clf;

for l = 1:nLev
    
    subplot(nr, nc, l);
    imagesc( imresize(Irgb, 1 / 2^(l-1)) );

    Rdg = CNT.ARDG{l};
    Riv = CNT.ARIV{l};
    Edg = CNT.AEDG{l};

    p_CntFromEpt(Rdg, 'r');     % ridges
    p_CntFromEpt(Riv, 'b');     % rivers
    p_CntFromEpt(Edg, 'c');     % edges

    set(gca,'fontsize',5);
    
end
