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
                    not knowsSomeNotPolentoni(N).
					
:- shape(N,polentoni), knowsSomeNotPolentoni(N) .

knowsPolentoni(N):- triple(N,knows,Y), 
					shape(N,polentoni).
					
knowsSomeNotPolentoni(N):- triple(N,knows,Y), 
                           not shape(Y,polentoni) .

node(N):- triple(N,_,_).
node(N):- triple(_,_,N).
					
% shape(diego,polentoni).					
% shape(enrico,polentoni).
					
#show shape/2 .
#show knowsPolentoni/1 .
#show knowsSomeNotPolentoni/1 .
