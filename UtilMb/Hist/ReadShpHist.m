%
% Reads shapeshistograms as saved under ShpIO.h-w_ShpHist
%
% cf LoadDescHist.m
%
function [Hcat Nbin] = ReadShpHist( fileID )

Nbin    = struct;

Scors   = ReadFieldsInt( fileID );
Sfine   = ReadFieldsInt( fileID );
Ras     = ReadFieldsInt( fileID );
Ato     = ReadFieldsInt( fileID );

HScors = u_FieldsCatToMxInt( Scors );
HSfine = u_FieldsCatToMxInt( Sfine );
HRas   = u_FieldsCatToMxInt( Ras );
HAto   = u_FieldsCatToMxInt( Ato );

Hcat   = [ HScors(:)' HSfine(:)' HRas(:)' HAto(:)' ];

end

