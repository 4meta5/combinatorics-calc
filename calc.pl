:- use_module(library(clpfd)).

/* Calculator Logic Flow
1. post problem
2. get user input
3. print answer
TODO: create command to ask random question
*/
ders([pder,msic]).
nats([hats,ckey]).
a2(der,X) :- ders(X).
a3(nk_perms,X) :- nats(X).
qs(Goal,N,X,R) :- 
    a2(Goal,Qs),
    random_permutation(Qs,[Q|_]),
    call(Q,N,X),call(Goal,N,R),read(Y),
    (Y = R -> write("Correct!");
        write("Incorrect!")).
qst(Goal,N,K,X,R) :- 
    a3(Goal,Qs),
    random_permutation(Qs,[Q|_]),
    call(Q,N,K,X),call(Goal,N,K,R),read(Y),
    (Y = R -> write("Correct!");
        write("Incorrect!")).
/*Derangement Number Questions*/
pder(N,X) :-
    write("How many different ways are there to place "),write(N),write(" "),write(X),
    write("s in "),write(N),write(" labelled boxes (each box holds one "),write(X),write(")?"),nl.
msic(N,X) :-
    write(N),write(" "),write(X),write("s are starting a game of musical chairs with "),
    write(N),write(" labelled chairs. "),write("How many different ways can the "),
    write(X),write("s sit down for the first time if every "),write(X),write(" sits in a chair?"),nl.
/*Number of N-Permutations with K Fixed Points*/
hats(N,K,X) :-
    write('At a party, '),write(N),write(' '),write(X),write('s check their hat at the front door. '),
    write('If '),write(K),write(' '),write(X),
    write('s receive their own hat, how many different ways can the hats be returned?'),nl.
ckey(N,K,X) :-
    write('At a fancy dinner, '),write(N),write(' '),write(X),write('s use the valet to park their cars. '),
    write('If only '),write(K),write(' of the '),write(X),
    write('s receive their own key at the end of the dinner, how many ways can the car keys be returned?'),nl.

/*Factorial Function*/
factorial(X,R) :- factorial(X,1,R).
factorial(X,R,R) :- X =< 1.
factorial(X,Y,R) :- 
    Y1 is Y*X,
    X1 is X-1,
    factorial(X1,Y1,R).
/*Binomial Coefficient, N choose R where order doesn't matter*/
binomial_co(N,R,Result) :-
    factorial(N,R1),
    factorial(N-R,R2),
    factorial(R,R3),
    Result is R1/(R2*R3).
/*Derangement Numbers*/
der(N,R) :-
    der(2,N,0,1,R).
der(X,N,R,_,R) :- X is N+1.
der(X,N,_,R,R) :- X=N.
der(X,N,D1,D2,R) :-
    X<N,
    X1 is X+1,
    D3 is (X * (D1 + D2)),
    der(X1,N,D2,D3,R).
/*Number of n-permutations such that exactly k integers are in their natural positions*/
nk_perms(N,K,R) :-
    K<N,
    binomial_co(N,K,R1),
    NK is N-K,
    der(NK,R2),
    R is R1*R2.
/*Pascal's Recurrence*/
pascal(X,X,1).
pascal(X,0,R) :-
    X>0 -> R is 0.
pascal(P,K,Result) :-
    K >= 1,
    P1 is P-1, P1 >= K,
    pascal(P1,K,R1),
    K1 is K-1,
    pascal(P1,K1,R2),
    Result is R1 + R2.
/*Second Stirling Numbers*/
second_stir(X,X,1).
second_stir(X,0,R) :-
    X>0 -> R is 0.
second_stir(P,K,Result) :-
    K >= 1,
    P1 is P-1, P1 >= K,
    second_stir(P1,K,R1),
    K1 is K-1,
    second_stir(P1,K1,R2),
    Result is ((K*R1) + R2).
/*First Stirling Numbers*/
first_stir(X,X,1).
first_stir(X,0,R) :-
    X>0 -> R is 0.
first_stir(P,K,Result) :-
    K >= 1,
    P1 is P-1, P1 >= K,
    first_stir(P1,K,R1),
    K1 is K-1,
    first_stir(P1,K1,R2),
    Result is ((P1*R1) + R2).

/*Calculate the number of nonnegative integral solutions to e_1 + ... + e_k = n*/
lin_num(N,K,R) :-
    K<N,Top is N+K-1,
    binomial_co(Top,N,R).


