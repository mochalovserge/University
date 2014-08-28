% Автор:
% Дата: 28.08.2014
:-dynamic автор/4.
goal:-загрузить_базу_данных,
      показать_меню.

показать_меню:-repeat,
         write('1. создать базу данных'), nl,
         write('2. просмотр базы данных'), nl,
         write('3. добавление записи'), nl,
         write('4. удаление записи'), nl,
         write('5. запрос к базе данных по заданию'), nl,
         write('6. выход'), nl, nl,
         write('введите номер: '),
         read(X),
         X < 6, process(X),
         X = 6,!.
         
process(6).
process(1):-создать_базу_данных.
process(2):-просмотр_базы_данных.
process(3):-запись_в_базу.
process(4):-удалить_запись_из_базы.
process(5).

создать_базу_данных:-write('формирование базы'), nl,
                     repeat,
                     write('новая запись? y/n'), nl,
                     read(A),
                     ответ(A),
                     tell('D:\\Институт\\source\\University\\prolog_kr\\autors.txt'),
                     listing(автор/4),
                     told.
ответ(n).
ответ(y):-запись_в_базу,
          fail.
ответ(_):-fail.

запись_в_базу:-write('автор: '),
               read(AuthorName),
               write('название: '),
               read(BookName),
               write('издательство:'),
               read(Producer),
               write('год издания:'),
               read(Year),
               assertz(автор(AuthorName, BookName, Producer, Year)).

загрузить_базу_данных:-consult('D:\\Институт\\source\\University\\prolog_kr\\autors.txt'),
                       told.

просмотр_базы_данных:-write('Просмотр базы данных'), nl,
                      listing(автор/4).

удалить_запись_из_базы:-write('Удалить по имени: '),
                        read(AuthorName),
                        автор(AuthorName, _, _, _),
                        write(AuthorName), write(' - удален.'), nl,
                        retract(автор(AuthorName, _, _, _)),
                        fail.

сохранить_базу_данных:-tell('D:\\Институт\\source\\University\\prolog_kr\\autors.txt'),
                       listing(автор/4),
                       told.

