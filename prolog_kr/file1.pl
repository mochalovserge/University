% Автор:
% Дата: 28.08.2014
:-dynamic автор/4.
goal:-show_menu.

show_menu:-repeat,
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
process(2).
process(3):-запись_в_базу.
process(4).
process(5).

создать_базу_данных:-write('формирование базы'), nl,
                     repeat,
                     write('новая запись? y/n'), nl,
                     read(A),
                     ответ(A),
                     tell('C:\autors.txt'),
                     listing(автор/3),
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
               
               
               