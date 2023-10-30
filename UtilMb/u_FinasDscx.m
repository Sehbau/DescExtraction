%
% Creates a text file with file paths for loading descriptor files
%
% PREVIOUS  -
% PRESENT   runDscColl.m
% NEXT      runFocNyu.m
%
clear; 
addpath('UtilMb');
%bas = 7; % OLTO
%bas = 10; % IndOut15
bas = 52; 
%bas = 37; % vo7
%bas = 200; % cityscapes
fext = '.vec';  sfn = 'FinasVec.txt';
%fext = '.vec';
cd('c:/klab/ppc/PROD/DescExtr/');
%% -----------------   Init Collection/DataBase   ---------------
% gs_globals; gs_NamesDesc;
if bas==7
    pthDat  = 'C:\IMGdat\OLTO\';
    pthImg  = 'C:\IMGdown\OLTO\';
    aFinas  = textread([pthDat 'ImgFinas.txt'], '%s\n');
    nImgTren = length(aFinas);
    PATH.IMGDsc = [pthDat 'DSCimg\'];
    sfp     = [pthDat sfn];
elseif bas==10
    pthDat  = 'C:\IMGdat\IndOut15\';
    pthImg  = 'C:\IMGdown\IndOut15\SameSize\';
    aFinas  = textread([pthDat 'ImgFinas.txt'], '%s\n');
    nImgTren = length(aFinas);
    PATH.IMGDsc = [pthDat 'DSCimg\'];
    sfp     = [pthDat sfn];
elseif bas==52
    nyuGlobals;       % klab/ppc/PPlcRec/NYU2/ datBasePrepIndoorNYU2.m
    sfp     = [PATH.IMGDAT sfn];
elseif bas==200
    currDir = pwd; 
    cd c:/klab/mb; 
    addpaths;
    ctyGlobalsDaimler;
    cd(currDir);
elseif bas==37
    Pth     = u_Vo7Paths();
    VOCinit;
    nImgTren = 9963;
else error('not implemented');
end
%% ----------------   Options   --------------
bPlot       = 0 ;
OptK        = u_OptDscxStc();
OptK.noBbox = 1 ;
OptK.noBon  = 1 ;
%OptK.noSave = 1 ;
%OptK.nLev   = 3 ;
%OptK.depth  = 2 ;
optS        = i_OptDscx(OptK);

%% SSSSSSSSSSSSSSSSS    LOOP IMAGES     SSSSSSSSSSSSSSSSSS
fprintf('Saving %d images to %s:', nImgTren, sfp);
fid = fopen(sfp,'w');
assert(fid>0);
for i = 1:nImgTren

    outf = [PATH.IMGDsc 'DSC_' num2str(i) fext];
    outf = u_FipaSlashToBack(outf); % slash to backslash for windows
    %outf = '.\ztst';                % test
    fprintf('%s\n', outf);
    fprintf(fid, '%s\n', outf);
    
end
fclose(fid);
fprintf('bas=%d done. Saved as %s.\n', bas, sfp);

