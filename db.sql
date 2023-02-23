CREATE SCHEMA IF NOT EXISTS `musicos_online` DEFAULT CHARACTER SET utf8;

USE `musicos_online`;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`user_system`(
        `user_id` INT NOT NULL AUTO_INCREMENT,
        `user_name` VARCHAR(255) NOT NULL,
        `user_email` VARCHAR(255) NOT NULL,
        `user_password` TEXT NOT NULL,
        `user_username` VARCHAR(255),
        `user_gender` CHAR(5),
        `user_biography` LONGTEXT,
        `user_state` VARCHAR(255),
        `user_city` VARCHAR(255),
        `user_lat` DOUBLE,
        `user_long` DOUBLE,
        `user_active` TINYINT DEFAULT 1,
        `user_premium` TINYINT DEFAULT 0,
        `music_type_id` VARCHAR(255),
        `music_default_type_id` INT,
        `musician_type_id` VARCHAR(255),
        `musiccian_default_type_id` INT,
        `instrument_type_id` VARCHAR(255),
        `instrument_default_type_id` INT,
        `user_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `user_date_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `user_date_deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`user_id`)
    );

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`follower`(
        `follower_id` INT NOT NULL AUTO_INCREMENT,
        `user_id` INT NOT NULL,
        PRIMARY KEY (`follower_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`followed`(
        `followed_id` INT NOT NULL AUTO_INCREMENT,
        `user_id` INT NOT NULL,
        PRIMARY KEY (`followed_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`post`(
        `post_id` INT NOT NULL AUTO_INCREMENT,
        `post_text` LONGTEXT NOT NULL,
        `post_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `post_date_deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `user_id` INT NULL,
        PRIMARY KEY (`post_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`chat`(
        `chat_id` INT NOT NULL AUTO_INCREMENT,
        `chat_text` LONGTEXT NOT NULL,
        `chat_view` BOOLEAN DEFAULT FALSE,
        `chat_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `chat_date_deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `user_id` INT NOT NULL,
        `chat_user` INT NOT NULL,
        PRIMARY KEY (`chat_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`),
        FOREIGN KEY (`chat_user`) REFERENCES `musicos_online`.`user_system` (`user_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`comment`(
        `comment_id` INT NOT NULL AUTO_INCREMENT,
        `comment_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `comment_date_deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `comment_text` LONGTEXT NOT NULL,
        `user_id` INT NOT NULL,
        `post_id` INT NOT NULL,
        PRIMARY KEY (`comment_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`),
        FOREIGN KEY (`post_id`) REFERENCES `musicos_online`.`post` (`post_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`liked`(
        `liked_id` INT NOT NULL AUTO_INCREMENT,
        `liked_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `user_id` INT NOT NULL,
        `post_id` INT NOT NULL,
        PRIMARY KEY (`liked_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`),
        FOREIGN KEY (`post_id`) REFERENCES `musicos_online`.`post` (`post_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`music_type`(
        `music_type_id` INT NOT NULL AUTO_INCREMENT,
        `music_type_title` TEXT NOT NULL,
        PRIMARY KEY (`music_type_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`musician_type`(
        `musician_type_id` INT NOT NULL AUTO_INCREMENT,
        `musician_type_title` TEXT NOT NULL,
        PRIMARY KEY (`musician_type_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`instrument_type`(
        `instrument_type_id` INT NOT NULL AUTO_INCREMENT,
        `instrument_type_title` TEXT NOT NULL,
        PRIMARY KEY (`instrument_type_id`)
    ) ENGINE = INNODB;

CREATE TABLE
    IF NOT EXISTS `musicos_online`.`suggestion`(
        `suggestion_id` INT NOT NULL AUTO_INCREMENT,
        `suggestion_date_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
        `suggestion_date_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `user_id` INT NOT NULL,
        `music_type_id` INT NOT NULL,
        `musician_type_id` INT NOT NULL,
        `instrument_type_id` INT NOT NULL,
        PRIMARY KEY (`suggestion_id`),
        FOREIGN KEY (`user_id`) REFERENCES `musicos_online`.`user_system` (`user_id`),
        FOREIGN KEY (`music_type_id`) REFERENCES `musicos_online`.`music_type` (`music_type_id`),
        FOREIGN KEY (`musician_type_id`) REFERENCES `musicos_online`.`musician_type` (`musician_type_id`),
        FOREIGN KEY (`instrument_type_id`) REFERENCES `musicos_online`.`instrument_type` (`instrument_type_id`)
    ) ENGINE = INNODB;