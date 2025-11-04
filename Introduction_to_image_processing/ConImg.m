function g = ConImg(f,m,E)
% Input:
% f: Input image
% m: Slope
% E: Dark-Light switch

% Standardizing f in [0,1] to prevent a full-white image (since m << 255)
f = f/max(max(f));

g = 1./(1+(m./(double(f)+eps)).^E);

end
