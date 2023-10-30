% 
% Creates long-option string for program dscx.
%
% IN    O   option structure with fields set by user
% OUT   S   options as string 
%
function S = i_OptDscx(O)

%% -----  Extraction/Saving  -----
S = '';
if O.noBbox>0,    S = [S ' --noBbox'];  end
if O.noBon>0,     S = [S ' --noBon'];   end
if O.noBin>0,     S = [S ' --noBin'];   end
if O.noSave>0,    S = [S ' --noSave'];  end

%% -----  Archit  -----
if O.nLev>-1,
    assert(O.nLev>0 && O.nLev<10);
    S = [S ' --nLev ' num2str(O.nLev)];
end
if O.depth>-1,
    assert(O.depth>0 && O.depth<5);
    S = [S ' --depth ' num2str(O.depth)];
end

