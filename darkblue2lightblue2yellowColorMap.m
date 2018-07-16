function [ darkblue2lightblue2yellowColorMap ] = darkblue2lightblue2yellowColorMap( numberOfSteps )
%teal2yellow2brownColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([8 29 88]./255,[37 52 148]./255, [34 94 168]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([34 94 168]./255, [29 145 192]./255, [65 182 196]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([65 182 196]./255,[127 205 187]./255, [199 233 180]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

yelloworange2 = makeColorMap([199 233 180]./255,[237 248 177]./255, [255 255 217]./255, gradientScale);
yelloworange2 = yelloworange2(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange; yelloworange2];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

darkblue2lightblue2yellowColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
darkblue2lightblue2yellowColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
darkblue2lightblue2yellowColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

