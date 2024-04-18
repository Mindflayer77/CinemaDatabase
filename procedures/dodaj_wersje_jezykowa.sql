CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_wersje_jezykowa`(in typ varchar(30),
														            in jezyk_nazwa varchar(30),
                                                                    in opis varchar(100))
BEGIN
    set @tmp = język_nazwa;
	set @id = null;
    select język_id into @id from język where język.nazwa = @tmp;
	insert into wersja_językowa (`typ`,
								 `język_id`,
                                 `opis`)
								values (typ,
										@id,
										opis);
END