triple(enrico,livesIn,northernItaly).
triple(diego,livesIn,northernItaly).
triple(alessandro,livesIn,northernItaly).
triple(sergio,livesIn,northernItaly).
triple(john,livesIn,northernItaly).
triple(maurizio,livesIn,southernItaly).

triple(enrico,knows,john).
triple(john,knows,maurizio).
triple(diego,knows,alessandro).
triple(alessandro,knows,diego).
triple(alessandro,knows,sergio).

shape(N,polentoni):-triple(N,livesIn,northernItaly), 
                    knowsOnlyPolentoni(N),
                    not -knowsOnlyPolentoni(N) .
					
-shape(N,polentoni):-node(N), not triple(N,livesIn,northernItaly) . 
-shape(N,polentoni):-triple(N,knows,Y), not shape(N,polentoni) . 

					
knowsOnlyPolentoni(N):- triple(N,knows,Y), 
					    shape(Y,polentoni),
					    not -knowsOnlyPolentoni(N) .
					
-knowsOnlyPolentoni(N):- triple(N,knows,Y), not shape(Y,polentoni) .
-knowsPolentoni(N):- node(N), not triple(N,knows,_).

node(N):- triple(N,_,_).
node(N):- triple(_,_,N).
					
%shape(diego,polentoni).					
%shape(enrico,polentoni).
					
#show shape/2 .
#show node/1 .