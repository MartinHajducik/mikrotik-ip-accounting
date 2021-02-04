-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Úte 29. pro 2015, 10:58
-- Verze serveru: 5.5.46-0ubuntu0.14.04.2
-- Verze PHP: 5.5.9-1ubuntu4.14
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
 
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
 
--
-- Databáze: `accounting`
--
 
-- --------------------------------------------------------
 
--
-- Struktura tabulky `collected_data`
--
 
CREATE TABLE IF NOT EXISTS `collected_data` (
  `src_address_ipv4` VARCHAR(15) NOT NULL,
  `dst_address_ipv4` VARCHAR(15) NOT NULL,
  `packets` INT(15) NOT NULL,
  `bytes` INT(15) NOT NULL,
  `src_user` VARCHAR(100) NOT NULL,
  `dst_user` VARCHAR(100) NOT NULL,
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5168 ;
 
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
