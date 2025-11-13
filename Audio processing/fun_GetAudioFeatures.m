function F = fun_GetAudioFeatures(chunk,Nfeatures)
% Input:
% chunk: the W matrix from fun_windowing
% Nfeature: the number of features we want to extract

[rows, columns] = size(chunk);

for i = 1:columns
    % Compute the power spectrum
    ps = abs(fft(chunk(:,1))).^2;
    pos_freq = 
end
end