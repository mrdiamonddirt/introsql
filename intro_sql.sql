USE bdgtz9j1xtvceikhuc8p;

SHOW TABLES;

DROP TABLE movies;
CREATE TABLE movies (
	title VARCHAR(255) NOT NULL UNIQUE,
    actor VARCHAR(255) default "not specified",
    director VARCHAR(255) DEFAULT "not specified"
	);

-- INSERT SPIDERMAN MOVIES INTO DATABASE
INSERT INTO movies VALUES 
	("SPIDERMAN","Tobey Maguire","sam raimi"),
	("SPIDERMAN 2","Tobey Maguire","sam raimi"),
	("SPIDERMAN 3","Tobey Maguire","sam raimi"),
	("The Amazing Spiderman","Andrew Garfield","Marc Webb"),
	("The Amazing Spiderman 2","Andrew Garfield","Marc Webb"),
	("Spider-Man: Homecoming","Tom Holland","Jon Watts"),
	("Spider-Man: Far From Home", "Tom Holland","Jon Watts"),
	("Spider-Man: No Way Home", "Tom Holland" , "Jon Watts");


-- INSERT INTO `bdgtz9j1xtvceikhuc8p`.`movies` (`title`, `actor`, `director`) VALUES ('spiderman 2', 'Tobey Maguire', 'sam raimi');

SELECT * FROM movies;

-- reaarch the UPDATE and DELETE command, amd add 4 or 5 movies update director on one and delete atleast one row