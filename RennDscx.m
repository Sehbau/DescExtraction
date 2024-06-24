%
% Wrapper function for program dscx
%
% IN    pthImg  image file path
%       pthOut  output file path
%       Admin   administration, u_CmndAdmin.m
%
% OUT   Out     standard output
% 
function [Out] = RennDscx( pthImg, pthOut, Admin )

if nargin==2, 
    Admin.pthProg = ''; 
    Admin.optS    = '';
end

cmd  	= [Admin.pthProg 'dscx ' pthImg ' ' pthOut ' ' Admin.optS ];

[status Out] = dos(cmd);                   % excecute program

%% ------  Status  ------
if status>0
    Out
    warning('something went wrong');
end

%% ------  Verify Proper Termination  -----
ixEOP = strfind( Out, 'EndOfProgram');

if isempty(ixEOP)
    warning('Command %s not executed.', cmd);
    Out
    fprintf('Paused');
    pause();
end


