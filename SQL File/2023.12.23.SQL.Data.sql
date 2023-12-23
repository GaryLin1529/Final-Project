-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: transactionthing
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `inventoryquantity`
--

DROP TABLE IF EXISTS `inventoryquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventoryquantity` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `BookCategory` varchar(45) NOT NULL,
  `BookLanguage` varchar(45) NOT NULL,
  `BookAuthor` varchar(45) NOT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryquantity`
--

LOCK TABLES `inventoryquantity` WRITE;
/*!40000 ALTER TABLE `inventoryquantity` DISABLE KEYS */;
INSERT INTO `inventoryquantity` VALUES (1,'小王子',10,'文學','繁體中文','修伯里',100),(2,'異鄉人',10,'文學','繁體中文','卡繆',100),(3,'深夜加油站遇見蘇格拉底',10,'文學','繁體中文',' 丹．米爾曼',100),(4,'52赫茲的鯨魚們',10,'文學','繁體中文','町田苑香',100),(5,'海風酒店',10,'文學','繁體中文','吳明益',100),(6,'那些少女沒有抵達',10,'文學','繁體中文','吳曉樂',105),(7,'秘密',10,'文學','繁體中文','東野圭吾',105),(8,'歪笑小說 ',10,'文學','繁體中文','東野圭吾',105),(9,'我的文青時代',10,'文學','繁體中文','蔣勳',105),(10,'HTML&CSS：網站設計建置優化之道',10,'教育','繁體中文','張雅芳',105),(11,'網頁美編的救星！ 零基礎也能看得懂的 HTML & CSS 網頁設計',10,'教育','繁體中文','吳嘉芳',110),(12,'小水豚教你做網站! 輕鬆學好 HTML / CSS 網頁設計',10,'教育','繁體中文','竹内直人',110),(13,'Servlet&JSP技術手冊：邁向Spring Boot(第二版)',10,'教育','繁體中文','林信良',110),(14,'JSP 2.3動態網頁技術（第六版）',10,'教育','繁體中文','呂文達',110),(15,'JSP程式設計領航寶典',10,'教育','繁體中文','普悠瑪數位科技',110),(16,'春日遲',10,'文學','繁體中文','凜之',105),(18,'冬泳',10,'文學','繁體中文','班宇',115),(19,'你所不知道的必學前端Debug技巧',10,'教育','繁體中文','楊楚玄',115),(20,'jQuery+AngularJS+Bootstrap前端開發實戰',10,'教育','簡體中文','李剛',115);
/*!40000 ALTER TABLE `inventoryquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `MemberPassword` varchar(45) NOT NULL,
  `MemberName` varchar(45) NOT NULL,
  `MemberAccount` varchar(45) NOT NULL,
  `MemberPhone` int NOT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,'11144209','JayPan','JayPan@gmail.com',955889701),(2,'11144239','Mina','Mina@gmail.com',985476321),(3,'11144275','Nathania','Nathania@gmail.com',957236589),(4,'11144101','John','John@gmail.com',966588970),(5,'11144201','Roy','Roy@gmail.com',988477563),(6,'11144301','Yale','Yale@gmail.com',974266581),(7,'11144501','Hank','Hank@gmail.com',974266873),(8,'11144601','Paul','Paul@gmail.com',984522307);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `ProductID` int NOT NULL,
  `SupplierName` varchar(45) NOT NULL,
  `SupplierAddress` varchar(45) NOT NULL,
  `SupplierPhone` int NOT NULL,
  `SupplierContactPerson` varchar(45) NOT NULL,
  `Tax ID` int NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (100,'蒼海','桃園市中壢區日新路88號',7634455,'王昭君',85174569),(105,'團月','桃園市中壢區大仁五街66號',4569211,'娜可露露',96385271),(110,'周周','高雄市鳳山區五甲二路99號',7925222,'東方耀',74182935),(115,'文化','台北市萬華區忠孝西路9號',7778855,'白起',65412391);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionrecord`
--

DROP TABLE IF EXISTS `transactionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionrecord` (
  `ProductID` int NOT NULL,
  `OrderID` int NOT NULL,
  `TransactionDate` date NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL,
  `ShipmentStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionrecord`
--

LOCK TABLES `transactionrecord` WRITE;
/*!40000 ALTER TABLE `transactionrecord` DISABLE KEYS */;
INSERT INTO `transactionrecord` VALUES (1,0,'2023-02-18','小王子',10,173,'shipped'),(2,0,'2023-02-18','異鄉人',10,173,'shipped'),(3,0,'2023-02-18','深夜加油站遇見蘇格拉底',10,234,'shipped'),(4,0,'2023-02-18','52赫茲的鯨魚們',10,300,'shipped'),(5,0,'2023-02-18','海風酒店',10,420,'shipped'),(6,0,'2023-02-18','那些少女沒有抵達',10,355,'shipped'),(7,0,'2023-02-18','秘密',10,355,'shipped'),(8,0,'2023-02-18','歪笑小說 ',10,237,'shipped'),(9,0,'2023-02-18','我的文青時代',10,300,'shipped'),(10,0,'2023-02-18','HTML&CSS：網站設計建置優化之道',10,458,'shipped'),(11,0,'2023-02-18','網頁美編的救星！ 零基礎也能看得懂的 HTML & CSS 網頁設計',10,434,'shipped'),(12,0,'2023-02-18','小水豚教你做網站! 輕鬆學好 HTML / CSS 網頁設計',10,458,'shipped'),(13,0,'2023-02-18','Servlet&JSP技術手冊：邁向Spring Boot(第二版)',10,489,'shipped'),(14,0,'2023-02-18','JSP 2.3動態網頁技術（第六版）',10,325,'shipped'),(15,0,'2023-02-18','JSP程式設計領航寶典',10,371,'shipped'),(16,0,'2023-02-18','Android 5.X + SQLite POS前端銷售 App 系統設計寶典',10,523,'shipped'),(17,0,'2023-02-18','春日遲',10,180,'shipped'),(18,0,'2023-02-18','冬泳',10,316,'shipped'),(19,0,'2023-02-18','你所不知道的必學前端Debug技巧',10,489,'shipped'),(20,0,'2023-02-18','jQuery+AngularJS+Bootstrap前端開發實戰',10,474,'shipped');
/*!40000 ALTER TABLE `transactionrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-23 23:51:18
