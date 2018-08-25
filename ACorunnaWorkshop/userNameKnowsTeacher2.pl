#show hasShape/2 .
%#show noHasShape/2 .
#const star=10.
% #show nodeShape/5 .
%#show countShapeProperty/4 .
hasShape(X,user) :- node(X), 
                    string(X,name,1,1),
                    nodeShape(X,knows,user,1,star) .
					
hasShape(X,teacher) :- node(X), 
                    string(X,name,1,1),
                    not nodeShape(X,knows,user,1,star) .

not hasShape(X,user):- node(X), 
                    not string(X,name,1,1) .
					
not hasShape(X,user):- node(X), 
                    not nodeShape(X,knows,user,1,star) .
					
not hasShape(X,teacher):-node(X),
                    not string(X,name,1,1) .

not hasShape(X,teacher):- node(X), 
                    nodeShape(X,knows,user,1,star) .

%show nodeShape/5 .					
nodeShape(X,P,S,MIN,MAX):- 
  integer(MIN), integer(MAX), shape(S),
  countShapeProperty(X,P,S,C),
  C >= MIN, C <= MAX .
not nodeShape(X,P,S,MIN,MAX):- 
  integer(MIN), integer(MAX), shape(S),
  countProperty(X,P,C),
  countNoShapeProperty(X,P,S,NS),
  C - NS < MIN .
					
string(X,P,MIN,MAX):-
  integer(MIN), integer(MAX), 
  countStringProperty(X,P,C),
  C >= MIN ,
  C <= MAX .
not string(X,P,MIN,MAX):-
  integer(MIN), integer(MAX), 
  countProperty(X,P,C),
  countNoStringProperty(X,P,NS),
  C - NS < MIN .

countStringProperty(X,P,C):- % as before
  node(X), 
  property(P), 
  C = #count { 1: arc(X,P,V), string(V) }  .
countNoStringProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { V: arc(X,P,V), not string(V) }  .

%#show countShapeProperty/4 .  
countShapeProperty(X,P,S,C):- 
  node(X), property(P), shape(S),
  C = #count { V: arc(X,P,V), hasShape(V,S) }  .

%#show countNoShapeProperty/4 .  
countNoShapeProperty(X,P,S,C):- 
  node(X), property(P), shape(S),
  C = #count { V: arc(X,P,V), noHasShape(V,S) }  .

%#show countProperty/3 .    
countProperty(X,P,C):- 
  node(X), property(P), 
  C = #count { V: arc(X,P,V) }  .
  
hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .
noHasShape(X,S) :- node(X), shape(S), not hasShape(X,S).				

arc(alice,name,"Alice").
arc(alice,knows,carol).
arc(bob,name,"Robert").
arc(bob,name,"Bob").
arc(carol,name,"Carol").
arc(carol,knows,alice).
arc(dave,name,2).
arc(emily,knows,dave). 
arc(emily,name,"Emily").
arc(frank,name,"Frank").
% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Robert";"Carol";"Emily";"Frank") .
node(alice;bob;carol;dave;emily;frank).  
property(name;knows).
shape(user;teacher).

% test
%:- not hasShape(alice,user).
%:-hasShape(bob,user).
%:- not hasShape(carol,user).
%:-hasShape(dave,user).
%:-hasShape(emily,user).