create
    definer = cinema_admin@air procedure dodaj_aktora(IN imie varchar(45), IN nazwisko varchar(45),
                                                      IN id_kraj tinyint unsigned, IN rok_urodzenia year,
                                                      IN plec tinyint unsigned, IN opis varchar(300),
                                                      IN pseudonim varchar(50))
BEGIN
    insert into aktor (`Imie`,
                         `Nazwisko`,
                         `Kraj_id`,
                         `Rok urodzenia`,
                         `Plec`,
                         `Opis`,
                         `Pseudonim`)
                         values (imie,
                                 nazwisko,
                                 id_kraj,
                                 rok_urodzenia,
                                 plec,
                                 opis,
                                 pseudonim);
END;


