CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_aktora`(in imie varchar(45),
															 in nazwisko varchar(45),
                                                             in nazwa_kraju varchar(60),
                                                             in rok_urodzenia year,
                                                             in plec tinyint unsigned,
                                                             in opis varchar(300),
                                                             in pseudonim varchar(50))
BEGIN
    set @kraj_id = 0;
    set @tmp = nazwa_kraju;
    select Kraj_id into @kraj_id from kraj where Nazwa = @tmp;
    insert into aktor (`Imię`,
                         `Nazwisko`,
                         `Kraj_id`,
                         `Rok urodzenia`,
                         `Płeć`,
                         `Opis`,
                         `Pseudonim`)
                         values (imie,
                                 nazwisko,
                                 @kraj_id,
                                 rok_urodzenia,
                                 plec,
                                 opis,
                                 pseudonim);
END