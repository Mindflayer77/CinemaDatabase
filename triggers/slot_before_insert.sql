create definer = cinema_admin@`%` trigger Slot_BEFORE_INSERT
    before insert
    on slot
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from slot where slot.slot_numer = @it;
        if @var = 0 then
			set new.slot_numer = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


