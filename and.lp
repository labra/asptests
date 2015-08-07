
% Example of encoding:
% <s> { :p (1 2 3), :q (2 3 4) }

shape(N,s):- triple(N,p,N1), in123(N1),
             triple(N,q,N2), in234(N2).
			 
:-shape(N,s),triple(N,p,N1), not in123(N1) .
:-shape(N,s),triple(N,q,N2), not in123(N2) .

triple(good1,p,1).
triple(good1,q,2).

triple(good2,p,2).
triple(good2,q,2).

triple(bad1,p,1).

triple(bad2,p,a).
triple(bad2,q,2).

in123(1..3).
in234(2..4).

#show shape/2 .
