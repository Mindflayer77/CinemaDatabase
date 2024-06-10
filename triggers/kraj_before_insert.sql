create definer = cinema_admin@`%` trigger Kraj_BEFORE_INSERT
    before insert
    on kraj
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from kraj where kraj.kraj_id = @it;
        if @var = 0 then
			set new.kraj_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


