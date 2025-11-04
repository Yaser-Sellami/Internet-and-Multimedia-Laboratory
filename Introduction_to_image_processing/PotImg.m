function g = PotImg(f,low_out, high_out, gamma)
% Input:
% f: Input image
% low_out: Minimum gray level of the output image
% high_out: Maximum gray level of the output image
% gamma: Power of the function

% Standardizing the input image between [0,1] and
% finding low_in, high_in between [0,1] as required by imadjust
f = f/max(max(f));

low_in = min(min(f)); % Minimum gray level 
high_in = max(max(f)); % Maximum gray level

g = imadjust(f, [low_in, high_in], [low_out, high_out], gamma);

end
