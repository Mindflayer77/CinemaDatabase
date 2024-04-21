CREATE VIEW `seans_widok` AS
SELECT Film.Tytuł, 'Film.Rok produkcji', 'Film.Czas Trwania', Sala.Sala_numer, Wersja_Językowa.Typ, Język.Nazwa FROM Seans
JOIN Sala, Wersja_Językowa, Film, Język
WHERE Seans.Film_Id = Film.Film_Id AND
Seans.Sala_numer = Sala.Sala_numer AND
Seans.Wersja_Id = Wersja_Językowa.Wersja_Id AND
Wersja_Językowa.Język_Id = Język.Język_Id;