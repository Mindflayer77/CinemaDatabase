CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_seans`(in seans_data date,
														  in film_id int unsigned,
														  in sala_numer tinyint unsigned,
                                                          in wersja_id tinyint unsigned,
                                                          in slot tinyint unsigned,
                                                          in czas_trwania tinyint unsigned,
                                                          in opis varchar(200))
BEGIN
	insert into seans (`data_seansu`,
					   `film_id`,
					   `sala_numer`,
                       `wersja_id`,
                       `slotNumer`,
                       `czas trwania`,
                       `opis`)
					values (seans_data,
							film_id,
							sala_numer,
                            wersja_id,
                            slot,
                            czas_trwania,
                            opis);
END