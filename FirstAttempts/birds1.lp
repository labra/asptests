fly(X):- bird(X), not not fly(X) .
not fly(X) :- penguin(X).

penguin(tux).
bird(tux).
bird(tweety).
% adding this generates unsatisfiable: fly(tux).