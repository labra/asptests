#const max=2 .

integer(1..max) .
node(a;b;c) .
property(p;q;r) .


shape(true,0) .
shape(and(S1,S2),K+1):-
  shape(S1,K),
  shape(S2,K),
  K < max .
shape(equals(R1,R2),0):-
  property(R1) , 
  property(R2) .  
shape(gtEquals(N,R,S),K+1):-
  integer(N), 
  property(R),
  shape(S,K),
  K < max .
  

hasShape(N,true,0):-node(N).  
hasShape(N,and(S1,S2),K+1):- 
  hasShape(N,S1,K), 
  hasShape(N,S2,K) .

:- shape(a, and(true,true),K), K < max .

%show shape/2 .





