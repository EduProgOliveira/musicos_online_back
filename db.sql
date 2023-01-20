CREATE SCHEMA IF NOT EXISTS `musicos_online` DEFAULT CHARACTER SET utf8;

USE `musicos_online`;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`user_system`(
        `user_id` INT NOT NULL AUTO_INCREMENT,
        `user_name` VARCHAR(255) NOT NULL,
        `user_email` VARCHAR(255) NOT NULL,
        `user_password` TEXT not NULL,
        `user_active` TINYINT NULL DEFAULT 1,
        `user_date_created` datetime DEFAULT CURRENT_TIMESTAMP,
        `user_date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`user_id`)
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`historic`(
        `historic_id` INT NOT NULL AUTO_INCREMENT,
        `historic_title` LONGTEXT NOT NULL,
        `historic_description` VARCHAR(255) NOT NULL,
        `historic_date_created` datetime DEFAULT CURRENT_TIMESTAMP,
        `historic_date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `user_id` INT NULL,
        PRIMARY KEY (`historic_id`),
        CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;