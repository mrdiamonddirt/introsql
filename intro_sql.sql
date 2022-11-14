USE bdgtz9j1xtvceikhuc8p;

SHOW TABLES;

DROP TABLE movies;
CREATE TABLE movies (
	id int NOT NULL,
	title VARCHAR(255) NOT NULL UNIQUE,
    actor VARCHAR(255) default "not specified",
    director VARCHAR(255) DEFAULT "not specified"
    -- dateadded date DEFAULT CURRENT_DATE() 
	);

-- INSERT SPIDERMAN MOVIES INTO DATABASE
INSERT INTO movies VALUES 
	(1,"SPIDERMAN","Tobey Maguire","sam raimi"),
	(2,"SPIDERMAN 2","Tobey Maguire","sam raimi"),
	(3,"SPIDERMAN 3","Tobey Maguire","sam raimi"),
	(4,"The Amazing Spiderman","Andrew Garfield","Marc Webb"),
	(5,"The Amazing Spiderman 2","Andrew Garfield","Marc Webb"),
	(6,"Spider-Man: Homecoming","Tom Holland","Jon Watts"),
	(7,"Spider-Man: Far From Home", "Tom Holland","Jon Watts"),
	(8,"Spider-Man: No Way Home", "Tom Holland" , "Jon Watts");


-- INSERT INTO `bdgtz9j1xtvceikhuc8p`.`movies` (`title`, `actor`, `director`) VALUES ('spiderman 2', 'Tobey Maguire', 'sam raimi');

SELECT * FROM movies;

-- reaarch the UPDATE and DELETE command, amd add 4 or 5 movies update director on one and delete atleast one row
-- update function
UPDATE movies
SET actor = 'Tobey Maguirei'
WHERE director = "sam raimi";