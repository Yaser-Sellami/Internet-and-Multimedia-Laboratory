% Read a random track from the folder TESTaudiotraces

pathprefixTEST = 'TESTaudiotraces\TESTaudiotraces\';
test_traces = dir(strcat(pathprefixTEST, '*wav'));
num_traces = length(test_traces);

random_track = test_traces(randi(num_traces)).name;
disp("Selected track: ")
disp(random_track)

% Establishing connection with the server
connectionSuccessful = 0;
while connectionSuccessful == 0
    try
        C = tcpclient("localhost", 1234);
        connectionSuccessful = 1;
        C.ByteOrder = 'little-endian';
    catch ME
        if strcmp(ME.identifier, 'MATLAB:networklib:tcpclient:cannotCreateObject')
            connectionSuccessful = 0;
            disp('wait')
        end
    end
end

% Sending the track length
[y, Fs] = audioread(random_track);
write(C, length(y), "double")

% Sending the audio track
write(C, y, "uint8")

% Reading index, namefile and track from the server
read...

