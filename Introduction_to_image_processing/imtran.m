function g = imtran(f, trasf)
%Input:
%f: Input image
f = double(f); % In case not already converted in double form
%trasf: Transformation to f

if strcmpi(trasf,"neg")
    L = 256; % Standard number of gray levels
    g = NegImg(f, L); % Negative transform

elseif strcmpi(trasf,"log")
    c = input("Enter the constant c: ");
    g = LogImg(f, c); % Logaritmic transform

elseif strcmpi(trasf,"pot")
    low_out = 0; % Standard minimum gray intensity
    high_out = 1; % Standard maximum gray intensity
    gamma = input("Enter the power gamma: ");
    g = PotImg(f, low_out, high_out, gamma); % Power transform

elseif strcmpi(trasf,"con")
    m = input("Enter the dark-light switch m: ");
    E = input("Enter the slope E: ");
    g = ConImg(f, m, E); % Contrast transform

else 
    disp("Transformation function not valid");
    g = f; % Returning the original image to prevent running errors
end

end