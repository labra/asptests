% Example

node(N):-triple(N,_,_).
node(N):-triple(_,_,N).

shape(N,ns):-triple(N,r,Y), not shape(Y,ns).
shape(N,e):-node(N).
shape(N,s):-triple(N,s,Y), shape(Y,ns).
shape(N,s):-triple(N,s,Y), shape(Y,e).

% Display
#show shape/2 .