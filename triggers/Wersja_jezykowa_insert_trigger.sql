CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`wersja_jezykowa_BEFORE_INSERT` BEFORE INSERT ON `Wersja_językowa` FOR EACH ROW
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from wersja_językowa where wersja_językowa.wersja_id = @it;
        if @var = 0 then
			set new.wersja_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END