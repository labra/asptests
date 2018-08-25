
hasShape(X,user) :- node(X), 
                    nodeShape(X,knows,user), 
					cardinality(X,knows,1,star).

noHasShape(X,user):- node(X), 
                     not nodeShape(X,knows,user) .
					 
noHasShape(X,user):- node(X), 
                     not cardinality(X,knows,1,star) .

cardinality(X,P,Min,star):- integer(Min), 
  countProperty(X,P,C), Min <= C .					 

cardinality(X,P,Min,Max):- integer(Min), integer(Max), 
  countProperty(X,P,C), Min <= C, C <= Max .					 

#show nodeShape/3 .
nodeShape(X,P,S):- 
  countShapeProperty(X,P,S,CS),
  countProperty(X,P,C), 
  C = CS . 
  
#show countProperty/3 .  
countProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { V: arc(X,P,V) }  .

#show countShapeProperty/4 .  
countShapeProperty(X,P,S,C):- 
  node(X), 
  property(P), 
  shape(S),
  C = #count { 1: shapeValue(X,P,S) }  .

#show shapeValue/3 .  
shapeValue(X,P,S):- shape(S), arc(X,P,V), hasShape(V,S) .

hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .
-hasShape(X,S) :- noHasShape(X,S).				

integerAge(X,A) :- arc(X,age,A), integer(A) .

% arc(alice,age,12) .
% arc(alice,name,"Alice").
arc(alice,knows,alice).

arc(bob,knows,carol).
-hasShape(carol,user).

% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Carol") .
node(alice;bob;carol).  
property(knows).
shape(user).
					
#show hasShape/2 .
#show noHasShape/2 .