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


