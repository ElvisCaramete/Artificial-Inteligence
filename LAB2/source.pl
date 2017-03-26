% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

% abs(X,Y) -> Y absolute value of X.

abs(X,Y) :-
    X>0,
    Y is X;
    Y is -X.

%  fibbonaci(N,F) -> F is the N fibbonaci number

fibbonaci(0,0) :-!.
fibbonaci(1,1) :-!.
fibbonaci(N,F) :-
   N1 is N-1,
   N2 is N-2,
   fibbonaci(N1,F1),
   fibbonaci(N2,F2),
   F is F1+F2.

% divisor(X,Y,D) _-> D is the biggest divisor of X and Y.

divisor(X,0,X).
divisor(X,Y,D) :-
    Y>0,
    Y2 is X mod Y,
    divisor(Y,Y2,D).
