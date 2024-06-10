create definer = cinema_admin@`%` trigger wersja_jezykowa_BEFORE_INSERT
    before insert
    on wersja_jezykowa
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from wersja_jezykowa where wersja_jezykowa.wersja_id = @it;
        if @var = 0 then
			set new.wersja_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


