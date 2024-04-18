CREATE PROCEDURE mydb.dodaj_grupe_wiekowa (in wiek tinyint unsigned, in opis varchar(100))
BEGIN
	insert into mydb.grupa_wiekowa (`Wiek`,`Opis`) values (wiek, opis);
END
