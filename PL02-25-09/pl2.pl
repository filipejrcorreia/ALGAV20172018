aminhalista([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 , 11, 12 ]).

%a)
contar([],0).
contar([_|T],C):-
    contar(T,C1),
    C is C1+1.

somar([],0).
somar([H|T], S):-
    somar(T,S1),
    S is S1+H.

media(L,M):-
    contar(L,C),
    somar(L,S),
    M is S/C.

%b)

menor([X | R], M):-
    menor(R, X, M).

menor([], X, X).

menor([Y | R], X, M):-
    X<Y, !,
    menor(R, X, M).

menor([Y | R], _, M):-
    menor(R, Y, M).


%c)

contarPares([],0):-!.

contarPares([H|T],C):-
    0 is H mod 2,
    contarPares(T,C1),
    C is C1 + 1.

contarPares([_|T],C):-
    contarPares(T,C).

contarImpares([], 0):-!.

contarImpares([H|T],C):-
    1 is H mod 2,
    contarImpares(T,C1),
    C is C1+1.

contarImpares([_|T],C):-
    contarImpares(T,C).

%d)

membro(X, [X | _]).

membro(X, [_ | T]):-
    membro(X, T).

nao_tem_repetidos([]).

nao_tem_repetidos([H | T]):-
    not(membro(H, T)),
    nao_tem_repetidos(T).

tem_repetidos([H | T]):-
    not(nao_tem_repetidos([H | T])).

%e)

novoMenor(L1,[M|L3]) :-
    menor(L1, M),
    delete(M,L1,L3).

%f)

concatena([], L, L).

concatena([H | T], L, [H | LR]):-
    concatena(T, L, LR).

%g)

flatten2([],[]):- !.
flatten2([H|T],FL):-
    !,
    flatten2(H,NL),
    flatten2(T,NLs),
    concatena(NL,NLs,FL).
flatten2(L,[L]).

%h)

deleteOne(_, [], []).

deleteOne(X, [X | R], R):-
    !.

deleteOne(X, [Y | R], [Y | R1]):-
    deleteOne(X, R, R1).

%i)

deleteAll(_,[],[]).

deleteAll(X, [X|R], R1):-!,
    deleteAll(X,R,R1).

deleteAll(X, [Y|R], [Y|R1]):-
    deleteAll(X, R, R1).

%j)

replace(_, _, [], []).

replace(X, Y, [X | R], [Y | R1]):-
    replace(X, Y, R, R1).

replace(X, Y, [Z | R], [Z | R1]):-
    replace(X, Y, R, R1).

%l)

inverte(L, LI):-
    inverte2(L, [], LI).

inverte2([], L, L).

inverte2([H | T], LA, LR):-
    inverte2(T, [H | LA], LR).

%n)

intersecao([], _, []).

intersecao([X | R1], R2, [X | R]):-
    membro(X, R2), !,
    intersecao(R1, R2, R).

intersecao([_ | R1], R2, R):-
    intersecao(R1, R2, R).













