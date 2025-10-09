function g = ConImg(f,m,E)
%f = input image
%m = slope
%E = dark-light switch
g = 1./(1+(m./(double(f)+eps)).^E);
end