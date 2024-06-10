create
    definer = cinema_admin@air procedure dodaj_film(IN tytul varchar(100), IN rok_produkcji year,
                                                    IN czas_trwania tinyint unsigned, IN opis_krotki varchar(1000),
                                                    IN opis_dlugi varchar(2000), IN grupa_wiekowa tinyint unsigned)
BEGIN
    INSERT INTO film (`Tytul`,
					`Rok produkcji`, 
                    `Czas trwania`, 
                    `Opis krotki`, 
                    `Opis dlugi`, 
                    `Grupa_Wiekowa`) 
			VALUES (tytul,
					rok_produkcji,
					czas_trwania, 
					opis_krotki, 
					opis_dlugi, 
					grupa_wiekowa);
END;


