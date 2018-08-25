#show hasShape/2 .
hasShape(X,user) :- node(X),                      
                    datatype(X,name,string),
                    cardinality(X,name,plus) .

not hasShape(X,user):- node(X), 
                    not datatype(X,name,string) .
not hasShape(X,user):- node(X), 
                    not cardinality(X,name,plus) .

hasShape(X,S) | not hasShape(X,S) :- node(X), shape(S) .

cardinality(X,P,plus):- 
  countProperty(X,P,C), C >= 1 .	

datatype(X,P,string):- 
  countStringProperty(X,P,CI),
  countProperty(X,P,C), C = CI . 

countProperty(X,P,C):- node(X), property(P), 
  C = #count { V: arc(X,P,V) }  .

countStringProperty(X,P,C):- node(X), property(P), 
  C = #count { 1: stringValue(X,P) }  .

stringValue(X,P):-arc(X,P,V), string(V) .

arc(alice,name,"Alice").
arc(alice,knows,alice).
arc(bob,name,"Robert").
arc(bob,name,"Bob").
arc(carol,name,"Carol").
arc(dave,name,2).
arc(emily,knows,dave). % emily has no name

% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Robert";"Carol") .
node(alice;bob;carol;dave;emily).  
property(name).
shape(user).

% test
:- not hasShape(alice,user).
:-hasShape(bob,user).
:- not hasShape(carol,user).
:-hasShape(dave,user).
:-hasShape(emily,user).

