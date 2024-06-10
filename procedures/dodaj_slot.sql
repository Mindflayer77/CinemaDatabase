create
    definer = cinema_admin@air procedure dodaj_slot(IN rozpoczecie time, IN zakonczenie time, IN opis varchar(100))
BEGIN
	insert into slot (`Godzina rozpoczecia`,
					  `Godzina zakonczenia`,
					   `opis`)
					values (rozpoczecie,
							zakonczenie,
							opis);
END;


