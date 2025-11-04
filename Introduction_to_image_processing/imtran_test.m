%% Reading and saving the Lena image

X = imread('lena.jpg'); % Reading and saving the image
X = double(X); % Converting the image in double form

%% Testing the imtran function

trasf = input("Enter the transformation to apply [neg, log, pot, con]: ", 's');
X_trasf = imtran(X, trasf);

% Standardizing both images
X = X/max(max(X));
X_trasf = X_trasf/max(max(X_trasf));

%% Displaying the results
figure

subplot(1,2,1)
imshow(X) % Dispaying the original image
title("Original image")

subplot(1,2,2)
% Displaying the transformed image (equal to the original if the input function is invalid)
imshow(X_trasf) 
title("Transformed image")
