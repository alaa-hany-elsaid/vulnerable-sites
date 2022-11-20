-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clinics_rooms`
--

DROP TABLE IF EXISTS `clinics_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics_rooms` (
  `department_id` int NOT NULL,
  `room_id` int NOT NULL,
  `build_no` int NOT NULL,
  `floor_no` varchar(60) NOT NULL,
  `room_no` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `clinics_rooms_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics_rooms`
--

LOCK TABLES `clinics_rooms` WRITE;
/*!40000 ALTER TABLE `clinics_rooms` DISABLE KEYS */;
INSERT INTO `clinics_rooms` VALUES (1,100,1,'الأرضى',1),(1,101,1,'الأرضى',2),(2,200,1,'الأرضى',3),(2,201,1,'الأرضى',4),(3,300,1,'الأرضى',5),(3,301,1,'الأرضى',6),(4,400,1,'الأرضى',7),(4,401,1,'الأرضى',8),(5,500,1,'الأرضى',9),(5,501,1,'الأرضى',10),(6,600,1,'الأرضى',11),(6,601,1,'الأرضى',12),(7,700,1,'الأرضى',13),(7,701,1,'الأرضى',14),(8,800,2,'الأرضى',15),(8,801,2,'الأرضى',16),(9,900,2,'الأرضى',17),(9,901,2,'الأرضى',18),(10,1000,2,'الأرضى',19),(10,1001,2,'الأرضى',20),(11,2000,2,'الأرضى',21),(11,2001,2,'الأرضى',22),(12,3000,2,'الأرضى',23),(12,3001,2,'الأرضى',24);
/*!40000 ALTER TABLE `clinics_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_fees`
--

DROP TABLE IF EXISTS `department_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_fees` (
  `department_id` int NOT NULL,
  `fees_id` int NOT NULL,
  `doc_type` varchar(20) NOT NULL,
  `fees` float NOT NULL,
  PRIMARY KEY (`fees_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `department_fees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_fees`
--

