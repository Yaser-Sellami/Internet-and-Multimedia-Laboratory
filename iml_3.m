%% Read and show images

x = imread('lena.jpg');
[m, n] = size(x);

imshow(x)

X = double(x);
imshow(X, [])
figure

imwrite(X, 'lena.bmp', 'bmp')
imwrite(x, 'Lena.bmp', 'bmp')

%% Negative image

X_neg = NegImg(X, 256);
X_neg = X_neg/max(max(X_neg));
imshow(X_neg)
figure
imwrite(X_neg, 'neg_lena.jpg', 'quality', 70)

%% Logaritmic transform image

x_log = LogImg(x, 1);
X_log = x_log/max(max(x_log));
imshow(X_log)
figure
imwrite(X_log, 'log_lena.jpg', 'quality', 70)

%% Contrast trasformation image

x_con = ConImg(x, 0.5, 20);
X_con = x_con/max(max(x_con));
imshow(X_con)
figure
imwrite(X_con, 'con_lena.jpg', 'quality', 70)

%% Power transform image
X_std = X/max(max(X));
X_pow = PowImg(X_std, 0, 1, 2);
X_pow = X_pow/max(max(X_pow));
imshow(X_pow)
imwrite(X_pow, 'pow_lena.jpg', 'quality', 70)