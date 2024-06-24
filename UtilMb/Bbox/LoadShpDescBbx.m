%
% Loads shape attributes as saved with w_ShpDesc() in ShpIO.h.
%
function [Att] = LoadShpDescBbx(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

nAtt  = 6;
ARR   = zeros(0, nAtt, 'int32');
tline = fgetl(fileID);
c=0;
while ischar(tline)
    
    %disp(tline)
    Vals = sscanf(tline, '%d', nAtt);
    
    %Vals
    c = c+1;
    ARR = [ARR; Vals'];

    tline = fgetl(fileID);
end

fclose(fileID);

fprintf('LoadShpDescBbx: read %d shapes\n', c);

%% ------   A2S   -------
Att.nShp	= c;
Att.Lab     = {'Top' 'Bot' 'Lef' 'Rit' 'Ctr' 'IxBon' };
assert( length(Att.Lab)==nAtt );        

Ctr         = ARR(:, 5);
assert(max(Ctr)<256);           % make sure it is reasonable

Att.VAL     = ARR;