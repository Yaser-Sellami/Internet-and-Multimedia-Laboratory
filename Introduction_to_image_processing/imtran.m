function g = imtran(f, trasf)
%f is the input image
%trasf is the transformation to apply to the input image

if trasf == "neg"
    g = NegImg(f, 255);
elseif trasf == "log"
    g = LogImg(f, 1);
elseif trasf == "pot"
    g = PotImg(f, 0, 1, 2);
elseif trasf == "con"
    g = ConImg(f, 0.5, 20);
else 
    g = "Transformation function not valid";
end

end