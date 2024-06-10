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


