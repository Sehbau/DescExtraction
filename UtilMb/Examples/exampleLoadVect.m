%
% Example for loading the vectors. 
%
% Run from WITHIN directory UtilMb
%
% Function scripts in directory 'Vect/'
%
clear;
addpath('../DescExtr/UtilMb/Vect');
%pthVect     = '../DescExtr/Desc/img1.vec';       % vectors for one image
%pthVect     = '../DescExtr/Desc/img2.vec';       % vectors for one image
pthVect     = '../DescExtr/Desc/aachen.vec';       % vectors for one image

[AVEC Kt]   = LoadDescVect(pthVect);    % in directory 'Vect'

if Kt.nLev>6, Kt.nLev = 6; end      % limit to 6 levels

%% -----   Geometrie  -----
% example for creating geometry descriptors for the 1st level:
C1  = AVEC.ACNT{1};
GMX = [C1.Les C1.Str C1.Ori];           % geometry only [nCnt 3]

fprintf('Some ranges:\n');
fprintf('Ori angles %1.3f to %1.3f\n', min(C1.Ori), max(C1.Ori));
fprintf('Lengths    %1.3f to %1.3f\n', min(C1.Les), max(C1.Les));

%% -----   Plot Contours  -----
hf = figure(1); clf; set(hf, 'name', 'Contours');
for lev = 1:Kt.nLev
    
    CNTlv = AVEC.ACNT{lev};         % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_CntFromVect(CNTlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
end

%% -----   Plot Rsg  -----
hf = figure(2); clf; set(hf, 'name', 'radsig'); 
for lev = 1:Kt.nLev
    
    RSGlv = AVEC.ARSG{lev};         % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_RsgFromVect(RSGlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end

%% -----   Plot Arcs & Straighters -----
% Plots only peakpoints for arcs
% I need to estimate endpoints. Or perhaps include them in output.
hf = figure(3); clf; set(hf, 'name', 'arcs & strs'); 
for lev = 1:Kt.nLev

    ARClv = AVEC.AARCgst{lev};
    
    subplot(3, 2, lev); hold on;
    
    p_ArcFromVect(ARClv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end

% -----   Plot Straighters  -----
for lev = 1:Kt.nLev
    
    %STRlv = AVEC.ASTRfll{lev};         % extracting one level (full)
    STRlv = AVEC.ASTRgst{lev};         % extracting one level (gerust)
    
    subplot(3, 2, lev); hold on;
    
    p_StrFromVect(STRlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end

%% -----   Plot Shapes   -----
% we plot boundary pixels in addition - for verification. For that we need
% to load the boundaries:
[APIX  Nbon2 SzM]   = LoadBonPixPyr([pthVect(1:end-4) '.BonPix']);
colGray     = [0.7 0.7 0.7];    % default for bounding boxes

hf = figure(4); clf; set(hf, 'name', 'shape'); 
for lev = 1:Kt.nLev
    
    SHPlv = AVEC.ASHP{lev};         % extracting one level
    APix  = APIX{lev};
    szM   = SzM(lev,:);
    
    subplot(3, 2, lev); hold on;
    
    p_ShpFromVect(SHPlv);           % in directory 'Vect'

    % now the corresponding boundaries
    nShp = length(SHPlv.IxBon);
    for b = 1:nShp
        ixBon   = SHPlv.IxBon(b) + 1;  % +1 to change from 0- to 1-indexing
        Pix     = APix{ ixBon };       % in original map coordinates...
        % ...therefore normalize
        Pix.Rw  = 1 - Pix.Rw / szM(1); % -1 due to inverted axis
        Pix.Cl  =     Pix.Cl / szM(2);
        hp  = plot( Pix.Cl, Pix.Rw, 'color', colGray );      

    end
    
    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end