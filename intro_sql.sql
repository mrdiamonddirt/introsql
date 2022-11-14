USE bdgtz9j1xtvceikhuc8p;

SHOW TABLES;

CREATE TABLE movies (
	title VARCHAR(255) NOT NULL UNIQUE,
    actor VARCHAR(255) default "not specified",
    director VARCHAR(255) DEFAULT "not specified"
	);
    
INSERT INTO movies VALUES (
	'SPIDERMAN','Tobey Maguire','sam raimi'
);

-- INSERT INTO `bdgtz9j1xtvceikhuc8p`.`movies` (`title`, `actor`, `director`) VALUES ('spiderman 2', 'Tobey Maguire', 'sam raimi');

SELECT * FROM movies;

-- reaarch the UPDATE and DELETE command, amd add 4 or 5 movies update director on one and delete atleast one row