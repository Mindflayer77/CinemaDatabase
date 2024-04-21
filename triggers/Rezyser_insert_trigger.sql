CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Reżyser_BEFORE_INSERT` BEFORE INSERT ON `Reżyser` FOR EACH ROW
BEGIN
	set @it = 0;
    set @var = 0;
	licznik : loop
		set @it = @it +1;
        select count(*) into @var from reżyser where reżyser.reżyser_id = @it;
        if @var = 0 then
			set new.reżyser_id = @it;
            leave licznik;
		end if;
	end loop licznik;
END