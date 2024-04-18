CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_jezyk`(in nazwa varchar(30),
														  in opis varchar(100))
BEGIN
	insert into język (`Nazwa`,
					   `opis`)
					values (nazwa,
							opis);
END