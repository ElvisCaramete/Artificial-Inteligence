%Homework #1

father(f1,c11).
father(f2,c2).
father(f1,c12).
father(f12,c3).
father(c12,c5).
father(c3,c4).

child(X,Y) :- father(Y,X).
brother(X,Y) :- father(Z,X),father(Z,Y),X\=Y.
nephew(X,Y) :- child(X,Z),brother(Y,Z).
grandchild(X,Y) :- child(X,Z),child(Z,Y).
predecesor(X,Y):- father(X,Y).
predecesor(X,Y) :- father(Z,Y),predecesor(X,Z).

%Homework #2

class('Vehicle').
class('EnginePoweredVehicle').
class('HumanPoweredVehicle').
class('Car').
class('Bus').
class('Bicycle').

inherits('EnginePoweredVehicle','Vehicle').
inherits('HumanPoweredVehicle','Vehicle').
inherits('Car','EnginePoweredVehicle').
inherits('Bus','EnginePoweredVehicle').
inherits('Bicycle','HumanPoweredVehicle').

memberVariable('numberOfSeats',protected,int,'Vehicle').
memberVariable('engineCapacity',public,int,'EnginePoweredVehicle').
memberVariable('fuelConsumption',protected,float,'EnginePoweredVehicle').
memberVariable('nameOfOwner',private,'java.lang.String','Car').
memberVariable('nameOfOwnerCompany',private,'java.lang.String','Bus').
memberVariable('numberOfGears',public,int,'Bicycle').

brotherClass(X,Y) :- inherits(X,Z),inherits(Y,Z),X\=Y.
ancestor(X,Y) :- inherits(X,Y).
ancestor(X,Y) :- inherits(X,Z),ancestor(Z,Y).
descendant(X,Y) :- inherits(Y,X).
descendant(X,Y) :- inherits(Y,Z),descendant(X,Z).
containsPublicMemberVariables(X) :- memberVariable(_,public,_,X).

%Homework #3

% movie(M,Y) <- movie M came out in year Y movie(the_usual_suspects, 1995).
movie(american_beauty, 1999).
movie(down_from_the_mountain, 2000).
movie(girl_with_a_pearl_earring, 2003).
movie(barton_fink, 1991).
movie(crimewave, 1985).
movie(lick_the_star, 1998).
movie(the_horse_whisperer, 1998).
movie(blade_runner, 1997).

% director(M,D) <- movie M was directed by director D director(american_beauty, sam_mendes).
director(girl_with_a_pearl_earring, peter_webber).
director(barton_fink, joel_coen).
director(crimewave, sam_raimi).
director(lick_the_stars, sofia_coppola).
director(blade_runner, joseph_d_kucan).

% actor(M,A,R) <- actor A played role R in movie M actor(american_beauty, kevin_spacey, lester_burnham).
actor(american_beauty, wes_bentley, ricky_fitts).
actor(american_beauty, chris_cooper, col_frank_fitts_usmc).
actor(the_usual_suspects, kevin_spacey, roger_verbal_kint).
actor(crimewave, joel_coen, reporter_at_execution).
actor(the_horse_whisperer, chris_cooper, frank_booker).
actor(blade_runner, joseph_d_kucan, crazylegs_larry).

% actress(M,A,R) <- actress A played role R in movie M actress(american_beauty, annette_bening, carolyn_burnham).
actress(american_beauty, thora_birch, jane_burnham).
actress(american_beauty, mena_suvari, angela_hayes).
actress(girl_with_a_pearl_earring, scarlett_johansson, griet).
actress(lick_the_stars, sofia_coppola, onet).

%In which year was the movie American Movie released ?
%movie(american_beauty,X).

%Find movie that was released in the year 2000 !
%movie(X,2000).

%Find a movie that was released before 2000 !
%movie(X,Y), Y<2000.

%Find the name of the year of a movie !
%movie(X,Y).

%Find an actor who appear in more then one movie !

actorMoreThenOnce(X) :-
    actor(M,X,_),
    actor(N,X,_),
    M\=N;
    actress(V,X,_),
    actress(B,X,_),
    V\=B.

% Find the director who has directed a movie in which the actress
% Scarlett Johansson appeared !

movieScarlett(X) :-
    director(M,X),
    actress(M,scarlett_johansson,_).

%Find an actor who also directed a movie !

actorDirectedMovie(X) :-
    director(M,X),
    actor(M,X,_).

%Find an actor or actress who has also directed a movie !

actorOrActressDirectedMovie(X):-
    director(M,X),
    actor(M,X,_);
    director(M1,X),
    actress(M1,X,_).

%Write a definition in Prolog for each of the following predicates !
%released_since(M,Y) <- movie M was released after year Y

released_since(M,Y) :-
    movie(M,X),
    X>Y.

%same_year_as(M1,M2) <- M1 realeased same year as M2

same_year_as(M1,M2) :-
    movie(M1,X),
    movie(M2,X),
    M1\=M2.

%newer(M1,M2) <- M1 released after M2

newer(M1,M2) :-
    movie(M1,X),
    movie(M2,Y),
    X<Y,
    M1\=M2.

%cast_member(A,M) <- person A an actor or actress of movie M

cast_member(A,M) :-
    actor(M,A,_);
    actress(M,A,_).











