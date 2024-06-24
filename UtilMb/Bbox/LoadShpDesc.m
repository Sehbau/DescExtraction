%
% Loads shape bounding boxes and some of their attributes as saved with
% ...
%
function [Att] = LoadShpDesc(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

nAtt  = 10;
ARR   = zeros(0, nAtt);
tline = fgetl(fileID);
c=0;
while ischar(tline)
    
    disp(tline)
    Vals = sscanf(tline, '%f', nAtt);
    
    %Vals
    c = c+1;
    ARR = [ARR; single( Vals' )];

    tline = fgetl(fileID);
end

fclose(fileID);

fprintf('Read %d shapes\n', c);

%% ------   A2S   -------
Att.nShp	= c;
Att.Lab     = {'Top' 'Bot' 'Lef'  'Rit' ...
               'Vrt' 'Hor' 'Dg1'  'Dg2' 'Spd' 'Ori'...
            };

%               'SteUng' 'SteEng' 'SteDow' 'SteUpp' 'OpnDow' 'OpnUpw'...
%               'LigUng' 'LigEng' 'LigDow' 'LigUpp' 'OpnRit' 'OpnLef'
    
assert( length(Att.Lab)==nAtt );        

sIxOri   = strfind(Att.Lab, 'Ori');
ixOri    = find( cellfun(@length, sIxOri) );
Ori      = ARR(:, ixOri);

assert(min(Ori>-2));        
assert(max(Ori<12));        
        
Att.VAL  = ARR;