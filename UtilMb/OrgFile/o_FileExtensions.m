%
% File extensions.
%
% ia Fixt
%
% from struct stuFileExtn in A_ANF/Util/FileNames.h
%
function [D F] = o_FileExtensions()

D.cntEpt = '.CntEpt';

D.vec    = '.vec';
D.vegi   = '.vecGrp';
D.vebi   = '.veb';
D.hsti   = '.hst';
D.utzi   = '.utz';		% utilities (deployed yet?)
D.objp   = '.obp';		% object proposals?			
D.cvpo   = '.cvpo';		% curve partitions organization (deployed yet?)
D.bbox   = '.Bbox';		% s_FunvBboxAll, ai dscx.cpp

D.bonBbx = '.BonBbox';  % s_BonBboxPyr
D.bonAsp = '.BonAsp';
D.bonPix = '.BonPix';
  
% focus:
F.vecf   = '.vef';
F.hstf1  = '.hsf1'; 	% PROD/FocExtr/focxh1.cpp
F.hstfL  = '.hsfL';
