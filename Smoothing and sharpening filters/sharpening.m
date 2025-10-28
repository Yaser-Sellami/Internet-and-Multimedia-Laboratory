%% Laplacian filter

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

%% Prewitt, Sobel and Canny filtering

% Read the image Baboon and display it
Y = imread("baboon.png");
figure
subplot(2,2,1)
imshow(Y)
title("Original image")
%Converting to double and standardizing
Y = double(Y);
Y = Y./max(max(Y));
% The image is in color, take only the R component or convert it to
% grayscale (does this operation return the same result?)
Y_red = Y(:,:,1);
subplot(2,2,3)
imshow(Y_red)
title("R component of the image")

Y_gray = rgb2gray(Y);
subplot(2,2,4)
imshow(Y_gray)
title("Grayscaled image")

subplot(2,2,2)
imshow(abs(Y_red-Y_gray))
title("Difference between R component and grayscale")

% Extract the image edges using the Prewitt operator with the function edge
Y_prewitt = edge(Y_gray, "prewitt");

% Extract the image edges using the Sobel filter
Y_sobel = edge(Y_gray, "sobel");

% Extract the image edges using the Canny filter
Y_canny = edge(Y_gray, "canny");

% Display using subplot the three filtered versions of Baboon that you created
%with the Prewitt, Sobel and Canny filter
figure
subplot(1,3,1)
imshow(Y_prewitt)
title("Prewitt filter")

subplot(1,3,2)
imshow(Y_sobel)
title("Sobel filter")

subplot(1,3,3)
imshow(Y_canny)
title("Canny filter")

% Create a noisy image by adding salt-and-pepper noise using the imnoise function 
Y_noisy = imnoise(Y_gray, "salt & pepper");

% Extract the image edges using the Prewitt operator with the function edge. Does the performance of the filter change?
Y_noisy_prewitt = edge(Y_noisy, "prewitt");

% Extract the edges from the noisy image using the Sobel filter
Y_noisy_sobel = edge(Y_noisy, "sobel");

% Extract the edges from the noisy image using the Canny filter
Y_noisy_canny = edge(Y_noisy, "canny");

% Display using subplot the three filtered versions of Baboon that you created
%with the Prewitt, Sobel and Canny filter
figure
subplot(2,2,1)
imshow(Y_noisy)
title("Original noisy image")

subplot(2,2,2)
imshow(Y_noisy_prewitt)
title("Prewitt filter with noise")

subplot(2,2,3)
imshow(Y_noisy_sobel)
title("Sobel filter with noise")

subplot(2,2,4)
imshow(Y_noisy_canny)
title("Canny filter with noise")