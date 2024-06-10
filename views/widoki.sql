create definer = cinema_admin@`%` view aktor_widok as
select `mydb`.`aktor`.`Aktor_Id`      AS `Aktor_Id`,
       `mydb`.`aktor`.`Imie`          AS `Imię`,
       `mydb`.`aktor`.`Nazwisko`      AS `Nazwisko`,
       `mydb`.`aktor`.`Kraj_Id`       AS `Kraj_Id`,
       `mydb`.`aktor`.`Rok urodzenia` AS `Rok urodzenia`,
       `mydb`.`aktor`.`Plec`          AS `Płeć`,
       `mydb`.`aktor`.`Opis`          AS `Opis`,
       `mydb`.`aktor`.`Pseudonim`     AS `Pseudonim`
from `mydb`.`aktor`;

create definer = cinema_admin@air view film_szczegolowo as
select `mydb`.`film`.`Film_Id`       AS `Film_Id`,
       `mydb`.`film`.`Tytul`         AS `Tytuł`,
       `mydb`.`film`.`Rok produkcji` AS `Rok produkcji`,
       `mydb`.`film`.`Czas trwania`  AS `Czas trwania`,
       `mydb`.`film`.`Opis krotki`   AS `Opis krótki`,
       `mydb`.`film`.`Opis dlugi`    AS `Opis długi`,
       `mydb`.`film`.`Grupa_Wiekowa` AS `Grupa wiekowa`,
       `mydb`.`rezyser`.`Imie`       AS `Imię`,
       `mydb`.`rezyser`.`Nazwisko`   AS `Nazwisko`,
       `mydb`.`aktor`.`Imie`         AS `IMAK`,
       `mydb`.`aktor`.`Nazwisko`     AS `NAAK`,
       `mydb`.`gatunek`.`Nazwa`      AS `GATNA`,
       `mydb`.`kraj`.`Nazwa`         AS `KRANA`,
       `mydb`.`kraj`.`Skrot`         AS `Skrót`,
       `mydb`.`jezyk`.`Nazwa`        AS `JENA`
from ((((((((((`mydb`.`film` join `mydb`.`rezyser_film`
               on ((`mydb`.`rezyser_film`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`rezyser`
              on ((`mydb`.`rezyser`.`Rezyser_Id` = `mydb`.`rezyser_film`.`Rezyser_Id`))) join `mydb`.`film_aktor`
             on ((`mydb`.`film_aktor`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`aktor`
            on ((`mydb`.`aktor`.`Aktor_Id` = `mydb`.`film_aktor`.`Aktor_Id`))) join `mydb`.`gatunek_film`
           on ((`mydb`.`gatunek_film`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`gatunek`
          on ((`mydb`.`gatunek`.`Gatunek_Id` = `mydb`.`gatunek_film`.`Gatunek_Id`))) join `mydb`.`kraj_produkcji`
         on ((`mydb`.`kraj_produkcji`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`kraj`
        on ((`mydb`.`kraj`.`Kraj_Id` = `mydb`.`kraj_produkcji`.`Kraj_Id`))) join `mydb`.`jezyk_film`
       on ((`mydb`.`jezyk_film`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`jezyk`
      on ((`mydb`.`jezyk`.`Jezyk_Id` = `mydb`.`jezyk_film`.`Jezyk_Id`)));

create definer = cinema_admin@`%` view film_widok as
select `mydb`.`film`.`Film_Id`       AS `Film_Id`,
       `mydb`.`film`.`Tytul`         AS `Tytuł`,
       `mydb`.`film`.`Rok produkcji` AS `Rok produkcji`,
       `mydb`.`film`.`Grupa_Wiekowa` AS `Grupa_Wiekowa`,
       `mydb`.`film`.`Opis krotki`   AS `Opis krótki`,
       `mydb`.`film`.`Czas trwania`  AS `Czas trwania`,
       `mydb`.`rezyser`.`Imie`       AS `Imię`,
       `mydb`.`rezyser`.`Nazwisko`   AS `Nazwisko`
from ((`mydb`.`film` join `mydb`.`rezyser_film`
       on ((`mydb`.`rezyser_film`.`Film_Id` = `mydb`.`film`.`Film_Id`))) join `mydb`.`rezyser`
      on ((`mydb`.`rezyser`.`Rezyser_Id` = `mydb`.`rezyser_film`.`Rezyser_Id`)));

create definer = cinema_admin@`%` view rezyser_widok as
select `mydb`.`rezyser`.`Rezyser_Id`    AS `Reżyser_Id`,
       `mydb`.`rezyser`.`Imie`          AS `Imię`,
       `mydb`.`rezyser`.`Nazwisko`      AS `Nazwisko`,
       `mydb`.`rezyser`.`Kraj_Id`       AS `Kraj_Id`,
       `mydb`.`rezyser`.`Rok_urodzenia` AS `Rok_urodzenia`,
       `mydb`.`rezyser`.`Plec`          AS `Płeć`,
       `mydb`.`rezyser`.`Opis`          AS `Opis`,
       `mydb`.`rezyser`.`Pseudonim`     AS `Pseudonim`
from `mydb`.`rezyser`;

create definer = cinema_admin@`%` view seans_widok as
select `mydb`.`film`.`Tytul`          AS `Tytuł`,
       `mydb`.`film`.`Rok produkcji`  AS `Film.Rok produkcji`,
       `mydb`.`film`.`Czas trwania`   AS `Film.Czas Trwania`,
       `mydb`.`sala`.`Sala_numer`     AS `Sala_numer`,
       `mydb`.`wersja_jezykowa`.`Typ` AS `Typ`,
       `mydb`.`jezyk`.`Nazwa`         AS `Nazwa`
from ((((`mydb`.`seans` join `mydb`.`sala`
         on ((`mydb`.`sala`.`Sala_numer` = `mydb`.`seans`.`Sala_numer`))) join `mydb`.`film`
        on ((`mydb`.`film`.`Film_Id` = `mydb`.`seans`.`Film_Id`))) join `mydb`.`wersja_jezykowa`
       on ((`mydb`.`wersja_jezykowa`.`Wersja_Id` = `mydb`.`seans`.`Wersja_Id`))) join `mydb`.`jezyk`
      on ((`mydb`.`jezyk`.`Jezyk_Id` = `mydb`.`wersja_jezykowa`.`Jezyk_Id`)));


