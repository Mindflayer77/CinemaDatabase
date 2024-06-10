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


