create
    definer = cinema_admin@air procedure dodaj_aktora(IN imie varchar(45), IN nazwisko varchar(45),
                                                      IN id_kraj tinyint unsigned, IN rok_urodzenia year,
                                                      IN plec tinyint unsigned, IN opis varchar(300),
                                                      IN pseudonim varchar(50))
BEGIN
    insert into aktor (`Imie`,
                         `Nazwisko`,
                         `Kraj_id`,
                         `Rok urodzenia`,
                         `Plec`,
                         `Opis`,
                         `Pseudonim`)
                         values (imie,
                                 nazwisko,
                                 id_kraj,
                                 rok_urodzenia,
                                 plec,
                                 opis,
                                 pseudonim);
END;

create
    definer = cinema_admin@air procedure dodaj_film(IN tytul varchar(100), IN rok_produkcji year,
                                                    IN czas_trwania tinyint unsigned, IN opis_krotki varchar(1000),
                                                    IN opis_dlugi varchar(2000), IN grupa_wiekowa tinyint unsigned)
BEGIN
    INSERT INTO film (`Tytul`,
					`Rok produkcji`, 
                    `Czas trwania`, 
                    `Opis krotki`, 
                    `Opis dlugi`, 
                    `Grupa_Wiekowa`) 
			VALUES (tytul,
					rok_produkcji,
					czas_trwania, 
					opis_krotki, 
					opis_dlugi, 
					grupa_wiekowa);
END;

create
    definer = cinema_admin@air procedure dodaj_film_aktor(IN film_nazwa varchar(200), IN aktor_imie varchar(45),
                                                          IN aktor_nazwisko varchar(45), IN rok_urodzenia year,
                                                          IN rola varchar(200), IN postac varchar(40))
BEGIN
set @aktorid = 0;
set @filmid = 0;
select film.Film_Id into @filmid from film
where film.Tytul = film_nazwa;
select aktor.Aktor_Id into @aktorid from aktor
where aktor.Imie = aktor_imie and aktor.Nazwisko = aktor_nazwisko and aktor.`Rok urodzenia` = rok_urodzenia;
	insert into film_aktor (`Film_Id`,
							`Aktor_Id`,
                            `Film`,
                            `Aktor`,
                            `Rola`,
                            `Postac`)
                            values (@filmid,
									@aktorid,
                                    @filmid,
                                    @aktorid,
                                    rola,
                                    postac);
END;

create
    definer = cinema_admin@air procedure dodaj_gatunek(IN nazwa varchar(30), IN opis varchar(100))
BEGIN
	insert into gatunek (`nazwa`,
						 `opis`)
						values (nazwa,
							    opis);
END;

create
    definer = cinema_admin@air procedure dodaj_gatunek_film(IN gatunek_nazwa varchar(45), IN film_tytul varchar(100),
                                                            IN film_czas tinyint unsigned)
BEGIN
set @filmid=0;
set @gatunekid = 0;
select Film.Film_Id into @filmid from film where film.Tytul = film_tytul and film.`Czas trwania` = film_czas;
select Gatunek.Gatunek_Id into @gatunekid from gatunek where gatunek.Nazwa = gatunek_nazwa;
	insert into gatunek_film (`Film_Id`,
							  `gatunek_id`,
                              `Film`,
							  `gatunek`)
                            values (@filmid,
									@gatunekid,
                                    @filmid,
                                    @gatunekid);
END;

create
    definer = root@localhost procedure dodaj_grupe_wiekowa(IN wiek tinyint unsigned, IN opis varchar(100))
BEGIN
	insert into mydb.grupa_wiekowa (`Wiek`,`Opis`) values (wiek, opis);
END;

create
    definer = cinema_admin@air procedure dodaj_jezyk(IN nazwa varchar(30), IN opis varchar(100))
BEGIN
	insert into jezyk (`Nazwa`,
					   `opis`)
					values (nazwa,
							opis);
END;

create
    definer = cinema_admin@air procedure dodaj_jezyk_film(IN jezyk_nazwa varchar(45), IN film_tytul varchar(100),
                                                          IN film_czas tinyint unsigned)
BEGIN
set @jezykid = 0;
set @filmid = 0;
select Jezyk.Jezyk_Id into @jezykid from Jezyk where Jezyk.Nazwa = jezyk_nazwa;
select Film.Film_Id into @filmid from Film where Film.Tytul = film_tytul and Film.`Czas trwania` = film_czas;
	insert into jezyk_film (`jezyk_id`,
						    `film_id`,
							`jezyk`,
                            `film`)
						values (@jezykid,
								@filmid,
								@jezykid,
                                @filmid);
