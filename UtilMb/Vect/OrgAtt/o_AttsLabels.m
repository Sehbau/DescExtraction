%
% Attribute labels for descriptors.
%
% An attribute label has at most 6 characters. 
%
% cf exampleShapeChar.m, cc_ovoT.m
%
function [S] = u_AttsLabels()


%% ----------   cnt/rsg/arc/str  ---------  
% to be provided.

%% ----------   shape  ---------   ShpAbstAtts.h

% ------ attsShpStrOri, ia Scors
Lbs = 'Vrt   Hor   Dg1   Dg2   Axi   Adg   Vab   Hab   Dab   Tri   Nil   ';
S.Scors = uu_LabArrToCell( Lbs );

% ------ attsShpStrFin, ia Sfine
Lbs = 'Vrt   Hor   Vti   Hti   Vob   Hob   Dg2   Dg1   Axi   Uni   Dul   Cvg   Agx   Ori   Nil   Dre   Vir   Fnf   ';
S.Sfine = uu_LabArrToCell( Lbs );

% ------ attsShpRadSeg, ia Ras
Lbs = 'Rad   Elo   Ron   Riss  SteUgfSteEngSteDowSteUppOpnDowOpnUpwLigUgfLigEngLigDowLigUppOpnRitOpnLef';
S.Ras = uu_LabArrToCell( Lbs );
  
%V.GOL   = ReadArrFltLh(fileID, {'Rib' 'Ori' 'Elo' 'AgX'});


end % MAIN

%
% Turns a linear string array into a two-dimensional one [nAtt 6]
%
function C = uu_LabArrToCell( LbLin )

Arr  = reshape( LbLin, 6, [])'; % [nAtt 6]
nAtt = size(Arr,1);
C    = cell(nAtt,1);
for a = 1:nAtt
    lab     = Arr(a,:);
    Bspc    = isspace(lab);
    C{a} = lab( ~Bspc );
end

end % SUB