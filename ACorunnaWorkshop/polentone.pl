hasShape(X,niaAddressShape):- 
  arc(X,telephone,T), 
  arc(X,locatedIn,northernItaly) .

% 1 #count { (X,T) : hasShape(X,niaAddressShape) : arc(X, telephone, T) } 1 .
  
hasShape(X,polentoneShape):-
  arc(X,address,A), hasShape(A,niaAddressShape),
  arc(X,knows,K), hasShape(K, polentoneShape) .

hasShape(X,semipolentoneShape):-
  arc(X,address,A), hasShape(A,niaAddressShape), 
  not knowsPolentone(X) .
  
knowsPolentone(X) :- arc(X,knows,K), hasShape(K,polentoneShape).  

nodeShape(polentoneShape).
nodeShape(semipolentoneShape).
nodeShape(niaAddressShape).
node(davide).  
node(enrico).
node(addr1).
node(addr2).

arc(enrico,knows,davide).
arc(enrico,address,addr1). 
arc(davide,knows,davide).
arc(davide,address,addr2).

arc(addr1,telephone,"234").
arc(addr1,locatedIn,northernItaly).
arc(addr2,locatedIn,northernItaly).
arc(addr2,telephone,"123").



% Avoid CWA on hasShape
hasShape(X,S)| not hasShape(X,S) :- node(X), nodeShape(S).

#show hasShape/2 .

:-hasShape(david,polentoneShape).
:-hasShape(enrico,semipolentoneShape).
  
					 