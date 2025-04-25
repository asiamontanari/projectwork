CREATE DATABASE  IF NOT EXISTS `new_gestioneferroviaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `new_gestioneferroviaria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: new_gestioneferroviaria
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `biglietti`
--

DROP TABLE IF EXISTS `biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biglietti` (
  `BigliettoID` int NOT NULL AUTO_INCREMENT,
  `Data` date DEFAULT NULL,
  `Prezzo` decimal(8,2) DEFAULT NULL,
  `Classe` varchar(20) DEFAULT NULL,
  `TrattaID` int DEFAULT NULL,
  `PrenotazioneID` int DEFAULT NULL,
  PRIMARY KEY (`BigliettoID`),
  KEY `TrattaID` (`TrattaID`),
  KEY `PrenotazioneID` (`PrenotazioneID`),
  KEY `idx_biglietti_data` (`Data`),
  CONSTRAINT `biglietti_ibfk_1` FOREIGN KEY (`TrattaID`) REFERENCES `tratte` (`TrattaID`),
  CONSTRAINT `biglietti_ibfk_2` FOREIGN KEY (`PrenotazioneID`) REFERENCES `prenotazioni` (`PrenotazioneID`),
  CONSTRAINT `biglietti_chk_1` CHECK ((`Prezzo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietti`
--

LOCK TABLES `biglietti` WRITE;
/*!40000 ALTER TABLE `biglietti` DISABLE KEYS */;
INSERT INTO `biglietti` VALUES (1,'2025-03-15',89.00,'Prima',1,1),(2,'2025-03-16',39.00,'Terza',2,2),(3,'2025-03-17',55.00,'Prima',3,3),(4,'2025-03-18',40.00,'Seconda',4,4),(5,'2025-03-19',65.00,'Seconda',5,5),(6,'2025-03-20',25.00,'Terza',6,6);
/*!40000 ALTER TABLE `biglietti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biglietti_sconti`
--

DROP TABLE IF EXISTS `biglietti_sconti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biglietti_sconti` (
  `BigliettoID` int NOT NULL,
  `ScontoID` int NOT NULL,
  PRIMARY KEY (`BigliettoID`,`ScontoID`),
  KEY `ScontoID` (`ScontoID`),
  CONSTRAINT `biglietti_sconti_ibfk_1` FOREIGN KEY (`BigliettoID`) REFERENCES `biglietti` (`BigliettoID`),
  CONSTRAINT `biglietti_sconti_ibfk_2` FOREIGN KEY (`ScontoID`) REFERENCES `sconti` (`ScontoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietti_sconti`
--

LOCK TABLES `biglietti_sconti` WRITE;
/*!40000 ALTER TABLE `biglietti_sconti` DISABLE KEYS */;
INSERT INTO `biglietti_sconti` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `biglietti_sconti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambi`
--

DROP TABLE IF EXISTS `cambi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambi` (
  `CambioID` int NOT NULL AUTO_INCREMENT,
  `ClienteID` int DEFAULT NULL,
  `StazioneID` int DEFAULT NULL,
  `OrdineCambio` int DEFAULT NULL,
  PRIMARY KEY (`CambioID`),
  KEY `ClienteID` (`ClienteID`),
  KEY `StazioneID` (`StazioneID`),
  CONSTRAINT `cambi_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clienti` (`ClienteID`),
  CONSTRAINT `cambi_ibfk_2` FOREIGN KEY (`StazioneID`) REFERENCES `stazioni` (`StazioneID`),
  CONSTRAINT `cambi_chk_1` CHECK ((`OrdineCambio` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambi`
--

LOCK TABLES `cambi` WRITE;
/*!40000 ALTER TABLE `cambi` DISABLE KEYS */;
INSERT INTO `cambi` VALUES (1,1,5,1),(2,1,6,2),(3,3,3,1),(4,4,2,1);
/*!40000 ALTER TABLE `cambi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE KEY `idx_email_telefono` (`Email`,`Telefono`),
  CONSTRAINT `clienti_chk_1` CHECK ((char_length(`Email`) <= 100)),
  CONSTRAINT `clienti_chk_2` CHECK ((`email` like _utf8mb4'%@%'))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Mario Rossi','mario.rossi@email.com','3455678231'),(2,'Anna Bianchi','anna.bianchi@email.com','3471234678'),(3,'Luca Verdi','luca.verdi@email.com','3336545677'),(4,'Giulia Neri','giulia.neri@email.com','3487612345'),(5,'Marco Blu','marco.blu@email.com','3209078564'),(6,'Serena Rosa','serena.rosa@email.com','3298456112');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazioni` (
  `PrenotazioneID` int NOT NULL AUTO_INCREMENT,
  `Stato` varchar(20) DEFAULT NULL,
  `ClienteID` int DEFAULT NULL,
  PRIMARY KEY (`PrenotazioneID`),
  KEY `idx_prenotazioni_cliente` (`ClienteID`),
  CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clienti` (`ClienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioni`
--

LOCK TABLES `prenotazioni` WRITE;
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
INSERT INTO `prenotazioni` VALUES (1,'Confermato',1),(2,'Annullato',2),(3,'Confermato',3),(4,'In attesa',4),(5,'Annullato',5),(6,'Confermato',6);
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sconti`
--

DROP TABLE IF EXISTS `sconti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sconti` (
  `ScontoID` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) DEFAULT NULL,
  `Percentuale` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ScontoID`),
  CONSTRAINT `sconti_chk_1` CHECK ((`Percentuale` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconti`
--

LOCK TABLES `sconti` WRITE;
/*!40000 ALTER TABLE `sconti` DISABLE KEYS */;
INSERT INTO `sconti` VALUES (1,'Studente',20.00),(2,'Anziani',30.00),(3,'Promo',10.00),(4,'Famiglia',15.00),(5,'Lavoratori',25.00);
/*!40000 ALTER TABLE `sconti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stazioni`
--

DROP TABLE IF EXISTS `stazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stazioni` (
  `StazioneID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Località` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StazioneID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stazioni`
--

LOCK TABLES `stazioni` WRITE;
/*!40000 ALTER TABLE `stazioni` DISABLE KEYS */;
INSERT INTO `stazioni` VALUES (1,'Milano Centrale','Milano'),(2,'Roma Termini','Roma'),(3,'Firenze SMN','Firenze'),(4,'Napoli Centrale','Napoli'),(5,'Bologna Centrale','Bologna'),(6,'Venezia S.L.','Venezia'),(7,'Torino Porta Nuova','Torino');
/*!40000 ALTER TABLE `stazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratte`
--

DROP TABLE IF EXISTS `tratte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratte` (
  `TrattaID` int NOT NULL AUTO_INCREMENT,
  `Durata` time DEFAULT NULL,
  `Prezzo` decimal(8,2) DEFAULT NULL,
  `TrenoID` int DEFAULT NULL,
  `StazionePartenza` int DEFAULT NULL,
  `StazioneArrivo` int DEFAULT NULL,
  PRIMARY KEY (`TrattaID`),
  KEY `TrenoID` (`TrenoID`),
  KEY `idx_stazione_partenza` (`StazionePartenza`),
  KEY `idx_stazione_arrivo` (`StazioneArrivo`),
  CONSTRAINT `tratte_ibfk_1` FOREIGN KEY (`TrenoID`) REFERENCES `treni` (`TrenoID`),
  CONSTRAINT `tratte_ibfk_2` FOREIGN KEY (`StazionePartenza`) REFERENCES `stazioni` (`StazioneID`),
  CONSTRAINT `tratte_ibfk_3` FOREIGN KEY (`StazioneArrivo`) REFERENCES `stazioni` (`StazioneID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratte`
--

LOCK TABLES `tratte` WRITE;
/*!40000 ALTER TABLE `tratte` DISABLE KEYS */;
INSERT INTO `tratte` VALUES (1,'03:30:00',90.00,1,1,2),(2,'01:30:00',30.00,2,2,3),(3,'02:15:00',50.00,3,3,4),(4,'01:10:00',35.00,4,1,5),(5,'03:00:00',50.00,1,5,6),(6,'04:30:00',85.00,3,6,7);
/*!40000 ALTER TABLE `tratte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratte_stazioni`
--

DROP TABLE IF EXISTS `tratte_stazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratte_stazioni` (
  `TrattaID` int NOT NULL,
  `StazioneID` int NOT NULL,
  `OrarioArrivo` time DEFAULT NULL,
  `OrarioPartenza` time DEFAULT NULL,
  PRIMARY KEY (`TrattaID`,`StazioneID`),
  KEY `StazioneID` (`StazioneID`),
  CONSTRAINT `tratte_stazioni_ibfk_1` FOREIGN KEY (`TrattaID`) REFERENCES `tratte` (`TrattaID`),
  CONSTRAINT `tratte_stazioni_ibfk_2` FOREIGN KEY (`StazioneID`) REFERENCES `stazioni` (`StazioneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratte_stazioni`
--

LOCK TABLES `tratte_stazioni` WRITE;
/*!40000 ALTER TABLE `tratte_stazioni` DISABLE KEYS */;
INSERT INTO `tratte_stazioni` VALUES (1,1,NULL,'08:00:00'),(2,2,'09:30:00','09:45:00'),(3,3,'10:45:00','11:00:00'),(4,1,'11:30:00',NULL),(5,5,'13:00:00','13:20:00'),(6,6,'19:00:00','19:25:00');
/*!40000 ALTER TABLE `tratte_stazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treni`
--

DROP TABLE IF EXISTS `treni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treni` (
  `TrenoID` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) DEFAULT NULL,
  `Capacità` int DEFAULT NULL,
  `Servizi` text,
  PRIMARY KEY (`TrenoID`),
  CONSTRAINT `treni_chk_1` CHECK ((`Capacità` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treni`
--

LOCK TABLES `treni` WRITE;
/*!40000 ALTER TABLE `treni` DISABLE KEYS */;
INSERT INTO `treni` VALUES (1,'Regionale',200,'Wi-Fi'),(2,'Alta Velocità',300,'Wi-Fi, Ristorante'),(3,'Intercity',400,'Wi-Fi, Bagagli'),(4,'Intercity Notturno',550,'Cuccette, Ristorante');
/*!40000 ALTER TABLE `treni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25 20:53:48
