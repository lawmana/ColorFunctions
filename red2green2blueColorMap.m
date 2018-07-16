function [ red2green2blueColorMap ] = red2green2blueColorMap( numberOfSteps )
%red2blueColorMap
%   Colormap from red to orange to green to blue
%   numberOfSteps adjusts how smooth the color transitions are (low # is
%   more contoured, higher # has smoother gradient)

%return error if number of steps is not an integer
if mod(numberOfSteps, 1) ~= 0
    error('Color Map Error: Number of Steps must be an Integer');
end

gradientScale = ceil((numberOfSteps + 2) / 3);

bluegreen = makeColorMap([50 136 189]./255,[153 213 148]./255, gradientScale);
bluegreen = bluegreen(1:end,:);

greenyellow = makeColorMap([153 213 148]./255, [230 245 152]./255, [254 224 139]./255, gradientScale);
greenyellow = greenyellow(2:end,:);

yellowred = makeColorMap([254 224 139]./255, [252 141 89]./255, [213 62 79]./255, gradientScale);
yellowred = yellowred(2:end,:);


colorMapTemp = [bluegreen; greenyellow; yellowred];

%linearly interpolate the color map to the specified number of steps
oldX = 1:length(colorMapTemp(:,1)); 
newX = 1:numberOfSteps;

red2green2blueColorMap(:,1) = interp1(oldX, colorMapTemp(:,1), newX, 'linear');
red2green2blueColorMap(:,2) = interp1(oldX, colorMapTemp(:,2), newX, 'linear');
red2green2blueColorMap(:,3) = interp1(oldX, colorMapTemp(:,3), newX, 'linear');


end

