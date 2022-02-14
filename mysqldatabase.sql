-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: group1
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dbms_nine`
--

DROP TABLE IF EXISTS `dbms_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dbms_nine` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `dbms_nine_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbms_nine`
--

LOCK TABLES `dbms_nine` WRITE;
/*!40000 ALTER TABLE `dbms_nine` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbms_nine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbms_ten`
--

DROP TABLE IF EXISTS `dbms_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dbms_ten` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `dbms_ten_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbms_ten`
--

LOCK TABLES `dbms_ten` WRITE;
/*!40000 ALTER TABLE `dbms_ten` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbms_ten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hci_nine`
--

DROP TABLE IF EXISTS `hci_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hci_nine` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `hci_nine_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hci_nine`
--

LOCK TABLES `hci_nine` WRITE;
/*!40000 ALTER TABLE `hci_nine` DISABLE KEYS */;
/*!40000 ALTER TABLE `hci_nine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hci_ten`
--

DROP TABLE IF EXISTS `hci_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hci_ten` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `hci_ten_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hci_ten`
--

LOCK TABLES `hci_ten` WRITE;
/*!40000 ALTER TABLE `hci_ten` DISABLE KEYS */;
/*!40000 ALTER TABLE `hci_ten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_nine`
--

DROP TABLE IF EXISTS `os_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_nine` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `os_nine_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_nine`
--

LOCK TABLES `os_nine` WRITE;
/*!40000 ALTER TABLE `os_nine` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_nine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_ten`
--

DROP TABLE IF EXISTS `os_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_ten` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `os_ten_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_ten`
--

LOCK TABLES `os_ten` WRITE;
/*!40000 ALTER TABLE `os_ten` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_ten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sepm_nine`
--

DROP TABLE IF EXISTS `sepm_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sepm_nine` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `sepm_nine_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sepm_nine`
--

LOCK TABLES `sepm_nine` WRITE;
/*!40000 ALTER TABLE `sepm_nine` DISABLE KEYS */;
/*!40000 ALTER TABLE `sepm_nine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sepm_ten`
--

DROP TABLE IF EXISTS `sepm_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sepm_ten` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `sepm_ten_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sepm_ten`
--

LOCK TABLES `sepm_ten` WRITE;
/*!40000 ALTER TABLE `sepm_ten` DISABLE KEYS */;
/*!40000 ALTER TABLE `sepm_ten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `username` char(11) NOT NULL,
  `rollno` char(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `class` char(5) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `rollno` (`rollno`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `username` char(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_details`
--

DROP TABLE IF EXISTS `teacher_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher_details` (
  `username` char(11) NOT NULL,
  `class` char(5) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `cc` char(1) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `teacher_details_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_details`
--

LOCK TABLES `teacher_details` WRITE;
/*!40000 ALTER TABLE `teacher_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toc_nine`
--

DROP TABLE IF EXISTS `toc_nine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `toc_nine` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `toc_nine_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toc_nine`
--

LOCK TABLES `toc_nine` WRITE;
/*!40000 ALTER TABLE `toc_nine` DISABLE KEYS */;
/*!40000 ALTER TABLE `toc_nine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toc_ten`
--

DROP TABLE IF EXISTS `toc_ten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `toc_ten` (
  `rollno` char(4) NOT NULL,
  `subjectname` varchar(40) NOT NULL,
  `att` int(2) NOT NULL,
  `cond` int(3) NOT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `toc_ten_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toc_ten`
--

LOCK TABLES `toc_ten` WRITE;
/*!40000 ALTER TABLE `toc_ten` DISABLE KEYS */;
/*!40000 ALTER TABLE `toc_ten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `name` char(11) NOT NULL,
  `pass` varchar(4) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 22:12:47
