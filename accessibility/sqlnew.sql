/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.5.62 : Database - news
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `news`;

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `categoryId` int(32) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

/*Data for the table `t_category` */

insert  into `t_category`(`categoryId`,`categoryName`) values 
(1,'今日头条'),
(2,'综合资讯'),
(3,'国内新闻'),
(4,'国际新闻');

/*Table structure for table `t_news` */

DROP TABLE IF EXISTS `t_news`;

CREATE TABLE `t_news` (
  `newsId` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `contentTitle` varchar(120) DEFAULT NULL,
  `titlePicUrl` varchar(120) DEFAULT NULL,
  `content` text,
  `contentAbstract` varchar(300) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `categoryId` int(32) DEFAULT NULL,
  `userId` int(32) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  `clicks` int(32) DEFAULT NULL,
  `publishStatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`newsId`),
  KEY `categoryId` (`categoryId`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_news_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `t_category` (`categoryId`),
  CONSTRAINT `t_news_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

/*Data for the table `t_news` */

insert  into `t_news`(`newsId`,`title`,`contentTitle`,`titlePicUrl`,`content`,`contentAbstract`,`keywords`,`categoryId`,`userId`,`author`,`publishTime`,`clicks`,`publishStatus`) values 
(1,'第一条新闻','这是第一条新闻','d:\\ddds\\dsd','各位老师，节日好！\n       \r\n义务教育幼升小工作开始启动，由于今年能否邀请到区教委有关负责人来学校开宣讲会，还不确定！所以现将此通知及统计表发给大家。\n     \r\n  \r\n符合就读垂杨柳中心小学本部和垂杨柳中心小学劲松分校（原劲松四小）入学条件的教职工（户口、房产、实际居住地对应的是这两所小学），如需校工会出面协调入学工作，请注意以下几点：\r\n\n\r\n1、5月3日中午午12:00前将情况说明材料和摸排统计信息表（(附件1、附件2）发给我，邮箱地址wangzhaoming@bjut.edu.cn，汇总后将于5月3日下午上报给校工会。\n\r\n\r\n2、小学入学（垂杨柳中心小学本部、垂杨柳中心小学劲松分校）咨询校工会张老师010-67392554、13683689811；潘老师010-67396145、15201141082。小学升初中（北工大实验学校）咨询周老师18800054300,67392690。\r\n\n\r\n3、需要特别说明的是，由于政策原因，本次摸排统计工作，以及后续开展的协调工作不能保证最终结果，学校在这项工作中没有话语权和决定权，完全按照《北京市关于2020年义务教育阶段入学工作的意见》。请教职工认真学习掌握教委文件要求，有关政策和流程可登陆朝阳区招生考试中心网站了解：\r\n\r\n朝阳区教委http://edu.bjchy.gov.cn,朝阳区招生考试中心http://www.cyks.org.cn，电话85967525。','第一条新闻的概要','第一条',1,1,'王丹丹','2020-07-01 19:48:02',100,'1'),
(2,'第二条新闻','这是第二条新闻','d:\\ddds\\dsd2','的防守打法佛挡杀佛神鼎飞丹砂\r\ndsfds\r\n\r\n的发生发生\r\n\r\n的防守打法是发生','第二条新闻的概要','第二条',2,2,'那金宇','2020-07-15 19:51:25',200,'1');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `roleId` int(32) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

/*Data for the table `t_role` */

insert  into `t_role`(`roleId`,`roleName`) values 
(1,'管理员'),
(2,'用户');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(32) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `loginName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `roleId` int(32) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`userName`,`loginName`,`password`,`roleId`,`tel`,`registerTime`,`status`) values 
(1,'张三','zhs','1234',1,'13651098291','2020-07-01 19:43:19','2'),
(2,'李四','ls','1234',1,'13922228200','2020-08-16 17:17:27','2'),
(3,'王五','ww','567890',2,'13423428291','2020-07-31 19:53:52','2'),
(4,'刘小','liux','123456',2,'13541791555','2020-07-31 19:54:56','2'),
(5,'222222','222','222222',2,'13541791666','2020-08-09 01:22:18','2'),
(6,'xinxin','xinxin','xinxin',1,'12541791902','2020-08-16 17:18:10','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
