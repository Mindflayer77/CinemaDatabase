create
    definer = cinema_admin@air procedure dodaj_seans(IN seans_data date, IN film_id int unsigned,
                                                     IN sala_numer tinyint unsigned, IN wersja_id tinyint unsigned,
                                                     IN slot tinyint unsigned, IN czas_trwania tinyint unsigned,
                                                     IN opis varchar(200), IN czas_rozpoczecia time)
BEGIN
	insert into seans (`data_seansu`,
					   `film_id`,
					   `sala_numer`,
                       `wersja_id`,
                       `slotNumer`,
                       `czas trwania`,
                       `opis`,
                       `Czas_rozpoczecia`)
					values (seans_data,
							film_id,
							sala_numer,
                            wersja_id,
                            slot,
                            czas_trwania,
                            opis,
                            czas_rozpoczecia);
END;


