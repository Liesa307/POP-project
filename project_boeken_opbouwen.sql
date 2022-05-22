DROP TABLE IF EXISTS boeken.writer;
DROP TABLE IF EXISTS boeken.book;
DROP TABLE IF EXISTS boeken.strip;
DROP TABLE IF EXISTS boeken.type;
DROP TABLE IF EXISTS boeken.boek_genre_specifications;
drop table if exists boeken.strip_genre_specifications;
DROP TABLE IF EXISTS boeken.genre;

DROP SCHEMA IF EXISTS boeken;
CREATE SCHEMA boeken;
USE boeken;

create table boeken.writer
(
writer_id int not null primary key,
autonymous_writer varchar(45) not null,
date_of_birth int,
name varchar(45) not null,
first_name varchar(45) not null,
country_of_origin varchar(45) not null,
amount_of_books int not null
);

create table boeken.book
(
book_id int not null primary key,
title_book varchar(45) not null,
size_book int not null,
aantal_revieuws_book int,
aantal_sterren_book float,
prijs_book decimal(7,2)
CHECK(prijs_book > 0),
serie_book boolean,
writer_id int not null,
FOREIGN KEY (writer_id) REFERENCES boeken.writer (writer_id)
);

create table boeken.strip
(
strip_id int not null primary key,
reeks_strip varchar(45) not null,
title_strip varchar(45) not null,
size_strip int not null,
aantal_revieuws_strip int,
aantal_strerren_strip float,
prijs_strip decimal,
serie_strip boolean, 
writer_id int not null,
FOREIGN KEY  (writer_id) REFERENCES boeken.writer (writer_id)
);

create table boeken.type
(
type_id int not null primary key,
book_id int not null,
nonfiction_fiction varchar(45) not null,
hardCover_softCover varchar(45),
FOREIGN KEY (book_id) REFERENCES boeken.book (book_id)
);


create table boeken.genre
(
genre_id int not null primary key,
actual_genre varchar(45) not null,
tweede_genre varchar(45),
derde_genre varchar(45)

);

create table boeken.book_genre_specifications
(
specifications_id int not null primary key,
genre_id int not null,
book_id int not null,
FOREIGN KEY  (genre_id) REFERENCES boeken.genre (genre_id),
FOREIGN KEY  (book_id) REFERENCES boeken.book (book_id)
);

create table boeken.strip_genre_specifications
(
specifications_id int not null primary key,
genre_id int not null,
strip_id int not null,
FOREIGN KEY  (genre_id) REFERENCES boeken.genre (genre_id),
FOREIGN KEY  (strip_id) REFERENCES boeken.strip (strip_id)
);

insert into boeken.writer values(1, 'Geronimo Stilton', '1958', 'Dami', 'Elisabetta', 'Italië', 517);
insert into boeken.writer values(2, 'Adam Blade', null, 'schrijversgroep', 'schrijversgroep', 'Engeland', 165);
insert into boeken.writer values(3, 'Moony Witcher', '1957', 'Rizzo', 'Roberta', 'Italië', 16);
insert into boeken.writer values(4, 'eigen naam', '1931', 'Terlouw', 'Jan', 'Nederland', 20);
insert into boeken.writer values(5, 'eigen naam', '1963', 'Jetten', 'Gertrud', 'België', 30);
insert into boeken.writer values(6, 'eigen naam', null, 'Schöning', 'Barbara', 'Duitsland', 2);
insert into boeken.writer values(7, 'eigen naam', null, 'schrijversgroep', 'schrijversgroep', 'België', 64);
insert into boeken.writer values(8, 'Annie M.G. Smidt', '1911', 'Smidt', 'Anna', 'Nederland', 135);
insert into boeken.writer values(9, 'eigen naam', '1957', 'Van Genechten', 'Guido', 'België', 170);
insert into boeken.writer values(10, 'eigen naam', '1990', 'Vandersteen', 'Willy', 'België', 463);
insert into boeken.writer values(11, 'eigen naam', '1924', 'Franquin', 'André', 'België', 112);
insert into boeken.writer values(12, 'Merho', '1948', 'Merhottein', 'Robert', 'België', 161);
insert into boeken.writer values(13, 'eigen naam', '1927', 'Nys', 'Jef', 'België', 308);
insert into boeken.writer values(14, 'Hergé', '1907', 'Remi', 'Georges', 'België', 24);
insert into boeken.writer values(15, 'eigen naam', '1950', 'Leemans', 'Hec', 'België', 214);

