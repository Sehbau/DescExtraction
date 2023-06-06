clear;

pth       = 'c:/klab/ppc/E_DESC/bins/';
progName  = 'dscx';
img       = 'Imgs/img1.jpg';
outf      = 'Desc\img1';        % windows backslash

opts      = '';
%opts      = '--nLev 3';

cmd     = [pth progName ' ' pth img ' ' pth outf ' ' opts];

[status OutStr] = dos(cmd);
%u_CheckStatusExec(status); 