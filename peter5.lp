% Peter's example:
% https://lists.w3.org/Archives/Public/public-data-shapes-wg/2015Mar/0309.html

% A tougher test is

% PREFIX ex: <http://ex.example/#>
% start = <S>
% <S> { ( ex:q @<Z> | ex:p @<T>* ) }
% <T> { ( ex:q @<Z> | ex:r @<T> ) }
% <Z> { }

shape(N,s):-triple(N,q,Y),shape(Y,z).
:- shape(N,s),triple(N,q,Y), not shape(Y,z).

shape(N,s):-triple(N,p,Y), shape(Y,t) .
:- shape(N,s), triple(N,p,Y), not shape(Y,t) .

% Exclusive-or for S
:- shape(N,s), triple(N,q,N1), shape(N1,z), triple(N,p,N2), shape(N2,t) .

shape(N,t):-triple(N,q,Y),shape(Y,z) .
:-shape(N,t), triple(N,q,Y), not shape(Y,z) .

shape(N,t):-triple(N,r,Y),shape(Y,t) .
:-shape(N,t), triple(N,r,Y), not shape(Y,t) .

% We add exclusive-or condition
:- shape(N,t), triple(N,q,N1), shape(N1,z), triple(N,r,N2), shape(N2,t) .

shape(N,z):-node(N) .

node(N):-triple(N,_,_).
node(N):-triple(_,_,N).


% PREFIX ex: <http://ex.example/#>
% ex:a ex:q ex:z .
% ex:a ex:p ex:b .
% ex:a ex:p ex:c .
% ex:b ex:q ex:z .
% ex:c ex:q ex:z .
% ex:b ex:r ex:c .
% ex:c ex:r ex:b .

triple(a,q,z).
triple(a,p,b).
triple(a,p,c).
triple(b,q,z).
triple(c,q,z).
triple(b,r,c).
triple(c,r,b).

% Peter: Here ex:a matches <S>.
% Labra: In this example, with exclusive-or, the answer is UNSATISFIABLE 


#show shape/2 .