create
    definer = cinema_admin@air procedure dodaj_rezysera(IN imie varchar(45), IN nazwisko varchar(45),
                                                        IN id_kraju tinyint unsigned, IN rok_urodzenia year,
                                                        IN plec tinyint unsigned, IN opis varchar(300),
                                                        IN pseudonim varchar(45))
BEGIN
    insert into rezyser (`Imie`,
                         `Nazwisko`,
                         `Kraj_id`,
                         `Rok_urodzenia`,
                         `Plec`,
                         `Opis`,
                         `Pseudonim`)
                         values (imie,
                                 nazwisko,
                                 id_kraju,
                                 rok_urodzenia,
                                 plec,
                                 opis,
                                 pseudonim);
END;


