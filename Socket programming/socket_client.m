echotcpip("on", 8005)
% Creating a TCP socket
t = tcpclient("127.0.0.1", 8005);
write(t, 300, "uint16")
read(t, 1, "uint8")
byte_order = t.ByteOrder;
bytes_available = t.NumBytesAvailable;
bytes_written = t.NumBytesWritten;