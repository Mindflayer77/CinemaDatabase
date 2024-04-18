CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_kraj`(in nazwa varchar(60),
							   in kontynent varchar(45),
                               in opis varchar(200))
BEGIN
	insert into kraj (`Nazwa`,`Kontynent`,`Opis`) values
					 (nazwa, kontynent, opis);
END