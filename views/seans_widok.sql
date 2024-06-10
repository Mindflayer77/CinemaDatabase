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


