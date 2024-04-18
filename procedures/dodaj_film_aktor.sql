CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_film_aktor`(in film_id int unsigned,
															   in aktor_id int unsigned,
															   in rola varchar(200),
															   in postac varchar(40))
BEGIN
	insert into film_aktor (`Film_Id`,
							`Aktor_Id`,
                            `Film`,
                            `Aktor`,
                            `Rola`,
                            `Postać`)
                            values (film_id,
									aktor_id,
                                    film_id,
                                    aktor_id,
                                    rola,
                                    postac);
END