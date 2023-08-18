CREATE DATABASE  IF NOT EXISTS `flm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flm`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flm
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userName` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `gmail` varchar(150) DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `FK_Account_Role` (`roleId`),
  CONSTRAINT `FK_Account_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','12345','image1',123456789,'Hà Tây',0,'bangnvhe161430@fpt.edu.vn','Nguyễn Văn Bằng','2002-07-30',1,1),('teacher','12345','image2',123456789,'Hà Tây',1,'hieulq161525@fpt.edu.vn','Lê Quang Hiếu','2002-07-15',2,1),('student1','12345','image3',123456789,'Hà Nội',1,'hailshe163820@fpt.edu.vn','Lâm Song Hải','2002-07-07',3,1),('student2','12345','image4',123456789,'Hà Nội',1,'tungkths163077@fpt.edu.vn','Tạ Khắc Tùng','2002-07-07',3,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `assessmentId` int NOT NULL AUTO_INCREMENT,
  `category` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `part` int DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `completionCriteria` varchar(50) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `clo` varchar(150) NOT NULL,
  `questionType` varchar(255) DEFAULT NULL,
  `noQuestion` varchar(255) DEFAULT NULL,
  `knowledgeSkill` varchar(255) DEFAULT NULL,
  `gradingGuide` varchar(255) DEFAULT NULL,
  `note` longtext,
  `syllabusId` int DEFAULT NULL,
  PRIMARY KEY (`assessmentId`),
  KEY `fk_assessment_syllabus_idx` (`syllabusId`),
  CONSTRAINT `fk_assessment_syllabus` FOREIGN KEY (`syllabusId`) REFERENCES `syllabus` (`syllabusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,'Assignment','	on-going',3,'10.0%','>0','16 slots','CLO1','Option 1: N/A, Option 2: Questions or Activities proposed by lecturer','Option 1: N/A, Option 2: Follow lecturer\'s proposal',NULL,NULL,'	Asm1: LO1 & 2',10),(2,'Group Project','on-going',1,'25.0%','	>0','	30 slots','LO2','Option 1: N/A, Option 2: Questions or Activities proposed by lecturer','Option 1: N/A, Option 2: Follow lecturer\'s proposal',NULL,NULL,'	problem(s) to solve by programming using LO1 - LO5',11),(3,'Practical Exam','on-going',1,'25.0%','>0','	80\'','LO3','	Manual evaluating',NULL,NULL,'	By exam board','problem(s) to solve by programming using LO1 - LO5',12);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `comboId` int NOT NULL AUTO_INCREMENT,
  `comboNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comboNameEn` varchar(255) DEFAULT NULL,
  `note` longtext,
  `tag` varchar(50) DEFAULT NULL,
  `curriculumId` int DEFAULT NULL,
  PRIMARY KEY (`comboId`),
  KEY `fk_Combo_Curriculum` (`curriculumId`),
  CONSTRAINT `fk_Combo_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,'Công cụ Marketing số','Digital Marketing Tools',NULL,'bla',43),(2,'Bán hàng đa kênh','	Omnichannel Marketing',NULL,'asa',44),(3,'Marketing Nội dung','Content Marketing',NULL,'zxc',45),(4,'Google ads và SEO','Google ads and SEO',NULL,'bzx',46);
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_subject`
--

DROP TABLE IF EXISTS `combo_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comboId` int NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Combo_Subject_Subject` (`subjectCode`) /*!80000 INVISIBLE */,
  KEY `fk_Combo_Subject_Combo_idx` (`comboId`),
  CONSTRAINT `fk_Combo_Subject_Combo` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`),
  CONSTRAINT `fk_Combo_Subject_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_subject`
--

LOCK TABLES `combo_subject` WRITE;
/*!40000 ALTER TABLE `combo_subject` DISABLE KEYS */;
INSERT INTO `combo_subject` VALUES (1,1,'SWT301'),(2,2,'SWR302'),(3,3,'SWP391'),(4,4,'PRN211');
/*!40000 ALTER TABLE `combo_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `curriculumId` int NOT NULL AUTO_INCREMENT,
  `curriculumCode` varchar(50) DEFAULT NULL,
  `nameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nameEn` varchar(255) DEFAULT NULL,
  `decription` longtext,
  `decisionNo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`curriculumId`),
  KEY `fk_Currculum_Decision` (`decisionNo`),
  CONSTRAINT `fk_Currculum_Decision` FOREIGN KEY (`decisionNo`) REFERENCES `decision` (`decisionNo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (43,'BBA_MKT_K16D17A','CTĐT ngành QTKD, chuyên ngành Marketing Số','	Bachelor Program of Business Adminstration, Digital Marketing Major','The objective of the Bachelor of Business Administration – Digital Marketing program of FPT University is to train students into specialists in marketing management, managers, and entrepreneurs. Students will be equipped with all essential knowledge and s...','495-QÐ-ÐHFPT'),(44,'BIT_SE_K16B','Chương trình cử nhân ngành CNTT, chuyên ngành Kỹ thuật phần mềm','	Bachelor Program of Information Technology, Software Engineering Major','1. Training Objectives 1.1 General objective: Training Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organ.','1095-QÐ-ÐHFPT'),(45,'BIT_AI_K15A','Chương trình cử nhân ngành CNTT, chuyên ngành Trí tuệ nhân tạo','Bachelor Program of Information Technology, Artificial Intelligence Major','1. Training Objectives 1.1 General objective: Training Information Technology (IT)/Artificial Intelligence (AI) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to or...','1189-QÐ-ÐHFPT'),(46,'BBA_MKT_K16B','CTĐT ngành QTKD, chuyên ngành Kinh doanh quốc tế','Bachelor Program of Business Adminstration, International Business Major ','The objective of the Bachelor of Business Administration – International Business program of FPT University is to train students into specialists in international business, managers, and entrepreneurs. Students will be equipped with all essential knowledg...','158-QÐ-ÐHFPT'),(47,'BIT_GD_K17D,K18A','Chương trình cử nhân ngành CNTT, chuyên ngành Thiết kế Mỹ thuật số','Bachelor Program of Information Technology, Digital Art & Design Major','. Training Objectives General objective: Training Bachelor of Information Technology, Digital Art & Design specialty with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implem...','973-QÐ-ÐHFPT'),(48,'BBA_HM_K15B','CTĐT ngành QTKD, chuyên ngành Quản trị Khách sạn','Bachelor Program of Business Adminstration, Hotel Management Major','\"The objective of the Bachelor of Business Administration – Hotel management program of FPT University is to train students into specialists in international business, managers, and entrepreneurs. Students will be equipped with all essential knowledge and..','336-QÐ-ÐHFPT');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum_subject`
--

DROP TABLE IF EXISTS `curriculum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curriculumId` int NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Curriculum_Subject_Subject_idx` (`subjectCode`),
  KEY `fk_Curriculum_Subject_Curriculum_idx` (`curriculumId`),
  CONSTRAINT `fk_Curriculum_Subject_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`),
  CONSTRAINT `fk_Curriculum_Subject_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum_subject`
