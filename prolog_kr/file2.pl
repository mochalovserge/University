% �����:
% ����: 29.08.2014
% (1 2 3 5) � (6 4 1 8 3)

goal:-except([1, 2, 3, 5], [6, 4, 1, 8, 3], Result), write(Result).

/*�������������� �������� � ���������*/
member(X,[X|_]).
member(X,[_|L]) :- member(X,L).

/*�������� �������� �� ��������� */
del(X,[X|L],L).
del(X,[Y|L],[Y|L1]) :- del(X,L,L1).

/*���������� ���� ��������� ������ ��������� �  ������ */
add([],L,L).
add([X|L1],L2,[X|L3]) :- add(L1,L2,L3).

/*�������� �� ������� ���������, ���� ��������� ������� ���������*/
except([],L,L).
except([X|L1],L2,Result):-member(X,L2),!,
                          del(X,L2,L),
                          except(L1,L,Result);
                          except(L1,L2,Result).

/* ����������� ���� �������� */
union(L1,L2):-add(L1,L2,Result),
              write('union='),write(Result),nl.

/*����������� ���� ��������*/
cross(L1,L2):-except(L1,L2,L3),
              except(L3,L2,Result),
              write('cross ='),write(Result).

/*��������� ��������*/
deduction(L1,L2):-except(L2,L1,Result),
                  write('deduction= '),write(Result),nl.

/*��������� ������������*/
cart([A|X1],[B|X],X2,[[A,B]|C]) :- !,cart([A|X1],X,X2,C).
cart([A|X1],[],X2,C):- !, cart(X1,X2,X2,C).
cart([],_,_,[]).
decart(L1,L2) :- cart(L1,L2,L2,Result),write('decart='),write(Result), nl.
