CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Gatunek_BEFORE_INSERT` BEFORE INSERT ON `Gatunek` FOR EACH ROW
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from gatunek where gatunek.gatunek_id = @it;
        if @var = 0 then
			set new.gatunek_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END