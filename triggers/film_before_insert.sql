create definer = cinema_admin@`%` trigger Film_BEFORE_INSERT
    before insert
    on film
    for each row
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from film where film.film_id = @it;
        if @var = 0 then
			set new.film_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END;


