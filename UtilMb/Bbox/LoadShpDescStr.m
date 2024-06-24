%
% Loads shape attributes as saved with w_ShpDesc() in ShpIO.h.
%
function [Att] = LoadShpDescStr(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

nAtt  = 6;
ARR   = zeros(0, nAtt, 'single');
tline = fgetl(fileID);
c=0;
while ischar(tline)
    
    %disp(tline)
    Vals = sscanf(tline, '%f', nAtt);
    
    %Vals
    c = c+1;
    ARR = [ARR; single( Vals' )];

    tline = fgetl(fileID);
end

fclose(fileID);

fprintf('LoadShpDescStr: read %d shapes\n', c);

%% ------   A2S   -------
Att.nShp	= c;
Att.Lab     = { 'Vrt' 'Hor' 'Dg1'  'Dg2' 'Spd' 'Ori' };

assert( length(Att.Lab)==nAtt );        

sIxOri   = strfind(Att.Lab, 'Ori');
ixOri    = find( cellfun(@length, sIxOri) );
Ori      = ARR(:, ixOri);

assert(min(Ori>-2));        % can be -1 if not determined
assert(max(Ori<12));        % values E [0..11] (12 orientations)
        
Att.VAL  = ARR;