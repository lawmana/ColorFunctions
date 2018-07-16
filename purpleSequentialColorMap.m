function [ purpleSequentialColorMap ] = purpleSequentialColorMap( numberOfSteps )
%teal2yellow2brownColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([252 251 253]./255,[218 237 245]./255, [188 189 220]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([188 189 220]./255, [128 125 186]./255, [106 81 163]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([106 81 163]./255, [63 0 125]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

purpleSequentialColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
purpleSequentialColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
purpleSequentialColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

