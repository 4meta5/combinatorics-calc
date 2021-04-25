# combinatorics-calc

combinatorics calculator

## usage

```prolog
?- qst(nk_perms,10,4,cat,R).
At a party 10 cats check their hat at the front door. If 4 cats receive their own hat, how many different ways can the hats be returned?
|: 10.
Incorrect!
R = 55650 .

?- qst(nk_perms,10,4,cat,R).
At a fancy dinner, 10 cats use the valet to park their cars. If only 4 of the cats receive their own key at the end of the dinner, how many ways can the car keys be returned?
|: 55650.
Correct!
R = 55650 .

?- qs(der,5,dog,R).
5 dogs are starting a game of musical chairs with 5 labelled chairs. How many different ways can the dogs sit down for the first time if every dog sits in a chair?
|: 55.
Incorrect!
R = 44 .

?- qs(der,5,dog,R).
How many different ways are there to place 5 dogs in 5 labelled boxes (each box holds one dog)?
|: 44.
Correct!
R = 44 .
```
