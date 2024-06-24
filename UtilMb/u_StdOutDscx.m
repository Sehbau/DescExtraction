% 
% Evaluate standard output of program dscx
%
% IN    Out   standard out
% OUT   []
%
function [] = u_StdOutDscx(Out)

ixPrms = strfind(Out, 'Prms Desc');

if ~isempty( ixPrms )

    OutPrms = Out( ixPrms:end );
    
    IxCR    = regexp( OutPrms, '\n' );

    fprintf('%s', OutPrms( 1:IxCR ) );

end

end

