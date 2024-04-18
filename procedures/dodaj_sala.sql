CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_sala`(in numer int unsigned,
														 in liczba_miejsc int unsigned,
														 in opis varchar(100))
BEGIN
	insert into sala (`sala_numer`,
							`liczba miejsc`,
                            `opis`)
                            values (numer,
									liczba_miejsc,
                                    opis);
END