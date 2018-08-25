% Project
person(P) :- knows(P, _).

% Separate helper predicate knows2/2.
% Not needed if polluting knows/2 with knows(X, X) is OK.
knows2(O, P) :- knows(O, P).
knows2(P, P) :- person(P).

% Everybody knows a popular person.
% When there is a person O that doesn't know P, #false is active.
% I.e. all rule instantiations where some O doesn't know P are discarded.
popular(P) :- person(P), #false : person(O), not knows2(O, P).

% Popular person knows only other popular persons.
% Redundant at this point, since the above rule already results
%   in correct answer without further integrity constraints.
:- person(P), person(O), popular(P), not popular(O), knows(P, O).

knows(adam,  dan).
knows(adam,alice).
knows(adam,peter).
knows(adam,eva).
knows(dan,   adam).
knows(dan,alice).
knows(dan,peter).
knows(eva,   alice).
knows(eva,peter).
knows(alice, peter).
knows(peter, alice).

#show popular/1.