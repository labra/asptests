% Peter's example:
% https://lists.w3.org/Archives/Public/public-data-shapes-wg/2015Mar/0439.html

% What I am seeing is that in

% PREFIX ex: <http://ex.example/#>
% start = <S>
% <S> { ex:p1 @<T> , ex:p2 @<T> }
shape(N,s):-triple(N,p1,N1), shape(N1,t), 
            triple(N,p2,N2), shape(N2,t) .
:-shape(N,s), triple(N,p1,N1), not shape(N1,t) .
:-shape(N,s), triple(N,p2,N2), not shape(N2,t) .

% <T> { ( ex:q @<Z> | ex:r @<T> ) }

shape(N,t):-triple(N,q,N1), shape(N1,z) .
:- shape(N,t), triple(N,q,N1), not shape(N1,z).

shape(N,t):-triple(N,r,N1), shape(N1,t) .
:- shape(N,t), triple(N,r,N1), not shape(N1,t).

% adding exclusive-or
:-shape(N,t), triple(N,q,N1), shape(N1,z), triple(N,r,N2), shape(N2,t) .

% <Z> { }
shape(N,z):-node(N).

node(N):-triple(N,_,_).
node(N):-triple(_,_,N).

% PREFIX ex: <http://ex.example/#>
% ex:a ex:p1 ex:b .
% ex:a ex:p2 ex:c .
% ex:b ex:q ex:z .
% ex:c ex:q ex:z .
% ex:b ex:r ex:c .
% ex:c ex:r ex:b .

triple(a,p1,b).
triple(a,p2,c).
triple(b,q,z).
triple(c,q,z).
triple(b,r,c).
triple(c,r,b).

% ex:a doesn't validate against <S>.

#show shape/2 .