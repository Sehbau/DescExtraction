%
% Reads shape attributes as saved under ShpIO.h-w_StrShp
%
% cf LoadDescVect.m
%
function [V nShp] = ReadShpAtt(fileID)

V       = [];

%%  ====================   Header   ====================
Hed     = ReadDescAttHead(fileID);
nShp    = Hed.nDsc;
V.nShp  = nShp;

%Nfld    = fread(fileID, 5, 'uint8=>int');  % number of fields
%Nfld    = double(Nfld); % should be [11 18 4 16 7]

%%  ====================   Data   ====================

%  =====   Str   =====
[V.STR szL] = ReadArrFltLh(fileID );
V.SFI       = ReadArrFltLh(fileID );
assert( szL.nElm==nShp );

%  =====   Gol/Ras/Ato   =====
V.RAS   = ReadArrFltLh(fileID );
V.ATO   = ReadArrFltLh(fileID );
V.GOL   = ReadArrFltLh(fileID, {'Rib' 'Ori' 'Elo' 'AgX'});

V.RGB   = ReadAttRgb(fileID, nShp);

V.Pos   = ReadAttPos(fileID);

% + 1 to change from zero- to one indexing
V.IxBon1 = fread(fileID, nShp, 'int=>int') + 1; 

idf    = fread(fileID, 1,  'int=>int'); % in-btw identifier
assert(idf==55555);

%  =====   Basic  =====
V.BAS   = ReadArrFltLh(fileID );

V.LGIx4str = fread(fileID, nShp*4, 'int16=>single');
V.SpkKrv = fread(fileID, nShp*5, 'float=>single');

% rotation of matrices (because C saves rowwise)
V.LGIx4str = reshape(V.LGIx4str, 4, nShp)'; 
V.SpkKrv   = reshape(V.SpkKrv,   5, nShp)'; 

%% =====  trailer/idf   ======
idf    = fread(fileID, 1,  'int=>int'); % identifier
assert(idf==55555);

end

