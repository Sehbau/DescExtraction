%
% Example for loading the vectors. 
% Function scripts in directory 'Vect'
%
clear;
addpath('Vect');
pthVect     = '../Desc/img1.vec';       % vectors for one image

[ACNT Kt]   = LoadDescVect(pthVect);    % in directory 'Vect'

%% -----   Geometrie  -----
% example for creating geometry descriptors for the 1st level:
C1  = ACNT{1};
GMX = [C1.Les C1.Str C1.Ori];           % geometry only [nCnt 3]

fprintf('Some ranges:\n');
fprintf('Ori angles %1.3f to %1.3f\n', min(C1.Ori), max(C1.Ori));
fprintf('Lengths    %1.3f to %1.3f\n', min(C1.Les), max(C1.Les));

%% -----   Plot Contours  -----
figure(1); clf; 
for lev = 1:Kt.nLev
    
    CNTlv = ACNT{lev};              % extracting one level
    
    subplot(3, 2, double(lev)); hold on;
    
    p_CntFromVect(CNTlv);           % in directory 'Vect'

    set(gca,'xlim',[-0.02 1.02]);
    set(gca,'ylim',[-0.02 1.02]);
    
end
