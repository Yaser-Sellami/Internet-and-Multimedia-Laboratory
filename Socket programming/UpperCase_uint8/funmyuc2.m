% function definition. The first parameter is assigned the handle of the 
% TCPserver object that calls the function. The other parameters are 
% neglected (~)
function funmyuc2(S,~)


if S.Connected
    disp('Connection OK!');
    disp(['Connected with Client with IP: ',S.ClientAddress,...
        ' at port number ',num2str(S.ClientPort)]);
        
        % Read the string until the Terminator ("LF  in this case")
        dataread = readline(S);
        
        % convert bytes into ASCII characters
        lowerstring = char(dataread);
        upperstring  = upper(lowerstring);
        % Send the uppercase version of the string to the client
        writeline(S, upperstring);
        disp('String converted and returned to the client')
    
else
    disp('Client disconnected')
end
