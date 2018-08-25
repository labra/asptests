
% Example from: 
% P. Cabalar, 
% "Existential Quantifiers in the Rule Body", 
% 23rd Workshop on (Constraint) Logic Programming (WLP'09), Potsdam, Germany, September 15/16, 2009.

% We want to represent: a person is happy when all his/her offsprings are married
% happy(X):- person(X), not exists Y(parent(X,Y), not exists Z(married(Y,Z)))

happy(X):-person(X),parent(X,Y),not has_single_offs(X).
has_single_offs(X):-parent(X,Y),not has_spouse(Y).
has_spouse(Y):-married(Y,Z).

married(luis,ana).
% married(belen,carlos).

parent(pepe,luis).
% parent(luis,belen).

person(luis).
person(ana).
person(belen).
person(carlos).
person(quico).
person(juan).

#show happy/1.
%#show has_single_offs/1.
%#show has_spouse/1.