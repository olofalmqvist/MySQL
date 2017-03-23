drop database a15oloal;
create database a15oloal;
use a15oloal;

create table tavling(
	namn varchar(20),
    datum date,
    primary key(namn)
)engine=innodb;

create table domare(
	namn varchar(20),
    lon integer(5),
    personnummer char(11),
    primary key(personnummer)
)engine=innodb;

create table ansvara(
	namn varchar(20),
    personnummer char(11),
    primary key(personnummer, namn),
    foreign key(personnummer) references domare(personnummer),
    foreign key(namn) references tavling(namn)
)engine=innodb;

create table spelare(
	personnummer char(11),
    namn varchar(20),
    primary key(personnummer)
)engine=innodb;

create table speltillfalle(
	starttid varchar(10),
    resultat varchar(10),
    namn varchar(20),
    personnummer char(11),
    primary key(starttid, namn, personnummer),
    foreign key (namn) references tavling(namn),
    foreign key(personnummer) references spelare(personnummer)
)engine=innodb;

create table boll(
	signatur varchar(20),
    nummer integer,
    marke varchar(15),
    personnummer char(11),
    primary key(signatur),
    foreign key(personnummer) references spelare(personnummer)
)engine=innodb;

create table golfbag(
    marke varchar(15),
    personnummer char(11),
    typ varchar(12),
    primary key(marke, personnummer),
    foreign key(personnummer) references spelare(personnummer)
)engine=innodb;

create table caddy(
    personnummer char(11),
    favorit_tips varchar(30),
    namn varchar(20),
    marke varchar(15),
    primary key(personnummer),
    foreign key(marke) references golfbag(marke)
)engine=innodb;

create table klubba(
    namn varchar(20),
    kommentar varchar(40),
    marke varchar(15),
    personnummer char(11),
    primary key(namn, marke, personnummer),
    foreign key(marke) references golfbag(marke),
    foreign key(personnummer) references golfbag(personnummer)
)engine=innodb;

/* Uppgift 1 */
insert into tavling (namn, datum) values ('Sigges_Sommargolf','2016-07-10');

/* Uppgift 2 */
insert into domare (namn, lon, personnummer) values ('Simon', '12000', '790129-4444');
insert into domare (namn, lon, personnummer) values ('Sven', '12000', '810912-5555');
insert into domare (namn, lon, personnummer) values ('Eva', '12000', '790612-1212');

insert into ansvara (namn, personnummer) values ('Sigges_Sommargolf', '790129-4444');
insert into ansvara (namn, personnummer) values ('Sigges_Sommargolf', '810912-5555');
insert into ansvara (namn, personnummer) values ('Sigges_Sommargolf', '790612-1212');

/* Uppgift 3 */
insert into spelare (personnummer, namn) values ('560123-6666', 'Bosse');
insert into speltillfalle (starttid, namn, personnummer, resultat) values ('10:25', 'Sigges_Sommargolf', '560123-6666', '44');
insert into golfbag (marke, personnummer, typ) values ('titleist', '560123-6666', 'Helgbag');
insert into klubba (namn, personnummer, marke, kommentar) values ('Swinger', '560123-6666', 'titleist', 'Klubba att lita på');
insert into caddy (marke, personnummer, namn, favorit_tips) values ('titleist', '560123-6666', 'Johannes_Brost', 'Tarecool');

/* Uppgift 4 */
insert into spelare (namn, personnummer) values ('Gudinnan Nike', '730909-1111');
insert into golfbag (marke, personnummer, typ) values ('Nike', '730909-1111', 'Tour');

/* Uppgift 5 */
insert into klubba (namn, kommentar, personnummer, marke) values ('Driver', 'Spikrak och kort', '730909-1111', 'Nike');

/* Uppgift 6 */
insert into spelare (namn, personnummer) values ('Sune', '670808-2222');
insert into golfbag (marke, typ, personnummer) values ('Adidas', 'Svart', '670808-2222');
insert into caddy (namn, favorit_tips, personnummer, marke) values ('Anna', 'Knyt skorna hårdare', '890123-4214', 'Adidas');

/* Uppgift 7 */
insert into speltillfalle (starttid, resultat, namn, personnummer) values ('13:10', '72', 'Sigges_Sommargolf', '670808-2222');
insert into boll (signatur, marke, personnummer, nummer) values ('Hjärta', 'Titleist', '670808-2222', '583');

/* Uppgift 8 */
insert into spelare (namn, personnummer) values ('Olle', '900101-8888');
insert into golfbag (marke, personnummer, typ) values ('Lacoste', '900101-8888', 'Getskinn');
insert into caddy (namn, personnummer, favorit_tips, marke) values ('Petra', '910202-7777', 'Svinga lungt', 'Lacoste');
insert into klubba (namn, kommentar, personnummer, marke) values ('Driver', 'Längst och snedast på touren', '900101-8888', 'Lacoste');

