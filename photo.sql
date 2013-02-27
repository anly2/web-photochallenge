-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2013 at 05:51 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `photo`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
  `cha_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(150) NOT NULL COMMENT 'url of image',
  `began` date NOT NULL COMMENT 'default(now())',
  `state` tinyint(10) NOT NULL COMMENT '[opened for submissions, voting stage, closed, ...]',
  PRIMARY KEY (`cha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `com_id` bigint(20) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `author` smallint(6) NOT NULL COMMENT 'usr_id',
  `approval` int(11) NOT NULL DEFAULT '0' COMMENT '~likes',
  PRIMARY KEY (`com_id`),
  KEY `pic_id` (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contenders`
--

CREATE TABLE IF NOT EXISTS `contenders` (
  `pic_id` int(11) NOT NULL,
  `cha_id` int(11) NOT NULL,
  KEY `pic_id` (`pic_id`,`cha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `pic_id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `title` varchar(50) NOT NULL,
  `uploader` smallint(6) NOT NULL COMMENT 'usr_id',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `pic_id` int(11) NOT NULL,
  `tag` varchar(16) NOT NULL COMMENT 'LOWERCASE!',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'username',
  `email` varchar(40) NOT NULL,
  `nick` varchar(50) DEFAULT NULL COMMENT 'nickname / display name',
  `avatar` varchar(150) DEFAULT NULL COMMENT 'url of image',
  `password` varchar(32) NOT NULL DEFAULT '0' COMMENT 'md5',
  `joined` date NOT NULL COMMENT 'default(now())',
  `exp` smallint(6) NOT NULL COMMENT 'experience -> level -> benefits',
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `pic_id` int(11) NOT NULL,
  `cha_id` int(11) NOT NULL,
  `voter` smallint(6) DEFAULT NULL COMMENT 'usr_id',
  KEY `pic_id` (`pic_id`,`cha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
