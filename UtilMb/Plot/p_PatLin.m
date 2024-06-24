%
% Plots a list of lines from structure stcPatLin.
%
% IN  Pat   pattern as produced by???
%     col   either as vector [1 3] E [0..1] or as a list [nLin 3] E [0..1]
%
% af p_CntFromVect
%
function [] = p_PatLin(Pat, col) 

%Les    = sqrt( sum( (Pat.Ep1-Pat.Ep2).^2, 2) );
Ep1     = Pat.Ep1;
Ep2     = Pat.Ep2;

if isvector(col)
    Red     = ones(Pat.nLin,1) * col(1);
    Grn     = ones(Pat.nLin,1) * col(2);
    Blu     = ones(Pat.nLin,1) * col(3);
else
    % we assume it is an array [nLin 3]
end

for i = 1:Pat.nLin

    %ori     = Pat.Ori(i);           % orientation angle
    %les     = Les(i);               % length
    wgt     = Pat.Wgt(i);           % weight
        
    hl = line( [ Ep1(i,2) Ep2(i,2) ], [ Ep1(i,1) Ep2(i,1) ] );
    
    % add color:
    set(hl, 'color', [Red(i) Grn(i) Blu(i)]);
    
    % make linewidth proportional to contrast:
    set(hl, 'linewidth', 0.2 + 2*wgt); % 0.2 is minimum width
    
end    
