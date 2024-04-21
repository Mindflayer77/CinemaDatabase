CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Aktor_BEFORE_INSERT` BEFORE INSERT ON `Aktor` FOR EACH ROW
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
END