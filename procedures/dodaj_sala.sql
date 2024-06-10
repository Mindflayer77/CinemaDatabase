create
    definer = cinema_admin@air procedure dodaj_sala(IN numer int unsigned, IN liczba_miejsc int unsigned,
                                                    IN opis varchar(100))
BEGIN
	insert into sala (`sala_numer`,
							`liczba miejsc`,
                            `opis`)
                            values (numer,
									liczba_miejsc,
                                    opis);
END;


