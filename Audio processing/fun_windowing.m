function W = fun_windowing(y,windowshape,wstep)

% grant y is column vector
y=reshape(y,length(y),1);

N=length(y);
n = length(windowshape);

% kmax is the max number of windows that can be extracted from y
kmax= ceil((N-n)/wstep + 1);
% index of the last element in the last window
Nmax = (kmax-1)*wstep+n; 

if Nmax > N % need to zero-pad y
    ye = zeros(Nmax,1);
    ye(1:length(y)) = y; 

end

W = zeros(n, kmax); 
for k=1:kmax
    
    range = (k-1)*wstep+1:(k-1)*wstep+n;
    
    W(:,k) = ye(range).*windowshape;
end