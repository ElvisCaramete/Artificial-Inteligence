% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

%P01 Find the last element of a list

my-last(E,L) :-
    L = [E].
my-last(E,L):-
    L = [_|X],
    my-last(E,X).

%P02 Find the last but one element of a list

last_but_one(E,L) :-
    L = [E,_].
last_but_one(E,L) :-
    L = [_,X|Y],
    last_but_one(E,[X|Y]).

%P03 Find the K`th element of a list

element_at(X,[X|_],1).
element_at(X,[_|L],K) :-
    K>1,
    K1 is K-1,
    element_at(X,L,K1).

%P04 Find the number of elements of a list

my_lenght([],0).
my_lenght([_|L],N) :-
    my_lenght(L,N1),
    N is N1 +1.

%PO5 Reverse a list

my_reverse(L1,L2) :-
    my_rev(L1,[],L2).

my_rev([],L2,L2) :-!.
my_rev([H|T],Acc,L2) :-
    my_rev(T,[H|Acc],L2).



