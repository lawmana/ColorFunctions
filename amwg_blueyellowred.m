function [map] = amwg_blueyellowred(numSteps)
%amwg_blueyellowred color map (RGB values from NCL)

    %ncolors = 16;
    map = [130 32  240;
        0   0   150;  
        0   0   205;  
        65  105 225;  
        30  144 255;  
        0   191 255;  
        160 210 255;
        210 245 255; 
        255 255 200;
        255 225 50;
        255 170 0;
        255 110 0;
        255 0   0;
        200 0   0;
        160 35  35;
        255 105 180]./255;
    
    oldX = 1:length(map);
    newX = 1:(length(map)/(numSteps+1)):length(map);
    map = interp1(oldX, map, newX, 'linear');
    
end

