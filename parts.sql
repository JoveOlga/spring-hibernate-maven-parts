USE test;

DROP TABLE IF EXISTS part;

CREATE TABLE `part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `necessity` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Sound card', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('CPU', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Keyboard Backlight', 1, 5);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('HDD', 0, 2);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Case', 1, 3);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('RAM', 1, 2);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('SSD', 1, 5);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Video card', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Speakers', 0, 4);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Mouse', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Backlight Case', 0, 5);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Cooler', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Monitor', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Motherboard', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('USB', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Power Supply', 1, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('CD-ROM', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Card Reader', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('TV-card', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Card Reader', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Satellite map', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('USB cooler', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('USB backlight', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Headset', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Webcam', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('USB adapter', 0, 6);
INSERT INTO `test`.`part` (`name`, `necessity`, `quantity`) VALUES ('Hard disk pocket', 0, 6);


