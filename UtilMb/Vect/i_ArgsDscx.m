% 
% Creates long-option string for program dscx.
%
% IN    A   argument structure with fields set by user
% OUT   S   arguments as string 
%
function S = i_ArgsDscx( A )

%% -----  Extraction/Saving  -----
S = '';
if A.noBbox>0,    S = [S ' --noBbox'];  end
if A.noBon>0,     S = [S ' --noBon'];   end
if A.noBin>0,     S = [S ' --noBin'];   end
if A.noSave>0,    S = [S ' --noSave'];  end

%% -----  Archit  -----
if A.nLev>-1,
    assert(A.nLev>0 && A.nLev<10);
    S = [S ' --nLev ' num2str(A.nLev)];
end
if A.depth>-1,
    assert(A.depth>0 && A.depth<5);
    S = [S ' --depth ' num2str(A.depth)];
end

