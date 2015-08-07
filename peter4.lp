% Peter's example:
% https://lists.w3.org/Archives/Public/public-data-shapes-wg/2015Mar/0301.html

% First solution with inclusive or

% SCHEMA:
% 
% PREFIX ex: <http://ex.example/#>
% start = <S>
% <S> { ex:p @<T>* }
% <T> { ( ex:q @<Z> | ex:r @<T> ) }
% <Z> { }

shape(N,s):-triple(N,p,Y), shape(Y,t) .
:- shape(N,s), triple(N,p,Y), not shape(Y,t) .

shape(N,t):-triple(N,q,Y),shape(Y,z) .
:-shape(N,t), triple(N,q,Y), not shape(Y,z) .

shape(N,t):-triple(N,r,Y),shape(Y,t) .
:-shape(N,t), triple(N,r,Y), not shape(Y,t) .

shape(N,z):-node(N) .

node(N):-triple(N,_,_).
node(N):-triple(_,_,N).

% DATA:
% PREFIX ex: <http://ex.example/#>
% ex:a ex:p ex:b .
% ex:a ex:p ex:c .
% ex:b ex:q ex:z .
% ex:c ex:q ex:z .
% ex:b ex:r ex:c .
% ex:c ex:r ex:b .

triple(a,p,b).
triple(a,p,c).
triple(b,q,z).
triple(c,q,z).
triple(b,r,c).
triple(c,r,b).

#show shape/2 .