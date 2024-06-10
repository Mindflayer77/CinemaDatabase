create
    definer = cinema_admin@air procedure dodaj_jezyk(IN nazwa varchar(30), IN opis varchar(100))
BEGIN
	insert into jezyk (`Nazwa`,
					   `opis`)
					values (nazwa,
							opis);
END;