/* Uppgift 9 */
insert into spelare (namn, personnummer) values ('Benny', '790101-4343');
insert into domare (namn, personnummer, lon) values ('Petrus', '770202-3333', '18990');
insert into ansvara (namn, personnummer) values ('Sigges_Sommargolf', '770202-3333');
insert into boll (signatur, marke, personnummer, nummer) values ('Treprickar', 'Zeitgeist', '790101-4343', '985');
insert into speltillfalle (namn, personnummer, resultat, starttid) values ('Sigges_Sommargolf', '790101-4343', 'Diskad', '08:00');

/* Uppgift 10 */
insert into spelare (namn, personnummer) values ('Stina', '950101-4141');
insert into golfbag (marke, personnummer, typ) values ('Nike', '950101-4141', 'Ormskinn');
insert into klubba (kommentar, marke, personnummer, namn) values ('Säkra Bettan', 'Nike', '950101-4141', 'Putt');
insert into speltillfalle (namn, personnummer, resultat, starttid) values ('Sigges_Sommargolf', '950101-4141', 'Diskad', '12:05');
insert into domare (namn, personnummer, lon) values ('Jens', '850102-7878', '18000');
insert into boll (signatur, marke, personnummer, nummer) values ('Extralångt', 'Nike', '950101-4141', '156');

/* Extrainserts */

insert into spelare (namn, personnummer) values ('Siegfried', '880101-8888');
insert into spelare (namn, personnummer) values ('Beowulf', '770101-7777');
insert into spelare (namn, personnummer) values ('Lancelot', '660101-6666');

insert into tavling (namn, datum) values ('Vikingatävlingen', '2016-07-15');
insert into tavling (namn, datum) values ('Riddarspelen', '2014-10-06');
insert into tavling (namn, datum) values ('Excaliburtävligen', '2012-09-10');

insert into speltillfalle (namn, personnummer, resultat, starttid) values ('Vikingatävlingen', '880101-8888', '150', '13:00');
insert into speltillfalle (namn, personnummer, resultat, starttid) values ('Riddarspelen', '770101-7777', '125', '15:00');
insert into speltillfalle (namn, personnummer, resultat, starttid) values ('Excaliburtävligen', '660101-6666', '55', '16:00');

insert into domare (namn, personnummer, lon) values ('Augustus', '550102-5589', '10500');
insert into domare (namn, personnummer, lon) values ('Julius', '400230-7810', '73500');
insert into domare (namn, personnummer, lon) values ('Nero', '731224-6532', '12453');

insert into ansvara (namn, personnummer) values ('Vikingatävlingen', '550102-5589');
insert into ansvara (namn, personnummer) values ('Riddarspelen', '400230-7810');
insert into ansvara (namn, personnummer) values ('Excaliburtävligen', '731224-6532');

insert into boll (signatur, marke, personnummer, nummer) values ('Vinnarbollen', 'CarlLagerfeldt', '880101-8888', '123456789');
insert into boll (signatur, marke, personnummer, nummer) values ('Apollobollen', 'AthenaSports', '770101-7777', '987654321');
insert into boll (signatur, marke, personnummer, nummer) values ('Zeusbollen', 'AthenaSports', '660101-6666', '13579');

insert into golfbag (marke, personnummer, typ) values ('CarlLagerfeldt', '880101-8888', 'Brun');
insert into golfbag (marke, personnummer, typ) values ('AthenaSports', '770101-7777', 'Guld');
insert into golfbag (marke, personnummer, typ) values ('AthenaSports', '660101-6666', 'Silver');

insert into klubba (namn, kommentar, marke, personnummer) values ('Putt', 'Vann tävlingen', 'CarlLagerfeldt', '880101-8888');
insert into klubba (namn, kommentar, marke, personnummer) values ('Slag', 'Hole in one', 'AthenaSports', '770101-7777');
insert into klubba (namn, kommentar, marke, personnummer) values ('Slag', 'Ok', 'AthenaSports', '660101-6666');

insert into caddy (personnummer, favorit_tips, marke, namn) values ('550123-4214', 'NEVER Give UP', 'CarlLagerfeldt', 'Olaus');
insert into caddy (personnummer, favorit_tips, marke, namn) values ('400901-5598', 'Se saken positivt', 'AthenaSports', 'Linn');
insert into caddy (personnummer, favorit_tips, marke, namn) values ('800420-5665', 'Kör bara!', 'AthenaSports', 'Tony');

