function g = LogImg(f, c)
% Input:
% f: Input image
% c: Amplitude constant

% Standardizing the image so that the effect of c does not vanish
f = f/max(max(f));

g = c*log(1+double(f));

end
