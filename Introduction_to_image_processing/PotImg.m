function g = PotImg(f,low_out, high_out, gamma)
% Input:
% f: Input image
% low_out: Minimum gray level of the output image
% high_out: Maximum gray level of the output image
% gamma: Power of the function

% Finding the minimum and maximum gray level of the input image
% Dividing by the maximum gray level in general (256 levels of gray)
% in order to standardize [low_in, low_out] between [0,1] as required by
% the function imadjust

low_in = min(min(f))/255; % Minimum gray level 
high_in = max(max(f))/255; % Maximum gray level

g = imadjust(f, [low_in, high_in], [low_out, high_out], gamma);

end
