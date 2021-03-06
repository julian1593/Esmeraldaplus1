-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: esmeraldaplus
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(767) NOT NULL,
  `ClaimType` text,
  `ClaimValue` text,
  PRIMARY KEY (`Id`),
  KEY `FK_AspNetRoleClaims_AspNetRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(767) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(767) NOT NULL,
  `ClaimType` text,
  `ClaimValue` text,
  PRIMARY KEY (`Id`),
  KEY `FK_AspNetUserClaims_AspNetUsers_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` text,
  `UserId` varchar(767) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `FK_AspNetUserLogins_AspNetUsers_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(767) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` text,
  `SecurityStamp` text,
  `ConcurrencyStamp` text,
  `PhoneNumber` text,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` timestamp NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('55ba1f3b-5733-495f-9a4b-f8ca1e277e70','julin-2014@outlook.com','JULIN-2014@OUTLOOK.COM','julin-2014@outlook.com','JULIN-2014@OUTLOOK.COM',1,'AQAAAAEAACcQAAAAELg82MMALPnQiOG3iEKWHYY25iiO1dgvSxpd/E00wnBthVL0DefxoVGjDFOZxZSOdw==','XPRYSRZM5ZQWGZZ7SSEERTZZLECBJMPZ','e5ba527f-c58c-479e-a1de-b0c403a53e1f',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id_Cliente` int NOT NULL,
  `Primer_Nombre` varchar(15) DEFAULT NULL,
  `Segundo_Nombre` varchar(15) DEFAULT NULL,
  `Primer_Apellido` varchar(15) DEFAULT NULL,
  `Segundo_Apellido` varchar(15) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo_electronico` varchar(40) DEFAULT NULL,
  `Cod_telefon` int NOT NULL,
  `Id_Roles` int NOT NULL,
  `Telefon` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`),
  KEY `Cod_telefon` (`Cod_telefon`),
  KEY `Id_Roles` (`Id_Roles`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Cod_telefon`) REFERENCES `tipo_de_numero` (`Cod_telefon`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1000454676,'DANIEL','','ACEVEDO','JHONG','Calle 4 No. 5  10','iabarcae@yahoo.es',987654321,223445668,'3208949580'),(1000454677,'MIGUEL','VICENTE','AGURTO','RONDOY','Calle 11 No. 4 - 14','maeillanes@hotmail.com',987654321,223445668,'3208949581'),(1000454678,'CHRISTIAN','NELSON','ALCALÁ','NEGRÓN','Calle 24 N° 5-60','osabarca@hotmail.com',987654321,223445668,'3208949582'),(1000454679,'RAUL','EDUARDO','ALMORA','HERNANDEZ','Av. Ciudad de Cali No. 6C-09','cabrigo@garmendia.cl',987654321,223445668,'3208949583'),(1000454680,'JORGE','ANDRES','ALOSILLA','VELAZCO','Calle 48b sur No. 21-13','Sb.nashxo.sk8@hotmail.com',987654321,223445668,'3208949584'),(1000454681,'VICTOR','ESTEBAN','ALVA','CAMPOS','Avenida Cra. 60 No. 57-60','fran.afull@live.cl',987654321,223445668,'3208949585'),(1000454682,'JAVIER','EDUARDO','AREVALO','LOPEZ','Calle 11 No. 4-21 / 93','carlosaguileram@hotmail.com',987654321,223445668,'3208949586'),(1000454683,'ROSARIO','ALEJANDRA','ARIAS','HERNANDEZ','Calle 10 No. 5-22','ikis_rojo@hotmail.com',987654321,223445668,'3208949587'),(1000454684,'EFRAÍN','ISRAEL','ARROYO','RAMÍREZ','Carrera 20 No. 37-54','daniela_aguilera_m500@hotmail.com',987654321,223445668,'3208949588'),(1000454685,'MARCO','TULIO','ALOCEN','BARRERA','Av. Calle 19 N° 2-49 ','vizkala@hotmail.com',987654321,223445668,'3208949589'),(1000454686,'CESAR','FELIPE','BAIOCCHI','URETA','Calle 109a N° 17-10 ','alexus3@hotmail.com',987654321,223445668,'3208949590'),(1000454687,'ISELA','FLOR','BAYLÓN','ROJAS','Cr.8a # 15-63','capitanaguilera@hotmail.com',987654321,223445668,'3208949591'),(1000454688,'LEONCIA','JIMENA','BEDOYA','CASTILLO','Cr.9 # 74-99','apalamosg@hotmail.com',987654321,223445668,'3208949592'),(1000454689,'LUZ','MARINA','BEDREGAL','CANALES','Carrera 1 Este No. 17 01','niikhox__@hotmail.com',987654321,223445668,'3208949593'),(1000454690,'RAMIRO','ALBERTO','BEJAR','TORRES','Cr.6 # 17-12','luuuuuuci@hotmail.com',987654321,223445668,'3208949594'),(1000454691,'JAVIER','ANTONIO','BENAVIDES','ESPEJO','Carrera 7 Calle 26','kristian_siempre_azul@hotmail.com',987654321,223445668,'3208949595'),(1000454692,'NELSON','STIVEN','BOZA','SOLIS','Av.19 #152-48 Esquina','mapuchin@hotmail.com',987654321,223445668,'3208949596'),(1000454693,'CIELITO','MERCEDES','CALLE','BETANCOURT','Carrera 13 # 26- 81','arahuetes@manquehue.net',987654321,223445668,'3208949597'),(1000454694,'ISABEL','FLORISA','CARAZA','VILLEGAS','Carrera 7 No. 22 - 79','eduardo.arancibia@grange.cl',987654321,223445668,'3208949598'),(1000454695,'MAICOL','FERNEY','CARRERA','ABANTO','Cl.90 # 11a-54','martacam2002@yahoo.com',987654321,223445668,'3208949599'),(1000454696,'ESTALINS','','CARRILLO','SEGURA','Calle 12# 2-65','andrea.geoplanet@gmail.com',987654321,223445668,'3208949600'),(1000454697,'JORGE','AUGUSTO','CARRIÓN','NEIRA','Calle 45A No. 14-37 ','faraya1910@hotmail.com',987654321,223445668,'3208949601'),(1000454698,'GUILLERMO','','CASAPIA','VALDIVIA','Cra. 18 No. 82 - 35','faraya@sprint.cl',987654321,223445668,'3208949602'),(1000454699,'LUISA','CAMILA','CHANCOS','MENDOZA','Calle 13 #3-17 ','leonor.araya@gmail.com',987654321,223445668,'3208949603'),(1000454700,'CARLOS','','CHIRINOS','LACOTERA','Cl.10 # 3-16','paulifran@hotmail.com',987654321,223445668,'3208949604'),(1000454701,'DORIS','','CORES','MORENO','Cl.119 # 15-41','bad.girl.-@hotmail.es',987654321,223445668,'3208949605'),(1000454702,'MARIBEL','CORINA','CORTEZ','LOZANO','Cr.15 # 82-87','aargomedo@hecsa.cl',987654321,223445668,'3208949606'),(1000454703,'ANGEL','','CRISPIN','QUISPE','Cl.81 # 11-92','aargomedo@hecsa.cl',987654321,223445668,'3208949607'),(1000454704,'ANTONIO','','LOAYZA','CONTERNO','Cl.69 # 4-64','elizabetharmstrong39@gmail.com',987654321,223445668,'3208949608'),(1000454705,'ANA','MARIA','DIAZ','SALINAS','Cl.81 # 8-70','c_arnes@hotmail.com',987654321,223445668,'3208949609'),(1000454706,'ANTONIO','','DUEŃAS','ARISTISABAL','Cr.21 # 88-12','aarriagada@petrok.cl',987654321,223445668,'3208949610'),(1000454707,'YULIANA','','ESPINOZA','ARANA','Cl.94 # 13-90','joy_pao_@hotmail.com',987654321,223445668,'3208949611'),(1000454708,'CARLOS','ENRIQUE','FERNANDEZ','GUZMAN','Cr.4 # 19-85','carlosarteaga.pef@gmail.com',987654321,223445668,'3208949612'),(1000454709,'ESTHER','AURORA','FERNANDEZ','MATTA','Cl.45 # 18 -27','arquitectoasenjo@gmail.com',987654321,223445668,'3208949613'),(1000454710,'OLGA','LUCIA','FERRO','SALAS','Cl.20 # 14-37/39','masenjog@gmail.com',987654321,223445668,'3208949614'),(1000454711,'EDWIN','','FLORES','ROMERO','Cl.70a # 7-41','Sergio.Aspe@adretail.cl',987654321,223445668,'3208949615'),(1000454712,'ROBERTO','','GAMARRA','ASTETE','Av.82 # 11-50 Int. 2','caspe@canal13.cl',987654321,223445668,'3208949616'),(1000454713,'GLORIA','','GAMIO','LOZANO','Cl.93b # 11a- 84 ','bantomaui@gmail.com',987654321,223445668,'3208949617'),(1000454714,'MIRIAM','','GARCÍA','PERALTA','Cr.9 # 94-58','mfbanto@gmail.com',987654321,223445668,'3208949618'),(1000454715,'ARTURO','','GONZALES','VALLE','Cr 20 # 15-15','Rodrigo.banto@Uvavins.ch',987654321,223445668,'3208949619'),(1000454716,'VICTORIA','','GONZALES','MARLENE','Cl.92 # 16-11','jbarrera05@hotmail.com',987654321,223445668,'3208949620'),(1000454717,'ELSA','PATRICIA','GONZALES','MEDINA','Cr 8 No. 8-91','claudiabergez@gmail.com',987654321,223445668,'3208949621'),(1000454718,'JAVIER','','GUTIERREZ','VELEZ','Cr.15 # 88-64','michelebk@hotmail.com',987654321,223445668,'3208949622'),(1000454719,'ELENA','ROSAVELT','GUZMAN','CHINAG','Calle 11 No. 4-21/ 93','angelicabergez@gmail.com',987654321,223445668,'3208949623'),(1000454720,'CLARA','','GUZMAN','QUISPE','Calle 11 No. 4-14','solbk26@hotmail.com',987654321,223445668,'3208949624'),(1000454721,'MILAGROS','SUSAN','HERRERA','CARBAJAL','Carrera 30 Calle 45 ','cibravohuerta@yahoo.com',987654321,223445668,'3208949625'),(1000454722,'GUILLERMO','','HORRUITINER','MARTINEZ','Carrera 6 No. 9-77','sebastianatila@hotmail.com',987654321,223445668,'3208949626'),(1000454723,'LOURDES','','HUAMANI','FLORES','Carrera 74 No. 82a-81.','jabravot@yahoo.es',987654321,223445668,'3208949627'),(1000454724,'LUIS','ARMANDO','HUAPAYA','RAYGADA','Carrera 30 No 45-03 ','pbg@endesa.cl',987654321,223445668,'3208949628'),(1000454725,'MARCOS','','HUARCAYA','QUISPE','Calle 24 No. 6-00','oscar.brito@gmail.com',987654321,223445668,'3208949629'),(1000454726,'WALTER','DAVID','HUAYTAN','SAUŃE','Carrera 8 No. 7-21','anibalito___@hotmail.com',987654321,223445668,'3208949630'),(1000454727,'ELBA','MERCEDES','ORTEGA','ROSA','Carrera 2 No. 10-70','rcabbada@vtr.net',987654321,223445668,'3208949631'),(1000454728,'PEDRO','GUILLERMO','LANDA','GINOCCHIO','Calle 200 # 500-1','superjp_coco@hotmail.com',987654321,223445668,'3208949632'),(1000454729,'ROBERTO','JULIAN','LLAJA','TAFUR','Entrada Calle 53.','cabbada@gmail.com',987654321,223445668,'3208949633'),(1000454730,'ORFELINA','','LLENPEN','NUŃEZ','Calle 13 # 26-5','nina_cabbada@hotmail.com',987654321,223445668,'3208949634'),(1000454731,'HECTOR','','LUJAN','VENEGAS','Carrera 48 No. 63-97','yaz_antu@yahoo.com',987654321,223445668,'3208949635'),(1000454732,'GISSELA','','MAGUIŃA','SANTOYO','Calle 61a No. 14-58','consuelo_caceres@hotmail.com',987654321,223445668,'3208949636'),(1000454733,'COSME','ADOLFO','MALDONADO','QUISPE','Calle 26 No. 25-42','dantekol@hotmail.com',987654321,223445668,'3208949637'),(1000454734,'SANDRA','MONICA','MALDONADO','TINCO','Carrera 30 No. 48-51','lukalcagno@gmail.com',987654321,223445668,'3208949638'),(1000454735,'JENNY','MARIA','MALLQUI','CELESTINO','Carrera 7 No. 93-01','ruliandro@hotmail.com',987654321,223445668,'3208949639'),(1000454736,'SANTIAGO','','MAMANI','UCHASARA','Carrera 4 No. 22-61','icalderon@tecval.cl',987654321,223445668,'3208949640'),(1000454737,'MAGDA','JANETH','MARAVI','NAVARRO','Carrera 6 Calle 16','pablo.calderon.cadiz@gmail.com',987654321,223445668,'3208949641'),(1000454738,'MARTIN','','MARTINEZ','MARQUEZ','Calle 23 A No. 19-86','allicamposv@hotmail.com',987654321,223445668,'3208949642'),(1000454739,'OSCAR','ENRIQUE','MEDINA','ZUTA','Calle 23 A No. 19-86','campos.onfray@gmail.com',987654321,223445668,'3208949643'),(1000454740,'CARLOS','','MELGAREJO','VIBES','Carrera 8 No. 6-87','jorge.campos@impromac.cl',987654321,223445668,'3208949644'),(1000454741,'CARMEN','ELIZABETH','MIGUEL','HOLGADO','Diagonal 53 No. 34-53','raulcd02ster@gmail.com',987654321,223445668,'3208949645'),(1000454742,'MANUEL','ANTONIO','MORI','RAMIREZ','Calle 10 No. 4-69','jaime.carmona@gendarmeria.cl ',987654321,223445668,'3208949646'),(1000454743,'CARLOS','ALBERTO','NUŃEZ','HUAYANAY','Calle 10 No 4-92','tantitamivida@gmail.com',987654321,223445668,'3208949647'),(1000454744,'OLGA','CECILIA','ORE','REYES','Carrera 7 No. 28-66','f.casajuan@gmail.com',987654321,223445668,'3208949648'),(1000454745,'JOSUE','','ORRILLO','ORTIZ','Transv. 6 No. 27  10 Of. 20','jaimecasajuana@gmail.com',987654321,223445668,'3208949649'),(1000454746,'JOSUÉ','VICTOR','ORRILLO','ORTIZ','Carrera 7 con Cl 12','javi_javis_3@hotmail.com',987654321,223445668,'3208949650'),(1000454747,'CARMEN','ROSA','PARDAVE','CAMACHO','Calle 20 No. 2 - 91 Este','casajuana_@hotmail.com',987654321,223445668,'3208949651'),(1000454748,'SANTIAGO','VICTOR','PAREDES','JARAMILLO','Calle 45A 14-62','hugocastanedav@hotmail.com',987654321,223445668,'3208949652'),(1000454749,'ARTURO','','PASTOR','PORRAS','Cl.70a # 5-67','acastanon@vectorchile.cl',987654321,223445668,'3208949653'),(1000454750,'ENRIQUE','','PINEDO','NUŃEZ','Cl.70a # 10-68','claudiocastanonmigeot@gmail.com',987654321,223445668,'3208949654'),(1000454751,'SONIA','','PRADA','VILCHEZ','Calle 11 No. 4-93','c.analuz@yahoo.es',987654321,223445668,'3208949655'),(1000454752,'GERARDO','DAVID','RIEGA','CALLE','Carrera 7 Calle 26','claudiocastanonmigeot@gmail.com',987654321,223445668,'3208949656'),(1000454753,'FREDDY','','RIOS','LIMA','Cr.13 # 14-69','tango_negro@hotmail.com',987654321,223445668,'3208949657'),(1000454754,'TERESA','','RIOS','LIMA','Cr.14 # 75-29','pato_one@hotmail.com',987654321,223445668,'3208949658'),(1000454755,'JUAN','ELVIS','RIQUELME','MIRANDA','Cra. 25 # 41 - 64 ','javier_celedon@hotmail.com',987654321,223445668,'3208949659'),(1000454756,'GEORGINA','ESPERANZA','ROA','YANAC','Calle 9 Nş 4-93','joacocordero@gmail.com',987654321,223445668,'3208949660'),(1000454757,'ROSA','LILIANA','ROBLES','VALVERDE','Calle 10 No. 5 - 32','pepacordero@gmail.com',987654321,223445668,'3208949661'),(1000454758,'ROSA','JOSEFA','RODRIGUEZ','FARIAS','Carrera 7a N° 22-47','laah.valehh@hotmail.com',987654321,223445668,'3208949662'),(1000454759,'MARIA','FATIMA','ROJAS','VALDIVIA','Carrera 6 No. 54 - 04','annabeck_@hotmail.com',987654321,223445668,'3208949663'),(1000454760,'ROSA','MARIA','ROMERO','GOMEZ','Calle 12 # 2-59.','japacortes@yahoo.com',987654321,223445668,'3208949664'),(1000454761,'CARINA','MAGNOLIA','ROSALES','FLORES','Carrera 13 #61-24 ','juanocortes@hotmail.com',987654321,223445668,'3208949665'),(1000454762,'CARLOS','JOSE','ROSAS','BONIFAZ','Calle 63 No. 9-60','pili_diami_angol@hotmail.com',987654321,223445668,'3208949666'),(1000454763,'AIDA','CRISTINA','RUIZ','CASTILLO','Calle 13 No.2 - 44','tallerlaquilla@gmail.com',987654321,223445668,'3208949667'),(1000454764,'CELIN','','SALCEDO','PINO','Cra. 11 No 61-80','anamariadelacarrera@gmail.com',987654321,223445668,'3208949668'),(1000454765,'VIOLETA','MARILU','SALINAS','PUCCIO','Calle 71 N. 10 - 25','paulinadelacarrera@gmail.com',987654321,223445668,'3208949669'),(1000454766,'AUGUSTO','','SANCHEZ','ARONE','Calle 95 # 30-13','fgregoriog@vtr.net',987654321,223445668,'3208949670'),(1000454767,'PEDRO','MANUEL','SANTOS','CRUZ','Calle 70 No. 19 - 40','anto_demarchi@hotmail.com',987654321,223445668,'3208949671'),(1000454768,'ANGEL','CAMILO','SOLANO','VARGAS','Calle %7 No. 17 - 13','Karito_1404@hotmail.com',987654321,223445668,'3208949672'),(1000454769,'JOSE','ALBERTO','TEJEDO','LUNA','Calle 10 No. 0  19 ','loredicat@hotmail.com',987654321,223445668,'3208949673'),(1000454770,'ANGEL','ALBEIRO','TENORIO','DAVILA','Calle 13# 2-70','diazma@tiscali.it',987654321,223445668,'3208949674'),(1000454771,'MIGUEL','ANGEL','TORRES','GASPAR','Carrera 7a. - Calle 106','pablodubof@gmail.com',987654321,223445668,'3208949675'),(1000454772,'JACQUELIN','','TRUJILLO','PARODI','Calle 68 #45-2','dddura69@gmail.com',987654321,223445668,'3208949676'),(1000454773,'RUTH','NORICILA','VEGA','CARREAZO','Calle 94 # 7-48','khiton_@hotmail.com',987654321,223445668,'3208949677'),(1000454774,'GUILLERMO','JONATHAN','VELASQUEZ','RAMOS','Calle 54 7-26','pecmor63@gmail.com',987654321,223445668,'3208949678'),(1000454775,'ALEJANDRO','','VERA','SILVA','Calle 100 carrera 43-10','jlescote@gasco.cl',987654321,223445668,'3208949679');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprovante_pedido`
--

DROP TABLE IF EXISTS `comprovante_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprovante_pedido` (
  `Id_Comprovante` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Costo_unitario` int DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Id_Cliente` int NOT NULL,
  PRIMARY KEY (`Id_Comprovante`),
  KEY `Id_Cliente` (`Id_Cliente`),
  CONSTRAINT `comprovante_pedido_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprovante_pedido`
--

LOCK TABLES `comprovante_pedido` WRITE;
/*!40000 ALTER TABLE `comprovante_pedido` DISABLE KEYS */;
INSERT INTO `comprovante_pedido` VALUES (9090,1,2000,2000,1000454676),(9091,2,2000,4000,1000454677),(9092,3,2000,6000,1000454678),(9093,4,2000,8000,1000454679),(9094,5,2000,10000,1000454680),(9095,6,2000,12000,1000454681),(9096,7,2000,14000,1000454682),(9097,8,2000,16000,1000454683),(9098,9,2000,18000,1000454684),(9099,10,2000,20000,1000454685),(9100,11,2000,22000,1000454686),(9101,12,2000,24000,1000454687),(9102,13,2000,26000,1000454688),(9103,14,2000,28000,1000454689),(9104,15,2000,30000,1000454690),(9105,16,2000,32000,1000454691),(9106,17,2000,34000,1000454692),(9107,18,2000,36000,1000454693),(9108,19,2000,38000,1000454694),(9109,20,2000,40000,1000454695),(9110,21,2000,42000,1000454696),(9111,22,2000,44000,1000454697),(9112,23,2000,46000,1000454698),(9113,24,2000,48000,1000454699),(9114,25,2000,50000,1000454700),(9115,26,2000,52000,1000454701),(9116,27,2000,54000,1000454702),(9117,28,2000,56000,1000454703),(9118,29,2000,58000,1000454704),(9119,30,2000,60000,1000454705),(9120,31,2000,62000,1000454706),(9121,32,2000,64000,1000454707),(9122,33,2000,66000,1000454708),(9123,34,2000,68000,1000454709),(9124,35,2000,70000,1000454710),(9125,36,2000,72000,1000454711),(9126,37,2000,74000,1000454712),(9127,38,2000,76000,1000454713),(9128,39,2000,78000,1000454714),(9129,40,2000,80000,1000454715),(9130,41,2000,82000,1000454716),(9131,42,2000,84000,1000454717),(9132,43,2000,86000,1000454718),(9133,44,2000,88000,1000454719),(9134,45,2000,90000,1000454720),(9135,46,2000,92000,1000454721),(9136,47,2000,94000,1000454722),(9137,48,2000,96000,1000454723),(9138,49,2000,98000,1000454724),(9139,50,2000,100000,1000454725),(9140,51,2000,102000,1000454726),(9141,52,2000,104000,1000454727),(9142,53,2000,106000,1000454728),(9143,54,2000,108000,1000454729),(9144,55,2000,110000,1000454730),(9145,56,2000,112000,1000454731),(9146,57,2000,114000,1000454732),(9147,58,2000,116000,1000454733),(9148,59,2000,118000,1000454734),(9149,60,2000,120000,1000454735),(9150,61,2000,122000,1000454736),(9151,62,2000,124000,1000454737),(9152,63,2000,126000,1000454738),(9153,64,2000,128000,1000454739),(9154,65,2000,130000,1000454740),(9155,66,2000,132000,1000454741),(9156,67,2000,134000,1000454742),(9157,68,2000,136000,1000454743),(9158,69,2000,138000,1000454744),(9159,70,2000,140000,1000454745),(9160,71,2000,142000,1000454746),(9161,72,2000,144000,1000454747),(9162,73,2000,146000,1000454748),(9163,74,2000,148000,1000454749),(9164,75,2000,150000,1000454750),(9165,76,2000,152000,1000454751),(9166,77,2000,154000,1000454752),(9167,78,2000,156000,1000454753),(9168,79,2000,158000,1000454754),(9169,80,2000,160000,1000454755),(9170,81,2000,162000,1000454756),(9171,82,2000,164000,1000454757),(9172,83,2000,166000,1000454758),(9173,84,2000,168000,1000454759),(9174,85,2000,170000,1000454760),(9175,86,2000,172000,1000454761),(9176,87,2000,174000,1000454762),(9177,88,2000,176000,1000454763),(9178,89,2000,178000,1000454764),(9179,90,2000,180000,1000454765),(9180,91,2000,182000,1000454766),(9181,92,2000,184000,1000454767),(9182,93,2000,186000,1000454768),(9183,94,2000,188000,1000454769),(9184,95,2000,190000,1000454770),(9185,96,2000,192000,1000454771),(9186,97,2000,194000,1000454772),(9187,98,2000,196000,1000454773),(9188,99,2000,198000,1000454774),(9189,100,2000,200000,1000454775);
/*!40000 ALTER TABLE `comprovante_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Id` int NOT NULL,
  `Primer_Nombre` varchar(15) DEFAULT NULL,
  `Segundo_Nombre` varchar(15) DEFAULT NULL,
  `Primer_Apellido` varchar(15) DEFAULT NULL,
  `Segundo_Apellido` varchar(15) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo_electronico` varchar(40) DEFAULT NULL,
  `Cod_telefon` int NOT NULL,
  `Telefon` varchar(10) DEFAULT NULL,
  `Id_Roles` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Cod_telefon` (`Cod_telefon`),
  KEY `Id_Roles` (`Id_Roles`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`Cod_telefon`) REFERENCES `tipo_de_numero` (`Cod_telefon`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (98897,'Juan ','Felipe','Garcia','Torres','Calle 77 Norte # 13-3','Juan_Felipe_tg443@yopmail.es',1234566789,'3207689077',223445669),(98898,'Dana ','Sofia ','Pacheco','Rodriguez','Carrera 99 Este # 2-33','sofi-pacheco776123@yopmail.es',1234566789,'3146958801',223445669),(98899,'Martha ','Lucia','Ortega','Ortiz','Av. 44 Norte # 15-15','luciaortegaortizllss@yopmail.com',1234566789,'3208654322',223445669);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_has_productos`
