/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.25-log : Database - zhuydemo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhuydemo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zhuydemo`;

/*Table structure for table `classment` */

DROP TABLE IF EXISTS `classment`;

CREATE TABLE `classment` (
  `id` varchar(36) NOT NULL COMMENT '班级id',
  `pid` varchar(36) NOT NULL COMMENT '院系id',
  `name` varchar(50) NOT NULL COMMENT '班级名称',
  `code` varchar(20) DEFAULT NULL COMMENT '班级编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classment` */

insert  into `classment`(`id`,`pid`,`name`,`code`) values ('1010','10','软件1402','01'),('1020','10','软件1403','02'),('1030','10','软件1401','03'),('1040','20','园林1401','01');

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `id` varchar(36) NOT NULL COMMENT '院系id',
  `name` varchar(100) NOT NULL COMMENT '院系名称',
  `code` varchar(20) DEFAULT NULL COMMENT '院系编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `faculty` */

insert  into `faculty`(`id`,`name`,`code`) values ('10','计算机系','01'),('20','园林系','02');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(36) NOT NULL DEFAULT '10' COMMENT '学生id',
  `pid` varchar(36) NOT NULL COMMENT '班级id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `age` varchar(10) DEFAULT NULL COMMENT '年龄',
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`pid`,`name`,`age`,`code`) values ('04c67a81-77b6-11e9-b82f-382c4a64e546','1020','鞍山市','25',NULL),('101010','1010','朱勇','26','001'),('101020','1010','李小芳','23','002'),('2324a730-77b7-11e9-b82f-382c4a64e546','1020','b','25',NULL),('2b2a690f-77b2-11e9-b82f-382c4a64e546','1020','杨贵妃','2014',NULL),('53a558b6-77b2-11e9-b82f-382c4a64e546','1020','神马','20',NULL),('8b04ae73-77b5-11e9-b82f-382c4a64e546','1020','试试','252',NULL),('b2842a66-786f-11e9-b87c-382c4a64e546','1010','高诗琴','23',NULL),('eba85cd5-77b1-11e9-b82f-382c4a64e546','101020','贵妃','25',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
