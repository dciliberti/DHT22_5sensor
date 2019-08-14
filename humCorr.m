function corrFact = humCorr(rh5,sensNum)
% Humidity correction factor from measurement of sensors 1,2,3,4,5
% rh5 is the relative humidity of sensor number 5
% sensNum is the sensor number (1 to 5)
%
% Data to interpolate:
% RH5 30.843        1.008   1.007   1.065   1.011   1.000
% RH5 53.775		1.077	1.150	1.136	1.059   1.000

data = [ 36.992     1.033	1.056	1.114	1.040   1.000;...
         62.333		1.060	1.115	1.170	1.066   1.000];
     
% check on input
if sensNum ~= 1 && sensNum ~= 2 && sensNum ~= 3 && sensNum ~= 4 && sensNum ~= 5
    error('sensNum must be 1 or 2 or 3 or 4 or 5')
end
     
deltaX = data(2,1) - data(1,1);             % scalar
deltaY = data(2,2:end) - data(1,2:end);     % array 1D
m = deltaY/deltaX;                    % slope of the linear interpolant

corrFact = data(1,sensNum+1) + m(sensNum) * (rh5 - data(1,1));
