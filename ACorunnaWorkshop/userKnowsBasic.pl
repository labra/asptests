#show hasShape/2 .
#show noHasShape/2 .
hasShape(X,user) :- node(X),
                    datatype(X,name,string),
					cardinality(X,name,plus),
                    nodeShape(X,knows,user),
                    cardinality(X,knows,plus) .

noHasShape(X,S) :- node(X), shape(S), not hasShape(X,S) .

not hasShape(X,user):- node(X), 
                    not datatype(X,name,string) .
not hasShape(X,user):- node(X), 
                    not cardinality(X,name,plus) .
not hasShape(X,user):- node(X), 
                    not nodeShape(X,knows,user) .
not hasShape(X,user):- node(X), 
                    not cardinality(X,knows,plus) .

hasShape(X,S) | not hasShape(X,S) :- node(X), shape(S) .

datatype(X,P,string):- 
  countStringProperty(X,P,CI),
  countProperty(X,P,C), 
  C = CI . 

cardinality(X,P,plus):- 
  countProperty(X,P,C), C >= 1 .	

%show nodeShape/3 .  
nodeShape(X,P,S):- 
  countShapeProperty(X,P,S,CI),
  countProperty(X,P,C), C = CI . 

countProperty(X,P,C):- node(X), property(P), 
  C = #count { V: arc(X,P,V) }  .

countStringProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { 1: stringValue(X,P) }  .
  
stringValue(X,P):-arc(X,P,V), string(V) .

countShapeProperty(X,P,S,C):- 
  node(X), 
  property(P), 
  shape(S),
  C = #count { 1: shapeValue(X,P,S) }  .

%show shapeValue/3 .  
shapeValue(X,P,S):-shape(S), 
                   arc(X,P,V), 
				   hasShape(V,S) .

arc(alice,knows,alice).
arc(alice,knows,dave).
arc(alice,name,"Alice").
arc(bob,knows,carol).
arc(dave,knows,emily).
arc(dave,name,"Dave").
arc(emily,knows,dave).
arc(emily,name,"Emily").

% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Robert";"Carol";"Dave";"Emily") .
node(alice;bob;carol;dave;emily).  
property(name;knows).
shape(user).

% test
%:- not hasShape(alice,user).
%:- hasShape(bob,user).
%:- hasShape(carol,user).
%:- not hasShape(dave,user).
%:- not hasShape(emily,user).

