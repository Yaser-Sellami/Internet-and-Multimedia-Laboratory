% Read the Lena image and diplay it
X = imread("lena.jpg");
imshow(X)
title("Original image")
% Convert from U-Int-8 to Double and standardizing
X = double(X);
X = X/max(max(X));

%%%%%%%%%%%%%% AVERAGE FILTER %%%%%%%%%%%%%%
% Create an average filter using the function fspecial (check the slides for details)
h_avg = fspecial("average", 3);
% Filter the Lena image with the average filter you created using the
%function imfilter 
X_avg = imfilter(X, h);
%Displaying the image
figure
subplot(1,3,1)
imshow(X_avg)
title("Average uniform filter")
% How does imfilter handle smoothing in edges? Zero padding

%%%%%%%%%%%%%% NON-UNIFORM AVERAGE FILTER %%%%%%%%%%%%%%
% Filters generated with fspecial are uniform. Create a non-uniform average
%filter (i.e., not all elements of the filter have the same weigth)
h_nonunif = [0.075 0.125 0.075; 0.125 0.2 0.125; 0.075 0.125 0.175];
% Filter the Lena image with the non-uniform filter you created
X_avg_nonunif = imfilter(X, h_nonunif);
% Display using subplot the two filtered versions of Lena that you created
%with the average and non-uniform average filter
subplot(1,3,2)
imshow(X_avg_nonunif)
title("Average non-uniform filter")
% Do you notice any difference? Try modifying the filter size and weights
% The non-uniform one is a little brighter
subplot(1,3,3)
imshow(abs(X_avg_nonunif-X_avg))
title("Difference between uniform and non-uniform")

%%%%%%%%%%%%%% GAUSSIAN FILTER %%%%%%%%%%%%%%
% Create a Gaussian filter of size 3𝑥3 and variance 1.5 and visualize it using the function bar3
h_gauss = fspecial("gaussian", 5, 2);
figure
bar3(h_gauss)
title("Gaussian filter")
% Filter the Lena image with the Gaussian filter 
X_gauss = imfilter(X, h_gauss);
% Display using subplot the two filtered versions of Lena that you created
%with the average and gaussian filter
figure
subplot(1,3,1)
imshow(X_avg)
title("Average filter")
subplot(1,3,2)
imshow(X_gauss)
title("Gaussian filter")
% Do you notice any difference? Try modifying the filter sizes and the
%variance of the gaussian
subplot(1,3,3)
imshow(abs(X_gauss-X_avg))
title("Difference between average and gaussian")

%%%%%%%%%%%%%% DENOISING %%%%%%%%%%%%%%
% Create a noisy image by adding salt-and-pepper noise using the imnoise function 
X_noisy = imnoise(X, "salt & pepper");
% Remove the noise with a median filter
X_median2 = medfilt2(X);
X_median3 = medfilt3(X);
% Display the result of the filtering for different values of filter size 
subplot(2,3,1)
imshow(X_noisy)
title("Noisy image")
%subplot(2,2,2)
%imshow(X_median2)
%title("Median filter 2x2")
subplot(2,3,2)
imshow(X_median3)
title("Median filter 3x3")
% Remove the noise with an average filter
X_noisy_avg = imfilter(X_noisy, h_avg);
subplot(2,3,4)
imshow(X_noisy_avg)
title("Average filter")
% Display the result of the denoising by using the median and the gaussian filter 
X_noisy_gaussian = imfilter(X_noisy, h_gauss);
subplot(2,3,5)
imshow(X_noisy_gaussian)
title("Gaussian filter")
% Do you notice any difference? Try modifying the filter sizes and the
% noise quantity
subplot(2,3,6)
imshow(abs(X_noisy_gaussian-X_noisy_avg))
title("Difference between Gaussian and Average")