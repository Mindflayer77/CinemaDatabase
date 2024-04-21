CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Kraj_BEFORE_INSERT` BEFORE INSERT ON `Kraj` FOR EACH ROW
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
END