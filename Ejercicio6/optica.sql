-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: opticadb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_Clientes` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_reg` date NOT NULL,
  `recomendacion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Franklin','Sol i Aire',606999767,'avenida@avenida.com','0000-00-00','amigo'),(20,'Franklin','Sol i Aire',606999767,'avenida@avenida.com','2021-08-22','amigo'),(21,'Franklin','Sol i Aire',606999767,'avenida@avenida.com','2021-08-22','amigo'),(101,'Franklin','Sol i Aire',606999767,'avenida@avenida.com','0000-00-00','amigo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dire_prove`
--

DROP TABLE IF EXISTS `dire_prove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dire_prove` (
  `id_Dire_Prove` int(11) NOT NULL AUTO_INCREMENT,
  `id_Proveedor` int(11) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `num` int(11) NOT NULL,
  `piso` int(11) NOT NULL,
  `puerta` varchar(2) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `cp` int(11) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Dire_Prove`),
  KEY `id_Proveedor_idx` (`id_Proveedor`),
  CONSTRAINT `id_Proveedor` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dire_prove`
--

LOCK TABLES `dire_prove` WRITE;
/*!40000 ALTER TABLE `dire_prove` DISABLE KEYS */;
INSERT INTO `dire_prove` VALUES (1,30,'Sol i Aire',200,1,'b','barcelona',8035,'España');
/*!40000 ALTER TABLE `dire_prove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `id_g` int(11) NOT NULL,
  PRIMARY KEY (`id_Factura`),
  KEY `id_Cliente_idx` (`id_cliente`),
  KEY `id_vendedor_idx` (`id_vendedor`),
  KEY `id_g_idx` (`id_g`),
  CONSTRAINT `id_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_Clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_g` FOREIGN KEY (`id_g`) REFERENCES `gafa` (`id_Gafa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_Vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (400,21,20,100,40);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafa`
--

DROP TABLE IF EXISTS `gafa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafa` (
  `id_Gafa` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id_Gafa`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafa`
--

LOCK TABLES `gafa` WRITE;
/*!40000 ALTER TABLE `gafa` DISABLE KEYS */;
INSERT INTO `gafa` VALUES (40,'Summer',100);
/*!40000 ALTER TABLE `gafa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` int(11) NOT NULL,
  `id_Gafa` int(11) NOT NULL,
  PRIMARY KEY (`id_Proveedor`),
  KEY `id_Gafa_idx` (`id_Gafa`),
  CONSTRAINT `id_Gafa` FOREIGN KEY (`id_Gafa`) REFERENCES `gafa` (`id_Gafa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (30,606999767,606999767,400400400,40);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_Vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (20,'Manel','García');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-22 15:14:33
