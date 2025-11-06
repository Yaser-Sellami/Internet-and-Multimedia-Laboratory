%% Transforming the image in frequency domain

% Read the image f and calculate its transform
f = imread("barbara.jpg");
subplot(2,2,1)
imshow(f)
title("Original image")
f = double(f);
f = f/max(max(f));

F = fft2(f);

% Show the magnitude of the spectrum by using the log transform setting
% c=1
magn=abs(F);
magn=log(1+abs(magn));
subplot(2,2,3)
imshow(magn,[])
title("Magnitude of the spectrum non-centered")

% Center the spectrum using fftshift2
F_centre = fftshift(F);

% Show the magnitude of the centered spectrum by using the log transform setting
% c=1
magn_centre=abs(F_centre);
magn_centre=log(1+abs(magn_centre));
subplot(2,2,4)
imshow(magn_centre,[])
title("Magnitude of the spectrum centered")

%%%%%%%%%%% IDEAL LOW PASS FILTER %%%%%%%%%%%%%%%%%%%
% Create an ideal low-pass filter with radius 35
% To do so:
% Generate the matrix containing the distances of each pixel from the center of the image
% using the distmatrix.m function available in Moodle
[M, N] = size(f);
dist = distmatrix(M,N);
dist = fftshift(dist);

% Create the filter use the output of the distmatrix.m function to select
% all elements that have distances less than 35 from the center and set them to 1
radius = 35;
H_lowpass = dist < radius;

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_lowpass)
title("Low pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_lowpass = F_centre .* H_lowpass;
magn_lowpass=abs(F_lowpass);
magn_lowpass=log(1+abs(magn_lowpass));

subplot(2,2,3)
imshow(magn_lowpass, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_lowpass)));
title("Filtered image in spatial domain")

%%%%%%%%%%%  BUTTERWORTH LOW PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a third order filter (n=3) with D0=35 
% by implementing H_but=1./(1+(dist./D0).^(2*n));
n = 3;
D0 = 35;
H_but = 1./(1+(dist./D0).^(2*n));

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_but)
title("Butterworth low pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_but = F_centre .* H_but;
magn_but=abs(F_but);
magn_but=log(1+abs(magn_but));

subplot(2,2,3)
imshow(magn_but, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_but)));
title("Filtered image in spatial domain")
% Vary the value of D0 and of the filter order to see their effect on the result


%%%%%%%%%%%  GAUSSIAN LOW PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a gaussian filter with s =30
% by implementing H_gau=exp(-(dist.^2)/(2*(sigma^2)));
s = 30;
H_gau=exp(-(dist.^2)/(2*(s^2)));

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_gau)
title("Gaussian low pass filter")

% Apply the filter to the image transform
F_gau = F_centre .* H_gau;
magn_gau=abs(F_gau);
magn_gau=log(1+abs(magn_gau));

subplot(2,2,3)
imshow(magn_gau, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_gau)));
title("Filtered image in spatial domain")

% Vary the value of s to see its effect on the result



%%%%%%%%%%% IDEAL HIGH PASS FILTER %%%%%%%%%%%%%%%%%%%
% Create an ideal high-pass filter with radius 35
% To do so:
% Use the matrix containing the distances of each pixel from the center of the image
% created using the distmatrix.m function
% Create the filter use the output of the distmatrix.m function to select
% all elements that have distances larger than 35 from the center and set them to 1
H_highpass = dist > radius;

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_highpass)
title("Ideal high pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_highpass = F_centre .* H_highpass;
magn_highpass=abs(F_highpass);
magn_highpass=log(1+abs(magn_highpass));

subplot(2,2,3)
imshow(magn_highpass, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_highpass)));
title("Filtered image in spatial domain")
% Create the high pass filter as 1-the low pass filter. Analyze the
% differences


%%%%%%%%%%%  BUTTERWORTH HIGH PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a third order filter (n=3) with D0=35 
% by implementing H_but=1- 1./(1+(dist./D0).^(2*n))
H_buthigh = 1 - 1./(1+(dist./D0).^(2*n));

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_buthigh)
title("Butterworth high pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_buthigh = F_centre .* H_buthigh;
magn_buthigh=abs(F_buthigh);
magn_buthigh=log(1+abs(magn_buthigh));

subplot(2,2,3)
imshow(magn_buthigh, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_buthigh)));
title("Filtered image in spatial domain")

% Vary the value of D0 and of the filter order to see their effect on the result



