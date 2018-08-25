#const max=1.
mult2(0;2;4;6;8;10;12).
mult3(0;3;6;9;12).

passes(N,and(C1,C2)) :- 
  shape(and(C1,C2)), 
  passes(N,C1), 
  passes(N,C2) .
passes(N,m2):-mult2(N).
passes(N,m3):-mult3(N).
-passes(N,S):-shape(S), number(N), not passes(N,S) .

%shape(m2).
%shape(m3).
shape(and(m2,m3)).

number(1..20).

hasShape(X,S):-shape(S),passes(X,S).
#show hasShape/2 .
%:-passes(12,and(m2,m3)).
