DROP TABLE IF EXISTS boeken.writer;
DROP TABLE IF EXISTS boeken.book;
DROP TABLE IF EXISTS boeken.strip;
DROP TABLE IF EXISTS boeken.type;
DROP TABLE IF EXISTS boeken.boek_genre_specifications;
drop table if exists boeken.strip_genre_specifications;
DROP TABLE IF EXISTS boeken.genre;

DROP SCHEMA IF EXISTS boeken2;
CREATE SCHEMA boeken2;
USE boeken2;

create table boeken2.writer
(
writer_id int not null primary key,
autonymous_writer varchar(45) not null,
date_of_birth int,
name varchar(45) not null,
first_name varchar(45) not null,
country_of_origin varchar(45) not null,
amount_of_books int not null
);

create table boeken2.book
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
FOREIGN KEY (writer_id) REFERENCES boeken2.writer (writer_id)
);

create table boeken2.strip
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
FOREIGN KEY  (writer_id) REFERENCES boeken2.writer (writer_id)
);

create table boeken2.type
(
type_id int not null primary key,
book_id int not null,
nonfiction_fiction varchar(45) not null,
hardCover_softCover varchar(45),
FOREIGN KEY (book_id) REFERENCES boeken2.book (book_id)
);


create table boeken2.genre
(
genre_id int not null primary key,
actual_genre varchar(45) not null,
tweede_genre varchar(45),
derde_genre varchar(45)

);

create table boeken2.book_genre_specifications
(
specifications_id int not null primary key,
genre_id int not null,
book_id int not null,
FOREIGN KEY  (genre_id) REFERENCES boeken2.genre (genre_id),
FOREIGN KEY  (book_id) REFERENCES boeken2.book (book_id)
);

create table boeken2.strip_genre_specifications
(
specifications_id int not null primary key,
genre_id int not null,
strip_id int not null,
FOREIGN KEY  (genre_id) REFERENCES boeken2.genre (genre_id),
FOREIGN KEY  (strip_id) REFERENCES boeken2.strip (strip_id)
);

insert into boeken2.writer values(1, 'eigen naam', '1932', 'Eco', 'Umberto', 'Italië', 7);
insert into boeken2.writer values(2, 'Lucinda Riley', '1965', 'Edmonds', 'Lucinda', 'Verenigd koningrijk', 21);
insert into boeken2.writer values(3, 'eigen naam', '1990', 'Vandersteen', 'Willy', 'België', 463);
insert into boeken2.writer values(4, 'Merho', '1948', 'Merhottein', 'Robert', 'België', 161);


insert into boeken2.book values(1, 'De naam van de roos', 584, 10, 4, 19.99, false, 1);
insert into boeken2.book values(2, "De zeven zussen: Maia's verhaal", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(3, "Storm", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(4, "Schaduw", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(5, "Parel", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(6, "Maan", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(7, "Zon", 569, 25, 5, 12.99, true, 2);
insert into boeken2.book values(8, "De zevende zus", 569, 25, 5, 12.99, true, 2);

insert into boeken2.strip values(9, 'De kiekeboes','De come-back van dede', 46, 3, 3.5 , 9.5, true, 4);
insert into boeken2.strip values(10, 'De kiekeboes','Black-out', 46, 8, 4 , 9, true, 4);
insert into boeken2.strip values(11, 'Suske en Wiske','De mompelende mummie', 48, 9, 4.5 , 10, true, 3);
insert into boeken2.strip values(12, 'Suske en Wiske','Text en Terry', 48, 9, 4.5 , 10, true, 3);
insert into boeken2.strip values(13, 'Suske en Wiske','Prachtige pjotr', 48, 9, 4.5 , 10, true, 3);
insert into boeken2.strip values(14, 'De rode ridder','De gijzelaars', 32, 11, 4 , 8, true, 3);
insert into boeken2.strip values(15, 'De rode ridder','Het bronzen gevaar', 32, 11, 4 , 8, true, 3);
insert into boeken2.strip values(16, 'De rode ridder','De vesting', 32, 11, 4 , 8, true, 3);


insert into boeken2.genre values(1, 'historische literartuur', 'verfilmde boeken', 'romans');
insert into boeken2.genre values(2, 'romans', null , null);
insert into boeken2.genre values(3, 'stripverhalen', 'humor', null);
insert into boeken2.genre values(4, 'stripverhalen', 'avontuur', null);
insert into boeken2.genre values(5, 'stripverhalen', 'historische verhalen', null);


insert into boeken2.type values(1, 1,'fiction', 'hard cover');
insert into boeken2.type values(2, 2,'fiction', 'hard cover');
insert into boeken2.type values(3, 3,'fiction', 'hard cover');
insert into boeken2.type values(4, 4,'fiction', 'hard cover');
insert into boeken2.type values(5, 5,'fiction', 'hard cover');
insert into boeken2.type values(6, 6,'fiction', 'hard cover');
insert into boeken2.type values(7, 7,'fiction', 'hard cover');
insert into boeken2.type values(8, 8,'fiction', 'hard cover');


insert into boeken2.book_genre_specifications values(1, 1, 1);
insert into boeken2.book_genre_specifications values(2, 2, 2);
insert into boeken2.book_genre_specifications values(3, 2, 3);
insert into boeken2.book_genre_specifications values(4, 2, 4);
insert into boeken2.book_genre_specifications values(5, 2, 5);
insert into boeken2.book_genre_specifications values(6, 2, 6);
insert into boeken2.book_genre_specifications values(7, 2, 7);
insert into boeken2.book_genre_specifications values(8, 2, 8);


insert into boeken2.strip_genre_specifications values(1, 3, 9);
insert into boeken2.strip_genre_specifications values(2, 3, 10);
insert into boeken2.strip_genre_specifications values(3, 4, 11);
insert into boeken2.strip_genre_specifications values(4, 4, 12);
insert into boeken2.strip_genre_specifications values(5, 4, 13);
insert into boeken2.strip_genre_specifications values(6, 5, 14);
insert into boeken2.strip_genre_specifications values(7, 5, 15);
insert into boeken2.strip_genre_specifications values(8, 5, 16);