insert into boeken.book values(1, 'Mijn naam is Stilton, Geronimo-Stilton', 111, 20, 4.5, 12.95, true, 1);
insert into boeken.book values(2, 'Piraten van de zilveren kattenklauw', 118, 2, 4, 16.95, true, 1);
insert into boeken.book values(3, 'Vlinders in je buik', 116, 7, 4.5, 8.99, true, 1);
insert into boeken.book values(4, 'Heidi', 212, 1, 5, 12.99, true, 1);
insert into boeken.book values(5, 'Fantasia', 283, 20, 4.5, 26.99, true, 1);
insert into boeken.book values(6, 'Mijn naam is Stilton, Geronimo Stilton', 110, 20, 4.5, 12.95, true, 1);
insert into boeken.book values(7, 'Monsterjacht', 440, 2, 4, 22.95, true, 2);
insert into boeken.book values(8, 'De eerste ruiter', 157, 2, 5, 9.90, true, 2);
insert into boeken.book values(9, 'Morga - De tovenares van de wind', 417, null, null, 10.50, true, 3);
insert into boeken.book values(10, 'oorlogswinter', 169, 97, 4.5, 14.99, false, 4);
insert into boeken.book values(11, 'Echte paardenliefde', 111, 2, 4, 28.63, true, 5);
insert into boeken.book values(12, 'Paarden beter begrijpen en opvoeden', 192, 3, 5, 24.99, false, 6);
insert into boeken.book values(13, 'Tiny en de lieve pony', 21, null, null, 12.46, true, 7);
insert into boeken.book values(14, 'Pluk van de petteflet', 167, 220, 4.8, 20.80, false, 8);
insert into boeken.book values(15, 'Rikki',28 ,7 ,5, 16.95, true, 9);

insert into boeken.strip values(16, 'Geronimo Stilton','Het geheim van de sfinx', 48, 4, 5 , 11.5, true, 1);
insert into boeken.strip values(17, 'Geronimo Stilton', 'De ontdekking van Amerika', 48, 8, 3.5, 13.0, true, 1);
insert into boeken.strip values(18, 'Geronimo Stilton', 'Wie heeft de Mona Lisa gestolen?',48, 2, 5, 11.5, true, 1 );
insert into boeken.strip values(19, 'Suske en Wiske', 'De fluitende olifant', 48, 10, 4.7, 7.3, true, 10);
insert into boeken.strip values(20, 'Suske en Wiske','De breinbrekers', 48, null, null, 20.99, true, 10);
insert into boeken.strip values(21,'Suske en Wiske' ,'De nacht van Narwal', 48, 18, 4.8, 7.25, true, 10);
insert into boeken.strip values(22,'Suske en Wiske' ,'De bonte Bollen', 48, null, null, 7.25, true, 10);
insert into boeken.strip values(23, 'Guust Flater','Flaters verjaardag', 56, 2, 4.5, 8.50, true, 11);
insert into boeken.strip values(24, 'De kiekeboes','Patiënt zero', 48, 7, 4.4, 7.25, true, 12);
insert into boeken.strip values(25,'Jommeke' ,'Het verpeste kamp', 48, 1, 5, 7.25, true, 13);
insert into boeken.strip values(26, 'Kuifje','De sigaren van de Farao', 48, 8, 4.8, 8.50, true, 14);
insert into boeken.strip values(27, 'De rode ridder', 'de duivespenning', 32, 1, 4, 6.99, true, 10);
insert into boeken.strip values(28, 'De rode ridder', 'biddeloo jaren 8', 232, null, null, 34.99, true, 10);
insert into boeken.strip values(29, 'De rode ridder', 'heksenjager', 32, null, null, 6.99, true, 10);
insert into boeken.strip values(30, 'F.C. De kampioenen','de bal is rond', 23, 2, 4.5, 6.99, true, 15);

