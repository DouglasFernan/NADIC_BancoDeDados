CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `idAutor` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Data_nasci` date NOT NULL,
  `Nacionalidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Douglas','1999-06-08','Brasileiro'),(2,'Toin','2003-05-02','Brasileiro'),(3,'Weslley','2001-08-27','Brasileiro'),(4,'Yasmin','2000-02-10','Brasileiro'),(5,'Frederico','2003-04-15','Mexicano');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `idEditora` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Rua` varchar(45) NOT NULL,
  `Número` int NOT NULL,
  `CEP` varchar(45) NOT NULL,
  PRIMARY KEY (`idEditora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Editora maia','Novo Encanto','Rua das bananeiras',46,'59905-000'),(2,'Editora Fernandes','Antonio Cajazeiras','Rua Maria Elvira de Carvalho',33,'59905-000'),(3,'Nina nova','Rua velha','Rua José Apolônio da Costa',21,'59905-000');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empréstimo`
--

DROP TABLE IF EXISTS `empréstimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empréstimo` (
  `idEmpréstimo` int NOT NULL,
  `Data_empres` date NOT NULL,
  `Data_devolu` date NOT NULL,
  PRIMARY KEY (`idEmpréstimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empréstimo`
--

LOCK TABLES `empréstimo` WRITE;
/*!40000 ALTER TABLE `empréstimo` DISABLE KEYS */;
INSERT INTO `empréstimo` VALUES (1,'2023-12-29','2024-01-27'),(2,'2024-01-02','2024-01-30'),(3,'2024-01-15','2024-02-20');
/*!40000 ALTER TABLE `empréstimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empréstimo_livro`
--

DROP TABLE IF EXISTS `empréstimo_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empréstimo_livro` (
  `idEmpréstimo` int NOT NULL,
  `idLivro` int NOT NULL,
  PRIMARY KEY (`idEmpréstimo`,`idLivro`),
  KEY `fk_empréstimo_has_livro_livro1_idx` (`idLivro`),
  KEY `fk_empréstimo_has_livro_empréstimo1_idx` (`idEmpréstimo`),
  CONSTRAINT `fk_empréstimo_has_livro_empréstimo1` FOREIGN KEY (`idEmpréstimo`) REFERENCES `empréstimo` (`idEmpréstimo`),
  CONSTRAINT `fk_empréstimo_has_livro_livro1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`idLivro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empréstimo_livro`
--

LOCK TABLES `empréstimo_livro` WRITE;
/*!40000 ALTER TABLE `empréstimo_livro` DISABLE KEYS */;
INSERT INTO `empréstimo_livro` VALUES (1,1),(3,2),(1,3),(2,4),(2,5);
/*!40000 ALTER TABLE `empréstimo_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `idLivro` int NOT NULL,
  `Gênero` varchar(45) NOT NULL,
  `Título` varchar(45) NOT NULL,
  `Ano_publi` date NOT NULL,
  `idEditora` int NOT NULL,
  PRIMARY KEY (`idLivro`,`idEditora`),
  KEY `fk_idEditora_idx` (`idEditora`),
  CONSTRAINT `fk_idEditora` FOREIGN KEY (`idEditora`) REFERENCES `editora` (`idEditora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Romance','A volta dos que não foram','2000-10-25',2),(2,'Suspense','A lua cheia','2023-10-25',3),(3,'Romance','First love','2019-11-02',2),(4,'Aventura','E lá vamos nós','1999-08-19',1),(5,'Aventura','A caçada','2010-03-03',1);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_autor`
--

DROP TABLE IF EXISTS `livro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_autor` (
  `idLivro` int NOT NULL,
  `idAutor` int NOT NULL,
  PRIMARY KEY (`idLivro`,`idAutor`),
  KEY `fk_livro_has_autor_autor1_idx` (`idAutor`),
  KEY `fk_livro_has_autor_livro1_idx` (`idLivro`),
  CONSTRAINT `fk_livro_has_autor_autor1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  CONSTRAINT `fk_livro_has_autor_livro1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`idLivro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_autor`
--

LOCK TABLES `livro_autor` WRITE;
/*!40000 ALTER TABLE `livro_autor` DISABLE KEYS */;
INSERT INTO `livro_autor` VALUES (1,1),(3,1),(2,3),(4,4),(5,4);
/*!40000 ALTER TABLE `livro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuário`
--

DROP TABLE IF EXISTS `usuário`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuário` (
  `idUsuário` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Rua` varchar(45) NOT NULL,
  `Número` int NOT NULL,
  `CEP` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuário`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuário`
--

LOCK TABLES `usuário` WRITE;
/*!40000 ALTER TABLE `usuário` DISABLE KEYS */;
INSERT INTO `usuário` VALUES (1,'Douglas Fernandes','Antonio Cajazeiras','Maria Elvira de Carvalho',33,'59905-000'),(2,'Yasmin Maia','Centro','Francisco Canindé',106,'59900-000'),(3,'Thiago','Chico cajá','Rua dos coqueiros',758,'59900-000'),(4,'Aluísio','Novo Encanto','Avenida da independência',246,'59900-000');
/*!40000 ALTER TABLE `usuário` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuário_tel`
--

DROP TABLE IF EXISTS `usuário_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuário_tel` (
  `idUsuário` int NOT NULL,
  `Telefone` varchar(45) NOT NULL,
  `idUsuário_tel` int NOT NULL,
  PRIMARY KEY (`idUsuário`,`idUsuário_tel`),
  CONSTRAINT `fk_idUsuário` FOREIGN KEY (`idUsuário`) REFERENCES `usuário` (`idUsuário`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuário_tel`
--

LOCK TABLES `usuário_tel` WRITE;
/*!40000 ALTER TABLE `usuário_tel` DISABLE KEYS */;
INSERT INTO `usuário_tel` VALUES (1,'98 98890-7022',1),(1,'84 98168-3883',2),(2,'84 12345-1234',3),(3,'88 11111-1111',4),(4,'21 22222-2222',5);
/*!40000 ALTER TABLE `usuário_tel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 10:05:11
