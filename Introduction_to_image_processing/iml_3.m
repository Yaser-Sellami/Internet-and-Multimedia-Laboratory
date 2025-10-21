%% Read and show images

x = imread('lena.jpg');
[m, n] = size(x);

imshow(x)

X = double(x);

%Creating a subplot for all the images
subplot(2, 3, 1)
imshow(X, [])
title("Original Image")

imwrite(X, 'lena.bmp', 'bmp')
imwrite(x, 'Lena.bmp', 'bmp')

%% Negative image

X_neg = NegImg(X, 255);
X_neg = X_neg/max(max(X_neg));
subplot(2, 3, 2)
imshow(X_neg)
title("Negative transformation")

imwrite(X_neg, 'neg_lena.jpg', 'quality', 70)

%% Logaritmic transform image

x_log = LogImg(x, 1);
X_log = x_log/max(max(x_log));
subplot(2, 3, 3)
imshow(X_log)
title("Logaritmic transformation")

imwrite(X_log, 'log_lena.jpg', 'quality', 70)

%% Contrast trasformation image

x_con = ConImg(x, 0.5, 20);
X_con = x_con/max(max(x_con));
subplot(2, 3, 4)
imshow(X_con)
title("Contrast transformation")

imwrite(X_con, 'con_lena.jpg', 'quality', 70)

%% Power transform image

X_pot = PotImg(X_std, 0, 1, 2);
X_pot = X_pot/max(max(X_pot));
subplot(2, 3, 5)
imshow(X_pot)
title("Power transformation")
imwrite(X_pot, 'pow_lena.jpg', 'quality', 70)

%% Testing imtran

trasf = input("Transformation to apply [neg, log, con, pot] :", "s");
X_tran = imtran(X, trasf);
% Standardizing the double image
X_tran = X_tran/max(max(X_tran));
figure

% Showing the transformed image
imshow(X_tran)
title("Transformed image")