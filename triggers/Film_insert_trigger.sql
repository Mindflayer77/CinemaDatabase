CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Film_BEFORE_INSERT` BEFORE INSERT ON `Film` FOR EACH ROW
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
END
