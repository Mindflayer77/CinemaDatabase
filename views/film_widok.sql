CREATE VIEW `film_widok` AS
SELECT Film.Film_Id, Film.Tytuł, 'Rok produkcji', Film.Grupa_Wiekowa, 'Opis krótki', 'Czas trwania', Reżyser.Imię, Reżyser.Nazwisko FROM Film
JOIN Reżyser_Film, Reżyser WHERE Reżyser.Reżyser_Id = Reżyser_Film.Reżyser_Id 
AND Reżyser_Film.Film_Id = Film.Film_Id;