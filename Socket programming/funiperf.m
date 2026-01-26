% function definition. The first parameter is assigned the handle of the 
% TCPserver object that calls the function. The other parameters are 
% neglected (~)

function funiperf(S, ~)

if S.Connected
    % Start the timer 
    tic;
    disp('Connection started')
    disp('Measuring the transfer speed')

    % Reading bytes until we encounter the number 0 (end of
    % transmission)
    data = read(S, 1, 'uint8'); % We read the first byte
    num_bytes = 1;
    while data ~= 0
        % We keep reading one byte at a time until we reach 0
        data = read(S, 1, 'uint8');
        num_bytes = num_bytes + 1;
    end

    % When we exit the loop the transmission ended
    % Stop the timer
    tot_time = toc;
    num_bits = num_bytes*8;
    speedmeasure = (num_bits/tot_time)/1000; % Speed in kb/s
    
    % Send to the client the speed
    write(S, speedmeasure, 'double')

else
    disp('Client disconnected')
end