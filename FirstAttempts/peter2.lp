% peter example on private email:

% I don't know how a multi-valued approach would work.  It appears to me that
%  recursion over negation splits the choice space.
%  Consider, for example,
%    sh = not p sh
%    sha = or ( q sh ) ( r sh )

shape(N,sh) :- triple(N,p,Y), not shape(Y,sh) .

% inclusive-or
shape(N,sha) :- triple(N,q,Y), shape(Y,sh) .
shape(N,sha) :- triple(N,r,Y), shape(Y,sh) .

%  on
%    a q x .
%    a r y .
%    x p y .
%    y p x .
%  I think that a should belong to sha, but I don't see how to achieve this
%  without considering multiple models.

triple(a,q,x).
triple(a,r,y).
triple(x,p,y).
triple(y,p,x).

#show shape/2 .
