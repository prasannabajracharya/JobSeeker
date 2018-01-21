# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: nepalicoders
# Generation Time: 2017-05-26 20:17:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `commentid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` text COLLATE utf8_bin NOT NULL,
  `postid` text COLLATE utf8_bin NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`commentid`, `userid`, `postid`, `comment`, `datecreated`, `dateupdated`)
VALUES
	(17,X'706F737433',X'7573657231',X'4D616E6F6A2062726F206B20636861','2017-05-22 22:51:21','0000-00-00 00:00:00'),
	(18,X'706F737433',X'7573657231',X'70726173616E6E61','2017-05-23 00:23:46','0000-00-00 00:00:00'),
	(91,X'3132',X'3638',X'6B73686974696A0A','2017-05-23 14:48:03','0000-00-00 00:00:00'),
	(92,X'3132',X'3638',X'6B73686974696A69736661736661','2017-05-23 14:48:40','0000-00-00 00:00:00'),
	(93,X'3132',X'3638',X'6B6370','2017-05-23 14:49:23','0000-00-00 00:00:00'),
	(94,X'3132',X'3638',X'6B73686974696A','2017-05-23 14:50:40','0000-00-00 00:00:00'),
	(95,X'3132',X'3636',X'6B73686974696A','2017-05-23 15:14:45','0000-00-00 00:00:00'),
	(96,X'3132',X'3638',X'6B6370','2017-05-23 15:14:52','0000-00-00 00:00:00'),
	(97,X'3132',X'3638',X'6B736B687361666461','2017-05-23 15:15:59','0000-00-00 00:00:00'),
	(98,X'3132',X'3638',X'6B73686974696A','2017-05-23 15:16:38','0000-00-00 00:00:00'),
	(99,X'3132',X'3638',X'6B6370','2017-05-23 15:18:22','0000-00-00 00:00:00'),
	(100,X'3132',X'3638',X'6B73686974696A','2017-05-23 15:19:57','0000-00-00 00:00:00'),
	(101,X'3132',X'3638',X'6B7670','2017-05-23 15:22:43','0000-00-00 00:00:00'),
	(102,X'3132',X'3638',X'6B6370','2017-05-23 15:23:36','0000-00-00 00:00:00'),
	(103,X'3132',X'3638',X'6B6370','2017-05-23 15:26:43','0000-00-00 00:00:00'),
	(104,X'3132',X'3638',X'6B6370','2017-05-23 15:27:43','0000-00-00 00:00:00'),
	(105,X'3132',X'3638',X'6B6370','2017-05-23 15:28:11','0000-00-00 00:00:00'),
	(106,X'3132',X'3638',X'6B6370','2017-05-23 15:30:08','0000-00-00 00:00:00'),
	(107,X'3132',X'3638',X'6B73687469696A','2017-05-23 15:32:02','0000-00-00 00:00:00'),
	(108,X'3132',X'3638',X'6B6370','2017-05-23 15:35:41','0000-00-00 00:00:00'),
	(109,X'3132',X'3638',X'6B6370','2017-05-23 15:36:26','0000-00-00 00:00:00'),
	(110,X'3132',X'3638',X'6B73686974696A','2017-05-23 15:36:40','0000-00-00 00:00:00'),
	(111,X'3132',X'3638',X'6D6862676B6A68676B','2017-05-23 16:04:28','0000-00-00 00:00:00'),
	(112,X'3132',X'3638',X'6D6E2C6D6E','2017-05-23 16:06:39','0000-00-00 00:00:00'),
	(113,X'3132',X'3638',X'6B6370','2017-05-23 16:08:53','0000-00-00 00:00:00'),
	(114,X'3132',X'3638',X'6B6370','2017-05-23 16:20:29','0000-00-00 00:00:00'),
	(115,X'3132',X'3637',X'6B6370','2017-05-23 16:24:05','0000-00-00 00:00:00'),
	(116,X'3132',X'3638',X'6B63700A','2017-05-23 16:24:15','0000-00-00 00:00:00'),
	(117,X'3132',X'3638',X'6B6370','2017-05-23 16:25:35','0000-00-00 00:00:00'),
	(118,X'3132',X'3638',X'2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D','2017-05-23 16:25:50','0000-00-00 00:00:00'),
	(119,X'3132',X'3638',X'68656C6C6C6F','2017-05-23 23:10:39','0000-00-00 00:00:00'),
	(120,X'3132',X'3638',X'6B63700A','2017-05-23 23:10:48','0000-00-00 00:00:00'),
	(121,X'3230',X'3834',X'6B6370','2017-05-24 10:02:00','0000-00-00 00:00:00'),
	(122,X'3132',X'3638',X'6B6370','2017-05-24 10:19:54','0000-00-00 00:00:00'),
	(123,X'3132',X'3836',X'6B6370','2017-05-24 10:19:59','0000-00-00 00:00:00'),
	(124,X'3132',X'3836',X'6B73686974696A','2017-05-24 10:20:03','0000-00-00 00:00:00'),
	(125,X'3132',X'3836',X'6B6370','2017-05-24 10:32:21','0000-00-00 00:00:00'),
	(126,X'3132',X'3932',X'6B6370','2017-05-24 10:34:02','0000-00-00 00:00:00'),
	(127,X'3132',X'3932',X'6B6370','2017-05-24 10:34:06','0000-00-00 00:00:00'),
	(128,X'3236',X'3834',X'6B6370','2017-05-24 12:07:58','0000-00-00 00:00:00'),
	(129,X'3236',X'3834',X'6B6370','2017-05-24 12:08:02','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `likeid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `postid` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`likeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;

INSERT INTO `likes` (`likeid`, `userid`, `postid`)
VALUES
	(14,X'3132',X'3637'),
	(51,X'3132',X'3639'),
	(59,X'3132',X'3635'),
	(60,X'3132',X'3636'),
	(63,X'3133',X'3634'),
	(64,X'3133',X'3733'),
	(65,X'3133',X'3732'),
	(68,X'3134',X'3638'),
	(70,X'3132',X'3732'),
	(75,X'3132',X'3731'),
	(80,X'3132',X'3733'),
	(84,X'3132',X'3730'),
	(100,X'393835363836',X'706F737432'),
	(107,X'3133',X'3637'),
	(114,X'3132',X'3833'),
	(115,X'3132',X'3638'),
	(116,X'3230',X'3638'),
	(117,X'3230',X'3637'),
	(118,X'3230',X'3636'),
	(119,X'3230',X'3635'),
	(120,X'3230',X'3634'),
	(121,X'3230',X'3633'),
	(125,X'3132',X'3633'),
	(126,X'3132',X'3634'),
	(132,X'3132',X'3938');

/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `postid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `post` text CHARACTER SET utf8 NOT NULL,
  `posttype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`postid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`postid`, `userid`, `post`, `posttype`, `datecreated`, `dateupdated`)
VALUES
	(63,'12','What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','1','2017-05-22 15:27:04','2017-05-22 14:52:03'),
	(64,'12','Why do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','1','2017-05-22 15:27:06','2017-05-22 14:52:29'),
	(65,'13','Where does it come from?\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.','1','2017-05-22 14:54:00','2017-05-22 14:54:00'),
	(66,'13','Where can I get some?\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.','1','2017-05-22 14:54:10','2017-05-22 14:54:10'),
	(67,'14','What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','1','2017-05-22 14:55:32','2017-05-22 14:55:32'),
	(68,'14','Why do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','1','2017-05-22 14:55:51','2017-05-22 14:55:51'),
	(84,'20','Lorem ipsum dolor sit amet, erat ridiculus tortor pellentesque tempus orci, orci tempus egestas hendrerit sed quisque gravida, congue sit. Rutrum velit tincidunt ante, ante erat nec nec nonummy, accumsan urna eros, arcu vivamus, ipsum sit litora justo eu et tortor. Amet orci molestie. Arcu vivamus lorem est ultrices justo, platea vel ornare in morbi suspendisse. Eleifend pede ipsum etiam pellentesque sed nec, aliquam est, malesuada nec massa quam quam maecenas, sodales sodales enim inceptos ornare, rhoncus interdum nullam molestie rutrum ac cras. Integer vel suspendisse cras ullamcorper, dui dapibus pede lorem nibh vel felis, dictum amet praesent imperdiet facilisis, cras neque iaculis tellus metus a nulla, turpis ridiculus pellentesque libero. Pellentesque curabitur faucibus fringilla nisl, eu vehicula non habitasse tincidunt, integer dolor, curabitur nam sed, sit sed. ','1','2017-05-24 10:01:36','2017-05-24 10:01:36'),
	(98,'12','skdjfaskldjsduhdsc','1','2017-05-24 11:53:09','2017-05-24 11:53:09'),
	(99,'26','asdsfgg','1','2017-05-24 12:08:26','2017-05-24 12:08:26'),
	(100,'26','n,n,mn','1','2017-05-24 12:19:04','2017-05-24 12:19:04');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(11) NOT NULL,
  `state` varchar(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zipcode` varchar(11) NOT NULL,
  `birthyear` varchar(11) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `datecreated` varchar(11) DEFAULT NULL,
  `dateupdated` varchar(11) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`userid`, `fullname`, `username`, `gender`, `state`, `city`, `street`, `zipcode`, `birthyear`, `email`, `password`, `datecreated`, `dateupdated`, `imageurl`)
