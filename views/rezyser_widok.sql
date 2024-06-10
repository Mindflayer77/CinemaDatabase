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


