% function definition. The first parameter is assigned the handle of the 
% TCPserver object that calls the function. The other parameters are 
% neglected (~)

function funshazam(S, ~)

if S.Connected
    % Reading the track length
    track_length = read(S, 1, "double");

    % Reading the track samples
    track_samples = read(S, track_length, "uint8");

    % Extracting the features from the track samples
    chunktime = 100e-3;
    overlapfraction= 0.5; 
    Nfeatures=2;

    steptime = (1-overlapfraction)*chunktime; 
    wstep = ceil(Fs*steptime);
    windowshape = hamming(n); 
        
    W = fun_windowing(y,windowshape,wstep);
    
    Nfeatures = 2; 
    FFeatures=fun_GetAudioFeatures(W,Nfeatures);
    kmax = size(FFeatures,2);
    
    % Carico tutti i file audio della cartella
    pathprefixLIBRARY = '.\MusicLibrary\MusicLibrary\';
    library_files = dir(pathprefixLIBRARY);
    numFiles = size(library_files, 1);
    % Passo in rassegna tutti i files e ci lavoro sopra, uno a uno
    MSEfiles = ones(numFiles, 1)*Inf;   %Array pieno di valori Inf, che andrò poi a riempire con i vari MSE minimi tra ogni traccia e il file audio target
    MSEmin=Inf;
    matchedFile=0;
    for countfile=1:numFiles
        filename = strcat(pathprefixLIBRARY, allfiles(countfile).name);    
        W = fun_features(filename);
        for column = 1 : size(W, 2)-size(Wtarget, 2)+1    %vario la colonna di partenza della matrice W in esame
            for k=1:size(Wtarget, 2)
                MSE=mean((Wtarget(:, k)-W(:, column-1+k)).^2);
                if MSE<MSEmin(length(MSEmin))
                    MSEmin=[MSEmin; MSE];
                    matchedFile=[matchedFile; countfile];
                    %matchedFile=allfiles(countfile).name;
                    %istante = colonna countfile-1+k
                end
            end
        end
    end

    song_name = allfiles(matchedFile(length(matchedFile))).name;
else 
    disp("Client disconnected")
end