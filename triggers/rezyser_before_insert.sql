create definer = cinema_admin@`%` trigger Rezyser_BEFORE_INSERT
    before insert
    on rezyser
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from rezyser where rezyser.rezyser_id = @it;
        if @var = 0 then
			set new.rezyser_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


