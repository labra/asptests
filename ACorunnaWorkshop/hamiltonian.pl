node(0). 
node(1).
node(2).
node(3).
edge(0,1).
edge(1,2).
edge(1,3).
edge(2,0).
edge(2,3).
edge(3,2).
edge(3,0).

in(X,Y) | not in(X,Y) :- edge(X,Y) .

:- in(X,Y), in(X,Z), Y != Z .
:- in(Y,X), in(Z,X), Y != Z .

reach(X,Y):-in(X,Y).
reach(X,Y):-in(X,Z),reach(Z,Y).

:- not reach(X,Y), node(X), node(Y) .

#show in/2.