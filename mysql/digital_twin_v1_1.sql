/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: digital_twin
-- ------------------------------------------------------
-- Server version	10.4.34-MariaDB-1:10.4.34+maria~ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allarmi`
--

DROP TABLE IF EXISTS `allarmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `allarmi` (
  `id_allarme` int(11) NOT NULL AUTO_INCREMENT,
  `id_sensore` int(11) DEFAULT NULL,
  `timestamp_inizio` datetime NOT NULL,
  `timestamp_fine` datetime NOT NULL,
  `livello` decimal(2,1) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_allarme`),
  KEY `id_sensore` (`id_sensore`),
  CONSTRAINT `allarmi_ibfk_1` FOREIGN KEY (`id_sensore`) REFERENCES `sensori` (`id_sensore`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allarmi`
--

LOCK TABLES `allarmi` WRITE;
/*!40000 ALTER TABLE `allarmi` DISABLE KEYS */;
INSERT INTO `allarmi` VALUES (1,2,'2002-07-04 15:40:15','2002-07-07 23:05:17',9.9,'crisi di calore'),(2,1,'2014-07-31 23:40:20','2014-08-01 04:17:43',2.5,'velocita pericolosa'),(3,2,'2022-08-12 12:40:59','2022-08-12 17:45:41',7.4,'sbalzo di temperatura');
/*!40000 ALTER TABLE `allarmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutenzioni`
--

DROP TABLE IF EXISTS `manutenzioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutenzioni` (
  `id_manutenzione` int(11) NOT NULL AUTO_INCREMENT,
  `id_allarme` int(11) DEFAULT NULL,
  `tecnico` varchar(50) DEFAULT NULL,
  `data_intervento` date DEFAULT NULL,
  `esito` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_manutenzione`),
  KEY `id_allarme` (`id_allarme`),
  CONSTRAINT `manutenzioni_ibfk_1` FOREIGN KEY (`id_allarme`) REFERENCES `allarmi` (`id_allarme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutenzioni`
--

LOCK TABLES `manutenzioni` WRITE;
/*!40000 ALTER TABLE `manutenzioni` DISABLE KEYS */;
INSERT INTO `manutenzioni` VALUES (1,2,'Cortesi Andrea','2002-07-04','successo'),(2,1,'Mario Mario','2020-04-11','successo');
/*!40000 ALTER TABLE `manutenzioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rilevazioni`
--

DROP TABLE IF EXISTS `rilevazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rilevazioni` (
  `id_rilevazione` int(11) NOT NULL AUTO_INCREMENT,
  `id_sensore` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `valori` decimal(10,2) NOT NULL,
  `quantita` int(11) NOT NULL,
  PRIMARY KEY (`id_rilevazione`),
  KEY `id_sensore` (`id_sensore`),
  CONSTRAINT `rilevazioni_ibfk_1` FOREIGN KEY (`id_sensore`) REFERENCES `sensori` (`id_sensore`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rilevazioni`
--

LOCK TABLES `rilevazioni` WRITE;
/*!40000 ALTER TABLE `rilevazioni` DISABLE KEYS */;
INSERT INTO `rilevazioni` VALUES (1,1,'2026-10-28 03:40:01',53.71,1),(2,2,'2026-10-29 07:20:07',12.40,3),(3,2,'2026-10-31 23:59:40',13.17,12);
/*!40000 ALTER TABLE `rilevazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensori`
--

DROP TABLE IF EXISTS `sensori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensori` (
  `id_sensore` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `unita_misura` varchar(10) NOT NULL,
  `posizione` varchar(20) NOT NULL,
  `data_installazione` date DEFAULT NULL,
  PRIMARY KEY (`id_sensore`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensori`
--

LOCK TABLES `sensori` WRITE;
/*!40000 ALTER TABLE `sensori` DISABLE KEYS */;
INSERT INTO `sensori` VALUES (1,'accelerometro','m/s','binari','2013-03-13'),(2,'termometro','°','termometro','2001-07-11');
/*!40000 ALTER TABLE `sensori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 11:32:26
