uri(a) .
uri(b) .
uri(c) .

literal(1) .
literal(2) .
literal(3) .

string("Alice").

nodeShape(userShape):-iri(X). 

%* :UserShape a sh:NodeShape ;
       sh:nodeKind(iri). 
	   
*%
