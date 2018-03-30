/*
SQLyog Ultimate v9.20 
MySQL - 5.1.12-beta-community-nt : Database - sm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `sm`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_admin` (`uid`),
  CONSTRAINT `FK_admin` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `admin` */

insert  into `admin`(`id`,`a_name`,`password`,`uid`) values (1,'1','2',6),(2,'1','1',6),(3,'2','2',6),(4,'3','3',6),(5,'123','123',6),(6,'122','123',15),(7,'123','123',15),(8,'123','234',15),(9,'234','234',15),(10,'234','234',15),(12,'234234','23423',1);

/*Table structure for table `clas` */

DROP TABLE IF EXISTS `clas`;

CREATE TABLE `clas` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `clasname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `clas` */

insert  into `clas`(`id`,`clasname`,`num`) values (1,'软件1515',34),(2,'软件1516',23);

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `questionid` int(30) DEFAULT NULL,
  `question` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choiceA` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choiceB` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choiceC` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choiceD` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fs` int(10) DEFAULT NULL,
  `anwser` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exam` */

insert  into `exam`(`id`,`questionid`,`question`,`choiceA`,`choiceB`,`choiceC`,`choiceD`,`fs`,`anwser`) values (1,1,'1+1=？','1','2','3','4',1,'b'),(2,2,'2+2=？','2','4','6','8',1,'b'),(3,3,'3+3=?','3','9','6','10',1,'c');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `adminid` int(37) DEFAULT NULL,
  `clasid` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user` (`adminid`),
  KEY `FK_clas` (`clasid`),
  CONSTRAINT `FK_clas` FOREIGN KEY (`clasid`) REFERENCES `clas` (`id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`phone`,`adminid`,`clasid`) values (1,'111','111',111,1,1),(2,'222','222',222,2,2),(6,'1','1',1,1,1),(9,'2','111',123,2,1),(10,'2','111',123,2,2),(12,'2','111',1,2,1),(13,'2','111',123,1,1),(14,NULL,'123123',123,2,2),(15,NULL,'1111',123,2,2),(16,NULL,'111',123,1,2),(17,'111','111',111,2,1),(18,'12333','3312',123,2,2),(19,'1','123',4,1,2),(20,'12','12',12,1,1),(21,'123223','234234234',123123123,1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