--

LOCK TABLES `curriculum_subject` WRITE;
/*!40000 ALTER TABLE `curriculum_subject` DISABLE KEYS */;
INSERT INTO `curriculum_subject` VALUES (1,43,'PRN211',NULL),(2,44,'SWR302',NULL),(3,45,'SWT301',NULL),(4,46,'SWP391',NULL),(5,47,'ITE302c',NULL);
/*!40000 ALTER TABLE `curriculum_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decision`
--

DROP TABLE IF EXISTS `decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision` (
  `decisionNo` varchar(150) NOT NULL,
  `decisionName` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` longtext,
  `createDate` date DEFAULT NULL,
  PRIMARY KEY (`decisionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision`
--

LOCK TABLES `decision` WRITE;
/*!40000 ALTER TABLE `decision` DISABLE KEYS */;
INSERT INTO `decision` VALUES ('1095-QÐ-ÐHFPT','QĐ Về việc bổ sung các học phần Trải nghiệm khởi nghiệp vào Chương trình đào tạo đại học hệ chính quy','1','2022-11-28'),('1189-QÐ-ÐHFPT','Ban hành đề cương chi tiết học kì Summer2023','1','2023-07-13'),('158-QÐ-ÐHFPT','	QĐ điều chỉnh CTĐT áp dụng từ SU23','1','2023-02-21'),('336-QÐ-ÐHFPT','Ban hành điều chỉnh CTĐT kì Spring 2022','1','2022-04-27'),('495-QÐ-ÐHFPT','Ban hành điều chỉnh  học kì Summer2023','1','2023-07-13'),('973-QÐ-ÐHFPT','Ban hành điều chỉnh CTĐT từ kì Spring 2023','1','2022-10-26');
/*!40000 ALTER TABLE `decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `userNameTo` varchar(150) NOT NULL,
  `userNameFrom` varchar(150) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `fk_feedback_account_from_idx` (`userNameFrom`),
  KEY `fk_feedback_account_to_idx` (`userNameTo`),
  CONSTRAINT `fk_feedback_account_from` FOREIGN KEY (`userNameFrom`) REFERENCES `account` (`userName`),
  CONSTRAINT `fk_feedback_account_to` FOREIGN KEY (`userNameTo`) REFERENCES `account` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Great','admin','teacher','The perfect teacher i never seen before','2023-07-18 00:00:00'),(2,'nice','admin','teacher','Good teacher','2023-06-12 00:00:00'),(3,'happy','Phuc','Tung','a happy day','2023-05-22 00:00:00');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `materialId` int NOT NULL AUTO_INCREMENT,
  `materialDescription` longtext,
  `Author` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Publisher` varchar(150) DEFAULT NULL,
  `PublishedDate` varchar(150) DEFAULT NULL,
  `URL` longtext,
  `subjectCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`materialId`),
  KEY `fk_Material_Subject` (`subjectCode`),
  CONSTRAINT `fk_Material_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Course from Edx: https://learning.edx.org/course/course-v1:CurtinX+IOT2x+2T2018/home','Hai','Bang','2023-07-20','https://flm.fpt.edu.vn/gui/role/student/SyllabusDetails?sylID=9301','IOT102'),(2,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','Hieu','Hai','2023-07-11',NULL,'ITE302c'),(3,'Pro C# 9 with .NET 5','Hai','Apress','2023-05-19',NULL,'PRN211'),(4,'Murach\'s Java Servlets and JSP','Tung','Hieu','2022-12-12','https://flm.fpt.edu.vn/gui/role/student/SyllabusDetails?sylID=9641','SWP391'),(5,'More About Software Requirements: Thorny Issues and Practical Advice','Karl E. Wiegers','Microsoft Press','2023-02-15',NULL,'SWR302'),(6,'Foundations of Software Testing: ISTQB Certification','Dorothy Graham, Erik van Veenendaal, Isabel Evans,Rex Black','Cengage Learning Business Press','20081-02-15','https://flm.fpt.edu.vn/gui/role/student/SyllabusDetails?sylID=9792','SWT301');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialofteacher`
--

DROP TABLE IF EXISTS `materialofteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialofteacher` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `TeacherUsername` varchar(150) NOT NULL,
  `SubjectCode` varchar(50) NOT NULL,
  `URL` longtext NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_MaterialOfTeacher_Teacher_idx` (`TeacherUsername`),
  KEY `fk_MaterialOfTeacher_Subject_idx` (`SubjectCode`),
  CONSTRAINT `fk_MaterialOfTeacher_Subject` FOREIGN KEY (`SubjectCode`) REFERENCES `subject` (`subjectCode`),
  CONSTRAINT `fk_MaterialOfTeacher_Teacher` FOREIGN KEY (`TeacherUsername`) REFERENCES `account` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialofteacher`
--

LOCK TABLES `materialofteacher` WRITE;
/*!40000 ALTER TABLE `materialofteacher` DISABLE KEYS */;
INSERT INTO `materialofteacher` VALUES (1,'MAS','bang','MAS','https://flm.fpt.edu.vn/gui/role/student/SyllabusDetails?sylID=9243','ok'),(2,'SE','hieu','MAS','https://flm.fpt.edu.vn/gui/role/student/CurriculumDetails?curid=1607','ok');
/*!40000 ALTER TABLE `materialofteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleId` int NOT NULL,
  `roleName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'GUEST'),(1,'ADMIN'),(2,'Teacher'),(3,'Student'),(4,''),(5,'');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `learningTeachingType` varchar(50) DEFAULT NULL,
  `studentMaterials` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Constructive question` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `subjectCode` varchar(50) NOT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `fk_session_subject_idx` (`subjectCode`),
  CONSTRAINT `fk_session_subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'Introduction of IoT course','Offline','Slide','	Why should we apply the early test design in software development life cycle?','IOT102'),(2,'Specialization Introduction','Online','','What is Unit test, Integration test, System test, Acceptance test?','ITE302c'),(3,'	Course Introduction','Offline','Chapter 01: https://docs.microsoft.com/en-us/dotnet/core/introduction','	Study just learned materials, redo sample examples','PRN211'),(4,'	INITIATION PHASE','Offline','	This Syllabus,','	How to test software structure/architecture (structural testing)?','SWP391'),(5,'The essential of software requirement (cnt)','Offline','Chapter 1 + Slides','What incremental integration strategy in software testing?','SWR302'),(6,'	Course Introduction','Offline','text book: Chapter 1','How to test software product characteristics (non-functional testing)?','SWT301');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusId` tinyint NOT NULL,
  `statusName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active'),(2,'Pause operation');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectCode` varchar(50) NOT NULL,
  `subjectNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `subjectNameEn` varchar(255) DEFAULT NULL,
  `preRequisite` varchar(45) DEFAULT NULL,
  `statusId` tinyint NOT NULL,
  PRIMARY KEY (`subjectCode`),
  KEY `fk_subject_status_idx` (`statusId`),
  CONSTRAINT `fk_status_subject` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('IOT102','Internet vạn vật','Internet of Things',NULL,1),('ITE302c','Đạo đức trong CNTT','Ethics in IT',NULL,1),('PRN211','Lập trình ứng dụng đa nền tảng cơ bản với .NET','Basis Cross-Platform Application Programming With .NET',NULL,1),('SWP391','Dự án phát triển phần mềm','Software development project',NULL,1),('SWR302','Yêu cầu phần mềm','Software Requirement',NULL,1),('SWT301','Kiểm thử phần mềm','Software Testing',NULL,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syllabus`
--

DROP TABLE IF EXISTS `syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syllabus` (
  `syllabusId` int NOT NULL AUTO_INCREMENT,
  `syllabusNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `syllabusNameEn` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(50) NOT NULL,
  `noCredit` int DEFAULT NULL,
  `degreeLevel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `timeAllocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `preRequisite` longtext,
  `description` longtext,
  `studentTask` longtext,
  `tool` longtext,
  `scoringScale` varchar(2) DEFAULT NULL,
  `decisionNo` varchar(150) DEFAULT NULL,
  `isApproved` tinyint DEFAULT NULL,
  `note` longtext,
  `minAvgMarkToPass` int DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  PRIMARY KEY (`syllabusId`),
  KEY `fk_Syllabus_Decision` (`decisionNo`),
  KEY `fk_Syllabus_Subject` (`subjectCode`),
  CONSTRAINT `fk_Syllabus_Decision` FOREIGN KEY (`decisionNo`) REFERENCES `decision` (`decisionNo`),
  CONSTRAINT `fk_Syllabus_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syllabus`
--

LOCK TABLES `syllabus` WRITE;
/*!40000 ALTER TABLE `syllabus` DISABLE KEYS */;
INSERT INTO `syllabus` VALUES (10,'Internet vạn vật','Internet of Things','IOT102',3,'Bachelor','Study hour (150h) = 22,5h contact hours + 22,5h online hours + 1h final exam + 104h self-study','Familiarity with C programming','This is a 3-credit course. This course has two parts online and offline. The content includes basic concepts and applications of IoT, practical exercises on the learning KIT. Students are taught how to learn online, and practice some parts at home. Q & A sessions, the Guidance for important issues, as well as performance assessments, will be conducted in the classroom.','- Students must attend at least 80% of contact sessions in order to be accepted to the final examination. - Student is responsible to learn all VIDEOs (theory) online given by instructor on Syllabus at home. - Student is responsible to do all LABs given by instructor on Syllabus at home. - Constantly follow announcements on intranet/CMS at http://cms.fpt.edu.vn for up-to-date course information.',NULL,'10','1095-QÐ-ÐHFPT','	1) On-going asessment: - 01 Presentation: 10% - 02 Exercises: 10% - 01 Project: 30% - Active learning: 10% 2) Final Exam: 40% 3) Final Result: 100%  Completion Criteria: 1) Every on-going assessment component >0 2) Final Exam Score >=4 & Final Result >=5',5,NULL,NULL),(11,'Đạo đức trong CNTT','Ethics in IT','ITE302c',3,'Bachelor','Online: 120 hours+5 slot offline','None','Organizations and governments are seeking out ethics professionals to minimize risk and guide their decision-making about the design of inclusive, responsible, and trusted technology. An algorithm not designed and assessed in alignment with ethical standards can create further inequity across race, gender and marginalized populations. The reputational and financial impact of an ethics violation can devastate a company. Knowledgeable ethics leaders are needed who can navigate through the more than 160 frameworks and guidelines to select and implement the best strategy to promote fairness and minimize risk for their organization. This specialization is designed for learners who want to create and lead initiatives that prioritize ethical integrity within emerging data-driven technology fields such as artificial intelligence and data science and will be prepared to bridge the gap between theory and practice.','Student must get the certification of CertNexus Certified Ethical Emerging Technologist Professional Certificate (CertNexus) specialization from Coursera to be accepted to the final examination','- Internet','10','973-QÐ-ÐHFPT','	1. Complete the online courses and get all specialization certifications to be allowed to take Final Exam 2. Final Exam included Final Theory Exam (TE): 100% 3. Student gets 1/6 bonus points for each course completed on time. 4. Completion Criteria: Final TE Score >=4 & (Final TE Score + bonus) >= 5',5,NULL,NULL),(12,'Lập trình ứng dụng đa nền tảng cơ bản với .NET','	Basis Cross-Platform Application Programming With .NET','PRN211',3,'Bachelor','Study hour (150h) = 49.5h contact hours + 1h final exam + 85\' practical exam + 99.5h self-study','PRO192 & DBI201','Upon completion of this course students should: 1. Understand the followings: • C# language for developing .NET applications; • Fundamental concepts of .NET Platform • Basic knowledge of Window Forms in .NET • Basic knowledge of ASP.NET Core MVC • Basic knowledge of RESTful API .NET 2. Be able to: • Develop Cross-platform Desktop applications and support for user experience ( UI & UX ) • Develop Back-end applications by ASP.NET Core Web API • Develop Distributed applications by Windows Forms and REST APIs • Develop Distributed applications by ASP.NET MVC Core and REST APIs 3. Be able to work in a team and present group\'s results','- Students must attend more than 80% of contact sessions in order to be accepted to the final examination. - Student is responsible to do all assigned exercises given by instructor in class or at home and submit on time - Use laptop in class only for learning purpose - Promptly access to the FU CMS at http://cms.fpt.edu.vn for up-to-date course information','- Internet - Visual Studio.NET 2019 version 16.8.3 or later - MS SQL Server 2014 or later - Platform : .NET 5.0 or later','10','495-QÐ-ÐHFPT',NULL,5,NULL,NULL),(13,'Dự án phát triển phần mềm','Software development project','SWP391',3,'Bachelor','Study hour (150h) = 45h contact hours + 105h self-study','PRJ301, SWE201c','\"This course focuses on designing, developing, and integrating the basic Web-based system/application using Java Web or .NET technologies (with the system requirements, technical framework & DBMS as asigned/agreed by the teacher) Students are required to build the system with other 3-5 team members as appointed by the teacher. After the course, students will be able to achieve Java web programing proficiency with the following skills by practicing with other members in the assigned team - Proficiency in common web techniques and basic Java or .NET Web development skills - Proficiency in front end skills (HTML, CSS, JS) require for industry - Analyze & design the solution following the object oriented models - Co-ordinate with the team to complete the works in the form of a project\"','- Build the team & select/define the project topic with arrangement/guide from the teacher - Select the team leader and using the FPT account (@fpt.edu.vn account) to setup/configure the project managemernt environment (sources, tasks, issues, milestones) on the GitLab & project documents management on the OneDrive. - Get the detailed assignment from the teacher, plan the project tasks, and execute the project accordingly - Students must attend at least 80% of contact slots in order to be accepted to the final presentation. - Student is responsible to do all exercises given by the teacher in class or at home and submit on time - Constantly follow the teacher\'s guides/references for up-to-date course information regarding assignment submission and feedback on assignments and project work. - Using the GitLab to collaborate in every phase of the project by all the team members','GitLab (https://gitlab.com/), One Drive For Java project • Java JDK version 1.6 or higher, NetBeans 13 • MySQL Server (v8.0.23 or higher), MySQL Workbench; For .NET project • Microsoft Internet Information Services server (come with Microsoft Windows) • Microsoft Visual Studio version 2015 or higher (for .NET project)','10','336-QÐ-ÐHFPT','1) On-going Assessment - On-going Assessment 1: 20% - On-going Assessment 2: 20% - On-going Assessment 3: 20% 2) Final Project Presentation: 40%  To be selected to the Final Presentation, each student needs: * Average on-going grade assessment >=5/10 * No cheating during the project progress',5,NULL,NULL),(14,'Yêu cầu phần mềm','Software Requirement','SWR302',3,'Bachelor','Study hour (150h) = 45h contact hours + 1h final exam + 104h self-study','SWE102 or SWE201c','This course is a model-based introduction to RE, providing the conceptual background and terminology on RE, addressing a variety of techniques for requirements development including Analysis and Requirements Elicitation; Requirements Evaluation; Requirements Specification and Documentation; Requirements Quality Assurance. To implement these frameworks, student will be learnt how to find appropriate customer representatives, elicit requirements from them, and document user requirements, business rules, functional requirements, data requirements, and nonfunctional requirements. The numerous visual models that will be represented to illustrate the requirements from various perspectives to supplement natural-language text. Other contents recommend the most effective requirements approaches for various specific classes of projects: agile projects developing products of any type, enhancement and replacement projects, projects that incorporate packaged solutions, outsourced projects, business process automation projects, business analytics projects, and embedded and other real-time systems.','Students must attend more than 80% of contact slots in order to be accepted to the final examination. - Student is responsible to do all exercises given by instructor in class or at home and submit on time - Constantly follow announcements on intranet/LMS at http://lms.fpt.edu.vn for up-to-date course information regarding assignment submission and feedback on assignments and project work.','Microsoft office for documents and presentation. - https://www.visual-paradigm.com/download/community.jsp students must install visual-paradigm for drawing UML (offline) before taking Final Practical Exam - BOUML (http://bouml.free.fr/) : UML Drawing software','10','158-QÐ-ÐHFPT','In the case: (5 > TE Score >=4) & (5 > Final PE Score >=4) & (Final Result < 5), the students can choose to take the resit of both TE & PE OR just either TE or PE.',5,NULL,NULL),(15,'Kiểm thử phần mềm','Software Testing','SWT301',3,'Bachelor','Study hour (150h) = 45h contact hours + 1h final exam + 104h self-study','SWE102 or SWE201c','• General concepts about software testing • Testing techniques aimed at assuring that appropriate functionality has been implemented correctly in the software system or product, including: a) black box or functional testing, b) clear box or structural testing, c) usage-based statistical testing. These testing techniques are organized by their underlying models, including lists, partitions and equivalent classes, finite-state machines. • Test activities, management, and related issues, such as testing sub-phases, team organization, testing process, people\'s roles and responsibilities, test automation, etc., will also be discussed. • Other testing, verification and validation techniques…','Students must attend more than 80% of contact sessions in order to be accepted to the final examination. - Students are responsible to do all exercises, assignments and labs given by instructor in class or at home and submit on time - Use laptop in class only for learning purpose - Promptly access to the https://cmshn.fpt.edu.vn/ for up-to-date course information','- Unit Test Framework - Bug Management Tool - Ms Office - IDE - Static Analyst Tool','10','1189-QÐ-ÐHFPT','In the case: (5 > TE Score >=4) & (5 > Final PE Score >=4) & (Final Result < 5), the students can choose to take the resit of both TE & PE OR just either TE or PE.',5,NULL,NULL);
/*!40000 ALTER TABLE `syllabus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 14:58:27
