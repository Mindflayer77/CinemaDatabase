create
    definer = admin@air procedure dodaj_kraj(IN nazwa varchar(60), IN skrot varchar(45), IN opis varchar(200))
BEGIN
	insert into kraj (`Nazwa`,`Skrot`,`Opis`) values
					 (nazwa, skrot, opis);
END;