--

DROP TABLE IF EXISTS `empleado_has_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_has_productos` (
  `Id_Empleado` int NOT NULL,
  `Id_producto` int NOT NULL,
  KEY `Id_Empleado` (`Id_Empleado`),
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `empleado_has_productos_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleado` (`Id`),
  CONSTRAINT `empleado_has_productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_has_productos`
--

LOCK TABLES `empleado_has_productos` WRITE;
/*!40000 ALTER TABLE `empleado_has_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_has_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `Id` int NOT NULL,
  `Estado_producto` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (879955676,'Inicial'),(879955677,'En Proceso'),(879955678,'Terminado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `Id` int NOT NULL,
  `Id_Tipo_de_Insumo` int NOT NULL,
  `Id_Provedor` int NOT NULL,
  `Valor_insumo` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Tipo_de_Insumo` (`Id_Tipo_de_Insumo`),
  KEY `Id_Provedor` (`Id_Provedor`),
  CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`Id_Tipo_de_Insumo`) REFERENCES `tipo_de_insumo` (`Id`),
  CONSTRAINT `insumos_ibfk_2` FOREIGN KEY (`Id_Provedor`) REFERENCES `provedor` (`Id_Provedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (87878,123,1234,10000),(87879,124,1283,40000),(87880,125,1236,40000),(87881,126,1237,5000),(87882,127,1238,13500),(87883,128,1256,1000),(87884,129,1265,2000),(87885,130,1270,9000),(87886,131,1276,75000);
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `Id_Inventario` int NOT NULL,
  `Fecha_ingreso_producto` date DEFAULT NULL,
  `Cantidad_producto` int DEFAULT NULL,
  `Id_del_producto` int NOT NULL,
  `Cantidad_insumo` int DEFAULT NULL,
  `Id_insumos` int NOT NULL,
  `Fecha_ingreso_insumos` date DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`),
  KEY `Id_producto` (`Id_del_producto`),
  KEY `Id_insumos` (`Id_insumos`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Id_del_producto`) REFERENCES `productos` (`Id_producto`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`Id_insumos`) REFERENCES `insumos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (2335344,'2020-11-05',95,5680,35,87880,'2020-10-21'),(2335346,'2020-11-05',40,5679,21,87881,'2020-10-22'),(2335348,'2020-11-06',10,5680,10,87882,'2020-10-23'),(2335350,'2020-11-07',15,5681,18,87883,'2020-10-24'),(2335352,'2020-11-08',38,5682,23,87884,'2020-10-25'),(2335354,'2020-11-09',23,5683,15,87885,'2020-10-26'),(2335356,'2020-11-10',10,5684,27,87886,'2020-10-27'),(2335358,'2020-11-11',20,5685,15,87879,'2020-10-28');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Id_Pedido` int NOT NULL,
  `Fecha_pedido` date DEFAULT NULL,
  `Fecha_entrega` date DEFAULT NULL,
  `Id_producto` int NOT NULL,
  `Id_Vendedor` int NOT NULL,
  PRIMARY KEY (`Id_Pedido`),
  KEY `Id_producto` (`Id_producto`),
  KEY `Id_Vendedor` (`Id_Vendedor`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_Vendedor`) REFERENCES `vendedor` (`Id_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1111,'0000-00-00','0000-00-00',5677,77777),(1112,'2000-00-01','2000-00-01',5678,77778),(1113,'2000-00-02','2000-00-02',5679,77779),(1114,'2000-00-03','2000-00-03',5680,77780),(1115,'2000-00-04','2000-00-04',5681,77781),(1116,'2000-00-05','2000-00-05',5682,77782),(1117,'2000-00-06','2000-00-06',5683,77783),(1118,'2000-00-07','2000-00-07',5684,77784),(1119,'2000-00-08','2000-00-08',5685,77785),(1121,'2000-00-10','2000-00-10',5678,77777),(1122,'2000-00-11','2000-00-11',5679,77778),(1123,'2000-00-12','2000-00-12',5680,77779),(1124,'2000-00-13','2000-00-13',5681,77780),(1125,'2000-00-14','2000-00-14',5682,77781),(1126,'2000-00-15','2000-00-15',5683,77782),(1127,'2000-00-16','2000-00-16',5684,77783),(1128,'2000-00-17','2000-00-17',5685,77784),(1131,'2000-00-20','2000-00-20',5679,77777),(1132,'2000-00-21','2000-00-21',5680,77778),(1133,'2000-00-22','2000-00-22',5681,77779),(1134,'2000-00-23','2000-00-23',5682,77780),(1135,'2000-00-24','2000-00-24',5683,77781),(1136,'2000-00-25','2000-00-25',5684,77782),(1137,'2000-00-26','2000-00-26',5685,77783),(1139,'2000-00-28','2000-00-28',5678,77785),(1141,'2000-00-30','2000-00-30',5680,77777),(1142,'2000-00-31','2000-00-31',5681,77778),(1143,'2020-00-01','2020-00-01',5682,77779),(1144,'2020-00-02','2020-00-02',5683,77780),(1145,'2020-00-03','2020-00-03',5684,77781),(1146,'2020-00-04','2020-00-04',5685,77782),(1148,'2020-00-06','2020-00-06',5678,77784),(1149,'2020-00-07','2020-00-07',5679,77785),(1151,'2020-00-09','2020-00-09',5681,77777),(1152,'2020-00-10','2020-00-10',5682,77778),(1153,'2020-00-11','2020-00-11',5683,77779),(1154,'2020-00-12','2020-00-12',5684,77780),(1155,'2020-00-13','2020-00-13',5685,77781),(1157,'2020-00-15','2020-00-15',5678,77783),(1158,'2020-00-16','2020-00-16',5679,77784),(1159,'2020-00-17','2020-00-17',5680,77785),(1161,'2020-00-19','2020-00-19',5682,77777),(1162,'2020-00-20','2020-00-20',5683,77778),(1163,'2020-00-21','2020-00-21',5684,77779),(1164,'2020-00-22','2020-00-22',5685,77780),(1166,'2020-00-24','2020-00-24',5678,77782),(1167,'2020-00-25','2020-00-25',5679,77783),(1168,'2020-00-26','2020-00-26',5680,77784),(1169,'2020-00-27','2020-00-27',5681,77785),(1171,'2020-00-29','2020-00-29',5683,77777),(1172,'2020-00-30','2020-00-30',5684,77778),(1173,'2020-00-31','2020-00-31',5685,77779),(1175,'2019-00-02','2019-00-02',5678,77781),(1176,'2019-00-03','2019-00-03',5679,77782),(1177,'2019-00-04','2019-00-04',5680,77783),(1178,'2019-00-05','2019-00-05',5681,77784),(1179,'2019-00-06','2019-00-06',5682,77785),(1181,'2019-00-08','2019-00-08',5684,77777),(1182,'2019-00-09','2019-00-09',5685,77778),(1184,'2019-00-11','2019-00-11',5678,77780),(1185,'2019-00-12','2019-00-12',5679,77781),(1186,'2019-00-13','2019-00-13',5680,77782),(1187,'2019-00-14','2019-00-14',5681,77783),(1188,'2019-00-15','2019-00-15',5682,77784),(1189,'2019-00-16','2019-00-16',5683,77785),(1191,'2019-00-18','2019-00-18',5685,77777),(1193,'2019-00-20','2019-00-20',5678,77779),(1194,'2019-00-21','2019-00-21',5679,77780),(1195,'2019-00-22','2019-00-22',5680,77781),(1196,'2019-00-23','2019-00-23',5681,77782),(1197,'2019-00-24','2019-00-24',5682,77783),(1198,'2019-00-25','2019-00-25',5683,77784),(1199,'2019-00-26','2019-00-26',5684,77785),(1202,'2019-00-29','2019-00-29',5678,77778),(1203,'2019-00-30','2019-00-30',5679,77779),(1204,'2019-00-31','2019-00-31',5680,77780),(1205,'2018-00-01','2018-00-01',5681,77781),(1206,'2018-00-02','2018-00-02',5682,77782),(1207,'2018-00-03','2018-00-03',5683,77783),(1208,'2018-00-04','2018-00-04',5684,77784),(1209,'2018-00-05','2018-00-05',5685,77785);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_comprovante_pedido`
--

DROP TABLE IF EXISTS `pedido_has_comprovante_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_comprovante_pedido` (
  `Id_Pedido` int NOT NULL,
  `Id_Comprovante` int NOT NULL,
  KEY `Id_Pedido` (`Id_Pedido`),
  KEY `Id_Comprovante` (`Id_Comprovante`),
  CONSTRAINT `pedido_has_comprovante_pedido_ibfk_1` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`),
  CONSTRAINT `pedido_has_comprovante_pedido_ibfk_2` FOREIGN KEY (`Id_Comprovante`) REFERENCES `comprovante_pedido` (`Id_Comprovante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_comprovante_pedido`
--

LOCK TABLES `pedido_has_comprovante_pedido` WRITE;
/*!40000 ALTER TABLE `pedido_has_comprovante_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_has_comprovante_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `Id_Produccion` int NOT NULL,
  `Estado_producto` int NOT NULL,
  `Id_Empleado` int NOT NULL,
  `Id_insumos` int NOT NULL,
  `Cantidad_insumos` int DEFAULT NULL,
  `Unidad_de_medida` varchar(4) DEFAULT NULL,
  `Tipo_de_productos` int NOT NULL,
  PRIMARY KEY (`Id_Produccion`),
  KEY `Id` (`Estado_producto`),
  KEY `Id_Empleado` (`Id_Empleado`),
  KEY `Id_insumos` (`Id_insumos`),
  KEY `Id_Tipo_de_productos` (`Tipo_de_productos`),
  CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`Estado_producto`) REFERENCES `estado` (`Id`),
  CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleado` (`Id`),
  CONSTRAINT `produccion_ibfk_3` FOREIGN KEY (`Id_insumos`) REFERENCES `insumos` (`Id`),
  CONSTRAINT `produccion_ibfk_4` FOREIGN KEY (`Tipo_de_productos`) REFERENCES `tipo_de_productos` (`Id_Tipo_de_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (525,879955676,98898,87880,800,'ml',1111111),(527,879955677,98897,87880,800,'ml',1111111),(529,879955678,98898,87880,800,'ml',1111111),(5242,879955676,98899,87886,100,'ml',2222222),(5243,879955676,98897,87880,350,'ml',2222222),(5245,879955677,98898,87886,100,'ml',2222222),(5246,879955677,98899,87880,350,'ml',2222222),(5248,879955678,98899,87886,100,'ml',2222222),(5249,879955678,98897,87880,350,'ml',2222222),(52424,879955676,98899,87882,2,'m^2',6666666),(52425,879955676,98897,87881,15,'m',6666666),(52427,879955677,98898,87882,2,'m^2',6666666),(52428,879955677,98899,87881,15,'m',6666666),(52430,879955678,98899,87882,2,'m^2',6666666),(52431,879955678,98897,87881,15,'m',6666666),(524256,879955676,98899,87882,3,'m^2',7777777),(524257,879955676,98897,87881,30,'m',7777777),(524259,879955677,98898,87882,3,'m^2',7777777),(524260,879955677,98899,87881,30,'m',7777777),(524262,879955678,98899,87882,3,'m^2',7777777),(524263,879955678,98897,87881,30,'m',7777777),(5242651,879955676,98899,87878,2,'cm^2',8888888),(5242654,879955677,98898,87878,15,'cm^2',8888888),(5242657,879955678,98899,87878,2,'cm^2',8888888),(5242658,879955678,98897,87881,15,'m',8888888),(5242682,879955676,98897,87881,15,'m',8888888),(5242685,879955677,98899,87881,2,'m',8888888),(52426831,879955676,98899,87886,100,'ml',3333333),(52426832,879955676,98897,87879,100,'ml',3333333),(52426833,879955677,98899,87886,100,'ml',3333333),(52426834,879955677,98897,87879,100,'ml',3333333),(52426835,879955678,98899,87886,100,'ml',3333333),(52426836,879955678,98897,87879,100,'ml',3333333);
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Id_producto` int NOT NULL,
  `Id_Tipo` int NOT NULL,
  `Valor_producto` int DEFAULT NULL,
  PRIMARY KEY (`Id_producto`),
  KEY `Id_Tipo_de_productos` (`Id_Tipo`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_Tipo`) REFERENCES `tipo_de_productos` (`Id_Tipo_de_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (5677,2222222,10007),(5678,2222222,8000),(5679,3333333,5000),(5680,4444444,12000),(5681,5555555,20000),(5682,6666666,45000),(5683,7777777,65000),(5684,8888888,7000),(5685,9999999,15000),(5687,9999999,6000);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor` (
  `Id_Provedor` int NOT NULL,
  `Primer_Nombre` varchar(15) DEFAULT NULL,
  `Segundo_Nombre` varchar(15) DEFAULT NULL,
  `Primer_Apellido` varchar(15) DEFAULT NULL,
  `Segundo_Apellido` varchar(15) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo_electronico` varchar(40) DEFAULT NULL,
  `Cod_telefon` int NOT NULL,
  `Telefon` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Provedor`),
  KEY `Cod_telefon` (`Cod_telefon`),
  CONSTRAINT `provedor_ibfk_1` FOREIGN KEY (`Cod_telefon`) REFERENCES `tipo_de_numero` (`Cod_telefon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
INSERT INTO `provedor` VALUES (0,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000000000'),(1234,'Rubiel','Alberto','Agudelo','Echeverry','Carrera 3 Sur # 18- 45','umata@angostura-antioquia.gov.co',987654321,'3203320091'),(1236,'Alejandra','Maria','Arango','Álvarez','Calle 4 Sur No. 5  10','dls@angostura-antioquia.gov.co',987654321,'3203320093'),(1237,'Jaider','Egidio','Arango','Arango','Calle 11 Sur No. 4 - 14','angosturaestereo89.2@gmail.com',987654321,'3203320094'),(1238,'Marlen','Haygnes','Arango','Posada','Calle 24 Sur N° 5-60','comisaria@angostura-antioquia.gov.co',987654321,'3203320095'),(1239,'Johana','Alexandra','Atehortua','Agudelo','Av. Cali Sur No. 6C-09','personería@angostura-antioquia.gov.co',987654321,'3203320096'),(1240,'Nai','de Jesus','Atehortua','Atehortua','Calle 48b sur No. 21-13','gobierno@angostura-antioquia.gov.co',987654321,'3203320097'),(1241,'Luz','Elena','Ayala','Mira','Av Cra. 60 Sur No. 57-60','casamuseo.angostura@gmail.com',987654321,'3203320098'),(1242,'Jhon','Jairo','Barrientos','González','Calle 11 Sur No. 4-21 / 93','gobierno@angostura-antioquia.gov.co',987654321,'3203320099'),(1243,'Mauro','Albeiro','Betancur','Pineda','Calle 10 Sur No. 5-22','planeacion@angostura-antioquia.gov.co',987654321,'3203320100'),(1244,'Luis','Reinaldo','Bustamante','Taborda','Carrera 20 Sur No. 37-54','tesoreria@angostura-antioquia.gov.co',987654321,'3203320101'),(1245,'Yulieth','','Cárdenas','Chaverra','Av. Calle 19 Sur N° 2-49','umata@angostura-antioquia.gov.co',987654321,'3203320102'),(1246,'Daniel','','Cardona','Loaiza','Calle 109a Sur N° 17-10 ','gobierno@angostura-antioquia.gov.co',987654321,'3203320103'),(1247,'Jeisson','Alejandro','Castańo','Piedrahita','Cr.8a Sur # 15-63','ambiente@angostura-antioquia.gov.co',987654321,'3203320104'),(1248,'Carlos','Ignacio','Castańo','Piedrahita','Cr.9 Sur # 74-99','dls@angostura-antioquia.gov.co',987654321,'3203320105'),(1249,'Hernado','de Jesús','Echeverry','Zapata','Carrera 1 Sur No. 17 01','tesoreria@angostura-antioquia.gov.co',987654321,'3203320106'),(1250,'Jose','Alirio','Fernandez','Gómez','Cr.6 Sur # 17-12','gobierno@angostura-antioquia.gov.co',987654321,'3203320107'),(1251,'María','Maryory','García','Moreno','Carrera 7 Sur Calle 26','tesoreria@angostura-antioquia.gov.co',987654321,'3203320108'),(1252,'Jorge','Ignacio','Gaviria','Rua','Av.19 Sur # 152-48','gobierno@angostura-antioquia.gov.co',987654321,'3203320109'),(1254,'Liliana','Maria','Gómez','Barrientos','Carrera 7 Sur No. 22 - 79','concejo@angostura-antioquia.gov.co',987654321,'3203320111'),(1255,'Molinero','Jaime','Gómez','Blandon','Cl.90 Sur # 11a-54','mujer@angostura-antioquia.gov.co',987654321,'3203320112'),(1256,'Andres','Felipe','Gómez','Zapata','Calle 12 Sur # 2-65','gobierno@angostura-antioquia.gov.co',987654321,'3203320113'),(1257,'Isbelia','Maria','González','Taborda','Calle 45A Sur No. 14-37','educacion@angostura-antioquiagov.co',987654321,'3203320114'),(1258,'Lina','Marcela','Grisales','Ortiz','Cra. 18 Sur No. 82 - 35','tesoreria@angostura-antioquia.gov.co',987654321,'3203320115'),(1259,'Johana','Maria','Guzman','Zapata','Calle 13 Sur #3-17','tesoreria@angostura-antioquia.gov.co',987654321,'3203320116'),(1260,'Martha','Elena','Henao','Zapata','Cl.10 Sur # 3-16','gobierno@angostura-antioquia.gov.co',987654321,'3203320117'),(1261,'Marisol','','Hernandez','Villa','Cl.119 Sur # 15-41','planeacion@angostura-antioquia.gov.co',987654321,'3203320118'),(1262,'Cristian','Darío','Hincapie','González','Cr.15 Sur # 82-87','inspecion@angostura-antioquia.gov.co',987654321,'3203320119'),(1263,'Juan','Guillermo','Londońo','Vasquez','Cl.81 Sur # 11-92','planeacion@angostura-antioquia.gov.co',987654321,'3203320120'),(1264,'Piedad','Teresita','Lopera','Rojas','Cl.69 Sur # 4-64','gobierno@angostura-antioquia.gov.co',987654321,'3203320121'),(1265,'Solina','Maria','Lopera','Zapata','Cl.81 Sur # 8-70','gobierno@angostura-antioquia.gov.co',987654321,'3203320122'),(1266,'Lizeth','Juliana','Lopez','Mira','Cr.21 Sur # 88-12','gobierno@angostura-antioquia.gov.co',987654321,'3203320123'),(1267,'Sandra','Mariana','Lujan','Sánchez','Cl.94 Sur # 13-90','juventud@angostura-antioquia.gov.co',987654321,'3203320124'),(1268,'Esmeralda','Lucia','Madrigal','Hoyos','Cr.4 Sur # 19-85 Piso 2','madrigal2266@gmail.com',987654321,'3203320125'),(1269,'Carmen','Elena','Martinez','Vélez','Cl.45 Sur # 18 -27','casamuseo.angostura@gmail.com',987654321,'3203320126'),(1270,'Monica','Patricia','Mendoza','Montoya','Cl.20 Sur # 14-37/39','gobierno@angostura-antioquia.gov.co',987654321,'3203320127'),(1272,'Rubiel','Alberto','Mora','González','Av.82 Sur # 11-50 Int. 2','umata@angostura-antioquia.gov.co',987654321,'3203320129'),(1273,'Yohan','Adrian','Mora','Taborda','Cl.93b Sur # 11a- 84','casamuseo.angostura@gmail.com',987654321,'3203320130'),(1275,'Wilsón','Alemán','Ospina','Escobar','Cr.12 Sur # 11-25','umata@angostura-antioquia.gov.co',987654321,'3203320132'),(1276,'Fernando','de Jesus','Pareja','Arango','Cl.92 Sur # 16-11','angosturaestereo89.2@gmail.com',987654321,'3203320133'),(1277,'Diego','Alejandro','Pemberthy','Lopera','Cr 8 Sur No. 8-91','personeria@angostura-antioquia.gov.co',987654321,'3203320134'),(1278,'Yasmir','Andrea','Pérez','Gaviria','Cr.15 Sur # 88-64','planeacion@angostura-antioquia.gov.co',987654321,'3203320135'),(1279,'Genni','Catalina','Piedrahita','Giraldo','Calle 11 Sur No. 4-21/ 93','depote@angostura-antioquia.gov.co',987654321,'3203320136'),(1280,'Yomaira','Andrea','Porras','Agudelo','Calle 11 Sur No. 4-14','gobierno@angostura-antioquia.gov.co',987654321,'3203320137'),(1281,'Marta','Lucia','Porras','Arenas','Carrera 30 Sur Calle 45 ','alcaldia@angostura-antioquia.gov.co',987654321,'3203320138'),(1282,'Homero','Esteban','Posada','Hoyos','Carrera 6 Sur No. 9-77','gobierno@angostura-antioquia.gov.co',987654321,'3203320139'),(1283,'Orlando','Antonio','Posada','Valencia','Carrera 74 Sur No. 82a-81.','planeacion@angostura-antioquia.gov.co',987654321,'3203320140'),(1284,'Jhon','Fredy','Restrepo','Cárdenas','Carrera 30 Sur No 45-03','depote@angostura-antioquia.gov.co',987654321,'3203320141'),(1285,'Olga','Inés','Restrepo','Prisco','Calle 24 Sur No. 6-00','gobierno@angostura-antioquia.gov.co',987654321,'3203320142'),(1286,'Hernán','Darío','Restrepo','Prisco','Carrera 8 Sur No. 7-21','planeacion@angostura-antioquia.gov.co',987654321,'3203320143'),(1287,'Gloria','Eugenia','Ríos','Monsalve','Carrera 2 Sur No. 10-70','sisben@angostura-antioquia.gov.co',987654321,'3203320144'),(1288,'Ana','Maria','Rojas','Martinez','Calle 53 Sur No. 43-10','discapacidad@angostura-antioquia.gov.co',987654321,'3203320145'),(1289,'Diana','Marcela','Rojo','Atehortua','Entrada Calle 53 Sur ','justicia@angostura-antioquia.gov.co',987654321,'3203320146'),(1290,'Darwin','Arley','Rojo','Macías','Calle 53 Sur #2-19','gobierno@angostura-antioquia.gov.co',987654321,'3203320147'),(1291,'Ana','Yenifer','Rua','Valencia','Carrera 48 Sur No. 63-97','gobierno@angostura-antioquia.gov.co',987654321,'3203320148'),(1292,'Marleny','','Sánchez','Piedrahita','Calle 61a Sur No. 14-58','tesoreria@angostura-antioquia.gov.co',987654321,'3203320149'),(1293,'Humberto','León','Sánchez','Gómez','Calle 26 Sur No. 25-42','tesoreria@angostura-antioquia.gov.co',987654321,'3203320150'),(1294,'Juan','José','Sepúlveda','Orrego','Carrera 30 Sur No. 48-51','umata@angostura-antioquia.gov.co',987654321,'3203320151'),(1295,'luz','Amparo','Sierra','Betancur','Carrera 7 Sur No. 93-01','dls@angostura-antioquia.gov.co',987654321,'3203320152'),(1296,'Juan','Carlos','Soto','Lennis','Carrera 4 Sur No. 22-61','gobierno@angostura-antioquia.gov.co',987654321,'3203320153'),(1297,'Margarita','Maria','Soto','Misas','Carrera 6 Sur Calle 16','gerontologia@angostura-antioquia.gov.co',987654321,'3203320154'),(1298,'Piedad','Marleny','Soto','Zapata','Calle 23 A Sur No. 19-86','almacen@angostura-antioquia.gov.co',987654321,'3203320155'),(1299,'Juan','Alberto','Soto','Angulo','Calle 23 A Sur No. 19-86','depote@angostura-antioquia.gov.co',987654321,'3203320156'),(1300,'Maria','de las Mercedes','Soto','Angulo','Carrera 8 Sur No. 6-87','planeacion@angostura-antioquia.gov.co',987654321,'3203320157'),(1301,'Eliana','Patricia','Tobón','Cardona','Diagonal Sur 53 No. 34-53','elianatobonc@yahoo.es',987654321,'3203320158'),(1302,'Luis','Fernando','Vargas','Correa','Calle 10 Sur No. 4-69','planeacion@angostura-antioquia.gov.co',987654321,'3203320159'),(1303,'Joaquín','Emilio','Vélez','Argáez','Calle 10 Sur No 4-92','gobierno@angostura-antioquia.gov.co',987654321,'3203320160'),(1304,'Jhuliana','Maria','Vélez','Loaiza','Carrera 7 Sur No. 28-66','umata@angostura-antioquia.gov.co',987654321,'3203320161'),(1306,'Juan','Alberto','Villa','Amaya','Carrera 7 Sur con Cl 12','planeacion@angostura-antioquia.gov.co',987654321,'3203320163'),(1307,'Jose','Fernando','Villa','Colina baja','Calle 20 Sur No. 2 - 91','umata@angostura-antioquia.gov.co',987654321,'3203320164'),(1308,'Andres','Felipe','Villa','Taborda','Calle 45A Sur 14-62','depote@angostura-antioquia.gov.co',987654321,'3203320165'),(1309,'Juan','Jairo','Zea','Henao','Cl.70a Sur # 5-67','gerontologia@angostura-antioquia.gov.co',987654321,'3203320166'),(1310,'Blanca ','Lorena','Vilca','Lucero','Cl.70a Sur # 10-68','hola_mundo@angostura-antioquia.gov.co',987654321,'3203320167'),(1311,'Luz','Angelica','Vilgoso','Alvarado','Calle 11 Sur No. 4-93','nfkfjff@angostura-antioquia.gov.co',987654321,'3203320168'),(1312,'Nelsy','Patricia','Yamawaki','Onaga','Carrera 7 Sur Calle 26','tvtpku_tv@angostura-antioquia.gov.co',987654321,'3203320169'),(1313,'Camila','Johana','Zawalloa','Vega','Cr.13 Sur # 14-69','micro7@angostura-antioquia.gov.co',987654321,'3203320170'),(1314,'Olga','Camila','Zapata','Chang','Cr.14 Sur # 75-29','meetmeet@angostura-antioquia.gov.co',987654321,'3203320171'),(1315,'Cristina','Lizeth','Zegarra ','Salcedo','Cra. 25 Sur # 41 - 64','zxasqw001122@angostura-antioquia.gov.co',987654321,'3203320172'),(1316,'Rafael','Eduardo','Silva','Davila','Calle 9 Sur Nş 4-93','mash890@angostura-antioquia.gov.co',987654321,'3203320173'),(1317,'Kevin','Esneider','Cancelado','Freinet','Calle 10 Sur No. 5 - 32','monster11@angostura-antioquia.gov.co',987654321,'3203320174'),(1318,'John','Alejandro','Cruz','Fonseca','Carrera 7a Sur N° 22-47','hesoyam@angostura-antioquia.gov.co',987654321,'3203320175'),(1319,'Johan','Enrique','Perez','Gonzalez','Carrera 6 Sur No. 54 - 04','var7745@angostura-antioquia.gov.co',987654321,'3203320176'),(1320,'Laura','Andrea','Diaz','Diaz','Calle 12 Sur # 2-59.','buno78@angostura-antioquia.gov.co',987654321,'3203320177'),(1321,'Paula','Lorena','Flores','Acosta','Carrera 13 Sur #61-24','asnaeb@angostura-antioquia.gov.co',987654321,'3203320178'),(1322,'Karen','Johana','Contreras','Palacios','Calle 63 Sur No. 9-60','hola123@angostura-antioquia.gov.co',987654321,'3203320179'),(1323,'Marco','Stiven','Cuellar','Romero','Calle 13 Sur No.2 - 44','mundo77@angostura-antioquia.gov.co',987654321,'3203320180'),(1324,'Israel','Andres','Mendez','Cortes','Cra. 11 Sur No 61-80','12fg45@angostura-antioquia.gov.co',987654321,'3203320181'),(1325,'Diana','Marcela','Pineda','Arias','Calle 71 Sur N. 10 - 25','bnoplń@angostura-antioquia.gov.co',987654321,'3203320182'),(1326,'Nancy','Carolina','Bello','Pinto','Calle 95 Sur # 30-13','qwe3333@angostura-antioquia.gov.co',987654321,'3203320183'),(1327,'Elsa','Marisol','Gaitan','Cuadros','Calle 70 Sur No. 19 - 40','lop76@angostura-antioquia.gov.co',987654321,'3203320184'),(1328,'Juan ','David','Gutierres','Paez','Calle 77 Sur No. 17 - 13','fbnh3@angostura-antioquia.gov.co',987654321,'3203320185'),(1329,'Andres','Felipe','Garay','Garay','Calle 10 Sur No. 0  19','cvfrtgh00@angostura-antioquia.gov.co',987654321,'3203320186'),(1330,'Juan','David','Gregory','Diaz','Calle 13 Sur # 2-70','rfgvv4567@angostura-antioquia.gov.co',987654321,'3203320187'),(1331,'Luis','Miguel','Jimenez','Poveda','Carrera 7a Sur - Calle 106','uttggh555@angostura-antioquia.gov.co',987654321,'3203320188'),(1332,'Diana','Lizeth','Cubides','Sepulveda','Av. 68 Sur # 33-11','dfgf45@angostura-antioquia.gov.co',987654321,'3203320189'),(1333,'Alison','Vanessa','Ruiz','Ardila','Calle 94 Sur # 7-48','Ejkl12@angostura-antioquia.gov.co',987654321,'3203320190');
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id_Roles` int NOT NULL,
  `Rol` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (223445666,'Administrador'),(223445667,'Vendedor'),(223445668,'Cliente'),(223445669,'Empleado');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_insumo`
--

DROP TABLE IF EXISTS `tipo_de_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_insumo` (
  `Id` int NOT NULL,
  `Insumo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_insumo`
--

LOCK TABLES `tipo_de_insumo` WRITE;
/*!40000 ALTER TABLE `tipo_de_insumo` DISABLE KEYS */;
INSERT INTO `tipo_de_insumo` VALUES (123,'Telas'),(124,'Gliserina'),(125,'Alcohol Industrial'),(126,'Hilos'),(127,'Telas AntiFluido'),(128,'Cremalleras'),(129,'Envases plasticos'),(130,'Tiras de ajuste'),(131,'Trietalonamina');
/*!40000 ALTER TABLE `tipo_de_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_numero`
--

DROP TABLE IF EXISTS `tipo_de_numero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_numero` (
  `Cod_telefon` int NOT NULL,
  `Tipo_de_numero` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cod_telefon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_numero`
--

LOCK TABLES `tipo_de_numero` WRITE;
/*!40000 ALTER TABLE `tipo_de_numero` DISABLE KEYS */;
INSERT INTO `tipo_de_numero` VALUES (0,NULL),(987654321,'Telefon Movil'),(1234566789,'Telefon Fijo');
/*!40000 ALTER TABLE `tipo_de_numero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_productos`
--

DROP TABLE IF EXISTS `tipo_de_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_productos` (
  `Id_Tipo_de_productos` int NOT NULL,
  `Producto` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_de_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_productos`
--

LOCK TABLES `tipo_de_productos` WRITE;
/*!40000 ALTER TABLE `tipo_de_productos` DISABLE KEYS */;
INSERT INTO `tipo_de_productos` VALUES (1111111,'Alcohol Antiseptico'),(2222222,'Gel AntiBacterial'),(3333333,'Jabon AntiBacterial'),(4444444,'Liquido Cuaternario'),(5555555,'Tapete AntiBacterial'),(6666666,'Chaqueta AntiFluido'),(7777777,'Traje AntiFluido'),(8888888,'Tapa Bocas'),(9999999,'Fumigador');
/*!40000 ALTER TABLE `tipo_de_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Id_usuarios` int NOT NULL,
  `Id_Roles` int NOT NULL,
  PRIMARY KEY (`Id_usuarios`),
  KEY `Id_Roles` (`Id_Roles`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1122,223445666),(1123,223445667),(1124,223445668),(1125,223445669);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `Id_Vendedor` int NOT NULL,
  `Primer_Nombre` varchar(15) DEFAULT NULL,
  `Segundo_Nombre` varchar(15) DEFAULT NULL,
  `Primer_Apellido` varchar(15) DEFAULT NULL,
  `Segundo_Apellido` varchar(15) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Cod_telefon` int NOT NULL,
  `Telefon` varchar(10) DEFAULT NULL,
  `Id_Roles` int NOT NULL,
  PRIMARY KEY (`Id_Vendedor`),
  KEY `Cod_telefon` (`Cod_telefon`),
  KEY `Id_Roles` (`Id_Roles`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`Cod_telefon`) REFERENCES `tipo_de_numero` (`Cod_telefon`),
  CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (77777,'Juan','Jose','Gonzalez','Rodriguez','Calle 140 sur # 35-50',987654321,'319564336',223445667),(77778,'Jorge','Enrique','Bello','Porras','Calle 140 sur # 35-51',987654321,'319564337',223445667),(77779,'Juan ','Andres','Hitler','Nazi','Calle 140 sur # 35-52',987654321,'319564338',223445667),(77780,'Ingrid','Yulieth','Picasso','Benedetti','Calle 140 sur # 35-53',987654321,'319564339',223445667),(77781,'Sofia','Martina','Ulises','Pineda','Calle 140 sur # 35-54',987654321,'319564340',223445667),(77782,'Catalina','Antonia','Cuadros','Morales','Calle 140 sur # 35-55',987654321,'319564341',223445667),(77783,'Luisa','Mirlaidys','Bladimir','Abril','Calle 140 sur # 35-56',987654321,'319564342',223445667),(77784,'Carol','Johana','Parker','Paez','Calle 140 sur # 35-57',987654321,'319564343',223445667),(77785,'Rosa','Maria','Melano','De las Cascada','Calle 140 sur # 35-58',987654321,'319564344',223445667);
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

-- Dump completed on 2020-12-14  2:37:25
