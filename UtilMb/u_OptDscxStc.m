% 
% The option structure for descriptor extraction program dscx.
% incomplete.
%
% Default is that NO options will be modified and no string will be created
% in i_OptDscx.
%
% IN    - 
% OUT   O   struct with options
%
function O = u_OptDscxStc()

%% -----  Extraction/Saving  -----
O.noBbox    = 0;    % extraction bboxes 
O.noBon     = 0;    % extraction boundary pixels 
O.noBin     = 0;    % extraction of bins
O.noSave    = 0;    % saving of vectors

%% -----  Archit  -----
O.nLev      = -1;
O.depth     = -1;




end

