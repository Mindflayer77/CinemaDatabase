CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_film`(IN tytul varchar(45), 
														IN rok_produkcji year, 
                                                        IN czas_trwania tinyint unsigned, 
                                                        IN opis_krotki varchar(500), 
                                                        IN opis_dlugi varchar(2000), 
                                                        IN grupa_wiekowa tinyint unsigned)
BEGIN
    INSERT INTO film (`Tytuł`,
					`Rok produkcji`, 
                    `Czas trwania`, 
                    `Opis krótki`, 
                    `Opis długi`, 
                    `Grupa_Wiekowa`) 
			VALUES (tytul,
					rok_produkcji,
					czas_trwania, 
					opis_krotki, 
					opis_dlugi, 
					grupa_wiekowa);
END