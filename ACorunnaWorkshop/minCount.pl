arc(":S1","a","sh:NodeShape").
arc(":S1","sh:property","_:b1").
arc("_:b1","sh:path",":p").
arc("_:b1","sh:minCount",1).
arc("_:b1","sh:maxCount",1).

arc(":x",":p","1") .
arc(":y",":p","1") .
arc(":y",":p","2") .
arc(":z",":q","0") .

arc(":S1","sh:targetNode",":x").
arc(":S1","sh:targetNode",":y").
arc(":S1","sh:targetNode",":z").

isShape(S) :- shape(S,_) .

% shape/2 identifies shapes and their components
shape(S, C) :- 
  arc(S, "a", "sh:NodeShape"), 
  arc(S, "sh:property", C) .
  
path(P,S,C) :- 
  shape(S,C), 
  arc(C,"sh:path",P) .  
  
hasMinCount(C) :- arc(C,"sh:minCount", _) .
hasMaxCount(C) :- arc(C,"sh:maxCount", _) .

cardinalityConstraint(C,S,0,MAX) :- 
 shape(S, C), arc(C,"sh:maxCount",MAX), not hasMinCount(C) .
cardinalityConstraint(C,S,MIN,-1) :- 
 shape(S, C), arc(C,"sh:minCount",MIN), not hasMaxCount(C) .
cardinalityConstraint(C,S,MIN,MAX) :- 
 shape(S, C), 
 arc(C,"sh:minCount",MIN),  
 arc(C,"sh:maxCount",MAX) .

  
minCountError(N,P,COUNT,S) :- 
  arc(S,"sh:targetNode",N), shape(S, C), path(P,S,C), 
  cardinalityConstraint(C,S,MIN,MAX), 
  #count { VAL : arc(N,P,VAL) } = COUNT, COUNT < MIN .
maxCountError(N,P,COUNT,S) :- 
  arc(S,"sh:targetNode",N), shape(S, C), path(P,S,C), 
  cardinalityConstraint(C,S,MIN,MAX), 
  #count { VAL : arc(N,P,VAL) } = COUNT, COUNT > MAX, 
  hasMaxCount(C) .

error(N,P,V,minCount,S) :- minCountError(N,P,V,S) .
error(N,P,V,maxCount,S) :- maxCountError(N,P,V,S) .
-hasShape(N,S) :- isShape(S), node(N), error(N,_,_,_,S) .
hasShape(N,S) :- isShape(S), node(N), not -hasShape(N,S).

node(":x";":y",":z").

#show hasShape/2 .
#show error/5 .  
