%
% Generates filenames for descriptor extraction output (dscx)
% 
% IN   stm    file stem, ie. 'IMGDAT/Collection/Desc/DSC_'
%      Fixt   file extensions ( u_FileExtensions.m )
% OUT  S      struct with filepaths including the file extensions
% 
function S = o_FipasDscxWithStem( stm, Fixt, bOSisWin )

if nargin==2                % argument bOSisWin missing...
    bOSisWin = 0;           % ...then we assum linux
end

aExt  = fieldnames( Fixt );
nFld  = length( aExt );

for f = 1:nFld
    xn      = aExt{f};
    S.(xn)  = [ stm Fixt.(xn) ];
    
    % slash to backslash for windows
    S.(xn)  = u_PathToBackSlash( S.(xn), bOSisWin ); 
end

end

