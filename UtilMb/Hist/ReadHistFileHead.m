%
% Reads histogram file header, namely struct fhedHist in
% E_DESC/UtilIO/DescFileAnf.h and saved under w_DescHistHead in
% DescIOhist.m
%
% cf LoadDescHist
%
function [H] = ReadHistFileHead( fileID )

nLev   = fread(fileID, 1,  'uint8=>uint8');  % # of pyramid levels
szV    = fread(fileID, 1,  'int=>int');      % vertical image size
szH    = fread(fileID, 1,  'int=>int');      % horizontal image size
ntDsc  = fread(fileID, 1,  'int=>int');      % # of total desc
typ    = fread(fileID, 1,  'uint8=>uint8');  % file identifier

vers   = fread(fileID, 1,  'int16=>int16');  % version

if (nLev<1 || nLev>10)
    fprintf('nLev not correct: %d\n', nLev);
    szV, szH, ntDsc, typ
end
assert(szV>0 && szV<5000, 'szV unreasonable: %d', szV);
assert(szH>0 && szH<5000, 'szH unreasnoable: %d', szH);
assert(vers==10,'Version depreciated: is %d. new 10', vers);

H.nLev  = nLev;
H.szV   = szV;
H.szH   = szH;
H.ntDsc = ntDsc;
H.typ   = typ;


end

