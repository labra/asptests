
hasShape(X,user) :- node(X), 
                    datatype(X,age,integer), 
                    cardinality(X,age,0,1), 
                    datatype(X,name,string),
                    cardinality(X,name,1,1),
					nodeShape(X,knows,user), 
					cardinality(X,knows,1,star).

noHasShape(X,user):- node(X), 
                     not datatype(X,age,integer) .
					 
noHasShape(X,user):- node(X), 
                     not cardinality(X,age,0,1) .
					 
noHasShape(X,user):- node(X), 
                     not datatype(X,name,string) .

noHasShape(X,user):- node(X), 
                     not cardinality(X,name,1,1) .

noHasShape(X,user):- node(X), 
                     not nodeShape(X,knows,user) .
					 
noHasShape(X,user):- node(X), 
                     not cardinality(X,knows,1,star) .

cardinality(X,P,Min,star):- integer(Min), 
  countProperty(X,P,C), Min <= C .					 

cardinality(X,P,Min,Max):- integer(Min), integer(Max), 
  countProperty(X,P,C), Min <= C, C <= Max .					 

nodeShape(X,P,S):- 
  countShapeProperty(X,P,S,CS),
  countProperty(X,P,C), 
  C = CS . 
  
#show datatype/3 .
datatype(X,P,integer):- 
  countIntegerProperty(X,P,CI),
  countProperty(X,P,C), 
  C = CI . 
  
datatype(X,P,string):- 
  countStringProperty(X,P,CI),
  countProperty(X,P,C), 
  C = CI . 

#show countProperty/3 .  
#show countIntegerProperty/3 .  
countProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { V: arc(X,P,V) }  .

countIntegerProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { 1: integerValue(X,P) }  .

countStringProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { 1: stringValue(X,P) }  .
  
#show countShapeProperty/4 .  
countShapeProperty(X,P,S,C):- 
  node(X), 
  property(P), 
  shape(S),
  C = #count { 1: shapeValue(X,P,S) }  .

integerValue(X,P):-arc(X,P,V), integer(V) .
stringValue(X,P):-arc(X,P,V), string(V) .
shapeValue(X,P,S):-shape(S), arc(X,P,V), hasShape(V,S) .

hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .
-hasShape(X,S) :- noHasShape(X,S).				

integerAge(X,A) :- arc(X,age,A), integer(A) .

arc(alice,age,12) .
arc(alice,name,"Alice").
arc(alice,knows,alice).


arc(bob,name,"Robert").
arc(bob,age,14) .
arc(bob,age,12) .

arc(carol,name,"Carol").
arc(carol,age,other) .

% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Carol") .
node(alice;bob;carol).  
property(age;name;knows).
shape(user).
					
#show hasShape/2 .
#show noHasShape/2 .