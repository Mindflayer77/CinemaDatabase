create definer = cinema_admin@`%` trigger Gatunek_BEFORE_INSERT
    before insert
    on gatunek
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from gatunek where gatunek.gatunek_id = @it;
        if @var = 0 then
			set new.gatunek_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


