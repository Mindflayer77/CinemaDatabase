CREATE VIEW `film_szczegolowo` AS
SELECT Tytuł, 'Rok produkcji', 'Czas trwania', 'Opis krótki', 'Opis długi', 'Grupa wiekowa', Reżyser.Imię, Reżyser.Nazwisko,
Aktor.Imię AS IMAK, Aktor.Nazwisko AS NAAK, Gatunek.Nazwa AS GATNA, Kraj.Nazwa AS KRANA, Kraj.Kontynent, Język.Nazwa AS JENA FROM Film
JOIN Reżyser, Aktor, Gatunek, Kraj, Język, Reżyser_Film, Film_Aktor, Gatunek_Film, Kraj_produkcji, Język_Film WHERE
Reżyser.Reżyser_Id = Reżyser_Film.Reżyser_Id AND Reżyser_Film.Film_Id = Film.Film_Id AND
Aktor.Aktor_Id = Film_Aktor.Aktor_Id AND Film_Aktor.Film_Id = Film.Film_Id AND
Gatunek.Gatunek_Id = Gatunek_Film.Gatunek_Id AND Gatunek_Film.Film_Id = Film.Film_Id AND
Kraj.Kraj_id = Kraj_produkcji.Kraj_Id AND Kraj_produkcji.Film_Id = Film.Film_Id AND
Język.Język_Id = Język_Film.Język_Id AND Język_Film.Film_Id = Film.Film_Id;