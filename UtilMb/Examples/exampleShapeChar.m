%
% Demonstrates characterized shapes.
%
% Run from WITHIN directory UtilMb
%
clear;
cd('c:/klab/ppc/PROD/UtilMb/');
addpath('../DescExtr/UtilMb/Vect');
%pthVect     = '../DescExtr/Desc/img1.vec';       % person
%pthVect     = '../DescExtr/Desc/img2.vec';       % train
pthVect     = '../DescExtr/Desc/aachen.vec';       % city

[AVEC Kt]       = LoadDescVect(pthVect);    % in directory 'Vect'
[APIX Nbon SzM] = LoadBonPixPyr([pthVect(1:end-4) '.BonPix']);

if Kt.nLev>6, Kt.nLev = 6; end      % limit to 6 levels

LabAtt = u_AttsLabels();

%% -----   Plot Shapes   -----
% we plot boundary pixels, and then colorize them according to attribute
% values
colGray     = [0.8 0.8 0.8];    % default for bounding boxes

hf = figure(1); clf; set(hf, 'name', 'shape'); 
for lev = 1:Kt.nLev
    
    SHPlv = AVEC.ASHP{lev};         % extracting one level
    APix  = APIX{lev};
    szM   = SzM(lev,:);

    Scors = u_AttsArrToStruct( SHPlv.STR, LabAtt.Scors ); 
    Sfine = u_AttsArrToStruct( SHPlv.SFI, LabAtt.Sfine ); 
    Ras   = u_AttsArrToStruct( SHPlv.RAS, LabAtt.Ras   ); 

    subplot(3, 2, lev); hold on;
    
    % the corresponding boundaries
    nShp = length(SHPlv.IxBon1);
    for b = 1:nShp
        
        ixBon   = SHPlv.IxBon1(b);  % already one-indexing (see loading rout)
        Pix     = APix{ ixBon };    % in (pixel) map coordinates

        hp  = plot( Pix.Cl, Pix.Rw, 'color', colGray );
        
        % extract attributes
        vrtCrs = Scors.Vrt(b);      % verticality coarse
        horCrs = Scors.Hor(b);      % horizontality coarse
        axiCrs = Scors.Axi(b);      % axiality coarse

        vrtFin = Sfine.Vrt(b);      % verticality fine
        horFin = Sfine.Hor(b);      % horizontality fine
        axiFin = Sfine.Axi(b);      % axiality fine
        
        if vrtCrs>0.5, set(hp, 'color', [0.8  0  0]); end % dark red
        if vrtFin>0.5, set(hp, 'color', [1.0  0  0]); end % full red
        
        %if ori==0, set(hp, 'color', [1.0 0 0]); end
        if horCrs>0.5, set(hp, 'color', [0  0.2  0.6]); end % dark blue
        if horFin>0.5, set(hp, 'color', [0  0    1.0]); end % full blue

        if axiCrs>0.5, set(hp, 'color', [0  0.5  0]); end % dark green
        if axiFin>0.5, set(hp, 'color', [0  1.0  0]); end % full green
    end
    
    axis ij;
    set(gca,'xlim',[1 szM(2)]);
    set(gca,'ylim',[1 szM(1)]);
    
end