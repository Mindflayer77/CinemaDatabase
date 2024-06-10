create
    definer = cinema_admin@air procedure dodaj_gatunek(IN nazwa varchar(30), IN opis varchar(100))
BEGIN
	insert into gatunek (`nazwa`,
						 `opis`)
						values (nazwa,
							    opis);
END;


