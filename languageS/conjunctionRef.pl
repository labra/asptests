#const max=10.
mult2(0;2;4;6;8;10;12).
mult3(0;3;6;9;12).

passes(N,true):-number(N) .
passes(N,no(C1)):-
  number(N), 
  shape(no(C1)), 
  not passes(N,C1) .

passes(N,and(C1,C2)) :- 
  shape(and(C1,C2)), 
  passes(N,C1), 
  passes(N,C2) .
passes(N,m2):-mult2(N).
passes(N,m3):-mult3(N).
-passes(N,S):-
   shape(S), 
   number(N), 
   not passes(N,S) .

shape(m3).
shape(m2).
shape(no(m2)).
shape(no(m3)).
shape(and(no(m2),no(m3))).

%goalShape(no(m2)).
goalShape(and(no(m2),no(m3))).

number(1..max).

hasShape(X,S):-goalShape(S),passes(X,S).
#show hasShape/2 .
%:-passes(12,and(m2,m3)).
