%% Transforming the image in frequency domain

% Read the image f and calculate its transform
f = imread("barbara.jpg");
subplot(2,2,1)
imshow(f)
title("Original image")

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
imshow(magn_centre, [])
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_lowpass)
title("Low pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_lowpass = F_centre*H_lowpass;
magn_lowpass=abs(F_lowpass);
magn_lowpass=log(1+abs(magn_lowpass));

subplot(2,2,3)
imshow(magn_lowpass, [])
title("Filtered image in frequency domain")

%%%%%%%%%%%  BUTTERWORTH LOW PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a third order filter (n=3) with D0=35 
% by implementing H_but=1./(1+(dist./D0).^(2*n));
n = 3;
D0 = 35;
H_but = 1./(1+(dist./D0).^(2*n));

% Show the filter
figure
subplot(2,2,1)
imshow(magn_centre)
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_but)
title("Butterworth low pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_but = F_centre*H_but;
magn_but=abs(F_but);
magn_but=log(1+abs(magn_but));

subplot(2,2,3)
imshow(magn_but, [])
title("Filtered image in frequency domain")

% Vary the value of D0 and of the filter order to see their effect on the result


%%%%%%%%%%%  GAUSSIAN LOW PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a gaussian filter with s =30
% by implementing H_gau=exp(-(dist.^2)/(2*(sigma^2)));
s = 30;
H_gau=exp(-(dist.^2)/(2*(s^2)));

% Show the filter
figure
subplot(2,2,1)
imshow(magn_centre, [])
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_gau)
title("Gaussian low pass filter")

% Apply the filter to the image transform
F_gau = F_centre*H_gau;
magn_gau=abs(F_gau);
magn_gau=log(1+abs(magn_gau));

subplot(2,2,3)
imshow(magn_gau, [])
title("Filtered image in frequency domain")

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
imshow(magn_centre)
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_highpass)
title("Ideal high pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_highpass = F_centre*H_highpass;
magn_highpass=abs(F_highpass);
magn_highpass=log(1+abs(magn_highpass));

subplot(2,2,3)
imshow(magn_highpass, [])
title("Filtered image in frequency domain")

% Create the high pass filter as 1-the low pass filter. Analyze the
% differences


%%%%%%%%%%%  BUTTERWORTH HIGH PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a third order filter (n=3) with D0=35 
% by implementing H_but=1- 1./(1+(dist./D0).^(2*n))
H_buthigh = 1 - 1./(1+(dist./D0).^(2*n));

% Show the filter
figure
subplot(2,2,1)
imshow(magn_centre)
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_buthigh)
title("Butterworth high pass filter")

% Apply the filter to the image transform by point multiplying the filter with the image transform
F_buthigh = F_centre*H_buthigh;
magn_buthigh=abs(F_buthigh);
magn_buthigh=log(1+abs(magn_buthigh));

subplot(2,2,3)
imshow(magn_buthigh, [])
title("Filtered image in frequency domain")

% Vary the value of D0 and of the filter order to see their effect on the result



%%%%%%%%%%%  GAUSSIAN HIGH PASS FILTER %%%%%%%%%%%%%%%%%%%

% Create a gaussian filter with s =30
% by implementing H_gau=1-exp(-(dist.^2)/(2*(sigma^2)));
H_gauhigh= 1- exp(-(dist.^2)/(2*(s^2)));

% Show the filter
figure
subplot(2,2,1)
imshow(magn_centre, [])
title("Original image in frequency domain")

subplot(2,2,2)
imshow(H_gauhigh)
title("Gaussian low pass filter")

% Apply the filter to the image transform
F_gauhigh = F_centre*H_gauhigh;
magn_gauhigh=abs(F_gauhigh);
magn_gauhigh=log(1+abs(magn_gauhigh));

subplot(2,2,3)
imshow(magn_gauhigh, [])
title("Filtered image in frequency domain")

% Vary the value of s to see its effect on the result


%%%%%%%%%% RINGING %%%%%%%%%%%%%%
% Load the image quadrati.png 
x = imread("quadrati.png");

% Add salt and pepper noise by using the function imnoise
x_noise = imnoise(x, 'salt & pepper');

% Compute the Fourier transform of the image
X_noise = fft2(X_noise);
X_noise = fftshift(X_noise);

% Apply an ideal low pass filter
X_noise_lowpass = X_noise * H_lowpass;

% Show the result in the spatial domain
figure
subplot(2,2,3)

% Apply an ideal high pass filter
X_noise_highpass = X_noise * H_highpass

% Show the result in the spatial domain


%%%%%%%%%%%% PHASE AND MAGNITUDE SWAP %%%%%%%%%%%%%%%%
%Load two images


% Compute their Fourier Transform


% Swap their phase components


%%%%%%%%%% SPATIAL DOMAIN <-> FREQUENCY DOMAIN %%%%%%%%%

% Use the function freqz2 to compute the frequency response of filters
% Generate a Sobel filter with the function fspecial

% Create its frequency counterpart by useing the function freqz2


% Perform the same filtering in the spatial and in the frequency domain 
 
 

% Show the results and compare them


%%%%%%%%%% IMPLEMENT A SIMPLE EDGE DETECTION %%%%%%%%%%
% Apply a threshold to the filtered images in the spatial and frequency domain by showing only
% pixel values whose absolute value is larger than 0.2*abs(max(max(gs)))


% Check if the filtered images are identical









%Compute the Fourier transform of the clean and of the noisy image