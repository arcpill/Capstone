CREATE USER 'orderDbUser_mvc2'@'localhost' IDENTIFIED BY 'spring';
GRANT ALL PRIVILEGES ON jobseekerdb.* TO 'orderDbUser_mvc2'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'orderDbUser_mvc2'@'localhost';


create schema jobseekerdb;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


