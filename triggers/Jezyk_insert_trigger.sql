CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Jezyk_BEFORE_INSERT` BEFORE INSERT ON `Język` FOR EACH ROW
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from język where język.język_id= @it;
        if @var = 0 then 
			set new.język_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END