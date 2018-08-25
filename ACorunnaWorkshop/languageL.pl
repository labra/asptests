#const max=5 .
#show hasShape/2 .
%#show -hasShape/2 .


% How can we represent userShape as:
% user => and(string(name,1,1),
%             nodeShape(knows,user,1,star))
% schema(ShapeRef,Shape)

%shape(and(qualified(name,true,1,1),
%          qualified(knows,ref(user),1,max)
%		 )
%	 ).

shape(true).
shape(qualified(name,true,1,1)) .
% shape(and(true,true)).

%schema(user, 
%       and(string(name,1,1),
%           nodeShape(knows,ref(user),1,star))).


%shape(S):-schema(Lbl,S) .
	   

%hasShape(Node,S):-schema(S, Shape), 
%                  hasShape(Node,Shape).

hasShape(X,true) :- shape(true), node(X) .
%hasShape(X,and(S1,S2)) :- 
%   node(X), shape(and(S1,S2)), 
%   hasShape(X,S1), hasShape(X,S2) .
%-hasShape(X,and(S1,S2)):-
%   node(X), shape(and(S1,S2)), not hasShape(X,S1).
%-hasShape(X,and(S1,S2)):-
%   node(X), shape(and(S1,S2)), not hasShape(X,S2).
%hasShape(X,qualified(P,S,MIN,MAX)):-
%   node(X), shape(qualified(P,S,MIN,MAX)), integer(MIN), integer(MAX), property(P),
%   C = #count { V: arc(X,P,V), hasShape(V,S) },
%   MIN <= C, C <= MAX .
%-hasShape(X,qualified(P,S,MIN,MAX)):-
%   node(X), shape(qualified(P,S,MIN,MAX)), integer(MIN), integer(MAX), property(P),
%   All = #count { V: arc(X,P,V) },	 
%   Fail = #count { V: arc(X,P,V), not hasShape(V,S) },
%   All - Fail < MIN .
   

#show countQualified/4 .   
countQualified(X,P,S,C):-node(X),property(P),shape(S),
   C = #count { V: arc(X,P,V), hasShape(V, S) } .
   
%hasShape(X,ref(S)):- 
%   node(X), schema(S,Shape), hasShape(N,Shape).   

%-hasShape(X,ref(S)):-node(X), not schema(S,Shape) .
%-hasShape(X,ref(S)):-node(X), schema(S,Shape), not hasShape(X,Shape) .
%-
   
% hasShape(X,A) | not hasShape(X,A) :- node(X), shape(A) .
%-hasShape(X,S) :- node(X), shape(S), not hasShape(X,S).				

%arc(alice,name,"Alice").
%arc(alice,knows,carol).
%arc(bob,name,"Robert").
%arc(bob,name,"Bob").
%arc(carol,name,"Carol").
%arc(carol,knows,alice).
%arc(dave,name,2).
%arc(emily,knows,dave). 
%arc(emily,name,"Emily").
%arc(frank,name,"Frank").
arc(grace,name,"Grace").
arc(grace,knows,grace) .
% Domain declarations...
integer(0..max).
string("Alice";"Bob";"Robert";"Carol";"Emily";"Frank") .
node(grace) .
% node(alice;bob;carol;dave;emily;frank).  
property(name;knows).

% test
%:- not hasShape(alice,user).
%:-hasShape(bob,user).
%:- not hasShape(carol,user).
%:-hasShape(dave,user).
%:- -hasShape(grace,ref(user)).