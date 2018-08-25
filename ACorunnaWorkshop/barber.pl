#show barber/1 .
#show shaves/2 .

barber(X):-person(Y), shaves(X,Y), not barber(Y).
not barber(X):-person(Y), person(X), not shaves(X,Y).

barber(X) | not barber(X) :- person(X) .

person(bob;dave) .

shaves(albert,dave).
shaves(bob,bob).