function g = ConImg(f,m,E)
% Input:
% f: Input image
% m: Slope
% E: Dark-Light switch

g = 1./(1+(m./(double(f)+eps)).^E);

end
