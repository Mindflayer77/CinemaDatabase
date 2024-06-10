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


