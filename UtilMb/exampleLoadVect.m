%
% Example for loading the vectors. 
% Function scripts in directory 'Vect/'
%
clear;
addpath('Vect');
pthVect     = '../Desc/img2.vec';       % vectors for one image

[AVEC Kt]   = LoadDescVect(pthVect);    % in directory 'Vect'

%% -----   Geometrie  -----
% example for creating geometry descriptors for the 1st level:
C1  = AVEC.ACNT{1};
GMX = [C1.Les C1.Str C1.Ori];           % geometry only [nCnt 3]

fprintf('Some ranges:\n');
fprintf('Ori angles %1.3f to %1.3f\n', min(C1.Ori), max(C1.Ori));
fprintf('Lengths    %1.3f to %1.3f\n', min(C1.Les), max(C1.Les));

%% -----   Plot Contours  -----
figure(1); clf; 
for lev = 1:Kt.nLev
    
    CNTlv = AVEC.ACNT{lev};         % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_CntFromVect(CNTlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end
%% -----   Plot Rsg  -----
figure(2); clf; 
for lev = 1:Kt.nLev
    
    RSGlv = AVEC.ARSG{lev};         % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_RsgFromVect(RSGlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end

%% -----   Plot Arcs  -----
% not implemented yet
% I need to estimate endpoints. Or perhaps include them in output.

%% -----   Plot Straighters  -----
figure(4); clf; 
for lev = 1:Kt.nLev
    
    %STRlv = AVEC.ASTRfll{lev};         % extracting one level
    STRlv = AVEC.ASTRgst{lev};         % extracting one level
    
    subplot(3, 2, lev); hold on;
    
    p_StrFromVect(STRlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end
