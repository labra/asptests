#show hasShape/2 .
#show -hasShape/2 .

hasShape(N,true) :- node(N).
-hasShape(N,false) :- node(N).

hasShape(N,and(S1,S2)) :- node(N), shape(and(S1,S2)), 
  hasShape(N,S1), hasShape(N,S2).
-hasShape(N,and(S1,S2)):- node(N), shape(and(S1,S2)),
  not hasShape(N,S1) .  
-hasShape(N,and(S1,S2)):- node(N), shape(and(S1,S2)),
  not hasShape(N,S2) .    
hasShape(N,ref(S)) :- node(N), schema(S,V), 
  hasShape(N,V).
  
node(alice).  
shape(true).
shape(ref(t)).
shape(and(ref(t),ref(t))).
schema(user,and(ref(t),ref(t))).
schema(t,true).
schema(t,false).