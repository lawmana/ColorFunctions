function [ yellow2lightblue2darkblueColorMap ] = yellow2lightblue2darkblueColorMap( numberOfSteps )
%teal2yellow2brownColorMap
%   Colormap from red to orange to yellow to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

blueltblue = makeColorMap([255 255 217]./255,[199 233 180]./255, [127 205 187]./255, gradientScale);
blueltblue = blueltblue(1:end,:);

ltblueyellow = makeColorMap([127 205 187]./255, [65 182 196]./255, [29 145 192]./255, gradientScale);
ltblueyellow = ltblueyellow(2:end,:);

yelloworange = makeColorMap([29 145 192]./255, [34 94 168]./255, [37 52 148]./255, gradientScale);
yelloworange = yelloworange(2:end,:);

yelloworange2 = makeColorMap([37 52 148]./255, [8 29 88]./255, gradientScale);
yelloworange2 = yelloworange2(2:end,:);

colorMapTemp = [blueltblue; ltblueyellow; yelloworange; yelloworange2];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

yellow2lightblue2darkblueColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
yellow2lightblue2darkblueColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
yellow2lightblue2darkblueColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');

end

