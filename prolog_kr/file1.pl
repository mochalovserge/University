% Автор:
% Дата: 28.08.2014
:-dynamic автор/4.

goal:-загрузка,
      показать_меню.

загрузка:-consult('C:\\Users\\serge\\Институт\\source\\University\\prolog_kr\\autors.txt'),
          told.
показать_меню:-repeat,
               write('1. просмотр базы данных'), nl,
               write('2. добавление записи'), nl,
               write('3. удаление записи'), nl,
               write('4. запрос к базе данных по заданию'), nl,
               write('0. выход'), nl, nl,
               write('введите номер: '),
               read(X),
               process(X),!.
               
process(0).
process(1):-просмотр_базы_данных.
process(2):-добавление_записи.
process(3):-удалить_запись.
process(4):-запрос_к_базе.
process(_):-fail.

добавление_записи:-write('формирование базы'), nl,
                   repeat,
                   write('новая запись? y/n'), nl,
                   read(A),
                   ответ(A),!,fail.

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
               assertz(автор(AuthorName, BookName, Producer, Year)),
               сохранить_файл.

просмотр_базы_данных:-write('Просмотр базы данных'), nl,
                      listing(автор/4),
                      fail.

удалить_запись:-write('Удалить по имени: '),
                read(AuthorName),
                автор(AuthorName, _, _, _),
                write(AuthorName), write(' - удален.'), nl, nl,
                retract(автор(AuthorName, _, _, _)),
                сохранить_файл,
                fail.

сохранить_файл:-tell('C:\\Users\\serge\\Институт\\source\\University\\prolog_kr\\autors.txt'),
                listing(автор/4),
                told.