% fun_GetAudioFeature 
% Extract features from the input vector of audio samples
% INPUT
%   chunk: vector of audio samples
%   Nfeatures: number of features to be extracted for each Window (0 -->
%   all possible features)
% OUTPUT
%   Features: matrix of features

function Features=fun_GetAudioFeatures(WW,Nfeatures)
% determine the number of samples for each chunk from the length of Window
[NT,~] = size(WW);

if Nfeatures ==0, Nfeatures = NT; end

% computer the FFT for each column of "chunk" 
FC = fft(WW); 

% Take only the first half of the squared module of the FFT (because of
% symmetry) 
Spectr = abs(FC(1:ceil(NT/2),:)).^2;

% Sort each column of spectr in descend order
[~,order]=sort(Spectr,'descend');

% Extract best Nfeatures features for each column
Features = order(1:min(Nfeatures,NT),:); 