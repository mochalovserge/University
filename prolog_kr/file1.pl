% �����:
% ����: 28.08.2014
:-dynamic �����/4.
goal:-show_menu.

show_menu:-repeat,
         write('1. ������� ���� ������'), nl,
         write('2. �������� ���� ������'), nl,
         write('3. ���������� ������'), nl,
         write('4. �������� ������'), nl,
         write('5. ������ � ���� ������ �� �������'), nl,
         write('6. �����'), nl, nl,
         write('������� �����: '),
         read(X),
         X < 6, process(X),
         X = 6,!.
         
process(6).
process(1):-�������_����_������.
process(2).
process(3):-������_�_����.
process(4).
process(5).

�������_����_������:-write('������������ ����'), nl,
                     repeat,
                     write('����� ������? y/n'), nl,
                     read(A),
                     �����(A),
                     tell('C:\autors.txt'),
                     listing(�����/3),
                     told.
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
               assertz(�����(AuthorName, BookName, Producer, Year)).
               
               
               