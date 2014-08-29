% �����:
% ����: 28.08.2014
:-dynamic �����/4.

goal:-��������,
      ��������_����.

��������:-consult('D:\\��������\\source\\University\\prolog_kr\\autors.txt'),
          told.
��������_����:-repeat,
               write('1. �������� ���� ������'), nl,
               write('2. ���������� ������'), nl,
               write('3. �������� ������'), nl,
               write('4. ������ � ���� ������ �� �������'), nl,
               write('0. �����'), nl, nl,
               write('������� �����: '),
               read(X),
               process(X),!.
               
process(0).
process(1):-��������_����_������.
process(2):-����������_������.
process(3):-�������_������.
process(4):-������_�_����.
process(_):-fail.

����������_������:-write('������������ ����'), nl,
                   repeat,
                   write('����� ������? y/n'), nl,
                   read(A),
                   �����(A),!,fail.

�����(n).
�����(y):-������_�_����,
          fail.
�����(_):-fail.

������_�_����:-write('�����: '),
               read(AuthorName),
               write('��������: '),
               read(BookName),
               write('������������:'),
               read(Producer),
               write('��� �������:'),
               read(Year),
               assertz(�����(AuthorName, BookName, Producer, Year)),
               ���������_����.

��������_����_������:-write('�������� ���� ������'), nl,
                      ����_������,
                      fail.

�������_������:-write('������� �� �����: '),
                read(AuthorName),
                �����(AuthorName, _, _, _),
                write(AuthorName), write(' - ������.'), nl, nl,
                retract(�����(AuthorName, _, _, _)),
                ���������_����,
                fail.

���������_����:-tell('D:\\��������\\source\\University\\prolog_kr\\autors.txt'),
                listing(�����/4),
                told.
                
������_�_����:-write('����� ����� �� �������:'), nl, nl,
               write('������� �������: '),
               read(X),
               write('������� ���: '),
               read(Y),
               �����_���(X, Y),
               fail.

����_������:-�����(AuthorName, BookName, Producer, Year),
             write('�������: '),
             write(Producer),
             write(' '),
             write('���: '),
             write(AuthorName),
             write(' '),
             write('�����: '),
             write(BookName),
             write(' '),
             write('���: '),
             writeln(Year).

�����_���(X, Y):-�����(AuthorName, BookName, Producer, Year),
                 Producer == X,
                 Year > Y,
                 write('�������: '),
                 write(X),
                 write(' '),
                 write('���: '),
                 write(AuthorName),
                 write(' '),
                 write('�����: '),
                 write(BookName),
                 write(' '),
                 write('���: '),
                 writeln(Year).
