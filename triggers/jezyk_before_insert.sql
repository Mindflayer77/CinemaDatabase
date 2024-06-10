create definer = cinema_admin@`%` trigger Jezyk_BEFORE_INSERT
    before insert
    on jezyk
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from jezyk where jezyk.jezyk_id= @it;
        if @var = 0 then 
			set new.jezyk_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


