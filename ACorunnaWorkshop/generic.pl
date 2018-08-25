
#const max = 100 .

#show hasShape/2 .
hasShape(X,t) :- node(X) .
hasShape(X,S):- 
  S = conj(S1,S2)),
  hasShape(X,S1), hasShape(X,S2) .
  
%hasShape(I,iri(X)) :- string(I), X = I .
%hasShape(X,no(S)) :- 
%  node(X), shape(S), 
%  not hasShape(X,S) .
%hasShape(X,lessOrEqualsThan(N,R,S)):- 
%  node(X), 
%  cardinality(X,R,S,0,N).

%not hasShape(X,and(S1,S2)):- node(X), shape(S1), shape(S2), 
%                    not hasShape(X,S1) .
					
%not hasShape(X,and(S1,S2)):- node(X), shape(S1), shape(S2),
%                    not hasShape(X,S2) .

%not hasShape(iri(X),iri(Y)):- node(X), string(Y),
%                    X != Y .

%cardinality(X,R,S,Min,Max):- integer(Min), integer(Max), 
%  countPropertyShape(X,R,S,C),
%  Min <= C, C <= Max .					 

%countPropertyShape(X,R,S,C):- 
%  node(X), 
%  property(R), 
%  shape(S),
%  C = #count { V: shapeValue(X,R,V) }  .

% shapeValue(X,R,S):-arc(X,R,V), hasShape(V,S) .

hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .

node(alice).
arc(alice,name,"Alice").
property(name).
string("Alice").


% Domain declarations...
integer(0..5) .
string("x") .

%#show check/2 .
%check(X,UserShape) :- 
% userShape(UserShape), hasShape(X,UserShape).

% userShape(and(lessOrEqualsThan(1,name,true),true)).
%userShape(true).
:-shape(conj(t,t)).


shape(t,0).
shape(conj(S1,S2),T+1) :- shape(S1,T), shape(S2,T).
%shape(no(S)):-shape(S).
%shape(iri(I)) :- string(I) .
%shape(lessOrEqualsThan(N,R,S)) :- 
%  integer(N), property(R), shape(S) .