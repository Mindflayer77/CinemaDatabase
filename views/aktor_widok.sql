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


