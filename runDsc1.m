%
% Runs program dscx and loads all files. Assumes the organization as given
% in the repository.
%
% See more examples in directory UtilMb
%
% PRESENT runDsc1.m
% NEXT    runMvec1.m
%         runFocxv1.m, runFocFew.m, ...
%         runFocxv1.m, runFocFew.m, ...
%
clear;
run('../globalsSB'); 
cd( PthProg.descExtr );
    
%strImg 	= 'img1.jpg';
strImg 	= 'img2.jpg';
%strImg    = 'aachen.png';

pthImg	= ['Imgs/' strImg];         % image path
pthOut 	= ['Desc/' strImg(1:end-4)]; % output file path

pthOut  = u_PathToBackSlash( pthOut, bOSISWIN ); % change to window backslash

%% --------   Options   --------
if 1                        % either manually
    %optS  	= '';               % default: no parameters modified
    %optS    = 'PrmDescTest.txt';
    %opts 	= '--nLev 3';       % write here...
    optS 	= '--depth 3';       % write here...
else                        % ...or use the following convenience wrapper
    OptK    = o_OptDscxStc();
    OptK.nLev = 3;
    optS    = i_OptDscx(OptK);
end

%% =========   Command   ========
% concatenate program name, arguments and options to one string
cmd   	= ['dscx ' pthImg ' ' pthOut ' ' optS];

[Sts Out] = dos(cmd);                   % excecute program

%% -------   Load All Output Files   -------
% requires:
% addpath('UtilMb/Vect');
% addpath('UtilMb/Hist');
% addpath('UtilMb/Bon');
% addpath('UtilMb/Bbox');

[AVEC Kt]           = LoadDescVect([pthOut '.vec']);    
[HFU HFB HSP Nuni Nbiv Nspa] = LoadDescHist([pthOut '.hst']);

[ABbox Nbon0 IxX]   = LoadBonBboxPyr([pthOut '.BonBbox']);
[AASP  Nbon1]       = LoadBonAspPyr( [pthOut '.BonAsp']);
[APIX  Nbon2 SzM]   = LoadBonPixPyr( [pthOut '.BonPix']);

[ABbox Ncc]         = LoadBboxFunv(  [pthOut '.Bbox']);
[CNT Ncnt]          = LoadCntxSpcEpt([pthOut '.CntEpt']);
nLev                = length(APIX);

%% -----   Plot Contours   -----
% Since contours are in absolute coordinates (corresponding to pyramid
% levels (map sizes)), I therefore downscale the image.
fprintf('Plotting contours?'); pause(); fprintf('...');
Irgb = imread(pthImg);                    % load image again for plotting
figure(2); clf;
[nr nc]  = deal(ceil(nLev/2), 2);       % # of rows/cols for subplots

for l = 1:nLev
    
    subplot(nr, nc, l);
    imagesc( imresize(Irgb, 1 / 2^(l-1)) ); % downscale

    Rdg = CNT.ARDG{l};
    Riv = CNT.ARIV{l};
    Edg = CNT.AEDG{l};

    p_CntFromEpt(Rdg, 'r', 'abs');     % ridges
    p_CntFromEpt(Riv, 'b', 'abs');     % rivers
    p_CntFromEpt(Edg, 'c', 'abs');     % edges

    set(gca,'fontsize',5);
    
end
fprintf('done\n');

%% -----   Plot More  -------
% see examples in directory UtilMb

%% -----   Plot Shape   ------
% p_ShpFromVect
