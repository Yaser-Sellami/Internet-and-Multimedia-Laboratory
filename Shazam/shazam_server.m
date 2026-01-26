clear all

% Create server socket listening to the port number 1234

S = tcpserver("::", 1234);

disp('Server ready, waiting for connections...')

% Specify byte ordering as "Little-Endian" 
% Same setting should be applied to the client side
S.ByteOrder = 'little-endian';

% Link the function to be invoked any time the connection state changes
% (i.e., a new client connects, or the connected one gets disconneted)
% The linked function will implement all the steps required to provide the
% service. 
S.ConnectionChangedFcn = @funshazam;















% Read clip length
% Read clip samples
% Search the clip in the local library
% Return: index, namefile, soundtrack original