create definer = cinema_admin@`%` trigger Seans_BEFORE_INSERT
    before insert
    on seans
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from seans where seans.Seans_Id = @it;
        if @var = 0 then
			set new.seans_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


