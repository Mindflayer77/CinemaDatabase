create definer = cinema_admin@`%` trigger Aktor_BEFORE_INSERT
    before insert
    on aktor
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from aktor where aktor.aktor_id = @it;
        if @var = 0 then
			set new.aktor_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


