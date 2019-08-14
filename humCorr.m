function corrFact = humCorr(rh5,sensNum)
% Humidity correction factor from measurement of sensors 1,2,3,4,5
% rh5 is the relative humidity of sensor number 5
% sensNum is the sensor number (1 to 5)
%
% Data to interpolate:
% RH5 30.843       1.008   1.007    1.065    1.011   1.000
% RH5 53.775	 1.077	1.150	1.136	1.059   1.000
%
%    Copyright (C) 2018  Danilo Ciliberti dancili@gmail.com
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <https://www.gnu.org/licenses/>

data = [ 36.992     1.033	1.056	1.114	1.040   1.000;...
         62.333	  1.060	1.115	1.170	1.066   1.000];
     
% check on input
if sensNum ~= 1 && sensNum ~= 2 && sensNum ~= 3 && sensNum ~= 4 && sensNum ~= 5
    error('sensNum must be 1 or 2 or 3 or 4 or 5')
end
     
deltaX = data(2,1) - data(1,1);             % scalar
deltaY = data(2,2:end) - data(1,2:end);     % array 1D
m = deltaY/deltaX;                    % slope of the linear interpolant

corrFact = data(1,sensNum+1) + m(sensNum) * (rh5 - data(1,1));
