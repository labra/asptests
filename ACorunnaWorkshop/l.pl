
node(X):-iri(X) .
node(X):-string(X).
iri(a;b;c).
string("a";"b";"c").

shape(userShape, and(iri,equals(1,name,string)).


hasShape(V,true).
hasShape(V,iri) :- iri(N) .
hasShape(V,string) :- string(N) .
hasShape(V,equals(N,P,S))
hasShape(V,S) :- node(V),
                 shape(S, and(S1,S2)), 
                 hasShape(V,S1),
				 hasShape(V,S2).
				 
hasShape(X,S) | not hasShape(X,S) :- node(X), shape(S,_) .
				 
%show hasShape/2 .