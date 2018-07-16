function [ teal2yellow2brownColorMap ] = teal2yellow2brownColorMap( numberOfSteps )
%teal2yellow2brownColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([1 102 94]./255,[90 180 172]./255, [199 235 229]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([199 235 229]./255, [246 232 195]./255, [216 179 101]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([216 179 101]./255, [140 81 10]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

teal2yellow2brownColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
teal2yellow2brownColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
teal2yellow2brownColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