insert into boeken.genre values(1, 'jeugd & kinderboeken', 'autobiografie', 'avontuurroman');
insert into boeken.genre values(2, 'fantasy', 'jeugd & kinderboeken', null);
insert into boeken.genre values(3, 'oorlogsverhalen', 'verfilmde boeken', null);
insert into boeken.genre values(4, 'paardenverhalen', null, null);
insert into boeken.genre values(5, 'paarden', 'informatief', null);
insert into boeken.genre values(6, 'prentenboeken', null, null);
insert into boeken.genre values(7, 'voorleesverhalen', 'verfilmde boeken', null);
insert into boeken.genre values(8, 'prentenboeken', null, null);
insert into boeken.genre values(9, 'avontuur', 'amusement', 'stripverhalen');
insert into boeken.genre values(10, 'stripverhalen', 'humor', null);
insert into boeken.genre values(11, 'stripverhalen', 'avontuur', null);
insert into boeken.genre values(12, 'stripverhalen', 'detectives', 'verfilmde boeken');
insert into boeken.genre values(13, 'stripverhalen', 'historische verhalen', null);


insert into boeken.type values(1, 1,'fiction', 'hard cover');
insert into boeken.type values(2, 2, 'fiction', 'hard cover');
insert into boeken.type values(3, 3, 'fiction', 'hard cover');
insert into boeken.type values(4, 4, 'fiction', 'hard cover');
insert into boeken.type values(5, 5, 'fiction', 'hard cover');
insert into boeken.type values(6, 6,'fiction', 'hard cover');
insert into boeken.type values(7, 7, 'fiction', 'hard cover');
insert into boeken.type values(8, 8, 'fiction', 'hard cover');
insert into boeken.type values(9, 9, 'fiction', 'hard cover');
insert into boeken.type values(10,10, 'non-fiction', 'soft cover');
insert into boeken.type values(11, 11, 'fiction', 'hard cover');
insert into boeken.type values(12, 12, 'non-fiction', 'hard cover');
insert into boeken.type values(13, 13, 'fiction', 'hard cover');
insert into boeken.type values(14, 14, 'fiction', 'hard cover');
insert into boeken.type values(15, 15, 'fiction', 'hard cover');

insert into boeken.book_genre_specifications values(1, 1, 1);
insert into boeken.book_genre_specifications values(2, 1, 2);
insert into boeken.book_genre_specifications values(3, 1, 3);
insert into boeken.book_genre_specifications values(4, 1, 4);
insert into boeken.book_genre_specifications values(5, 1, 5);
insert into boeken.book_genre_specifications values(6, 1, 6);
insert into boeken.book_genre_specifications values(7, 2, 7);
insert into boeken.book_genre_specifications values(8, 2, 8);
insert into boeken.book_genre_specifications values(9, 2, 9);
insert into boeken.book_genre_specifications values(10, 3, 10);
insert into boeken.book_genre_specifications values(11, 4, 11);
insert into boeken.book_genre_specifications values(12, 5, 12);
insert into boeken.book_genre_specifications values(13, 6, 13);
insert into boeken.book_genre_specifications values(14, 7, 14);
insert into boeken.book_genre_specifications values(15, 8, 15);


insert into boeken.strip_genre_specifications values(1, 1, 16);
insert into boeken.strip_genre_specifications values(2, 1, 17);
insert into boeken.strip_genre_specifications values(3, 1, 18);
insert into boeken.strip_genre_specifications values(4, 9, 19);
insert into boeken.strip_genre_specifications values(5, 9, 20);
insert into boeken.strip_genre_specifications values(6, 9, 21);
insert into boeken.strip_genre_specifications values(7, 9, 22);
insert into boeken.strip_genre_specifications values(8, 10, 23);
insert into boeken.strip_genre_specifications values(9, 11, 24);
insert into boeken.strip_genre_specifications values(10, 10, 25);
insert into boeken.strip_genre_specifications values(11, 12, 26);
insert into boeken.strip_genre_specifications values(12, 13, 27);
insert into boeken.strip_genre_specifications values(13, 13, 28);
insert into boeken.strip_genre_specifications values(14, 13, 29);
insert into boeken.strip_genre_specifications values(15, 10, 30);

