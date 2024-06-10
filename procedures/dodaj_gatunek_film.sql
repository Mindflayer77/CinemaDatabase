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


