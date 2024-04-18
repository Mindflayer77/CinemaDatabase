CREATE PROCEDURE mydb.dodaj_film(IN tytul varchar(45), IN rok_produkcji year, IN czas_trwania tinyint, IN opis_krotki varchar(500), IN opis_dlugi varchar(2000))
BEGIN
    INSERT INTO film (`Tytuł`, `Rok produkcji`, `Czas trwania`, `Opis krótki`, `Opis długi`) VALUES (tytul, rok_produkcji, czas_trwania, opis_krotki, opis_dlugi);
END