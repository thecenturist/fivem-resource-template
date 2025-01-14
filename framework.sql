CREATE DATABASE IF NOT EXISTS `framework`;
USE `framework`;

CREATE TABLE `user_identifiers` (
    `playername` VARCHAR(60) NOT NULL,
    `license` VARCHAR(60) NOT NULL,
    `discord` VARCHAR(60) NOT NULL,
    `fivem` VARCHAR(60) NOT NULL,
    `ip` VARCHAR(60) NOT NULL,
    PRIMARY KEY(`license`)
);