function [ red2yellow2blueColorMap ] = red2yellow2blueColorMap( numberOfSteps )
%red2yellow2blue ColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([69 117 180]./255,[145 191 219]./255, [224 243 248]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([224 243 248]./255, [254 224 144]./255, [252 141 89]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([252 141 89]./255, [215 48 39]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

red2yellow2blueColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
red2yellow2blueColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
red2yellow2blueColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

