CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `userid` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(15) NOT NULL,
    `profile_picture` VARCHAR(255),
    `status_message` TEXT,
    `is_quited` TINYINT NOT NULL DEFAULT 0,
    `join_date` DATE NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(100) NOT NULL,
    `created_id` INT NOT NULL,
    `channel_link` VARCHAR(255),
    `max` INT NOT NULL,
    `is_quited` TINYINT NOT NULL DEFAULT 0,
    `created_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`created_id`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `content` TEXT NOT NULL,
    `author` INT NOT NULL,
    `channel` INT NOT NULL,
    `created_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author`) REFERENCES `users`(`id`),
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`),
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker` INT NOT NULL,
    `blocked` INT NOT NULL,
    `block_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker`) REFERENCES `users`(`id`),
    FOREIGN KEY (`blocked`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
