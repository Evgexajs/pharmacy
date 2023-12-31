-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: Pharmacy
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `Client_ID` int NOT NULL,
  `FIO` text NOT NULL,
  `Login` text NOT NULL,
  `Phone_number` bigint NOT NULL,
  `Code` int NOT NULL,
  `Address` text NOT NULL,
  `Bank_account` bigint NOT NULL,
  PRIMARY KEY (`Client_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'╨Ш╨▓╨░╨╜╨╛╨▓ ╨Х╨▓╨│╨╡╨╜╨╕╨╣ ╨Ь╨╕╤Е╨░╨╣╨╗╨╛╨▓╨╕╤З','Ira3',79535356523,123432,'╨а╨╡╤Б╨┐╤Г╨▒╨╗╨╕╨║╨╕ 12, ╨┤. 1, ╨║╨▓. 10',3859423463234951349),(2,'╨С╨╕╨╖╨╡╤В╨╛╨▓ ╨Р╨╗╨╡╨║╤Б╨░╨╜╨┤╤А','Ivan3',79224351945,456234,'╨Э╨╕╨║╨╛╨╗╨░╤П ╨а╨╛╤Б╤В╨╛╨▓╤Ж╨╡╨▓╨░ ╨┤. 20, ╨║╨▓ 123',3465365755243455439),(3,'╨Я╨╡╤В╤А╨╛╨▓╨░ ╨Х╨║╨░╤В╨╡╤А╨╕╨╜╨░ ╨Ъ╨╕╤А╨╕╨╗╨╗╨╛╨▓╨╜╨░','Petr',79533420612,678343,'╨Э╨╕╨║╨╛╨╗╨░╤П ╨а╨╛╤Б╤В╨╛╨▓╤Ж╨╡╨▓╨░ ╨┤. 10, ╨║╨▓ 19',2347524359234055934);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courier`
--

DROP TABLE IF EXISTS `Courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courier` (
  `Courier_ID` int NOT NULL,
  `Login` text NOT NULL,
  `Phone_number` bigint NOT NULL,
  `Code` int NOT NULL,
  `Location` text NOT NULL,
  PRIMARY KEY (`Courier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courier`
--

LOCK TABLES `Courier` WRITE;
/*!40000 ALTER TABLE `Courier` DISABLE KEYS */;
INSERT INTO `Courier` VALUES (1,'Kur1',79342345412,123098,' 50 ╨╗╨╡╤В ╨Я╤А╨╛╨╕╨│╤А╤Л╤И╨░ ╨┤. 14'),(2,'Kur2',79432652378,765345,' 50 ╨╗╨╡╤В ╨Я╤А╨╛╨╕╨│╤А╤Л╤И╨░ ╨┤. 14'),(3,'Kur3',79236542347,234876,' 50 ╨╗╨╡╤В ╨Я╤А╨╛╨╕╨│╤А╤Л╤И╨░ ╨┤. 14');
/*!40000 ALTER TABLE `Courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicinesCatalog`
--

DROP TABLE IF EXISTS `MedicinesCatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedicinesCatalog` (
  `Medicines_ID` int NOT NULL,
  `Name` text NOT NULL,
  `Has_recipe` tinyint(1) NOT NULL,
  `Address_create` text NOT NULL,
  `Indications_use` text NOT NULL,
  `Method_use` text NOT NULL,
  `Side_effect` text NOT NULL,
  `Interaction_other_medicines` text NOT NULL,
  `Expiration_date` date NOT NULL,
  `Composition` text NOT NULL,
  `Count` int NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`Medicines_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicinesCatalog`
--

LOCK TABLES `MedicinesCatalog` WRITE;
/*!40000 ALTER TABLE `MedicinesCatalog` DISABLE KEYS */;
INSERT INTO `MedicinesCatalog` VALUES (1,'╨Э╨╛-╤И╨┐╨░',0,'╨Т╨╡╨╜╨│╤А╨╕╤П','╨б╨┐╨░╨╖╨╝╤Л ╨│╨╗╨░╨┤╨║╨╛╨╣ ╨╝╤Г╤Б╨║╤Г╨╗╨░╤В╤Г╤А╤Л ╨┐╤А╨╕ ╨╖╨░╨▒╨╛╨╗╨╡╨▓╨░╨╜╨╕╤П╤Е ╨╢╨╡╨╗╤З╨╡╨▓╤Л╨▓╨╛╨┤╤П╤Й╨╕╤Е ╨┐╤Г╤В╨╡╨╣, ╨┐╤А╨╕ ╤Б╨┐╨░╨╖╨╝╨░╤Е ╨│╨╗╨░╨┤╨║╨╛╨╣ ╨╝╤Г╤Б╨║╤Г╨╗╨░╤В╤Г╤А╤Л ╨╢╨╡╨╗╤Г╨┤╨╛╤З╨╜╨╛-╨║╨╕╤И╨╡╤З╨╜╨╛╨│╨╛ ╤В╤А╨░╨║╤В╨░, ╨┐╤А╨╕ ╨│╨╛╨╗╨╛╨▓╨╜╤Л╤Е ╨▒╨╛╨╗╤П╤Е ╨╜╨░╨┐╤А╤П╨╢╨╡╨╜╨╕╤П.','╨Т╨╖╤А╨╛╤Б╨╗╤Л╨╡: ╨Я╨╛ 1-2 ╤В╨░╨▒╨╗╨╡╤В╨║╨╕ ╨╜╨░ ╨╛╨┤╨╕╨╜ ╨┐╤А╨╕╨╡╨╝ 2-3 ╤А╨░╨╖╨░ ╨▓ ╨┤╨╡╨╜╤М. ╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨░╤П ╤Б╤Г╤В╨╛╤З╨╜╨░╤П ╨┤╨╛╨╖╨░ - 6 ╤В╨░╨▒╨╗╨╡╤В╨╛╨║ (╤З╤В╨╛ ╤Б╨╛╨╛╤В╨▓╨╡╤В╤Б╤В╨▓╤Г╨╡╤В 240 ╨╝╨│). ╨Ф╨╡╤В╨╕: ╨Ъ╨╗╨╕╨╜╨╕╤З╨╡╤Б╨║╨╕╨╡ ╨╕╤Б╤Б╨╗╨╡╨┤╨╛╨▓╨░╨╜╨╕╤П ╨┐╨╛ ╨┐╤А╨╕╨╝╨╡╨╜╨╡╨╜╨╕╤О ╨┤╤А╨╛╤В╨░╨▓╨╡╤А╨╕╨╜╨░ ╤Г ╨┤╨╡╤В╨╡╨╣ ╨╜╨╡ ╨┐╤А╨╛╨▓╨╛╨┤╨╕╨╗╨╕╤Б╤М.\r\n','╨│╨╛╨╗╨╛╨▓╨╜╨░╤П ╨▒╨╛╨╗╤М, ╨▓╨╡╤А╤В╨╕╨│╨╛, ╨▒╨╡╤Б╤Б╨╛╨╜╨╜╨╕╤Ж╨░. ╨з╨░╤Б╤В╨╛╤В╨░ ╨╜╨╡╨╕╨╖╨▓╨╡╤Б╤В╨╜╨░: ╨│╨╛╨╗╨╛╨▓╨╛╨║╤А╤Г╨╢╨╡╨╜╨╕╨╡.','╨Ш╨╜╨│╨╕╨▒╨╕╤В╨╛╤А╤Л ╤Д╨╛╤Б╤Д╨╛╨┤╨╕╤Н╤Б╤В╨╡╤А╨░╨╖╤Л, ╨┐╨╛╨┤╨╛╨▒╨╜╤Л╨╡ ╨┐╨░╨┐╨░╨▓╨╡╤А╨╕╨╜╤Г, ╤Б╨╜╨╕╨╢╨░╤О╤В ╨░╨╜╤В╨╕╨┐╨░╤А╨║╨╕╨╜╤Б╨╛╨╜╨╕╤З╨╡╤Б╨║╨╛╨╡ ╨┤╨╡╨╣╤Б╤В╨▓╨╕╨╡ ╨╗╨╡╨▓╨╛╨┤╨╛╨┐╤Л. ╨Я╤А╨╕ ╨╜╨░╨╖╨╜╨░╤З╨╡╨╜╨╕╨╕ ╨┤╤А╨╛╤В╨░╨▓╨╡╤А╨╕╨╜╨░ ╨╛╨┤╨╜╨╛╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛ ╤Б ╨╗╨╡╨▓╨╛╨┤╨╛╨┐╨╛╨╣ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛ ╤Г╤Б╨╕╨╗╨╡╨╜╨╕╨╡ ╤А╨╕╨│╨╕╨┤╨╜╨╛╤Б╤В╨╕ ╨╕ ╤В╤А╨╡╨╝╨╛╤А╨░.','2025-12-01','╨┤╨╡╨╣╤Б╤В╨▓╤Г╤О╤Й╨╡╨╡ ╨▓╨╡╤Й╨╡╤Б╤В╨▓╨╛: ╨┤╤А╨╛╤В╨░╨▓╨╡╤А╨╕╨╜╨░ ╨│╨╕╨┤╤А╨╛╤Е╨╗╨╛╤А╨╕╨┤ - 40 ╨╝╨│; ╨▓╤Б╨┐╨╛╨╝╨╛╨│╨░╤В╨╡╨╗╤М╨╜╤Л╨╡ ╨▓╨╡╤Й╨╡╤Б╤В╨▓╨░: ╨╝╨░╨│╨╜╨╕╤П ╤Б╤В╨╡╨░╤А╨░╤В, ╤В╨░╨╗╤М╨║, ╨┐╨╛╨▓╨╕╨┤╨╛╨╜ ╨Ъ-25, ╨║╤А╨░╤Е╨╝╨░╨╗ ╨║╤Г╨║╤Г╤А╤Г╨╖╨╜╤Л╨╣, ╨╗╨░╨║╤В╨╛╨╖╤Л ╨╝╨╛╨╜╨╛╨│╨╕╨┤╤А╨░╤В, ╨╛╨┐╨░╨┤╤А╨░╨╣ II 85G32431 ╨╢╨╡╨╗╤В╤Л╨╣.\r\n',60,150),(2,'╨У╤А╨░╨╝╨╝╨╕╨┤╨╕╨╜ ╨╜╨╡╨╛',1,'╨а╨╛╤Б╤Б╨╕╤П','╨б╤В╨╛╨╝╨░╤В╨╕╤В, ╨Т╨╛╤Б╨┐╨░╨╗╨╡╨╜╨╕╨╡ ╨┐╨░╤А╨╛╨┤╨╛╨╜╤В╨░, ╨в╨╛╨╜╨╖╨╕╨╗╨╗╨╕╤В, ╨д╨░╤А╨╕╨╜╨│╨╕╤В, ╨Т╨╛╤Б╨┐╨░╨╗╨╡╨╜╨╕╨╡ ╨┤╤С╤Б╨╡╨╜.\r\n','╨Я╤А╨╡╨┐╨░╤А╨░╤В ╨┐╤А╨╕╨╜╨╕╨╝╨░╨╡╤В╤Б╤П ╨▓╨╜╤Г╤В╤А╤М, ╨┐╨╛╤Б╨╗╨╡ ╨╡╨┤╤Л, ╨┐╤Г╤В╤С╨╝ ╤А╨░╤Б╤Б╨░╤Б╤Л╨▓╨░╨╜╨╕╤П. ╨Я╨╛╤Б╨╗╨╡ ╨┐╨╛╨╗╨╜╨╛╨│╨╛ ╤А╨░╤Б╤В╨▓╨╛╤А╨╡╨╜╨╕╤П ╤В╨░╨▒╨╗╨╡╤В╨║╨╕ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨▓╨╛╨╖╨┤╨╡╤А╨╢╨░╤В╤М╤Б╤П ╨╛╤В ╤Г╨┐╨╛╤В╤А╨╡╨▒╨╗╨╡╨╜╨╕╤П ╨╡╨┤╤Л ╨╕ ╨╜╨░╨┐╨╕╤В╨║╨╛╨▓ (╨┤╨░╨╢╨╡ ╨▓╨╛╨┤╤Л) ╨╜╨░ ╨┐╤А╨╛╤В╤П╨╢╨╡╨╜╨╕╨╕ 1-2 ╤З╨░╤Б╨╛╨▓. ╨б╤Г╤В╨╛╤З╨╜╨░╤П ╨┤╨╛╨╖╨░ ╨┤╨╗╤П ╨╗╨╕╤Ж, ╤Б╤В╨░╤А╤И╨╡ 12 ╨╗╨╡╤В, ╤Б╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В 2 ╤В╨░╨▒╨╗╨╡╤В╨║╨╕ 4 ╤А╨░╨╖╨░ ╨▓ ╤Б╤Г╤В╨║╨╕. ╨Ф╨╗╤П ╨┤╨╡╤В╨╡╨╣ тАФ 1-2 ╤В╨░╨▒╨╗╨╡╤В╨║╨╕ 4 ╤А╨░╨╖╨░ ╨▓ ╤Б╤Г╤В╨║╨╕. ╨Ф╨╛╨╖╨╕╤А╨╛╨▓╨║╨░ ╨╕ ╨┤╨╗╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╤М ╤В╨╡╤А╨░╨┐╨╕╨╕ ╨┐╨╛╨┤╨▒╨╕╤А╨░╨╡╤В╤Б╤П ╨╗╨╡╤З╨░╤Й╨╕╨╝ ╨▓╤А╨░╤З╨╛╨╝ ╨╕╨╜╨┤╨╕╨▓╨╕╨┤╤Г╨░╨╗╤М╨╜╨╛, ╨╜╨╛ ╨╜╨╡ ╨┤╨╛╨╗╨╢╨╜╨░ ╨┐╤А╨╡╨▓╤Л╤И╨░╤В╤М 7 ╨┤╨╜╨╡╨╣.','╨Т ╨╛╤В╨┤╨╡╨╗╤М╨╜╤Л╤Е ╤Б╨╗╤Г╤З╨░╤П╤Е ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╤Л ╨░╨╗╨╗╨╡╤А╨│╨╕╤З╨╡╤Б╨║╨╕╨╡ ╤А╨╡╨░╨║╤Ж╨╕╨╕ ╨╜╨░ ╨║╨╛╨╝╨┐╨╛╨╜╨╡╨╜╤В╤Л ╨┐╤А╨╡╨┐╨░╤А╨░╤В╨░','╨г╤Б╨╕╨╗╨╕╨▓╨░╨╡╤В ╤Н╤Д╤Д╨╡╨║╤В╤Л ╨┤╤А╤Г╨│╨╕╤Е ╨┐╤А╨╛╤В╨╕╨▓╨╛╨╝╨╕╨║╤А╨╛╨▒╨╜╤Л╤Е ╤Б╤А╨╡╨┤╤Б╤В╨▓ ╨╝╨╡╤Б╤В╨╜╨╛╨│╨╛ ╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╨╜╨╛╨│╨╛ ╨┤╨╡╨╣╤Б╤В╨▓╨╕╤П.','2024-12-01','╨│╤А╨░╨╝╨╕╤Ж╨╕╨┤╨╕╨╜╨░ ╨б ╨┤╨╕╨│╨╕╨┤╤А╨╛╤Е╨╗╨╛╤А╨╕╨┤ - 3,20 ╨╝╨│ (╨▓ ╨┐╨╡╤А╨╡╤Б╤З╨╡╤В╨╡ ╨╜╨░ ╨│╤А╨░╨╝╨╕╤Ж╨╕╨┤╨╕╨╜ ╨б - 3,00 ╨╝╨│); ╨╛╨║╤Б╨╕╨▒╤Г╨┐╤А╨╛╨║╨░╨╕╨╜╨░ ╨│╨╕╨┤╤А╨╛╤Е╨╗╨╛╤А╨╕╨┤ - 0,20 ╨╝╨│; ╤Ж╨╡╤В╨╕╨╗╨┐╨╕╤А╨╕╨┤╨╕╨╜╨╕╤П ╤Е╨╗╨╛╤А╨╕╨┤╨░ ╨╝╨╛╨╜╨╛╨│╨╕╨┤╤А╨░╤В - 1,05 ╨╝╨│ (╨▓ ╨┐╨╡╤А╨╡╤Б╤З╨╡╤В╨╡ ╨╜╨░ ╤Ж╨╡╤В╨╕╨╗╨┐╨╕╤А╨╕╨┤╨╕╨╜╨╕╤П ╤Е╨╗╨╛╤А╨╕╨┤ - 1,00 ╨╝╨│);\r\n',20,300),(3,'╨б╤Г╨┐╤А╨░╨┤╨╕╨╜',1,'╨д╤А╨░╨╜╤Ж╨╕╤П','╨Я╤А╨╡╨┐╨░╤А╨░╤В ╨┐╤А╨╕╨╝╨╡╨╜╤П╤О╤В ╨┐╤А╨╕ ╨┐╤А╨╛╤Д╨╕╨╗╨░╨║╤В╨╕╨║╨╡ ╨╕ ╨╗╨╡╤З╨╡╨╜╨╕╨╕ ╨│╨╕╨┐╨╛- ╨╕ ╨░╨▓╨╕╤В╨░╨╝╨╕╨╜╨╛╨╖╨╛╨▓ ╨╕ ╨╜╨╡╨┤╨╛╤Б╤В╨░╤В╨║╨╡ ╨╝╨╕╨╜╨╡╤А╨░╨╗╤М╨╜╤Л╤Е ╨▓╨╡╤Й╨╡╤Б╤В╨▓','╨Т╨╜╤Г╤В╤А╤М, ╨┐╤А╨╡╨┤╨▓╨░╤А╨╕╤В╨╡╨╗╤М╨╜╨╛ ╤А╨░╤Б╤В╨▓╨╛╤А╨╕╨▓ ╨▓ ╤Б╤В╨░╨║╨░╨╜╨╡ ╨▓╨╛╨┤╤Л. ╨Т╨╖╤А╨╛╤Б╨╗╤Л╨╡ ╨╕ ╨┤╨╡╤В╨╕ ╤Б╤В╨░╤А╤И╨╡ 12 ╨╗╨╡╤В: ╨┤╨╗╤П ╨┐╤А╨╛╤Д╨╕╨╗╨░╨║╤В╨╕╨║╨╕ ╨┐╤А╨╕╨╜╨╕╨╝╨░╤В╤М ╨┐╨╛ 1 ╤В╨░╨▒╨╗╨╡╤В╨║╨╡ ╨▓ ╨┤╨╡╨╜╤М; ╨┤╨╗╤П ╨╗╨╡╤З╨╡╨╜╨╕╤П ╨│╨╕╨┐╨╛- ╨╕ ╨░╨▓╨╕╤В╨░╨╝╨╕╨╜╨╛╨╖╨╛╨▓ ╨┐╤А╨╕╨╜╨╕╨╝╨░╤В╤М ╨┐╨╛ 1 ╤В╨░╨▒╨╗╨╡╤В╨║╨╡ ╨▓ ╨┤╨╡╨╜╤М. ╨Ъ╤Г╤А╤Б ╨╗╨╡╤З╨╡╨╜╨╕╤П - 1-2 ╨╝╨╡╤Б╤П╤Ж╨░.\r\n','╨б╨╛ ╤Б╤В╨╛╤А╨╛╨╜╤Л ╨╕╨╝╨╝╤Г╨╜╨╜╨╛╨╣ ╤Б╨╕╤Б╤В╨╡╨╝╤Л: ╨░╨╗╨╗╨╡╤А╨│╨╕╤З╨╡╤Б╨║╨╕╨╡ ╨╕╨╗╨╕ ╨░╨╜╨░╤Д╨╕╨╗╨░╨║╤В╨╕╤З╨╡╤Б╨║╨╕╨╡ ╤А╨╡╨░╨║╤Ж╨╕╨╕ (╤Б╤Л╨┐╤М, ╨║╤А╨░╨┐╨╕╨▓╨╜╨╕╤Ж╨░, ╨╛╤В╨╡╨║ ╨╗╨╕╤Ж╨░, ╤Б╨▓╨╕╤Б╤В╤П╤Й╨╡╨╡ ╨┤╤Л╤Е╨░╨╜╨╕╨╡, ╨╛╨┤╤Л╤И╨║╨░, ╨┐╨╛╨║╤А╨░╤Б╨╜╨╡╨╜╨╕╨╡ ╨║╨╛╨╢╨╕, ╨╖╤Г╨┤, ╨▓╨╛╨╗╨┤╤Л╤А╨╕, ╤И╨╛╨║). ╨Т ╤Б╨╗╤Г╤З╨░╨╡ ╨▓╨╛╨╖╨╜╨╕╨║╨╜╨╛╨▓╨╡╨╜╨╕╤П ╨░╨╗╨╗╨╡╤А╨│╨╕╤З╨╡╤Б╨║╨╛╨╣ ╤А╨╡╨░╨║╤Ж╨╕╨╕ ╤Б╨╗╨╡╨┤╤Г╨╡╤В ╨┐╤А╨╡╨║╤А╨░╤В╨╕╤В╤М ╨┐╤А╨╕╨╡╨╝ ╨┐╤А╨╡╨┐╨░╤А╨░╤В╨░ ╨╕ ╨╛╨▒╤А╨░╤В╨╕╤В╤М╤Б╤П ╨║ ╨▓╤А╨░╤З╤Г.  ╨б╨╛ ╤Б╤В╨╛╤А╨╛╨╜╤Л ╨┐╨╕╤Й╨╡╨▓╨░╤А╨╕╤В╨╡╨╗╤М╨╜╨╛╨╣ ╤Б╨╕╤Б╤В╨╡╨╝╤Л: ╨▒╨╛╨╗╨╕ ╨▓ ╨╢╨╡╨╗╤Г╨┤╨║╨╡, ╨║╨╕╤И╨╡╤З╨╜╨╕╨║╨╡, ╨╖╨░╨┐╨╛╤А, ╨┤╨╕╨░╤А╨╡╤П, ╨╝╨╡╤В╨╡╨╛╤А╨╕╨╖╨╝, ╤В╨╛╤И╨╜╨╛╤В╨░, ╤А╨▓╨╛╤В╨░.  ╨б╨╛ ╤Б╤В╨╛╤А╨╛╨╜╤Л ╨╜╨╡╤А╨▓╨╜╨╛╨╣ ╤Б╨╕╤Б╤В╨╡╨╝╤Л: ╨│╨╛╨╗╨╛╨▓╨╜╨░╤П ╨▒╨╛╨╗╤М, ╨│╨╛╨╗╨╛╨▓╨╛╨║╤А╤Г╨╢╨╡╨╜╨╕╨╡, ╨▒╨╡╤Б╤Б╨╛╨╜╨╜╨╕╤Ж╨░, ╨╜╨╡╤А╨▓╨╛╨╖╨╜╨╛╤Б╤В╤М.','╨Э╨╡ ╨┐╤А╨╕╨╜╨╕╨╝╨░╤В╤М ╨╛╨┤╨╜╨╛╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛ ╨┤╤А╤Г╨│╨╕╨╡ ╨┐╨╛╨╗╨╕╨▓╨╕╤В╨░╨╝╨╕╨╜╨╜╤Л╨╡ ╨┐╤А╨╡╨┐╨░╤А╨░╤В╤Л.','2024-12-01','╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨Р (╨▓╨╕╤В╨░╨╝╨╕╨╜ ╨Р ╨┐╨░╨╗╤М╨╝╨╕╤В╨░╤В), ╨Т╨╕╤В╨░╨╝╨╕╨╜ B1 (╤В╨╕╨░╨╝╨╕╨╜╨░ ╨│╨╕╨┤╤А╨╛╤Е╨╗╨╛╤А╨╕╨┤)  20,0 ╨╝╨│, ╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨Т2 (╤А╨╕╨▒╨╛╤Д╨╗╨░╨▓╨╕╨╜), ╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨Т6 (╨┐╨╕╤А╨╕╨┤╨╛╨║╤Б╨╕╨╜╨░ ╨│╨╕╨┤╤А╨╛╤Е╨╗╨╛╤А╨╕╨┤) 10,0 ╨╝╨│, ╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨Т12 (╤Ж╨╕╨░╨╜╨╛╨║╨╛╨▒╨░╨╗╨░╨╝╨╕╨╜)4   5,0 ╨╝╨║╨│, ╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨б (╨░╤Б╨║╨╛╤А╨▒╨╕╨╜╨╛╨▓╨░╤П ╨║╨╕╤Б╨╗╨╛╤В╨░)  150,0 ╨╝╨│, ╨Т╨╕╤В╨░╨╝╨╕╨╜ D3 (╨║╨╛╨╗╨╡╨║╨░╨╗╤М╤Ж╨╕╤Д╨╡╤А╨╛╨╗)5   500 ME, ╨Т╨╕╤В╨░╨╝╨╕╨╜ ╨Х (DL-╨░╨╗╤М╤Д╨░-╤В╨╛╨║╨╛╤Д╨╡╤А╨╕╨╗╨░ ╨░╤Ж╨╡╤В╨░╤В) 10.0 ╨╝╨│, ╨С╨╕╨╛╤В╨╕╨╜ 0,25 ╨╝╨│, ╨Ъ╨░╨╗╤М╤Ж╨╕╤П ╨┐╨░╨╜╤В╨╛╤В╨╡╨╜╨░╤В 11,6 ╨╝╨│, ╨д╨╛╨╗╨╕╨╡╨▓╨░╤П ╨║╨╕╤Б╨╗╨╛╤В╨░ 1,0 ╨╝╨│\r\n',20,1500);
/*!40000 ALTER TABLE `MedicinesCatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `Order_ID` int NOT NULL,
  `Courier_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  `Pharmacist_ID` int NOT NULL,
  `Address` text NOT NULL,
  `Status` text NOT NULL,
  `Total_price` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Client_ID` (`Client_ID`),
  KEY `Courier_ID` (`Courier_ID`),
  KEY `Pharmacist_ID` (`Pharmacist_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `Client` (`Client_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Courier_ID`) REFERENCES `Courier` (`Courier_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`Pharmacist_ID`) REFERENCES `Pharmacist` (`Pharmacist_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,1,1,'╨а╨╡╤Б╨┐╤Г╨▒╨╗╨╕╨║╨╕ 12, ╨┤. 1, ╨║╨▓. 10','╨б╨╛╤Б╤В╨░╨▓╨╗╨╡╨╜',1800),(2,2,2,2,'╨Э╨╕╨║╨╛╨╗╨░╤П ╨а╨╛╤Б╤В╨╛╨▓╤Ж╨╡╨▓╨░ ╨┤. 20, ╨║╨▓ 123','╨Ю╤Д╨╛╤А╨╝╨╗╨╡╨╜',300),(3,3,3,3,'╨Э╨╕╨║╨╛╨╗╨░╤П ╨а╨╛╤Б╤В╨╛╨▓╤Ж╨╡╨▓╨░ ╨┤. 10, ╨║╨▓ 19','╨Ю╨┐╨╗╨░╤З╨╡╨╜',1500);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderMedicines`
--

DROP TABLE IF EXISTS `OrderMedicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderMedicines` (
  `Order_ID` int NOT NULL,
  `Recipe_ID` int NOT NULL,
  `Medicines_ID` int NOT NULL,
  `Count` int NOT NULL,
  KEY `Order_ID` (`Order_ID`),
  KEY `Recipe_ID` (`Recipe_ID`),
  KEY `Medicines_ID` (`Medicines_ID`),
  CONSTRAINT `ordermedicines_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordermedicines_ibfk_2` FOREIGN KEY (`Recipe_ID`) REFERENCES `Recipe` (`Recipe_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordermedicines_ibfk_3` FOREIGN KEY (`Medicines_ID`) REFERENCES `MedicinesCatalog` (`Medicines_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderMedicines`
--

LOCK TABLES `OrderMedicines` WRITE;
/*!40000 ALTER TABLE `OrderMedicines` DISABLE KEYS */;
INSERT INTO `OrderMedicines` VALUES (1,123,2,1),(1,124,3,1),(2,231,2,1),(3,432,3,1);
/*!40000 ALTER TABLE `OrderMedicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacist`
--

DROP TABLE IF EXISTS `Pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pharmacist` (
  `Pharmacist_ID` int NOT NULL,
  `Login` text NOT NULL,
  `Phone_number` bigint NOT NULL,
  `Code` int NOT NULL,
  `Level_education` text NOT NULL,
  PRIMARY KEY (`Pharmacist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacist`
--

LOCK TABLES `Pharmacist` WRITE;
/*!40000 ALTER TABLE `Pharmacist` DISABLE KEYS */;
INSERT INTO `Pharmacist` VALUES (1,'Farm1',79324332156,324545,'╨Т╤Л╤Б╤И╨╡╨╡'),(2,'Farm2',79233241254,234657,'╨б╤А╨╡╨┤╨╜╨╡╨╡-╤Б╨┐╨╡╤Ж╨╕╨░╨╗╤М╨╜╨╛╨╡'),(3,'Farm3',79437882915,234767,'╨Т╤Л╤Б╤И╨╡╨╡');
/*!40000 ALTER TABLE `Pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `Recipe_ID` int NOT NULL,
  `Medicines_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  `Expiration_date` date NOT NULL,
  `QR_code` bigint NOT NULL,
  PRIMARY KEY (`Recipe_ID`),
  KEY `Client_ID` (`Client_ID`),
  KEY `Medicines_ID` (`Medicines_ID`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `Client` (`Client_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`Medicines_ID`) REFERENCES `MedicinesCatalog` (`Medicines_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (123,2,1,'2023-02-28',2347631209),(124,3,1,'2023-03-31',2347631222),(231,2,2,'2023-02-28',2142323489),(432,3,3,'2023-03-31',1235409023);
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 14:52:47
