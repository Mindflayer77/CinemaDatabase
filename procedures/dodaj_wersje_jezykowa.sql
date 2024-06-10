create
    definer = cinema_admin@air procedure dodaj_wersje_jezykowa(IN typ varchar(30), IN jezyk_nazwa varchar(30),
                                                               IN opis varchar(100))
BEGIN
    set @tmp = jezyk_nazwa;
	set @id = null;
    select jezyk_id into @id from jezyk where jezyk.nazwa = @tmp;
	insert into wersja_jezykowa (`typ`,
								 `jezyk_id`,
                                 `opis`)
								values (typ,
										@id,
										opis);
END;


