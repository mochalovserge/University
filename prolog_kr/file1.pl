% �����:
% ����: 28.08.2014
:-dynamic �����/4.
goal:-���������_����_������,
      ��������_����.

��������_����:-repeat,
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
process(2):-��������_����_������.
process(3):-������_�_����.
process(4):-�������_������_��_����.
process(5).

�������_����_������:-write('������������ ����'), nl,
                     repeat,
                     write('����� ������? y/n'), nl,
                     read(A),
                     �����(A),
                     tell('D:\\��������\\source\\University\\prolog_kr\\autors.txt'),
                     listing(�����/4),
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

���������_����_������:-consult('D:\\��������\\source\\University\\prolog_kr\\autors.txt'),
                       told.

��������_����_������:-write('�������� ���� ������'), nl,
                      listing(�����/4).

�������_������_��_����:-write('������� �� �����: '),
                        read(AuthorName),
                        �����(AuthorName, _, _, _),
                        write(AuthorName), write(' - ������.'), nl,
                        retract(�����(AuthorName, _, _, _)),
                        fail.

���������_����_������:-tell('D:\\��������\\source\\University\\prolog_kr\\autors.txt'),
                       listing(�����/4),
                       told.

