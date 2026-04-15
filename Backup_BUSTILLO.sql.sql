CREATE DATABASE  IF NOT EXISTS `refugio_patitas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `refugio_patitas`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: refugio_patitas
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `adopciones`
--

DROP TABLE IF EXISTS `adopciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopciones` (
  `id_adopcion` int NOT NULL AUTO_INCREMENT,
  `id_animal` int NOT NULL,
  `id_adoptante` int NOT NULL,
  `fecha_adopcion` date NOT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_adopcion`),
  KEY `id_animal` (`id_animal`),
  KEY `id_adoptante` (`id_adoptante`),
  CONSTRAINT `adopciones_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`),
  CONSTRAINT `adopciones_ibfk_2` FOREIGN KEY (`id_adoptante`) REFERENCES `adoptantes` (`id_adoptante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopciones`
--

LOCK TABLES `adopciones` WRITE;
/*!40000 ALTER TABLE `adopciones` DISABLE KEYS */;
INSERT INTO `adopciones` VALUES (1,4,1,'2024-08-20','Se entregó con libreta sanitaria al día. Viven dos personas, madre e hijo en un departamento. Se verificó balcón con red. Gata tímida, se indicó paciencia los primeros días.'),(2,7,2,'2025-10-15','Se entregó con libreta sanitaria al día. Viven 3 personas, una pareja y su hija adolescente en un departamento. Perro con mucha energía, tira de la correa.'),(3,8,3,'2025-12-10','Se entregó con libreta sanitaria al día. Vive una pareja sin hijos en una casa. Firma compromiso de castración obligatoria para el mes de marzo. Queda agendado turno veterinario para seguimiento.'),(4,9,4,'2025-12-23','Se entregó con libreta sanitaria al día. Vive una sola persona y es un departamento. Se realiza periodo de prueba de 15 días por adaptación. Come alimento ProPlan.'),(5,11,5,'2023-02-15','Se entregó con libreta sanitaria al día. Departamento, balcón con red protectora. Adaptación exitosa.'),(6,12,6,'2023-03-15','Se entregó con libreta sanitaria al día. Casa con patio cerrado. Convive con otro perro sin problemas.'),(7,13,7,'2023-04-15','Se entregó con libreta sanitaria al día. Familia con niños, perra muy dócil y juguetona.'),(8,14,8,'2023-05-15','Se entregó con libreta sanitaria al día. Pareja joven, responsable. Ideal para este gato, muy tranquilo.'),(9,15,9,'2023-06-15','Se entregó con libreta sanitaria al día. Se lleva bien con otros gatos. Se indicó alimento especial para raza grande.'),(10,16,10,'2023-07-15','Se entregó con libreta sanitaria al día. Casa amplia, necesita ejercicio diario por su energía.');
/*!40000 ALTER TABLE `adopciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptantes`
--

DROP TABLE IF EXISTS `adoptantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptantes` (
  `id_adoptante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_adoptante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptantes`
--

LOCK TABLES `adoptantes` WRITE;
/*!40000 ALTER TABLE `adoptantes` DISABLE KEYS */;
INSERT INTO `adoptantes` VALUES (1,'Antonio','Ballester','35065244','1998-05-18','1156984275','Av. Libertador 1286','antonioballester@gmail.com'),(2,'Justina','Miraflores','28934729','1981-10-03','1149506377','Aguero 1625','justimiraflores@gmail.com'),(3,'Jaime','Portillo','38735739','1991-03-10','1179519374','Billinghurst 1724','jaimeporti@gmail.com'),(4,'Francisca','Barrionuevo','36072642','1985-07-25','1124506925','Juncal 1821','franbarrion@gmail.com'),(5,'Martin','Suarez','31070191','1988-11-05','1152934450','Av.Callao 5124','martin.s@gmail.com'),(6,'Lucia','Fernandez','32701227','1993-02-14','1135845596','AV.Santa Fe 1476','luciafernandez@gmail.com'),(7,'Pedro','Gonzalez','23702375','1983-09-30','1144556677','Cordoba 789','pedrogonzalez@hotmail.com'),(8,'Maria','Rooselt','39065474','1995-12-01','1155632788','Montevideo 1739','maria.rooselt@gmail.com'),(9,'Justino','Alvarez','24040759','1978-06-18','1165378890','Guemes 5189','justino.a@gmail.com'),(10,'Ana','Grimoldi','36051369','1990-08-22','1157884912','Thames 2325','ana.grimoldi@gmail.com');
/*!40000 ALTER TABLE `adoptantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_validar_edad_adoptante` BEFORE INSERT ON `adoptantes` FOR EACH ROW BEGIN
		IF TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURRENT_DATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El adoptante debe ser mayor de 18 años para registrarse en el refugio.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_auditoria_nuevos_adoptantes` AFTER INSERT ON `adoptantes` FOR EACH ROW BEGIN
    INSERT INTO AUDITORIA_REGISTRO_ADOPTANTES (accion, dni_registrado, fecha_hora, usuario)
    VALUES ('Nuevo Adoptante Cargado', NEW.dni, NOW(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `castrado` varchar(2) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `id_raza` int NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_raza` (`id_raza`),
  CONSTRAINT `animales_ibfk_1` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'Nala','Hembra','2024-01-10','2022-05-10',15.50,'SI','Disponible',1),(2,'Milo','Macho','2024-02-05','2023-10-05',4.45,'NO','Disponible',2),(3,'Toro','Macho','2024-03-01','2019-03-01',25.00,'SI','En Tratamiento',3),(4,'Cleo','Hembra','2024-03-15','2023-01-15',3.85,'SI','Adoptado',4),(5,'Zuma','Hembra','2025-02-10','2020-02-10',5.00,'NO','Disponible',4),(6,'Roco','Macho','2025-06-07','2023-06-07',28.00,'NO','En Tratamiento',3),(7,'Zeus','Macho','2025-06-20','2024-06-20',16.00,'SI','Adoptado',1),(8,'Rumba','Hembra','2025-08-21','2025-05-21',4.00,'NO','Adoptado',1),(9,'Filipa','Hembra','2025-09-07','2025-03-07',5.00,'SI','Adoptado',4),(10,'Milanesa','Hembra','2025-10-10','2021-10-10',26.00,'SI','Disponible',3),(11,'Lola','Hembra','2023-01-01','2022-01-01',6.50,'SI','Adoptado',5),(12,'Simba','Macho','2023-02-01','2022-02-01',7.00,'SI','Adoptado',6),(13,'Berta','Hembra','2023-03-01','2022-03-01',22.50,'SI','Adoptado',7),(14,'Mota','Macho','2023-04-01','2022-04-01',4.50,'SI','Adoptado',8),(15,'Mia','Hembra','2023-05-01','2022-05-01',21.00,'SI','Adoptado',9),(16,'Rocky','Macho','2023-06-01','2022-06-01',22.00,'SI','Adoptado',10);
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_estandarizar_nombre_animal` BEFORE INSERT ON `animales` FOR EACH ROW BEGIN
    SET NEW.nombre = UPPER(NEW.nombre);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditoria_registro_adoptantes`
--

DROP TABLE IF EXISTS `auditoria_registro_adoptantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_registro_adoptantes` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(50) NOT NULL,
  `dni_registrado` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_registro_adoptantes`
--

LOCK TABLES `auditoria_registro_adoptantes` WRITE;
/*!40000 ALTER TABLE `auditoria_registro_adoptantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_registro_adoptantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia_clinica`
--

DROP TABLE IF EXISTS `historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_clinica` (
  `id_historia` int NOT NULL AUTO_INCREMENT,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_vacuna` int DEFAULT NULL,
  `fecha_consulta` date NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_historia`),
  KEY `id_animal` (`id_animal`),
  KEY `id_veterinario` (`id_veterinario`),
  KEY `id_vacuna` (`id_vacuna`),
  CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`),
  CONSTRAINT `historia_clinica_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`),
  CONSTRAINT `historia_clinica_ibfk_3` FOREIGN KEY (`id_vacuna`) REFERENCES `vacunas` (`id_vacuna`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_clinica`
--

LOCK TABLES `historia_clinica` WRITE;
/*!40000 ALTER TABLE `historia_clinica` DISABLE KEYS */;
INSERT INTO `historia_clinica` VALUES (1,1,1,1,'2024-01-15','Nala: Control general y vacunación anual. Peso estable.'),(2,2,1,1,'2024-02-10','Milo: Cachorro sano. Se aplica Antirrábica. Sin reacciones.'),(3,3,2,2,'2024-03-02','Toro: Bajo peso y parásitos.'),(4,4,1,1,'2024-03-16','Cleo: Control previo a adopción. Vacuna al día. Muy tranquila.'),(5,5,2,4,'2025-02-11','Zuma: Chequeo de rutina. Se aplica Triple Felina.'),(6,6,2,NULL,'2025-06-08','Roco: Consulta por renguera pata trasera. Reposo y control en 7 días.'),(7,7,1,2,'2025-06-21','Zeus: Control de ingreso. Se aplica Quíntuple.'),(8,8,2,NULL,'2025-08-22','Rumba: Se desparasita, vacuna pendiente por edad.'),(9,9,1,1,'2025-09-10','Filipa: Control post-castración. Herida sanando perfecto. Antirrábica ok.'),(10,10,2,2,'2025-10-12','Milanesa: Control general. Se aplica Quíntuple.'),(11,11,3,3,'2023-01-10','Luna: Control de ingreso y Séxtuple. Todo en orden.'),(12,12,4,2,'2023-02-10','Simba: Control de ingreso y Quíntuple. Buen estado.'),(13,13,5,1,'2023-03-10','Berta: Chequeo general y vacuna Antirrábica. Dientes con sarro.'),(14,14,6,5,'2023-04-10','Mota: Control y vacuna Leucemia Felina. Gato muy tranquilo.'),(15,15,7,7,'2023-05-10','Mia: Desparasitación y vacuna Moquillo Canino. Peso ideal.'),(16,16,8,8,'2023-06-10','Rocky: Vacunación Coronavirus Canino. Piel y pelaje sanos.');
/*!40000 ALTER TABLE `historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorios`
--

DROP TABLE IF EXISTS `laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorios` (
  `id_laboratorio` int NOT NULL AUTO_INCREMENT,
  `nombre_laboratorio` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorios`
--

LOCK TABLES `laboratorios` WRITE;
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
INSERT INTO `laboratorios` VALUES (1,'Zoetis','0800-121-2450'),(2,'MSD','0800-333-4000'),(3,'Boehringer','0800-555-6080'),(4,'Bagó','0800-777-8000'),(5,'Bayer','0800-133-5000'),(6,'Virbac','0800-133-7000'),(7,'Pfizer','0800-155-6700'),(8,'Tecnovax','0800-450-7890'),(9,'Biolab','0800-570-8901'),(10,'Elanco','0800-650-9012');
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `razas`
--

DROP TABLE IF EXISTS `razas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `razas` (
  `id_raza` int NOT NULL AUTO_INCREMENT,
  `nombre_raza` varchar(50) NOT NULL,
  `tipo_animal` varchar(20) NOT NULL,
  PRIMARY KEY (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razas`
--

LOCK TABLES `razas` WRITE;
/*!40000 ALTER TABLE `razas` DISABLE KEYS */;
INSERT INTO `razas` VALUES (1,'Mestizo','Perro'),(2,'Siamés','Gato'),(3,'Labrador','Perro'),(4,'Mestizo','Gato'),(5,'Caniche','Perro'),(6,'Salchicha','Perro'),(7,'Galgo','Perro'),(8,'Persa','Gato'),(9,'Golden','Perro'),(10,'Bulldog','Perro'),(11,'Beagle','Perro'),(12,'Border Collie','Perro'),(13,'Pug','Perro'),(14,'Cocker','Perro');
/*!40000 ALTER TABLE `razas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_animales_disponibles`
--

DROP TABLE IF EXISTS `v_animales_disponibles`;
/*!50001 DROP VIEW IF EXISTS `v_animales_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animales_disponibles` AS SELECT 
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `sexo`,
 1 AS `raza`,
 1 AS `peso`,
 1 AS `tamano`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animales_en_tratamiento`
--

DROP TABLE IF EXISTS `v_animales_en_tratamiento`;
/*!50001 DROP VIEW IF EXISTS `v_animales_en_tratamiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animales_en_tratamiento` AS SELECT 
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `sexo`,
 1 AS `raza`,
 1 AS `peso`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_historial_adopciones`
--

DROP TABLE IF EXISTS `v_historial_adopciones`;
/*!50001 DROP VIEW IF EXISTS `v_historial_adopciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_historial_adopciones` AS SELECT 
 1 AS `fecha_adopcion`,
 1 AS `mascota`,
 1 AS `tipo`,
 1 AS `sexo`,
 1 AS `adoptante`,
 1 AS `dni`,
 1 AS `telefono`,
 1 AS `detalle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock_vacunas`
--

DROP TABLE IF EXISTS `v_stock_vacunas`;
/*!50001 DROP VIEW IF EXISTS `v_stock_vacunas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock_vacunas` AS SELECT 
 1 AS `vacuna`,
 1 AS `principio_activo`,
 1 AS `lote`,
 1 AS `stock`,
 1 AS `laboratorio`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vacunas`
--

DROP TABLE IF EXISTS `vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas` (
  `id_vacuna` int NOT NULL AUTO_INCREMENT,
  `nombre_vacuna` varchar(50) NOT NULL,
  `principio_activo` varchar(100) DEFAULT NULL,
  `lote` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  `id_laboratorio` int NOT NULL,
  PRIMARY KEY (`id_vacuna`),
  KEY `id_laboratorio` (`id_laboratorio`),
  CONSTRAINT `vacunas_ibfk_1` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorios` (`id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacunas`
--

LOCK TABLES `vacunas` WRITE;
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` VALUES (1,'Antirrábica','Virus inactivado','LOTE-A01',50,1),(2,'Quíntuple','Parvovirus y otros','LOTE-Q99',30,2),(3,'Séxtuple','Adenovirus','LOTE-S01',20,3),(4,'Triple Felina','Herpesvirus','LOTE-TF2',40,4),(5,'Leucemia Felina','Virus Leucemia','LOTE-LF3',15,5),(6,'Tos de las perreras','Bordetella','LOTE-TP4',25,6),(7,'Moquillo Canino','Virus Distemper','LOTE-M05',10,7),(8,'Coronavirus Canino','Coronavirus','LOTE-C06',35,8),(9,'Antitetánica','Toxoide tetánico','LOTE-AT7',5,9),(10,'Triple Canina','Moquillo y otros','LOTE-TC8',50,10);
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,'Rufina','Pereyra','MN-1234','1156728970'),(2,'Hilario','Ferreira','MN-5678','1155443678'),(3,'Francisca','Gomez','MN-2534','1156867789'),(4,'Diego','Bustamante','MN-3741','1124314450'),(5,'Jeronimo','Monserrat','MN-4955','1135475269'),(6,'Facundo','Perez','MN-5961','1143516770'),(7,'Tomas','Juncal','MN-5671','1154267592'),(8,'Horacio','Romero','MN-3788','1161748200'),(9,'Ines','Diaz','MN-3891','1173819215'),(10,'Joaquin','Ruiz','MN-5910','1148921022');
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'refugio_patitas'
--
/*!50003 DROP FUNCTION IF EXISTS `f_calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_calcular_edad`(fecha_nac DATE) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE anos INT;
    DECLARE meses INT;
    
    -- Calcular ambos valores
    SET anos = TIMESTAMPDIFF(YEAR, fecha_nac, CURRENT_DATE());
    SET meses = TIMESTAMPDIFF(MONTH, fecha_nac, CURRENT_DATE());
    
    -- Si tiene 1 año o más, se van a mostrar años. 
    -- Si tiene 0 años, se van a mostrar los meses.	
    IF anos > 0 THEN
        RETURN CONCAT(anos, ' años');
    ELSE
        RETURN CONCAT(meses, ' meses');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_tamano_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_tamano_animal`(peso_animal DECIMAL(5,2)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE tamano VARCHAR(20);
    
    IF peso_animal < 10.00 THEN
        SET tamano = 'Pequeño';
    ELSEIF peso_animal >= 10.00 AND peso_animal <= 20.00 THEN
        SET tamano = 'Mediano';
    ELSE
        SET tamano = 'Grande';
    END IF;
    
    RETURN tamano;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_stock_vacunas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_stock_vacunas`(
    IN p_id_vacuna INT, 
    IN p_cantidad INT,
    IN p_tipo_movimiento VARCHAR(10) -- para poder diferenciar si se suma o resta del stock
)
BEGIN
    -- Ingreso de vacunas
    IF p_tipo_movimiento = 'INGRESO' THEN
        UPDATE VACUNAS 
        SET stock = stock + p_cantidad
        WHERE id_vacuna = p_id_vacuna;
        
    -- Egreso de vacunas
    ELSEIF p_tipo_movimiento = 'USO' THEN
        UPDATE VACUNAS 
        SET stock = stock - p_cantidad
        WHERE id_vacuna = p_id_vacuna;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_adopcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_adopcion`(
    IN p_id_animal INT, 
    IN p_id_adoptante INT, 
    IN p_detalle VARCHAR(500)
)
BEGIN
    -- Iniciamos la transacción 
    START TRANSACTION;
    
    INSERT INTO ADOPCIONES (id_animal, id_adoptante, fecha_adopcion, detalle)
    VALUES (p_id_animal, p_id_adoptante, CURRENT_DATE(), p_detalle);
    
    UPDATE ANIMALES 
    SET estado = 'Adoptado'
    WHERE id_animal = p_id_animal;
    
    -- Guardamos los cambios definitivamente 
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_animales_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `v_animales_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animales_disponibles` AS select `an`.`nombre` AS `nombre`,`ra`.`tipo_animal` AS `tipo`,`an`.`sexo` AS `sexo`,`ra`.`nombre_raza` AS `raza`,concat(`an`.`peso`,' kg') AS `peso`,`f_tamano_animal`(`an`.`peso`) AS `tamano`,`f_calcular_edad`(`an`.`fecha_nacimiento`) AS `edad` from (`animales` `an` join `razas` `ra` on((`an`.`id_raza` = `ra`.`id_raza`))) where (`an`.`estado` = 'Disponible') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animales_en_tratamiento`
--

/*!50001 DROP VIEW IF EXISTS `v_animales_en_tratamiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animales_en_tratamiento` AS select `an`.`nombre` AS `nombre`,`ra`.`tipo_animal` AS `tipo`,`an`.`sexo` AS `sexo`,`ra`.`nombre_raza` AS `raza`,concat(`an`.`peso`,' kg') AS `peso`,`f_calcular_edad`(`an`.`fecha_nacimiento`) AS `edad` from (`animales` `an` join `razas` `ra` on((`an`.`id_raza` = `ra`.`id_raza`))) where (`an`.`estado` = 'En Tratamiento') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_historial_adopciones`
--

/*!50001 DROP VIEW IF EXISTS `v_historial_adopciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_historial_adopciones` AS select `ad`.`fecha_adopcion` AS `fecha_adopcion`,`an`.`nombre` AS `mascota`,`ra`.`tipo_animal` AS `tipo`,`an`.`sexo` AS `sexo`,concat(`adp`.`nombre`,' ',`adp`.`apellido`) AS `adoptante`,`adp`.`dni` AS `dni`,`adp`.`telefono` AS `telefono`,`ad`.`detalle` AS `detalle` from (((`adopciones` `ad` join `animales` `an` on((`ad`.`id_animal` = `an`.`id_animal`))) join `razas` `ra` on((`an`.`id_raza` = `ra`.`id_raza`))) join `adoptantes` `adp` on((`ad`.`id_adoptante` = `adp`.`id_adoptante`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock_vacunas`
--

/*!50001 DROP VIEW IF EXISTS `v_stock_vacunas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_vacunas` AS select `v`.`nombre_vacuna` AS `vacuna`,`v`.`principio_activo` AS `principio_activo`,`v`.`lote` AS `lote`,`v`.`stock` AS `stock`,`l`.`nombre_laboratorio` AS `laboratorio`,`l`.`telefono` AS `telefono` from (`vacunas` `v` join `laboratorios` `l` on((`v`.`id_laboratorio` = `l`.`id_laboratorio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 17:05:19
