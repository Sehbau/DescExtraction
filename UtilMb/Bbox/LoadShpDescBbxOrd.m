%
% Loads shape attributes as saved with w_ShpDescBbxOrd() in ShpIOdscu.h.
%
function [Att] = LoadShpDescBbxOrd(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

nAtt  = 8;
ARR   = zeros(0, nAtt, 'single');
tline = fgetl(fileID);
c=0;
while ischar( tline )
    
    disp(tline)
    Vals = sscanf( tline, '%f', nAtt );
    
    %Vals
    c = c+1;
    ARR = [ARR; Vals'];

    tline = fgetl(fileID);
end

fclose(fileID);

fprintf('LoadShpDescBbxOrd: read %d shapes\n', c);

%% ------   A2S   -------
Att.nShp	= c;
Att.Lab     = {'Top' 'Bot' 'Lef' 'Rit' 'Vrt' 'Hor' 'IxShp' 'IxBon' };
assert( length(Att.Lab)==nAtt );        

Att.Bbx     = ARR(:,1:4);
Att.Vrt     = ARR(:,5);
Att.Hor     = ARR(:,6);
Att.IxShp   = ARR(:,7);
Att.IxBon   = ARR(:,8);

Att.nVrt    = nnz( Att.Vrt );
Att.nHor    = nnz( Att.Hor );

assert(max(Att.Vrt)<1.01);           % make sure it is reasonable