END;

create
    definer = admin@air procedure dodaj_kraj(IN nazwa varchar(60), IN skrot varchar(45), IN opis varchar(200))
BEGIN
	insert into kraj (`Nazwa`,`Skrot`,`Opis`) values
					 (nazwa, skrot, opis);
END;

create
    definer = admin@air procedure dodaj_kraj_produkcji(IN film_tytul varchar(200), IN kraj_skrot varchar(45))
BEGIN
    set @krajid = 0;
    set @filmid = 0;
    select Film.Film_Id into @filmid from film where Film.Tytul = film_tytul;
    select Kraj.Kraj_Id into @krajid from kraj where Kraj.Skrot = kraj_skrot; 
	insert into kraj_produkcji (`Film_Id`,
							`Kraj_Id`,
                            `Film`,
                            `Kraj`)
                            values (@filmid,
									@krajid,
                                    @filmid,
                                    @krajid);
END;

create
    definer = cinema_admin@air procedure dodaj_rezyser_film(IN rezyser_imie varchar(45),
                                                            IN rezyser_nazwisko varchar(45), IN rok_urodzenia year,
                                                            IN film_tytul varchar(200))
BEGIN
set @rezyserid = 0;
set @filmid = 0;
select rezyser.Rezyser_Id into @rezyserid from rezyser where rezyser.Imie = rezyser_imie and rezyser.Nazwisko = rezyser_nazwisko and rezyser.Rok_urodzenia = rok_urodzenia;
select film.Film_Id into @filmid from film where film.Tytul = film_tytul;
	insert into rezyser_film (`Rezyser_Id`,
							  `Film_Id`,
                              `Rezyser`,
                              `Film`)
                            values (@rezyserid,
								    @filmid,
                                    @rezyserid,
                                    @filmid);
END;

create
    definer = cinema_admin@air procedure dodaj_rezysera(IN imie varchar(45), IN nazwisko varchar(45),
                                                        IN id_kraju tinyint unsigned, IN rok_urodzenia year,
                                                        IN plec tinyint unsigned, IN opis varchar(300),
                                                        IN pseudonim varchar(45))
BEGIN
    insert into rezyser (`Imie`,
                         `Nazwisko`,
                         `Kraj_id`,
                         `Rok_urodzenia`,
                         `Plec`,
                         `Opis`,
                         `Pseudonim`)
                         values (imie,
                                 nazwisko,
                                 id_kraju,
                                 rok_urodzenia,
                                 plec,
                                 opis,
                                 pseudonim);
END;

create
    definer = cinema_admin@air procedure dodaj_sala(IN numer int unsigned, IN liczba_miejsc int unsigned,
                                                    IN opis varchar(100))
BEGIN
	insert into sala (`sala_numer`,
							`liczba miejsc`,
                            `opis`)
                            values (numer,
									liczba_miejsc,
                                    opis);
END;

create
    definer = cinema_admin@air procedure dodaj_seans(IN seans_data date, IN film_id int unsigned,
                                                     IN sala_numer tinyint unsigned, IN wersja_id tinyint unsigned,
                                                     IN slot tinyint unsigned, IN czas_trwania tinyint unsigned,
                                                     IN opis varchar(200), IN czas_rozpoczecia time)
BEGIN
	insert into seans (`data_seansu`,
					   `film_id`,
					   `sala_numer`,
                       `wersja_id`,
                       `slotNumer`,
                       `czas trwania`,
                       `opis`,
                       `Czas_rozpoczecia`)
					values (seans_data,
							film_id,
							sala_numer,
                            wersja_id,
                            slot,
                            czas_trwania,
                            opis,
                            czas_rozpoczecia);
END;

create
    definer = cinema_admin@air procedure dodaj_slot(IN rozpoczecie time, IN zakonczenie time, IN opis varchar(100))
BEGIN
	insert into slot (`Godzina rozpoczecia`,
					  `Godzina zakonczenia`,
					   `opis`)
					values (rozpoczecie,
							zakonczenie,
							opis);
END;

create
    definer = cinema_admin@air procedure dodaj_wersje_jezykowa(IN typ varchar(30), IN jezyk_nazwa varchar(30),
                                                               IN opis varchar(100))
BEGIN
    set @tmp = jezyk_nazwa;
	set @id = null;
    select jezyk_id into @id from jezyk where jezyk.nazwa = @tmp;
	insert into wersja_jezykowa (`typ`,
								 `jezyk_id`,
                                 `opis`)
								values (typ,
										@id,
										opis);
END;



