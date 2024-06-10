create
    definer = root@localhost procedure dodaj_grupe_wiekowa(IN wiek tinyint unsigned, IN opis varchar(100))
BEGIN
	insert into mydb.grupa_wiekowa (`Wiek`,`Opis`) values (wiek, opis);
END;


