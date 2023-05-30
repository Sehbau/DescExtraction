%
% Loads RRE endpoints as saved under CntIO.h:si_CntxSpcEpt.
%
% af LoadCntxSpc
%
function [CNT Ncnt] = LoadCntxSpcEpt(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% ----- nLev
nLev  = fread(fileID, 1,  'int=>int');
fprintf('[nLev %d]\n', nLev);

%% =====  The space
Ncnt    = zeros(nLev,3);
[ARDG ARIV AEDG] = deal(cell(nLev,1));
for l = 1:nLev

    ARDG{l} = ReadCntEpt(fileID);   Ncnt(l,1)=ARDG{l}.nCnt;
    ARIV{l} = ReadCntEpt(fileID);   Ncnt(l,2)=ARIV{l}.nCnt;
    AEDG{l} = ReadCntEpt(fileID);   Ncnt(l,3)=AEDG{l}.nCnt;
    
end
fclose(fileID);

CNT.ARDG = ARDG;
CNT.ARIV = ARIV;
CNT.AEDG = AEDG;

%DispLoad(lfn);