LOCK TABLES `department_fees` WRITE;
/*!40000 ALTER TABLE `department_fees` DISABLE KEYS */;
INSERT INTO `department_fees` VALUES (1,10,'اخصائى',100),(1,11,'استشارى',205),(2,20,'استشارى',220),(2,21,'اخصائى',105),(3,30,'استشارى',208),(3,31,'اخصائى',99),(4,40,'استشارى',240),(4,41,'اخصائى',150),(5,50,'استشارى',180),(5,51,'اخصائى',100),(6,60,'استشارى',220),(6,61,'اخصائى',140),(7,70,'استشارى',160),(7,71,'اخصائى',89),(8,80,'استشارى',170),(8,81,'اخصائى',100),(9,90,'استشارى',180),(9,91,'اخصائى',140),(10,100,'استشارى',110),(10,101,'اخصائى',65),(11,200,'استشارى',200);
/*!40000 ALTER TABLE `department_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(30) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'قسم القلب'),(2,'قسم الباطنه'),(3,'قسم الانف والأذن'),(4,'قسم النساء والتوليد'),(5,'قسم العظام'),(6,'قسم النفسيه والعصبية'),(7,'قسم الاطفال'),(8,'قسم المسالك البولية'),(9,'قسم جلدية وتناسلية'),(10,'قسم عيون و رمد'),(11,'قسم الاسنان'),(12,'قسم التخدير'),(13,'قسم التحاليل'),(14,'قسم الاشعه');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_appoint`
--

DROP TABLE IF EXISTS `doctor_appoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_appoint` (
  `doctor_id` int NOT NULL,
  `app_id` int NOT NULL,
  `day` date NOT NULL,
  `from_h` time(6) NOT NULL,
  `to_h` time(6) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `doctor_appoint_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_appoint`
--

LOCK TABLES `doctor_appoint` WRITE;
/*!40000 ALTER TABLE `doctor_appoint` DISABLE KEYS */;
INSERT INTO `doctor_appoint` VALUES (10487623,123,'0000-00-00','10:00:00.000000','06:00:00.000000'),(123478922,124,'0000-00-00','11:00:00.000000','07:00:00.000000');
/*!40000 ALTER TABLE `doctor_appoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_id` int NOT NULL,
  `department_id` int NOT NULL,
  `F_name` varchar(20) NOT NULL,
  `M_name` varchar(20) NOT NULL,
  `L_name` varchar(20) NOT NULL,
  `img` blob NOT NULL,
  `doctor_type` varchar(20) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `office_no` int NOT NULL,
  `clinic_room_id` int NOT NULL,
  `phone` varchar(11) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `department_id` (`department_id`),
  KEY `room_doc_id` (`office_no`),
  KEY `clinic_room_id` (`clinic_room_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`office_no`) REFERENCES `doctors_room` (`room_doc_id`),
  CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`clinic_room_id`) REFERENCES `clinics_rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (8228844,12,'تامر','هانى','ميشيل','','استشارى','استشارى تخدير',12,3000,'01020369874','tamerhany528@gmail.com','$2y$10$M37HJe3bLqje6V7PiFNq/un.3/0kKDVAJ/RU6.e1fk8Mbq2ibH2pm'),(8514584,10,'احمد','عمار','هانى','','اخصائى',' اخصائى عيون',10,1000,'01120369874','ahmedamar369@gmail.com','$2y$10$WqdEkDKONJ0bQphr0zC0OuzTbEMboUZSjsRWdqx5hP8uHOo4C2Hfq'),(10487623,7,'ابراهيم ','ابراهيم ','الصواف','','استشارى','استشارى طب اطفال',19,701,'01236985471','ibrahem7453@gmail.com','$2y$10$4ROXrsv/FdhjY9sSIDPotuPfRBFCO29qyODbdF.M5WCV0EOGfyhMa'),(12356849,9,'سميره','محمد','فوزى','','اخصائى','اخصائى جلدية و تناسليه',9,900,'01515263478','samira853@gmail.com','$2y$10$drsw6JfBGgX7RmEwxg9FMePi0sRZAxeE96q6am/fkU.3ObMDvWhSa'),(23559961,11,'هاشم','سامر','شبل','','استشارى','استشارى اسنان وتجميل اسنان',11,2000,'01020506030','hashemsamr123@gmail.com','$2y$10$OGop47CjRg8l3wzPkokbbOnMlR7/tjjZiVXLX.KurkQ.GamoXrYuy'),(25741369,2,'هشام','السيد','اياد','','استشارى','استشارى باطنه وكبد',2,200,'01125203164','eyad135@gmail.com','$2y$10$sta6vmUQPUtdzuHnz5Lt..GE0EyyCrEoVw5oybbXrHNBu5V4q0YLm'),(25893715,5,'السيد','هاشم','عامر','','استشارى','استشارى عظام و كسور',5,501,'01236987415','elsayedhashem125@gmail.com','$2y$10$o2EpFtZj.gzeCUsoR1C/VuMMuYyx9KorR0czKlEgQ2pF39pWOYwIq'),(30620008,12,'غانم','محمد ','محمد ','','اخصائى','اخصائى تخدير',12,3000,'01212141516','ganemsamy258@gmail.com','$2y$10$mJ1Mb1NLpDI.0oGsSsiVh.Eelc5H7Qht/b4nl97cS9/L0ZhC.9Awq'),(52733188,10,'فاتن','سعيد','جرجس','','اخصائى',' اخصائى عيون',10,1001,'01254698741','fatensaid173@gmail.com','$2y$10$ybmVwLVy6FgZCBwVT6dvoOkwSl..saAABrjpDV2IXUg4tO82rSY9a'),(52793166,8,'فاتن','محمد','الطوخى','','اخصائى','اخصائى مسالك بوليه',8,800,'01036987452','fatenmohamed357@gmail.com','$2y$10$QvYxMq2Nm6Lo6wF0gi9BB.nZf0e1rKeo1G0pHUOPWc4jFwGSitbI6'),(52793188,7,'فاتن','امل','حربى','','اخصائى','اخصائى اطفال',7,700,'01526398741','fatenaml147@gmail.com','$2y$10$xXfgtmQ9x8JGVapyd3JCq.OrIY3yltrD6iEWMW66rFgfiGmQeYD1.'),(57012346,7,'احمد','عمار','عزت','','اخصائى','اخصائى اطفال',7,701,'01526398755','ahmedamar258@gmail.com','$2y$10$klv1sGWEP.AN1NBV3fp.du2qCuecqwJHHiCAZ6WV7mdkwd.XqiiZC'),(65848265,6,'حسن','أحمد','الشيشينى','','استشارى','استشارى نفسيه وعصبيه و عمود فقارى',18,601,'01126398741','hassanahmed456@gmail.com','$2y$10$4Cs8PbcqFItszccof7x3ceeYlCujyPBIfU5UXcppH/exZjuczDJxa'),(82256489,9,'تامر','حبيب','عاصم','','استشارى','استشارى جلدية و تناسليه',9,901,'01236398741','tamerhabib258@gmail.com','$2y$10$gUQinH2OB0LFXqN3z.tXbuTlJWtmYLDUqVV4U5SnuDjFiGvzxMSba'),(94562178,9,'غانم','محمد ','سامى','','اخصائى','اخصائى جلدية و تناسليه',9,900,'01026398741','ganem856@gmail.com','$2y$10$5I6mrLfc4OdwXG4S/XqweO1hdHwPVpR12ECE9ehWiupROppkcg1K.'),(123478911,6,'عمرو ','سمير','عزت','','استشارى','استشارى نفسيه وعصبية وطب نفسى',6,600,'01236989522','amrsamir147@gmail.com','$2y$10$m6cLYjWW5FprICaEsfzTG.APwa.R/MiD3fWNKPmnzHf5GVytNJ0wO'),(123478922,4,'احمد','سامى','عزت','','اخصائى','اخصائى نساء و توليد',4,401,'01529398741','ahmedezat123@gmail.com','$2y$10$8eNVjabTVSaGIHVHHS6Y8eMLglgm7s1ieyZctiOGTChB5aSnjGjNK'),(126345789,2,'محمد','عماد','السيد','','استشارى','استشارى باطنه و قولون',14,201,'01529998741','mohamed258@gmail.com','$2y$10$juwW9iPaAAuQJ98i9J3wnO1oYu8Y2VspDY0od5R0Rk7ZQFAsOAs06'),(126589985,10,'سمير ','غانم','غانم','','استشارى','استشارى عيون',22,1001,'01526398555','samirganem25@gmail.com','$2y$10$WnFkBv9kMnroc3p0ghK5FuQwPZOF0ce/Z3MAetrHfFHBwwh2.Lsr6'),(147536948,3,'سارة','عماد','السيد','','استشارى','استشارى انف و اذن',15,301,'01526222741','saraemad258@gmail.com','$2y$10$DitgO2L2o0GRZwFtPxjtz.Ci7Hkp.SU0fpfR8XlYiAJaUujBNC7Nq'),(147963258,2,'السعيد','محمد','ايمن','','اخصائى','اخصائى باطنه و قولون',2,201,'01526392741','ayman258@gmail.com','$2y$10$ZTdcTj/ZPBzDX.whoBwu.O1JKPToFSXJvkbimB4a/hkmHhRUasS86'),(159236741,3,'فاطمه','احمد','السيد','','استشارى','استشارى انف و اذن',3,300,'01526322741','fatma456@gmail.com','$2y$10$XxmkTnVx6zbxK7gwf8Vtu.IBQaJ.v9Fw6hOrlL.fmRLHY6W.3ES5G'),(189765354,8,'صفاء','فادى','السيد','','استشارى','استشارى مسالك بوليه',20,801,'01526398301','safaafdy951@gmail.com','$2y$10$Vdrh6ZMJX0s1r1TelBb0yunIetDHngPKCPdWs3ehH1K8oQuFKDY8e'),(258741963,2,'السيد ','عماد','السيد','','اخصائى','اخصائى باطنه و كبد',2,200,'01526398700','elsayedemad258@gmail.com','$2y$10$Wy3LymR8JnGRKrARd7Nnd.BDWdxi1DYGPEjZkaoJPckluwIB4yPby'),(287416952,5,'هانى','ميشيل','جرجس','','اخصائى','اخصائى عظام و عمود فقرى',5,500,'01526398500','hanymeshel148@gmail.com','$2y$10$2bQP8GfmQ5QVObbyg2umt.NbQqSOYdA7z.KC8syOG2eiyySeYmrqm'),(357489214,3,'احمد','غانم','الديب','','اخصائى','اخصائى انف واذن و حنجره',3,301,'01256478910','ahmedganem25@gmail.com','$2y$10$bE/3zJB2lbzWFcsE.9R8tuvNQcd4kiH8LnIImS06lDBVSSeJ/c0.m'),(369258147,1,'هاشم','محمد','الصواف','','اخصائى','اخصائى باطنه وقلب',1,100,'012354985','hashem852@gmail.com','$2y$10$IfAAEi7btlMUv8/6fS/5juDg.pzvlx6r81kLIjvJspI3dvj3FN5O2'),(425755145,4,'ابراهيم ','احمد','شبل','','استشارى','استشارى نساء و توليد',16,401,'0123964578','ibrahemshibl125@gmail.com','$2y$10$WDW8kQUFo1hMryVaVsiRE.tlGQrkQ24/oFJMy933krshCGVrSjed2'),(458712357,4,'هناء','محمد','الطوخى','','اخصائى','اخصائى نساء و توليد',4,400,'0159784361','hanaamohamed1258@gmail.com','$2y$10$8HTjz8rapWpElBSal4QwX.aazDb56m9o8Yaym7OTPJZack3GiWi7a'),(528763148,8,'سمير ','شبل','شبل','','استشارى','استشارى مسالك بوليه',8,800,'0123456952','samirshibl258@gmail.com','$2y$10$pyj3tmwCwqM9XCq6ZHH0QegbjGanTh5e4HRkQJWAU/nqNVxiWOkaG'),(715943008,11,'فاطمه','سيف','غانم','','استشارى','استشارى اسنان ',23,2001,'0403510083','seifganem354@gmail.com','$2y$10$zRCYWudhEypgvmjoYcI9repnIrkd2R/1Fgd/cGMWZt53OQ/cVL4yu'),(741085236,4,'صفاء','ابراهيم','فادى','','استشارى','استشارى نساء و توليد',4,400,'01003229631','safaaibrahem15@gmail.com','$2y$10$tQT7VR6OTp8vWzfd9g7lO.qlSw2L5eyTcsZ64hGtASMJrThY5hP4O'),(789456123,1,'هشام','احمد','احمد','','اخصائى','اخصائى قلب و اوعيه ',1,101,'01525963417','hesham235@gmail.com','$2y$10$FaIgS6jqyawJczjws8.J7.LZLrSuwjgKqvKDBCetzOPBhSTW1uzje'),(852147963,3,'شيماء','عماد','فادى','','اخصائى','اخصائى انف و اذن',3,300,'0152367456','shimaaemad125@gmail.com','$2y$10$z1Wv80EYt1u.1g2tCa.C9OTv8vJ0I8P0sJFsS.rrrh9CBRZAucf8O'),(852374171,5,'عامر','عمار','فادى','','اخصائى','اخصائى عظام و كسور',5,500,'01235879314','amaarfady128@gmail.com','$2y$10$9rQON01T290bPk4FKwUUtOx09N8oic8KEgbtowreQ.gTdymDpg9GK'),(945641212,12,'نادين','محمود','قطب','','استشارى','استشارى تخدير',24,3001,'040336611','nadeinmahmoud258@gmail.com','$2y$10$IX195qXKxs/dmOovtccVP.elabteV4UEqiB7sawvB/V3n.qoAg7.m'),(945648654,9,'تسنيم','سامر','حبيب','','استشارى','استشارى جلدية و تناسليه',21,901,'01060063670','tasnem585@gmail.com','$2y$10$Wviwazg9aJUoB/9f/aW8SOXH1Bbvn0l1QWdmrRjeHV13n3nu2pQKG'),(1237469855,11,'عامر','سامى','هانى','','اخصائى','اخصائى اسنان وتجميل',11,2000,'01234568521','amrsamy852@gmail.com','$2y$10$7NGk4DFUXwaODsL6.2ZFZ.u72dTdMVwpIXr12SVqzHexcnU99MLl6'),(1276541239,6,'هانى','سعيد','الطوخى','','اخصائى','اخصائى نفسيه و عصبيه',6,601,'01234568523','hany158@gmail.com','$2y$10$JsLZvFTsmByrJMvsHxSdie5b/SdrGTUugTM1Z.1.RsVjUtJW7lZjq'),(1472544698,6,'سمر','عماد','فادى','','اخصائى','اخصائيه نفسيه و عصبية',6,600,'01234568923','samar145@gmail.com','$2y$10$lUhJSUzptRbEBxJqY1Iv/eJHi0pyLH5zcKmEY4Hbazvxa76HRSdFK'),(1472583611,10,'صفاء','احمد','السيد','','استشارى','استشارى عيون',10,1000,'','safaaahmed258@gmail.com','$2y$10$vTmAseZEE6XW5d8ed3.AE.Xa7lCpp5MtAst9eSwjbrFKVdO8Hagti'),(1472583692,1,'محمد','ابراهيم','السيد','','استشارى','استشارى قلب و اوعيه ',13,101,'01321456891','ahmed456@gmail.com','$2y$10$1ku57dMXyp7y0CNCFPle4e3CYJT.xkscw7ZzREEbZYZxUgCMHTut6'),(1472583698,5,'سارة','ابراهيم','غانم','','استشارى','استشارى عظام و عمود فقرى',17,501,'0125874361','saraaibrahem852@gmail.com','$2y$10$NVUouE4OkU2J6droOhLxde1T0ycbg4U1FZPO772BL8vvM9GL5JS..'),(1485583698,7,'شيماء','سيف','السيد','','استشارى','استشارى اطفال',7,700,'0147258369','shimaaseif147@gmail.com','$2y$10$5w5DT.20prSq5Ld.kjngBuFdxGH0bi6WCg0nVXoF2ln11lrG2M7zq'),(1534789821,1,'سمير ','أحمد','شبل','','استشارى','استشارى باطنه وقلب',1,100,'01032283849','samir123@gmail.com','$2y$10$7z2q0MOE0XMH2ZwxNHEe5eWz2I/2BgWsfoJL/5igxxXdLlIX3QuYu');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors_booking`
--

DROP TABLE IF EXISTS `doctors_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors_booking` (
  `book_id` int NOT NULL,
  `doc_id` int NOT NULL,
  `department_id` int NOT NULL,
  `book_date` date NOT NULL,
  `book_time` time(6) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `department_id` (`department_id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `doctors_booking_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `doctors_booking_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors_booking`
--

LOCK TABLES `doctors_booking` WRITE;
/*!40000 ALTER TABLE `doctors_booking` DISABLE KEYS */;
INSERT INTO `doctors_booking` VALUES (123,369258147,1,'2022-04-12','10:00:00.000000');
/*!40000 ALTER TABLE `doctors_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors_room`
--

DROP TABLE IF EXISTS `doctors_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors_room` (
  `room_doc_id` int NOT NULL,
  `department_id` int NOT NULL,
  `building_doc_no` varchar(10) NOT NULL,
  `floor_doc_no` varchar(14) NOT NULL,
  `Room_doc_no` int NOT NULL,
  `doc_no` int NOT NULL,
  `room_type` varchar(70) NOT NULL,
  PRIMARY KEY (`room_doc_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `doctors_room_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors_room`
--

LOCK TABLES `doctors_room` WRITE;
/*!40000 ALTER TABLE `doctors_room` DISABLE KEYS */;
INSERT INTO `doctors_room` VALUES (1,1,'1','1',100,3,'دكتور'),(2,2,'1','2',101,3,'دكتور'),(3,3,'1','3',102,3,'دكتور'),(4,4,'1','4',103,3,'دكتور'),(5,5,'1','5',105,3,'دكتور'),(6,6,'1','6',106,3,'دكتور'),(7,7,'1','7',107,3,'دكتور'),(8,8,'2','1',108,2,'دكتور'),(9,9,'2','2',109,3,'دكتور'),(10,10,'2','3',110,3,'دكتور'),(11,11,'2','4',111,2,'دكتور'),(12,12,'2','5',112,3,'دكتور'),(13,1,'1','1',300,1,'مدير'),(14,2,'1','2',301,1,'مدير'),(15,3,'1','3',302,1,'مدير'),(16,4,'1','4',303,1,'مدير'),(17,5,'1','5',304,1,'مدير'),(18,6,'1','6',305,1,'مدير'),(19,7,'1','7',306,1,'مدير'),(20,8,'2','1',307,1,'مدير'),(21,9,'2','2',308,1,'مدير'),(22,10,'2','3',309,1,'مدير'),(23,11,'2','4',310,1,'مدير'),(24,12,'2','5',311,1,'مدير');
/*!40000 ALTER TABLE `doctors_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_patient`
--

DROP TABLE IF EXISTS `in_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_patient` (
  `department_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `nurse_id` int NOT NULL,
  `MRN` int NOT NULL,
  `in_patient_id` int NOT NULL,
  `in_F_name` varchar(30) NOT NULL,
  `in_M_name` varchar(30) NOT NULL,
  `in_L_name` varchar(30) NOT NULL,
  `room_no` int NOT NULL,
  `bed_no` int NOT NULL,
  `admission_date` date NOT NULL,
  `discharge_date` date NOT NULL,
  PRIMARY KEY (`in_patient_id`),
  KEY `department_id` (`department_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `MRN` (`MRN`),
  KEY `nurse_id` (`nurse_id`),
  CONSTRAINT `in_patient_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `in_patient_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `in_patient_ibfk_3` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_patient`
--

LOCK TABLES `in_patient` WRITE;
/*!40000 ALTER TABLE `in_patient` DISABLE KEYS */;
INSERT INTO `in_patient` VALUES (1,23559961,120364598,1,123489657,'محمد','خالد','السيد',1,1,'2022-02-25','2022-02-27'),(1,369258147,1223456789,3,147536981,'محمد','هاشم','جميل',2,5,'2022-05-07','2022-05-09'),(2,258741963,147963258,2,258741369,'سامر','خالد','جميل',10,3,'2022-06-22','2022-06-25');
/*!40000 ALTER TABLE `in_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intensive_care`
--

DROP TABLE IF EXISTS `intensive_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intensive_care` (
  `department_id` int NOT NULL,
  `intensive_id` int NOT NULL,
  `intensive_name` varchar(20) NOT NULL,
  `nurse_no` int NOT NULL,
  `building_no` int NOT NULL,
  `floor_no` int NOT NULL,
  PRIMARY KEY (`intensive_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `intensive_care_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intensive_care`
--

LOCK TABLES `intensive_care` WRITE;
/*!40000 ALTER TABLE `intensive_care` DISABLE KEYS */;
INSERT INTO `intensive_care` VALUES (1,100,'عناية القلب',5,1,1),(5,500,'عناية العظام',5,1,5);
/*!40000 ALTER TABLE `intensive_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intensive_care_room`
--

DROP TABLE IF EXISTS `intensive_care_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intensive_care_room` (
  `intensive_id` int NOT NULL,
  `nurse_id` int NOT NULL,
  `primarycare_id` int NOT NULL,
  `room_no` int NOT NULL,
  `bed_no` int NOT NULL,
  `available` varchar(20) NOT NULL,
  PRIMARY KEY (`primarycare_id`),
  KEY `intensive_id` (`intensive_id`),
  KEY `nurse_id` (`nurse_id`),
  CONSTRAINT `intensive_care_room_ibfk_1` FOREIGN KEY (`intensive_id`) REFERENCES `intensive_care` (`intensive_id`),
  CONSTRAINT `intensive_care_room_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intensive_care_room`
--

LOCK TABLES `intensive_care_room` WRITE;
/*!40000 ALTER TABLE `intensive_care_room` DISABLE KEYS */;
INSERT INTO `intensive_care_room` VALUES (100,1223456789,1,40,1,'متاح'),(100,213456879,2,40,2,'غير متاح');
/*!40000 ALTER TABLE `intensive_care_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory` (
  `department_id` int NOT NULL,
  `test_id` int NOT NULL,
  `test_name` varchar(80) NOT NULL,
  `test_name2` varchar(80) NOT NULL,
  `test_type` varchar(20) NOT NULL,
  `test_case` varchar(20) NOT NULL,
  `test_price` float NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `laboratory_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (13,1,'Hemoglobin Test  \r\n',' الهيموجلوبين\r\n','تحليل دم','صايم',50,1),(13,2,'Mean Corpuscular Volume Test  \r\n','تحليل متوسط حجم الكريات\r\n','تحليل دم','صايم',50,1),(13,3,'Platelet Count Test\r\n\r\n','تحليل الصفائح الدموية\r\n','تحليل دم','فاطر',70,1),(13,4,'White blood cells count\r\n','فحص تعداد خلايا الدم البيضاء','تحليل بول','صايم',70,1),(13,5,'Lymphocyte count\r\n','فحص تعداد الخلايا الليمفية','تحليل بول','صايم',40,1),(13,6,'Complete Blood Count Test','تحليل تعداد الدم الكامل','تحليل دم','صايم',100,1),(13,7,'Red Blood Cell Antibody Screen\r\n\r\n','تحليل الأجسام المضادة لكريات الدم الحمراء\r\n','تحليل دم','فاطر',80,1),(13,8,'Hematocrit Test\r\n','تحليل حجم الكريات الحمر المكدس','تحليل دم','صايم',50.5,1),(13,9,'Reticulocyte Count Test','تحليل تعداد الخلايا الشبكية\r\n','تحليل دم','فاطر-واعلا',97.6,1),(13,10,'Thyroid Stimulating Hormone Test-TSH','الهرمون المنبه للدرقية','تحليل دم','صايم',60,2),(13,11,'Thyroxine Test','الثايروكسين الحر','تحليل دم','صايم',70,2),(13,12,'Thyroid peroxidase antibodies','الأجسام المُضادة للبيروكسيداز الدرقي','تحليل دم','صايم-واعلام بالادويه',90,2),(13,13,'Triiodothyronine Test','تحليل هرمون ثلاثي يودو ثيرونين','تحليل دم','صايم',80,2),(13,14,'Thyroglobulin Test','اختبار الثايرو جلوبيولين','تحليل دم','صايم-واعلام بالادويه',100,2),(13,15,'Thyroxine-Binding Globulin\r\n','فحص الغلوبيولين الرابط للثيروكسين','تحليل دم','صايم',100,2),(13,16,'Gamma-Glutamyl Transpeptidase Test','تحليل ناقلة الببتيد غاما غلوتاميل','تحليل دم','صايم ثمانية ساعات',50,3),(13,17,'Alanine Transaminase Test','تحليل ناقلة امين الالانين','تحليل دم','فاطر-واعلام بالأدويه',70.7,3),(13,18,'Alkaline Phosphatase Test','تحليل انزيم الفوسفاتاز القلوي','تحليل دم','صايم',80.5,3),(13,19,'Aspartate Transaminase Test','تحليل ناقلة امين الاسبارتات','تحليل دم','فاطر-واعلام بالأدويه',51,3),(13,20,'Direct Bilirubin Test','تحليل البيليروبين المباشر في الدم','تحليل دم','فاطر-واعلام بالادويه',55,3),(13,21,'Bilirubin In Urine Test\r\n','تحليل البيليروبين','تحليل بول','صايم-واعلام بالأدوبة',77,3),(13,22,'Globulin Test','الجلوبيولين','تحليل دم','صايم',66,3),(13,23,'Microalbuminuria Test','تحليل الميكرو ألبومين في البول-وظائف كلى','تحليل بول','صايم-واعلام بالادويه',20,3),(13,24,'Blood Urea Test','تحليل اليوريا-وظائف كلى','تحليل دم','فاطر-واعلام بالادويه',40,3),(13,25,'Creatinine Blood Test','تحليل الكرياتينين في الدم-وظائف كلى','تحليل دم','فاطر-واعلام بالادويه',45,3),(13,26,'Uric Acid in Blood Test','تحليل حمض اليوريك-وظائف كلى','تحليل دم','صايم',33,3),(13,27,'Blood in urine test','الدم في البول','تحليل بول','صايم',40,3),(13,28,'Calcium in Urine Test','الكالسيوم في البول-وظائف كلى','تحليل بول','فاطر-واعلام بالادويه',35,3),(13,29,'Microalbumin Creatinine Ratio Test','الكالسيوم في البول-وظائف كلى','تحليل بول','فاطر',36.5,3),(13,30,'Albumin Urine Test','تحليل الزلال في البول-وظائف كلى','تحليل بول','فاطر',45,3),(13,31,'Parathyroid Hormone Test','فحص الهرمون الدريقي','تحليل بول','صايم',50,4),(13,32,'Cortisol test','فحص هرمون الكورتيزول','تحليل دم','فاطر',66,4),(13,33,'Aldosterone Test','تحليل الالدوستيرون','تحليل دم','فاطر-واعلام بالأدويه',80,4),(13,34,'Total Testosterone Test','تحليل التستوستيرون الكلي','تحليل دم','فاطر-واعلام بالأدوية',46,4),(13,35,'Prolactin Test\r\n','هرمون البرولاكتين\r\n','تحليل دم','صايم',55,4),(13,36,'Progesterone Test','تحليل البروجسترون','تحليل دم','فاطر-واعلام بالادويه',77,4),(13,37,'Estrogen Test','تحليل الاستروجين','تحليل دم','فاطر-واعلام بالأدويه',64,4),(13,38,'Testosterone Test','تحليل التستوستيرون','تحليل دم','فاطر-واعلام بالأدوية',70,4),(13,39,'Growth Hormone Test','تحليل هرمون النمو','تحليل دم','صايم',75,4),(13,40,'Lactate Dehydrogenase Test','تحليل نازعة هيدروجين اللاكتات','تحليلي بلازما دم','فاطر',45,4),(13,41,'Ceruloplasmin','سيروبلازمين\r\n','تحليل دم','فاطر',80,4),(13,42,'Phenylketonuria (PKU) Screening','مرض بيلة فينيل كيتون','تحليل دم','فاطر',70,4),(13,43,'5\'-Nucleotidase Test','تحليل 5- نوكليوتيداز','تحليل دم','فاطر-واعلام بالأدوية',75,4),(13,44,'Glucose-6-Phosphate Dehydrogenase Test','تحليل نازعة هيدروجين الجلوكوز-6-فوسفات','تحليل دم','فاطر',57,4),(13,45,'Rheumatoid Factor Test','تحليل العامل الروماتويدي\r\n','تحليل دم','فاطر',50,5),(13,46,'CD4 Lymphocyte Count','عدد الخلايا اللمفاويةCD4','تحليل دم','فاطر',45,5),(13,47,'Adenovirus and Rotavirus','فحص فيروسة الحمة الغدانية والفيروسة العجلية','تحليل براز','فاطر',46,5),(13,48,'Helicobacter Pylori Antibodies ( IgA )','فحص الاجسام المُضادة IgA للبكتيريا الملوية البابية','تحليل بول','فاطر',47.2,5),(13,49,'Urine PH','فحص الرقم الهيدروجيني للبول','تحليل بول','فاطر',40,6),(13,50,'ketones in urine','الكيتونات في البول','تحليل بول','صايم',36,6),(13,51,'Urine red blood cells','فحص خلايا الدم الحمراء في البول','تحليل بول','صايم-الميعاد صباح ال',27,6),(13,52,'Urine white blood cells','خلايا الدم البيضاء في البول','تحليل بول','فاطر',33,6),(13,53,'Nitrites in Urine','فحص النيتريت في البول','تحليل بول','صايم',32,6),(13,54,'Kidney Stone Analysis','تحليل حصى الكلى','تحليل بول','فاطر',26,6),(13,55,'Urobilinogen in Urine','يوروبيلينوجين في البول\r\n','تحليل بول','صايم',22,6),(13,56,'Stool mucus\r\n','فحص المخاط في البراز','تحليل براز','فاطر',33,6),(13,57,'Stool blood','فحص الدم في البراز','تحليل براز','فاطر',34,6),(13,58,'Stool white blood cells','فحص خلايا الدم البيضاء في البراز','تحليل براز','فاطر',45.2,6),(13,59,'Stool parasite','الطفيليات في البراز','تحليل براز','فاطر',33,6),(13,60,'Fecal Occult Blood Test','فحص الدم الخفي في البراز','تحليل براز','صايم-واعلام بالادويه',35,6),(13,61,'Total Calcium Test','الكالسيوم\r\n','تحليل دم','صايم',76,7),(13,62,'Ionized Calcium Test\r\n','الكالسيوم المتأين','تحليل دم','صايم-واعلام بالأدوبة',70,7),(13,63,'Magnesium Blood Test','تحليل المغنيسيوم في الدم','تحليل دم','فاطر-واعلام بالأدوية',80,7),(13,64,'Ferritin Test\r\n','الفيريتين\r\n','تحليل دم','صايم',66,8),(13,65,'Serum Iron Test','الحديد\r\n','تحليل دم','صايم-واعلام بالأدوبة',70,8),(13,66,'Total Iron Binding Capacity','فحص السعة الرابطة الكلية للحديد','بلازما الدم','صايم ثمانية ساعات',35,8),(13,67,'Transferrin Test','تحليل الترانسفيرين في الدم','تحليل دم','صايم',55,8),(13,68,'Transferrin Saturation Test\r\n','فحص إشباع الترانسفيرين','تحليل بلازما الدم','صايم',80,8),(13,69,'Urine pregnancy test','فحص الحمل في البول','تحليل بول','فاطر',70,9),(13,70,'Down Syndrome Tests\r\n','فحص متلازمة داون','تحليل دم','فاطر',100,9),(13,71,'Karyotype Genetic Test\r\n','اختبار الوراثة النووي','تحليل دم','فاطر',70,9),(13,72,'Red Blood Cell Antibody Screen','تحليل الأجسام المضادة لكريات الدم الحمراء','تحليل دم','فاطر',80,9),(13,73,'Hemoglobin Test in Pregnancy','تحليل الهيموجلوبين للحامل','تحليل دم','فاطر',57,9),(13,74,'Glucose Tolerance Test for Gestational Diabetes','اختبار تحمل الجلوكوز للحامل','تحليل دم','صايم',100,9),(13,75,'Fungal Culture Test','تحليل زراعة الفطريات','اجزاء الجسم','فاطر',150,10),(13,76,'Yeast Infection Tests\r\n','اختبارات عدوى الخميرة','عينه تفرازات المهبل','فاطر',120,10),(13,77,'Sputum Fungal Smear','فحص مسحة الفطريات للبلغم','--','فاطر',150,10),(13,78,'Bicarbonate\r\n','بيكربونات الدم\r\n','تحليل دم','فاطر',70,11),(13,79,'Folic Acid Test','فولات','تحليل بلازما دم','صايم',77,12),(13,80,'Vitamin B12 Test','فحص فيتامين ب 12\r\n','تحليل دم','صايم',50,12),(13,81,'Vitamin D Test','فيتامين د','تحليل دم','صايم',66,12),(13,83,'Homocysteine Test','الهوموسيستين\r\n','تحليل دم','صايم',50,12),(13,84,'Vitamin E Test','فيتامين هـ (توكوفيرول)\r\n','تحليل دم','صايم',53.2,12),(13,85,'Vitamin C Test','فيتامين سي\r\n','تحليل دم','صايم',60,12);
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_rooms`
--

DROP TABLE IF EXISTS `nurse_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse_rooms` (
  `nurse_room_id` int NOT NULL,
  `department_id` int NOT NULL,
  `building_no` int NOT NULL,
  `floor_no` int NOT NULL,
  `room_no` int NOT NULL,
  `nurses_count` int NOT NULL,
  PRIMARY KEY (`nurse_room_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `nurse_rooms_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_rooms`
--

LOCK TABLES `nurse_rooms` WRITE;
/*!40000 ALTER TABLE `nurse_rooms` DISABLE KEYS */;
INSERT INTO `nurse_rooms` VALUES (1,1,1,1,30,5),(2,2,1,2,31,4),(3,3,1,3,32,4),(4,4,1,4,33,4),(5,5,1,5,34,5),(6,6,1,6,35,5),(7,7,1,7,36,4),(8,8,2,1,37,5),(9,9,2,2,38,3);
/*!40000 ALTER TABLE `nurse_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `nurse_id` int NOT NULL,
  `department_id` int NOT NULL,
  `nurse_name` varchar(250) NOT NULL,
  `supervisor_doctor` int NOT NULL,
  `nurse_type` varchar(250) NOT NULL,
  `nurse_phone` int NOT NULL,
  `room_no` int NOT NULL,
  PRIMARY KEY (`nurse_id`),
  KEY `department_id` (`department_id`),
  KEY `supervisor_doctor` (`supervisor_doctor`),
  KEY `room_no` (`room_no`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `nurses_ibfk_2` FOREIGN KEY (`supervisor_doctor`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `nurses_ibfk_3` FOREIGN KEY (`room_no`) REFERENCES `nurse_rooms` (`nurse_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (120364598,1,'سالمه محمد على',1534789821,'تمريض',1124567893,1),(147963258,1,'هاله احمد',369258147,'اشراف تمريض',147528963,1),(213456879,1,'صافى محمد هاشم',369258147,'تمريض',1523467891,1),(321456789,2,'تهانى السيد ياسر',258741963,'تمريض',1124567852,2),(369852147,1,'سهيله السيد عامر',1534789821,'تمريض',1032258832,1),(1223456789,1,'اميره هندى السيد',1534789821,'تمريض',12385467,1);
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `out_patient`
--

DROP TABLE IF EXISTS `out_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `out_patient` (
  `department_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `out_prescrip_id` int NOT NULL,
  `out_patient_id` int NOT NULL,
  `F_pat_name` varchar(40) NOT NULL,
  `M_pat_name` varchar(40) NOT NULL,
  `L_pat_name` varchar(40) NOT NULL,
  `visiting_no` int NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `payment_val` float NOT NULL,
  PRIMARY KEY (`out_patient_id`),
  KEY `department_id` (`department_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `prescrip_id` (`out_prescrip_id`),
  CONSTRAINT `out_patient_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `out_patient_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_patient`
--

LOCK TABLES `out_patient` WRITE;
/*!40000 ALTER TABLE `out_patient` DISABLE KEYS */;
INSERT INTO `out_patient` VALUES (2,258741963,1,18963457,'نادين ','محمود','قطب',2,'0000-00-00','12:00:00.000000',140),(1,1534789821,2,147258369,'نادين ','محمد','على',1,'0000-00-00','10:00:00.000000',210);
/*!40000 ALTER TABLE `out_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpatient_prescription`
--

DROP TABLE IF EXISTS `outpatient_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outpatient_prescription` (
  `out_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `out_prescrip_id` int NOT NULL,
  `doct_name` varchar(50) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `treatment` varchar(300) NOT NULL,
  `test_rad` varchar(100) NOT NULL,
  PRIMARY KEY (`out_prescrip_id`),
  KEY `out_patient_id` (`out_patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `outpatient_prescription_ibfk_1` FOREIGN KEY (`out_patient_id`) REFERENCES `out_patient` (`out_patient_id`),
  CONSTRAINT `outpatient_prescription_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient_prescription`
--

LOCK TABLES `outpatient_prescription` WRITE;
/*!40000 ALTER TABLE `outpatient_prescription` DISABLE KEYS */;
INSERT INTO `outpatient_prescription` VALUES (18963457,258741963,1,'السيد','DIABETES DIAGNOSIS','DIAMICRRRON\r\nDXCHGVNYJH','X-RAY');
/*!40000 ALTER TABLE `outpatient_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpatient_radiology`
--

DROP TABLE IF EXISTS `outpatient_radiology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outpatient_radiology` (
  `outpatient_ray_id` int NOT NULL,
  `ray_id` int NOT NULL,
  `out_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `ray_results` varchar(400) NOT NULL,
  PRIMARY KEY (`outpatient_ray_id`),
  KEY `out_patient_id` (`out_patient_id`),
  KEY `out_ray` (`ray_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `outpatient_radiology_ibfk_1` FOREIGN KEY (`out_patient_id`) REFERENCES `out_patient` (`out_patient_id`),
  CONSTRAINT `outpatient_radiology_ibfk_2` FOREIGN KEY (`ray_id`) REFERENCES `radiology` (`ray_id`),
  CONSTRAINT `outpatient_radiology_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient_radiology`
--

LOCK TABLES `outpatient_radiology` WRITE;
/*!40000 ALTER TABLE `outpatient_radiology` DISABLE KEYS */;
INSERT INTO `outpatient_radiology` VALUES (2,123,147258369,82256489,'SDFGHJKL'),(3,124,147258369,126589985,'ASDFGHHJK');
/*!40000 ALTER TABLE `outpatient_radiology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpatient_test`
--

DROP TABLE IF EXISTS `outpatient_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outpatient_test` (
  `outpatient_test_id` int NOT NULL,
  `test_id` int NOT NULL,
  `out_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `results` varchar(500) NOT NULL,
  PRIMARY KEY (`outpatient_test_id`),
  KEY `out_patient_id` (`out_patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `out_test` (`test_id`),
  CONSTRAINT `outpatient_test_ibfk_1` FOREIGN KEY (`out_patient_id`) REFERENCES `out_patient` (`out_patient_id`),
  CONSTRAINT `outpatient_test_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `laboratory` (`test_id`),
  CONSTRAINT `outpatient_test_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient_test`
--

LOCK TABLES `outpatient_test` WRITE;
/*!40000 ALTER TABLE `outpatient_test` DISABLE KEYS */;
INSERT INTO `outpatient_test` VALUES (1,17,18963457,357489214,'jgtrsedcvgbhjnkml'),(2,32,147258369,945648654,'ASDFGVHBJNKML');
/*!40000 ALTER TABLE `outpatient_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_radiology`
--

DROP TABLE IF EXISTS `patient_radiology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_radiology` (
  `inpatient_ray_id` int NOT NULL,
  `ray_id` int NOT NULL,
  `in_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `ray_results` varchar(100) NOT NULL,
  PRIMARY KEY (`inpatient_ray_id`),
  KEY `patient_id` (`in_patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `ray_id` (`ray_id`),
  CONSTRAINT `patient_radiology_ibfk_1` FOREIGN KEY (`ray_id`) REFERENCES `radiology` (`ray_id`),
  CONSTRAINT `patient_radiology_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `patient_radiology_ibfk_3` FOREIGN KEY (`in_patient_id`) REFERENCES `in_patient` (`in_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_radiology`
--

LOCK TABLES `patient_radiology` WRITE;
/*!40000 ALTER TABLE `patient_radiology` DISABLE KEYS */;
INSERT INTO `patient_radiology` VALUES (1,123,258741369,123478922,'iguiftgdtgfdthfgvhmvu'),(2,123,123489657,147963258,'tdexcgfghjkml.jihgfdsawsedrftgh');
/*!40000 ALTER TABLE `patient_radiology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_rooms`
--

DROP TABLE IF EXISTS `patient_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_rooms` (
  `department_id` int NOT NULL,
  `patient_room_id` int NOT NULL AUTO_INCREMENT,
  `bulding_no` int NOT NULL,
  `floor_no` int NOT NULL,
  `room_no` int NOT NULL,
  `bed_no` int NOT NULL,
  `room_type` varchar(30) NOT NULL,
  PRIMARY KEY (`patient_room_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `patient_rooms_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_rooms`
--

LOCK TABLES `patient_rooms` WRITE;
/*!40000 ALTER TABLE `patient_rooms` DISABLE KEYS */;
INSERT INTO `patient_rooms` VALUES (1,1,1,1,1,1,'فردي'),(1,2,1,1,2,1,'فردي'),(1,3,1,1,3,1,'فردي'),(1,4,1,1,4,1,'فردي'),(1,5,1,1,5,1,'فردي'),(1,6,1,1,6,1,'زوجي'),(1,7,1,1,6,2,'زوجي'),(1,8,1,1,7,1,'زوجي'),(1,9,1,1,7,2,'زوجي'),(1,10,1,1,9,1,'زوجي'),(1,11,1,1,9,2,'زوجي'),(1,12,1,1,10,1,'زوجي'),(1,13,1,1,10,2,'زوجي'),(1,14,1,1,11,1,'عنبر'),(1,15,1,1,11,2,'عنبر'),(1,16,1,1,11,3,'عنبر'),(1,17,1,1,11,4,'عنبر'),(1,18,1,1,11,5,'عنبر'),(1,19,1,1,12,1,'عنبر'),(1,20,1,1,12,2,'عنبر'),(1,21,1,1,12,3,'عنبر'),(1,22,1,1,12,4,'عنبر'),(2,23,1,2,1,1,'فردي'),(2,24,1,2,2,1,'فردي'),(2,25,1,2,3,1,'فردي'),(2,26,1,2,4,1,'فردي'),(2,27,1,2,5,1,'فردي'),(2,28,1,2,6,1,'زوجي'),(2,29,1,2,6,2,'زوجي'),(2,30,1,2,7,1,'زوجي'),(2,31,1,2,7,2,'زوجي'),(2,32,1,2,8,1,'زوجي'),(2,33,1,2,8,2,'زوجي'),(2,34,1,2,9,1,'زوجي'),(2,35,1,2,9,2,'زوجي'),(2,36,1,2,10,1,'عنبر'),(2,37,1,2,10,2,'عنبر'),(2,38,1,2,10,3,'عنبر'),(2,39,1,2,10,4,'عنبر'),(3,40,1,3,1,1,'فردي'),(3,41,1,3,2,1,'فردي'),(3,42,1,3,3,1,'فردي'),(3,43,1,3,4,1,'فردي'),(3,44,1,3,5,1,'فردي'),(3,45,1,3,6,1,'زوجي'),(3,46,1,3,6,2,'زوجي'),(3,47,1,3,7,1,'زوجي'),(3,48,1,3,7,2,'زوجي'),(3,49,1,3,8,1,'زوجي'),(3,50,1,3,8,2,'زوجي'),(3,51,1,3,9,1,'زوجي'),(3,52,1,3,9,2,'زوجي'),(3,53,1,3,10,1,'زوجي'),(3,54,1,3,10,2,'زوجي'),(3,55,1,3,11,1,'عنبر'),(3,56,1,3,11,2,'عنبر'),(3,57,1,3,11,3,'عنبر'),(3,58,1,3,11,4,'عنبر'),(4,59,1,4,1,1,'فردي'),(4,60,1,4,2,1,'فردي'),(4,61,1,4,3,1,'فردي'),(4,62,1,4,4,1,'فردي'),(4,63,1,4,5,1,'فردي'),(4,64,1,4,6,1,'زوجي'),(4,65,1,4,6,2,'زوجي'),(4,66,1,4,7,1,'زوجي'),(4,67,1,4,7,2,'زوجي'),(4,68,1,4,8,1,'زوجي'),(4,69,1,4,8,2,'زوجي'),(4,70,1,4,9,1,'زوجي'),(4,71,1,4,9,2,'زوجي'),(4,72,1,4,10,1,'زوجي'),(4,73,1,4,10,2,'زوجي'),(4,74,1,4,11,1,'عنبر'),(4,75,1,4,11,2,'عنبر'),(4,76,1,4,11,3,'عنبر'),(4,77,1,4,11,4,'عنبر'),(5,78,1,5,2,1,'فردي'),(5,79,1,5,3,1,'فردي'),(5,80,1,5,4,1,'فردي'),(5,81,1,5,5,1,'فردي'),(5,82,1,5,6,1,'زوجي'),(5,83,1,5,6,2,'زوجي'),(5,84,1,5,7,1,'زوجي'),(5,85,1,5,7,2,'زوجي'),(5,86,1,5,8,1,'زوجي'),(5,87,1,5,8,2,'زوجي'),(5,88,1,5,9,1,'زوجي'),(5,89,1,5,9,2,'زوجي'),(5,90,1,5,10,1,'زوجي'),(5,91,1,5,10,2,'زوجي'),(5,92,1,5,11,1,'عنبر'),(5,93,1,5,11,2,'عنبر'),(5,94,1,5,11,3,'عنبر'),(5,95,1,5,11,4,'عنبر'),(4,96,1,4,2,1,'فردي'),(6,97,1,6,3,1,'فردي'),(6,98,1,6,4,1,'فردي'),(6,99,1,6,5,1,'فردي'),(6,100,1,6,6,1,'زوجي'),(6,101,1,6,6,2,'زوجي'),(6,102,1,6,7,1,'زوجي'),(6,103,1,6,7,2,'زوجي'),(6,104,1,6,8,1,'زوجي'),(6,105,1,6,8,2,'زوجي'),(6,106,1,6,9,1,'زوجي'),(6,107,1,6,9,2,'زوجي'),(6,108,1,6,10,1,'زوجي'),(6,109,1,6,10,2,'زوجي'),(6,110,1,6,11,1,'عنبر'),(6,111,1,6,11,2,'عنبر'),(6,112,1,6,11,3,'عنبر'),(6,113,1,6,11,4,'عنبر'),(7,114,1,7,2,1,'فردي'),(7,115,1,7,3,1,'فردي'),(7,116,1,7,4,1,'فردي'),(7,117,1,7,5,1,'فردي'),(7,118,1,7,6,1,'زوجي'),(7,119,1,7,6,2,'زوجي'),(7,120,1,7,7,1,'زوجي'),(7,121,1,7,7,2,'زوجي'),(7,122,1,7,8,1,'زوجي'),(7,123,1,7,8,2,'زوجي'),(7,124,1,7,9,1,'زوجي'),(7,125,1,7,9,2,'زوجي'),(7,126,1,7,10,1,'زوجي'),(7,127,1,7,10,2,'زوجي'),(7,128,1,7,11,1,'عنبر'),(7,129,1,7,11,2,'عنبر'),(7,130,1,7,11,3,'عنبر'),(7,131,1,7,11,4,'عنبر'),(8,132,2,1,2,1,'فردي'),(8,133,2,1,3,1,'فردي'),(8,134,2,1,4,1,'فردي'),(8,135,2,1,5,1,'فردي'),(8,136,2,1,6,1,'زوجي'),(8,137,2,1,6,2,'زوجي'),(8,138,2,1,7,1,'زوجي'),(8,139,2,1,7,2,'زوجي'),(8,140,2,1,8,1,'زوجي'),(8,141,2,1,8,2,'زوجي'),(8,142,2,1,9,1,'زوجي'),(8,143,2,1,9,2,'زوجي'),(8,144,2,1,10,1,'زوجي'),(8,145,2,1,10,2,'زوجي'),(8,146,2,1,11,1,'عنبر'),(8,147,2,1,11,2,'عنبر'),(8,148,2,1,11,3,'عنبر'),(8,149,2,1,11,4,'عنبر'),(9,150,2,2,1,1,'فردي'),(9,151,2,2,2,1,'فردي'),(9,152,2,2,3,1,'فردي'),(9,153,2,2,4,1,'فردي'),(9,154,2,2,5,1,'فردي'),(9,155,2,2,6,1,'زوجي'),(9,156,2,2,6,2,'زوجي'),(9,157,2,2,7,1,'زوجي'),(9,158,2,2,7,2,'زوجي'),(9,159,2,2,8,1,'زوجي'),(9,160,2,2,8,2,'زوجي'),(9,161,2,2,9,1,'زوجي'),(9,162,2,2,9,2,'زوجي'),(9,163,2,2,10,1,'زوجي'),(9,164,2,2,10,2,'زوجي'),(9,165,2,2,11,1,'عنبر'),(9,166,2,2,11,2,'عنبر'),(9,167,2,2,11,3,'عنبر'),(9,168,2,2,11,4,'عنبر'),(10,169,2,3,1,1,'فردي'),(10,170,2,3,2,1,'فردي'),(10,171,2,3,3,1,'فردي'),(10,172,2,3,4,1,'فردي'),(10,173,2,3,5,1,'فردي'),(10,174,2,3,6,1,'زوجي'),(10,175,2,3,6,2,'زوجي'),(10,176,2,3,7,1,'زوجي'),(10,177,2,3,7,2,'زوجي'),(10,178,2,3,8,1,'زوجي'),(10,179,2,3,8,2,'زوجي'),(10,180,2,3,9,1,'زوجي'),(10,181,2,3,9,2,'زوجي'),(10,182,2,3,10,1,'زوجي'),(10,183,2,3,10,2,'زوجي'),(10,184,2,3,11,1,'عنبر'),(10,185,2,3,11,2,'عنبر'),(10,186,2,3,11,3,'عنبر'),(10,187,2,3,11,4,'عنبر'),(11,188,2,4,1,1,'فردي'),(11,189,2,4,2,1,'فردي'),(11,190,2,4,3,1,'فردي'),(11,191,2,4,4,1,'فردي'),(11,192,2,4,5,1,'فردي'),(11,193,2,4,6,1,'زوجي'),(11,194,2,4,6,2,'زوجي'),(11,195,2,4,7,1,'زوجي'),(11,196,2,4,7,2,'زوجي'),(11,197,2,4,8,1,'زوجي'),(11,198,2,4,8,2,'زوجي'),(11,199,2,4,9,1,'زوجي'),(11,200,2,4,9,2,'زوجي'),(11,201,2,4,10,1,'زوجي'),(11,202,2,4,10,2,'زوجي'),(11,203,2,4,11,1,'عنبر'),(11,204,2,4,11,2,'عنبر'),(11,205,2,4,11,3,'عنبر'),(11,206,2,4,11,4,'عنبر'),(12,207,2,5,1,1,'فردي'),(12,208,2,5,2,1,'فردي'),(12,209,2,5,3,1,'فردي'),(12,210,2,5,4,1,'فردي'),(12,211,2,5,5,1,'فردي'),(12,212,2,5,6,1,'زوجي'),(12,213,2,5,6,2,'زوجي'),(12,214,2,5,7,1,'زوجي'),(12,215,2,5,7,2,'زوجي'),(12,216,2,5,8,1,'زوجي'),(12,217,2,5,8,2,'زوجي'),(12,218,2,5,9,1,'زوجي'),(12,219,2,5,9,2,'زوجي'),(12,220,2,5,10,1,'زوجي'),(12,221,2,5,10,2,'زوجي'),(12,222,2,5,11,1,'عنبر'),(12,223,2,5,11,2,'عنبر'),(12,224,2,5,11,3,'عنبر'),(12,225,2,5,11,4,'عنبر');
/*!40000 ALTER TABLE `patient_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_surgery`
--

DROP TABLE IF EXISTS `patient_surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_surgery` (
  `patient_name` varchar(80) NOT NULL,
  `doc_surg_id` int NOT NULL,
  `nurse_id` int NOT NULL,
  `room_no` int NOT NULL,
  `surgery_type` varchar(40) NOT NULL,
  `stay_time` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  KEY `doc_surg_id` (`doc_surg_id`),
  KEY `nurse_id` (`nurse_id`),
  CONSTRAINT `patient_surgery_ibfk_1` FOREIGN KEY (`doc_surg_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `patient_surgery_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_surgery`
--

LOCK TABLES `patient_surgery` WRITE;
/*!40000 ALTER TABLE `patient_surgery` DISABLE KEYS */;
INSERT INTO `patient_surgery` VALUES ('هشام جميل السيد',369258147,1223456789,60,'جراحه قلب مفتوح','ثلات ايام',10000),('هشام جميل السيد',369258147,1223456789,60,'جراحه قلب مفتوح','ثلات ايام',10000);
/*!40000 ALTER TABLE `patient_surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_test`
--

DROP TABLE IF EXISTS `patient_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_test` (
  `inpatient_test_id` int NOT NULL,
  `test_id` int NOT NULL,
  `in_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `results` varchar(400) NOT NULL,
  PRIMARY KEY (`inpatient_test_id`),
  KEY `test_id` (`test_id`),
  KEY `patient_id` (`in_patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `patient_test_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `laboratory` (`test_id`),
  CONSTRAINT `patient_test_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `patient_test_ibfk_3` FOREIGN KEY (`in_patient_id`) REFERENCES `in_patient` (`in_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_test`
--

LOCK TABLES `patient_test` WRITE;
/*!40000 ALTER TABLE `patient_test` DISABLE KEYS */;
INSERT INTO `patient_test` VALUES (1,85,258741369,57012346,'gvtgybhjnkml;sdfghjnk'),(2,25,123489657,147536948,'jnbhvcsasexdfcghbjnkml');
/*!40000 ALTER TABLE `patient_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `in_patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `prescrip_id` int NOT NULL,
  `doct_name` varchar(50) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `treatment` varchar(400) NOT NULL,
  `test_rad` varchar(300) NOT NULL,
  PRIMARY KEY (`prescrip_id`),
  KEY `patient_id` (`in_patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`in_patient_id`) REFERENCES `in_patient` (`in_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (258741369,147963258,1234,'السعيد ابراهيم','heart fail','ogmanteen\r\nvsqagdfg','pcr');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiology`
--

DROP TABLE IF EXISTS `radiology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radiology` (
  `department_id` int NOT NULL,
  `ray_id` int NOT NULL,
  `ray_name` varchar(70) NOT NULL,
  `ray_name2` varchar(70) NOT NULL,
  `ray_type` varchar(40) NOT NULL,
  `ray_price` float NOT NULL,
  PRIMARY KEY (`ray_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `radiology_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiology`
--

LOCK TABLES `radiology` WRITE;
/*!40000 ALTER TABLE `radiology` DISABLE KEYS */;
INSERT INTO `radiology` VALUES (14,123,'التنظير الافتراضى للقولون','virtual colonoscopy','الاشعه المقطعيه',250),(14,124,'اشعه مقطعيه للاوعيه الدمويه','Angiography','الاشعه المقطعيه',250);
/*!40000 ALTER TABLE `radiology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_rooms`
--

DROP TABLE IF EXISTS `services_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_rooms` (
  `department_id` int NOT NULL,
  `s_id` int NOT NULL,
  `bulding_no` int NOT NULL,
  `floor_no` int NOT NULL,
  `room_no` int NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `services_rooms_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_rooms`
--

LOCK TABLES `services_rooms` WRITE;
/*!40000 ALTER TABLE `services_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12  4:24:16
