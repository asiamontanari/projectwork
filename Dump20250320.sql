CREATE DATABASE  IF NOT EXISTS `gestioneferroviaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestioneferroviaria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gestioneferroviaria
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
  `TrattaID` int NOT NULL,
  `Data` date NOT NULL,
  `Prezzo` decimal(10,2) NOT NULL,
  `Classe` varchar(50) NOT NULL,
  PRIMARY KEY (`BigliettoID`),
  KEY `TrattaID` (`TrattaID`),
  CONSTRAINT `biglietti_ibfk_1` FOREIGN KEY (`TrattaID`) REFERENCES `tratte` (`TrattaID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietti`
--

LOCK TABLES `biglietti` WRITE;
/*!40000 ALTER TABLE `biglietti` DISABLE KEYS */;
INSERT INTO `biglietti` VALUES (1,1,'2025-03-15',89.00,'Prima'),(2,2,'2025-03-16',39.00,'Terza'),(3,3,'2025-03-17',55.00,'Prima'),(4,4,'2025-03-18',40.00,'Seconda'),(5,5,'2025-03-19',65.00,'Seconda'),(6,6,'2025-03-20',25.00,'Terza');
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
  CONSTRAINT `biglietti_sconti_ibfk_1` FOREIGN KEY (`BigliettoID`) REFERENCES `biglietti` (`BigliettoID`) ON DELETE CASCADE,
  CONSTRAINT `biglietti_sconti_ibfk_2` FOREIGN KEY (`ScontoID`) REFERENCES `sconti` (`ScontoID`) ON DELETE CASCADE
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
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Telefono` (`Telefono`)
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
  `ClienteID` int NOT NULL,
  `BigliettoID` int NOT NULL,
  `Stato` enum('Confermato','Annullato','In attesa') NOT NULL,
  PRIMARY KEY (`PrenotazioneID`),
  KEY `ClienteID` (`ClienteID`),
  KEY `BigliettoID` (`BigliettoID`),
  CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clienti` (`ClienteID`) ON DELETE CASCADE,
  CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`BigliettoID`) REFERENCES `biglietti` (`BigliettoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioni`
--

LOCK TABLES `prenotazioni` WRITE;
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
INSERT INTO `prenotazioni` VALUES (1,1,1,'Confermato'),(2,2,2,'Annullato'),(3,3,3,'Confermato'),(4,4,4,'In attesa'),(5,5,5,'Annullato'),(6,6,6,'Confermato');
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
  `Tipo` varchar(50) NOT NULL,
  `Percentuale` int NOT NULL,
  PRIMARY KEY (`ScontoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sconti`
--

LOCK TABLES `sconti` WRITE;
/*!40000 ALTER TABLE `sconti` DISABLE KEYS */;
INSERT INTO `sconti` VALUES (1,'Studente',20),(2,'Anziani',30),(3,'Promo',10),(4,'Famiglia',15),(5,'Lavoratori',25);
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
  `Nome` varchar(100) NOT NULL,
  `Località` varchar(100) NOT NULL,
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
  `StazionePartenza` int NOT NULL,
  `StazioneArrivo` int NOT NULL,
  `Durata` decimal(4,2) NOT NULL,
  `Prezzo` decimal(10,2) NOT NULL,
  `TrenoID` int NOT NULL,
  PRIMARY KEY (`TrattaID`),
  KEY `StazionePartenza` (`StazionePartenza`),
  KEY `StazioneArrivo` (`StazioneArrivo`),
  KEY `TrenoID` (`TrenoID`),
  CONSTRAINT `tratte_ibfk_1` FOREIGN KEY (`StazionePartenza`) REFERENCES `stazioni` (`StazioneID`) ON DELETE CASCADE,
  CONSTRAINT `tratte_ibfk_2` FOREIGN KEY (`StazioneArrivo`) REFERENCES `stazioni` (`StazioneID`) ON DELETE CASCADE,
  CONSTRAINT `tratte_ibfk_3` FOREIGN KEY (`TrenoID`) REFERENCES `treni` (`TrenoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratte`
--

LOCK TABLES `tratte` WRITE;
/*!40000 ALTER TABLE `tratte` DISABLE KEYS */;
INSERT INTO `tratte` VALUES (1,1,2,3.30,90.00,1),(2,2,3,1.30,30.00,2),(3,3,4,2.15,50.00,3),(4,1,5,1.10,35.00,4),(5,5,6,3.00,50.00,1),(6,6,7,4.30,85.00,3);
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
  PRIMARY KEY (`TrattaID`,`StazioneID`),
  KEY `StazioneID` (`StazioneID`),
  CONSTRAINT `tratte_stazioni_ibfk_1` FOREIGN KEY (`TrattaID`) REFERENCES `tratte` (`TrattaID`) ON DELETE CASCADE,
  CONSTRAINT `tratte_stazioni_ibfk_2` FOREIGN KEY (`StazioneID`) REFERENCES `stazioni` (`StazioneID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratte_stazioni`
--

LOCK TABLES `tratte_stazioni` WRITE;
/*!40000 ALTER TABLE `tratte_stazioni` DISABLE KEYS */;
INSERT INTO `tratte_stazioni` VALUES (1,1),(4,1),(2,2),(3,3),(5,5);
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
  `Capacità` int NOT NULL,
  `Servizi` text,
  PRIMARY KEY (`TrenoID`)
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

-- Dump completed on 2025-03-20 18:29:03
