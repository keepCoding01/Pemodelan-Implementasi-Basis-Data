-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tugas2
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `231112518_pegawai`
--

DROP TABLE IF EXISTS `231112518_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `231112518_pegawai` (
  `NIP` char(5) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Tgl_Lahir` date NOT NULL,
  `Kode_Bgn` int NOT NULL,
  `Jlh_Anak` int NOT NULL DEFAULT '0',
  `Tgl_Masuk` date NOT NULL,
  `Alamat_Rumah` varchar(30) NOT NULL,
  `Kota_Alamat` varchar(30) NOT NULL,
  `Alamat_Lengkap` varchar(60) NOT NULL,
  PRIMARY KEY (`NIP`),
  KEY `fk_Kode_Bgn_bagian_idx` (`Kode_Bgn`),
  CONSTRAINT `fk_Kode_Bgn_bagian` FOREIGN KEY (`Kode_Bgn`) REFERENCES `231112518_bagian` (`Kode_Bgn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `231112518_pegawai`
--

LOCK TABLES `231112518_pegawai` WRITE;
/*!40000 ALTER TABLE `231112518_pegawai` DISABLE KEYS */;
INSERT INTO `231112518_pegawai` VALUES ('P0001','Adi','1990-06-20',2,3,'2012-03-01','Jl.Thamrin 112','Medan','Jl.Thamrin 112 Medan'),('P0002','Budi','1992-03-15',1,2,'2012-05-15','Jl.Asia 54','Binjai','Jl.Asia 54 Binjai');
/*!40000 ALTER TABLE `231112518_pegawai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27  0:26:10