VALUES
	(12,'sushan','kcp','Male','AL','asdfa','1000 N 4th St','22222','2222','kcpoudyal@gmail.com','kcp',NULL,NULL,'http://lorempixel.com/150/150'),
	(13,'Sulav Neupane','sulav','male','AL','Fairfield','street','52557','1990','sulavneupane@gmail.com','Sulav1','2017 May 18','today','hello.com'),
	(14,'Dinesh Sapkota','dinesh','male','AL','Fairfield','street','52557','1980','dinesh@dinesh.com','Dinesh1','2017 May 18','today','hello.com'),
	(15,'Xitiz CP','xitizcp','male','AL','Lalitpur','Gwarko','97777','1995','xitiz@cp.xomm','kcpkcp1','2017 May 18','today','hello.com'),
	(18,'Kshitij Chandra Poudyal','Kahitashi','male','IA','Fairfield','MR 109, 1000 N 4TH ST','52556','1995','kcpoudyal@gmail.com','Kshitij1','2017 May 18','today','hello.com'),
	(20,'Prasanna Bajracharya','Prasanna','male','IA','Fairfield','MR 109, 1000 N 4TH ST','52556','1987','prasanna@gmail.com','Prasanna1','2017 May 18','today','hello.com'),
	(21,'Sushan Maharjan','Sushan','male','IA','Fairfield','MR 109, 1000 N 4TH ST','52556','1111','Sushan@gmail.com','Sushan1','2017 May 18','today','http://lorempixel.com/150/150'),
	(25,'test','test','male','AL','test','test','11111','1111','test@test.com','Testtest1','2017 May 18','today','http://lorempixel.com/150/150'),
	(26,'Prasanna Bajracharya','test','male','IA','Fairfield','test','52556','2002','test@test.com','Testtest1','2017 May 18','today','http://lorempixel.com/150/150');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
