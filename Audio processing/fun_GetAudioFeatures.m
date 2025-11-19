function F = fun_GetAudioFeatures(chunk,Nfeatures)
% Input:
% chunk: the W matrix from fun_windowing
% Nfeature: the number of features we want to extract

[rows, columns] = size(chunk);
F = zeros(Nfeatures, columns);

for i = 1:columns
    % Compute the fft of the column
    fft_column = fft(chunk(:,i));
    % Select only the positive frequencies
    pos_freq = fft_column(1: (floor(rows/2)+1
    % Compute the power spectrum
    power_spectrum = abs(pos_freq).^2;

    % Divide the positive frequencies into subbands
    nBands = 8;
    dimBands = ceil(length(pos_freq)/nBands);
    % Sum energy per subband
    energy = zeros(nBands, 1);

    for i = 1:nBands
        bandStart = (i-1)*dimBands + 1;
        bandEnd = (i)*dimBands;
        % Check if we don't go out of index bounds
        if bandEnd > length(power_spectrum)
            bandEnd = length(power_spectrum);
        end
        energy(i) = sum(power_spectrum(bandStart:bandEnd));
    end

    % Pick the top Nfeatures subband energies
    energy = sort(energy);
    F(:, i) = energy((length(energy)-Nfeatures), length(energy))'; 
end
end