%%%%%%%%%%%  GAUSSIAN HIGH PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a gaussian filter with s =30
% by implementing H_gau=1-exp(-(dist.^2)/(2*(sigma^2)));
H_gauhigh= 1- exp(-(dist.^2)/(2*(s^2)));

% Show the filter
figure
subplot(2,2,1)
imshow(f)
title("Original image in spatial domain")

subplot(2,2,2)
imshow(H_gauhigh)
title("Gaussian low pass filter")

% Apply the filter to the image transform
F_gauhigh = F_centre .* H_gauhigh;
magn_gauhigh=abs(F_gauhigh);
magn_gauhigh=log(1+abs(magn_gauhigh));

subplot(2,2,3)
imshow(magn_gauhigh, [])
title("Filtered image in frequency domain")

subplot(2,2,4)
imshow(ifft2(ifftshift(F_gauhigh)));
title("Filtered image in spatial domain")

% Vary the value of s to see its effect on the result


%%%%%%%%%% RINGING %%%%%%%%%%%%%%
% Load the image quadrati.png 
x = imread("quadrati.png");
x = x(:,:,1);
x = double(x);
x = x/max(max(x));

figure
subplot(2,2,1)
imshow(x);
title("Original image")

% Add salt and pepper noise by using the function imnoise
x_noise = imnoise(x, 'salt & pepper');
subplot(2,2,2)
imshow(x_noise)
title("Image with salt & pepper noise")

% Compute the Fourier transform of the image
X_noise = fft2(x_noise);
X_noise = fftshift(X_noise);

% Apply an ideal low pass filter
[L, G] = size(x_noise);
dist_quad = distmatrix(L, G);
H_lowpass_quad = dist_quad < radius;
X_noise_lowpass = X_noise .* H_lowpass_quad;

% Show the result in the spatial domain
x_noise_lowpass = ifft2(ifftshift(X_noise_lowpass));
subplot(2,2,3)
imshow(x_noise_lowpass, [])
title("Low pass filtering")

% Apply an ideal high pass filter
H_highpass_quad = 1-H_lowpass_quad;
X_noise_highpass = X_noise .* H_highpass_quad;

% Show the result in the spatial domain
x_noise_highpass = ifft2(ifftshift(X_noise_highpass));
subplot(2,2,4)
imshow(x_noise_highpass, [])
title("High pass filtering")

%%%%%%%%%%%% PHASE AND MAGNITUDE SWAP %%%%%%%%%%%%%%%%
%Load two images


% Compute their Fourier Transform


% Swap their phase components


%%%%%%%%%% SPATIAL DOMAIN <-> FREQUENCY DOMAIN %%%%%%%%%

% Use the function freqz2 to compute the frequency response of filters
% Generate a Sobel filter with the function fspecial
h_sobel = fspecial('sobel');

% Create its frequency counterpart by useing the function freqz2
H_sobel = freqz2(h_sobel, M, N);
magn_sobel=abs(H_sobel);
magn_sobel=log(1+abs(magn_sobel));

% Perform the same filtering in the spatial and in the frequency domain 
F_sobel_spat = imfilter(f, h_sobel);
F_sobel = F_centre .* H_sobel;
F_sobel_freq = ifft2(ifftshift(F_sobel));

% Show the results and compare them
subplot(2,2,1)
imshow(f)
title("Original image")

subplot(2,2,2)
imshow(magn_sobel, [])
title("Sobel filter in frequency domain")

subplot(2,2,3)
imshow(F_sobel_spat)
title("Filtering in spatial domain")

subplot(2,2,4)
imshow(F_sobel_freq)
title("Filtering in frequency domain")

%%%%%%%%%% IMPLEMENT A SIMPLE EDGE DETECTION %%%%%%%%%%
% Apply a threshold to the filtered images in the spatial and frequency domain by showing only
% pixel values whose absolute value is larger than 0.2*abs(max(max(gs)))
figure
subplot(2,2,1)
imshow(abs(F_sobel_spat)>0.2*abs(max(max(F_sobel_spat))))
title("Threshold in spatial domain")

subplot(2,2,2)
imshow(abs(F_sobel_freq)>0.2*abs(max(max(F_sobel_freq))))
title("Threshold in frequency domain")

% Check if the filtered images are identical
subplot(2,2,3)
imshow(abs(F_sobel_spat - F_sobel_freq))
title("Difference between spatial and frequency filtering")