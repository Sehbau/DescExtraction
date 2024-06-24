%
% Reads fields with integer types as saved under w_FieldsI 
%
% cf ReadShpHist.m
%
function [S] = ReadFieldsInt(fileID)

S    = struct;

% =====   dims   =====
S.nFields   = fread(fileID, 1,  'uint8=>int');
S.lenArr    = fread(fileID, 1,  'int=>int');

% =====   data   =====
for f = 1:S.nFields
    fn      = sprintf('F%d', f);
    S.(fn)  = fread(fileID, S.lenArr, 'int=>int');
end

end

