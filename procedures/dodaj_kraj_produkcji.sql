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


