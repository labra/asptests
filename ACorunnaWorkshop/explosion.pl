#show hasShape/2 .

hasShape(N,true) :- node(N).
hasShape(N,and(S1,S2)) :- node(N), hasShape(N,S1), hasShape(N,S2).

node(alice).  
:-hasShape(alice,and(true,true)).
