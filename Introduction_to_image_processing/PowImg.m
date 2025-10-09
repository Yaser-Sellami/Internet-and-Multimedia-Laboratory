function g = PowImg(f,low_out, high_out, gamma)
%Compute min and max of f
low_in = min(min(f));
high_in = max(max(f));

g = imadjust(f, [low_in, high_in], [low_out, high_out], gamma);
end
