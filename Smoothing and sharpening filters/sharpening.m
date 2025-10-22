% Read the Luna image and diplay it
X = imread("Luna.jpeg");
imshow(X)
title("Original image")
%Converting to double and standardizing
X = double(X);
X = X/max(max(X));

% Create a laplacian kernel (by using fspecial) and apply it to the image Luna by using the function imfilter
h_laplace = fspecial("laplacian");
X_laplace = imfilter(X, h_laplace);
h_kernel = [0 1 0; 1 -4 1; 0 1 0];
X_kernel = imfilter(X, h_kernel);
% Visualize the result and (if needed) scale (=normalize it) it to make it visible
figure
subplot(2,2,1)
imshow(X)
title("Original image")
subplot(2,2,2)
imshow(X_laplace)
title("Laplacian filter")
subplot(2,2,3)
imshow(X-X_laplace)
title("Scaled filtered version with fspecial")
% Perform the previous operations using the kernel obtained from
% g(𝑥,𝑦)=𝑓(𝑥,𝑦)+𝑐[𝛻^2 (𝑥,𝑦)] (check the laplacian in the slides)
subplot(2,2,4)
imshow(X-X_kernel)
title("Scaled filtered version with kernel")
% Read the image Baboon and display it

% The image is in color, take only the R component or convert it to
% grayscale (does this operation return the same result?)

% Extract the image edges using the Prewitt operator with the function edge

% Extract the image edges using the Sobel filter

% Extract the image edges using the Canny filter

% Display using subplot the three filtered versions of Baboon that you created
%with the Prewitt, Sobel and Canny filter

% Create a noisy image by adding salt-and-pepper noise using the imnoise function 

% Extract the image edges using the Prewitt operator with the function edge. Does the performance of the filter change?

% Try varying the threshold value of the function edge

% Extract the edges from the noisy image using the Sobel filter

% Extract the edges from the noisy image using the Canny filter

% Display using subplot the three filtered versions of Baboon that you created
%with the Prewitt, Sobel and Canny filter