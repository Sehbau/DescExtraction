%
% Scales points in a list of lines (with coordinates E [0,1]) to map size
% szI.
%
function Pat = u_PatLinScale(Pat, szI) 

Pat.Ep1(:,1) = Pat.Ep1(:,1) * szI(1);
Pat.Ep1(:,2) = Pat.Ep1(:,2) * szI(2);

Pat.Ep2(:,1) = Pat.Ep2(:,1) * szI(1);
Pat.Ep2(:,2) = Pat.Ep2(:,2) * szI(2);

Pat.Mip(:,1) = Pat.Mip(:,1) * szI(1);
Pat.Mip(:,2) = Pat.Mip(:,2) * szI(2);


