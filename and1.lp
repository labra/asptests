% Simple problem: How to represent conjunction with multi-occurrence in ASP

% Shape expression:
% <S> { :p (1 2 3), :p (2 3 4) }
% It allows 2 predicates p, one with values (1,2,3) and another with values (2,3,4)
% It allows other predicates
% It doesn't allow predicates p with values different to 1, 2, 3

shape(N,s):-
  triple(N,p,N1), in123(N1), not -pIn123(N) ,
  triple(N,p,N2), in234(N2), not -pIn234(N) .
  
shape(N,s):-
  triple(N,p,N1), in123(N1), not -pIn123(N) , 
  triple(N,p,N2), in234(N2), not -pIn234(N) ,
  anyOtherTripleThanP(N). 


in123(1..3) .
in234(2..4) .
-pIn123(N):-triple(N,p,N1), not in123(N1).
-pIn234(N):-triple(N,p,N1), not in234(N1).

anyOtherTripleThanP(N):-triple(N,Pred,N1), Pred != p .

% Examples:

% Example with 2 p's
triple(good1,p,1) .
triple(good1,p,3) .


% Example with 2 p's
triple(good2,p,2) .
triple(good2,p,3) .

% Example with an extra triple (allowed with open shapes)
triple(good3,p,1) .
triple(good3,p,3) .
triple(good3,q,4) .

% Constraint violation because value there is only one value of p
triple(bad1,p,4).

% Constraint violation because one value of p is not in (1,2,3) or (2,3,4)
triple(bad2,p,1).
triple(bad2,p,3).
triple(bad2,p,6).

% Doesn't have any p
triple(bad3,q,1).
triple(bad3,q,4).

% helpers
% I define node(N) so I can declare it in a possitive literal to avoid unsafe rules

node(N):-triple(N,_,_).
node(N):-triple(_,_,N).

#show shape/2 .