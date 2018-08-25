#show hasShape/2 .
#show noHasShape/2 .
%#show string/4 .  
%#show countStringProperty/3 .      
%#show countProperty/3 .    


hasShape(X,user) :- node(X), 
                    string(X,name,1,1) .

not hasShape(X,user):- node(X), 
                    not string(X,name,1,1) .

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

countStringProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { V: arc(X,P,V), string(V) }  .
  
countNoStringProperty(X,P,C):- 
  node(X), 
  property(P), 
  C = #count { V: arc(X,P,V), not string(V) }  .

countProperty(X,P,C):- 
  node(X), property(P), 
  C = #count { V: arc(X,P,V) }  .
  
hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .
noHasShape(X,S) :- node(X), shape(S), not hasShape(X,S).				

string(X,P,MIN,star):- 
  integer(MIN), 
  countProperty(X,P,CP),
  countStringProperty(X,P,C),
  C = CP,
  MIN <= C .

arc(alice,name,"Alice").
arc(alice,knows,carol).
arc(bob,name,"Robert").
arc(bob,name,"Bob").
arc(carol,name,"Carol").
arc(carol,knows,alice).
arc(dave,name,2) .
arc(emily,knows,dave). % emily has no name
arc(frank,name,"Frank") .
arc(frank,name,2) .


% Domain declarations...
integer(0..100).
string("Alice";"Bob";"Robert";"Carol";"Frank") .

node(alice). 
node(bob). 
node(carol). 
node(dave). 
node(emily). 
node(frank).  
property(name).
shape(user).

% test
% :- string(bob,name,1,1).
%:-hasShape(bob,user).
%:- not hasShape(carol,user).
%:-hasShape(dave,user).
%:-hasShape(emily,user).

					