/*  Frågeoperationer */

/*  Uppgift 1 
select namn from domare 
where personnummer = '790129-4444'; */

/* Uppgift 2 
select signatur from boll 
where personnummer = '560123-6666'; */


/*  Uppgift 3 
select typ from golfbag 
where personnummer = '560123-6666'; */

/* Uppgift 4 
select namn from spelare
where spelare.personnummer = (
	select boll.personnummer
	from boll
	where marke = 'Titleist'); */


/* Uppgift 5 
select resultat from speltillfalle
where speltillfalle.personnummer =
	(select spelare.personnummer from spelare
	where spelare.personnummer =
		(select boll.personnummer from boll
		where marke='Nike')); */
        
/* Uppgift 6 
insert into spelare (namn, personnummer) values ('Sune', '888888-7777');

CREATE VIEW dubblettnamn AS
SELECT namn, count(*)
FROM spelare
group by namn
having COUNT(*) > 1;

create view alla_namn AS
select namn, personnummer from spelare;

select personnummer, namn as 'Dublettnamn' from alla_namn 
where alla_namn.namn = (select dubblettnamn.namn from dubblettnamn); */

/* Uppgift 7 
select domare.personnummer from domare
where domare.personnummer not in (
	select ansvara.personnummer
    from ansvara) */
    
/* Uppgift 8   Inget svar ges eftersom det inte finns någon spelare med efterfrågat personnummer som fick 72 poäng i tävlingen Ryder Cup. 

select favorit_tips from caddy
where caddy.marke = (
	select golfbag.marke from golfbag
    where golfbag.personnummer = (
		select spelare.personnummer from spelare
        where spelare.personnummer = (
			select speltillfalle.personnummer from speltillfalle
            where speltillfalle.resultat = 72 and speltillfalle.namn = 'Ryder Cup' and speltillfalle.personnummer = '660808-5555'))); */
            
/* Uppgift 9 
select spelare.namn from spelare join speltillfalle
	on spelare.personnummer = speltillfalle.personnummer; */
    
/* Uppgift 10
insert into tavling (namn) value ('Supertävlingen');
insert into ansvara (namn, personnummer) values ('Supertävlingen', '550102-5589');

select domare.namn from domare
where domare.personnummer = (
select ansvara.personnummer
from ansvara
group by personnummer
having count(*) = 2); */
    
/* Uppgift 11 
select marke from golfbag
order by marke DESC; */

/* Uppgift 12 
select * from speltillfalle;
select AVG(resultat) from speltillfalle; */

/* Uppgift 13 
select AVG(resultat) from speltillfalle
where resultat group by namn; */

/* Uppgift 14 
select * from klubba 
where namn LIKE 'J%'; */

/* Uppgift 15 
insert into tavling (namn, datum) values ('Masters', '2016-01-23');
insert into spelare (namn, personnummer) values ('HermannBrant', '888888-5555');
insert into speltillfalle (starttid, resultat, namn, personnummer) values ('10:15', '14', 'Masters', '888888-5555');

insert into spelare (namn, personnummer) values ('GöstaVarg', '123456-4444');
insert into speltillfalle (starttid, resultat, namn, personnummer) values ('11:15', '11', 'Masters', '123456-4444');

select namn from spelare
where spelare.personnummer = 
	(select speltillfalle.personnummer from speltillfalle
    where resultat =  
		(select MAX(resultat) from speltillfalle
		where namn = 'Masters')); */
    
/*Uppgift 16  
select namn from spelare
where spelare.personnummer = ANY
	(select speltillfalle.personnummer from speltillfalle
	where resultat = 'Diskad'); */
    

/* Uppgift 17
select speltillfalle.namn from speltillfalle
where speltillfalle.namn = any (
select tavling.namn from tavling
where (datum between '2016-07-10' and '2016-07-17')); */


/* Uppgift 18
SET SQL_SAFE_UPDATES = 0;

update domare 
set lon = lon * 1.03
where lon >= 10000 and lon <= 12000; */


/* Uppgift 19 
insert into spelare (namn, personnummer) values ('Jesper', '440101-8989');
insert into golfbag (marke, typ, personnummer) values ('Decker', 'Snygg', '440101-8989');
insert into caddy (personnummer, favorit_tips, namn, marke) values ('990123-4214', 'Sluta stirra', 'OlausP', 'Decker');
insert into klubba (namn, kommentar, personnummer, marke) values ('Driver', 'Svag', '440101-8989', 'Decker');

delete from caddy
where favorit_tips = 'Sluta stirra'; */

/* Uppgift 20 
delete from golfbag  
where marke = 'titleist' and personnummer = '560123-6666'; */


			






