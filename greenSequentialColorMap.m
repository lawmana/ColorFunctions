function [ greenSequentialColorMap ] = greenSequentialColorMap( numberOfSteps )
%teal2yellow2brownColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([247 252 245]./255,[199 233 192]./255, [116 196 118]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([116 196 118]./255, [65 171 93]./255, [35 139 69]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([35 139 69]./255, [0 48 7]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

greenSequentialColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
greenSequentialColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
greenSequentialColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

