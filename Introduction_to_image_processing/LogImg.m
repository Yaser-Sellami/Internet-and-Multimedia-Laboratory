function g = LogImg(f, c)
% Input:
% f: Input image
% c: Amplitude constant

g = c*log(1+double(f));

end
