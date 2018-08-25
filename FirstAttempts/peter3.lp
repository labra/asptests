% Peter's example:
% https://lists.w3.org/Archives/Public/public-data-shapes-wg/2015Mar/0187.html

% There are multiple simple examples that show the problems.  Consider
%  <Sh1> { !:p1 @<Sh1> }
% with the graph
%   ex:a :p1 ex:b .

% What belongs to <Sh1>?  There are two different possibilities.  Either ex:a
% belongs to <Sh1> or ex:b belongs to <Sh1>.  However, they both can't belong
% to <Sh1> and similarly they can't both not belong to <Sh1>, at least not
% without violating the intuitive meaning of <Sh1>.

% Now you could pop up a level and say that all this means that neither ex:a
% nor ex:b belongs to <Sh1> because there are setups where ex:a does not
% belong to <Sh1> and there are setups where ex:b does not belong to <Sh1>.
% So far, so good, but note that there is a reasoning-by-cases being done
% here, which can be very computationally expensive.

shape(N,sh1):-triple(N,p1,Y), not shape(Y,sh1).

:-shape(N,sh1), triple(N,p1,Y), not not shape(Y,sh1).

triple(a,p1,b).

% By default, it infers shape(a,sh1) asuming that b doesn't have shape sh1

% if we add shape(b,sh1), then it infers that shape(a,sh1) is false
shape(b,sh1) .

% if we add shape(a,sh1), the program is unsatisfiable
shape(a,sh1) .


#show shape/2 .

