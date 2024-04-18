CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_jezyk_film`(in jezyk_id tinyint unsigned,
															    in film_id int unsigned)
BEGIN
	insert into język_film (`język_id`,
						    `film_id`,
							`język`,
                            `film`)
						values (jezyk_id,
								film_id,
								język_id,
                                film_id);
END