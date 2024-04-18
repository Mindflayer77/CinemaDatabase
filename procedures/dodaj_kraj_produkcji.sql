CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_kraj_produkcji`(in film_id int unsigned,
																   in kraj_id int unsigned)
BEGIN
	insert into kraj_produkcji (`Film_Id`,
							`Kraj_Id`,
                            `Film`,
                            `Kraj`)
                            values (film_id,
									kraj_id,
                                    film_id,
                                    kraj_id);
END