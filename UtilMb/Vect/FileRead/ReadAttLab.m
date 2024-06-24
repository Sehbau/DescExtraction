%
% Reads the attribute labels as saved under w_AttLab (AttUtil.h)
%
function [Lab] = ReadAttLab( fileID, nLab )

Lab = fread(fileID, nLab * 6, 'char=>char' );

Lab = reshape( Lab, 6, [] )';

end

