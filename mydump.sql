-- MySQL dump 10.13  Distrib 5.5.13, for Win32 (x86)
--
-- Host: localhost    Database: omning_db
-- ------------------------------------------------------
-- Server version	5.5.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_address`
--

DROP TABLE IF EXISTS `account_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_address` (
  `ACCOUNT_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_2fs006oxcubsjln2w17g8ti14` (`ACCOUNT_ID`),
  CONSTRAINT `FK_2fs006oxcubsjln2w17g8ti14` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `accountmgmtmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_address`
--

LOCK TABLES `account_address` WRITE;
/*!40000 ALTER TABLE `account_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_currency`
--

DROP TABLE IF EXISTS `account_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_currency` (
  `accountId` bigint(20) NOT NULL,
  `currencyId` bigint(20) NOT NULL,
  KEY `FK_9mew3atc3ucb3jhdf2m2vgns5` (`currencyId`),
  KEY `FK_g5ab0yv4gxu6bjodbblurk0a` (`accountId`),
  CONSTRAINT `FK_9mew3atc3ucb3jhdf2m2vgns5` FOREIGN KEY (`currencyId`) REFERENCES `currencymst` (`id`),
  CONSTRAINT `FK_g5ab0yv4gxu6bjodbblurk0a` FOREIGN KEY (`accountId`) REFERENCES `accountmgmtmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_currency`
--

LOCK TABLES `account_currency` WRITE;
/*!40000 ALTER TABLE `account_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_productmst`
--

DROP TABLE IF EXISTS `account_productmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_productmst` (
  `accountId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  KEY `FK_ah9jodnuxcqy1drrnv4vkpjmy` (`productId`),
  KEY `FK_ou8xq0c5lrmaf9eps5liedpc0` (`accountId`),
  CONSTRAINT `FK_ah9jodnuxcqy1drrnv4vkpjmy` FOREIGN KEY (`productId`) REFERENCES `productmst` (`id`),
  CONSTRAINT `FK_ou8xq0c5lrmaf9eps5liedpc0` FOREIGN KEY (`accountId`) REFERENCES `accountmgmtmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_productmst`
--

LOCK TABLES `account_productmst` WRITE;
/*!40000 ALTER TABLE `account_productmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_productmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountmgmtmst`
--

DROP TABLE IF EXISTS `accountmgmtmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountmgmtmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `AddressOfNominee` varchar(255) DEFAULT NULL,
  `accountStatus` varchar(255) DEFAULT NULL,
  `accountType` varchar(255) DEFAULT NULL,
  `additionalInformation1` varchar(255) DEFAULT NULL,
  `additionalInformation2` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dateOfNomination` varchar(255) DEFAULT NULL,
  `eMail` varchar(255) DEFAULT NULL,
  `freezeType` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `guardianOfMinorNominee` varchar(255) DEFAULT NULL,
  `holderAddress` varchar(255) DEFAULT NULL,
  `holderDateOfBirth` datetime DEFAULT NULL,
  `holderTelephoneCode` varchar(255) DEFAULT NULL,
  `holderTelephoneNo` varchar(255) DEFAULT NULL,
  `holders` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isNomineeMinor` bit(1) DEFAULT NULL,
  `minorType` varchar(255) DEFAULT NULL,
  `modeOfOperation` varchar(255) DEFAULT NULL,
  `nameOfHolder` varchar(255) DEFAULT NULL,
  `nameOfNominee` varchar(255) DEFAULT NULL,
  `noOfHolders` int(11) DEFAULT NULL,
  `nomineeDateOfBirth` datetime DEFAULT NULL,
  `nomineeEMail` varchar(255) DEFAULT NULL,
  `nomineeTelephoneCode` varchar(255) DEFAULT NULL,
  `nomineeTelephoneNo` varchar(255) DEFAULT NULL,
  `percentageShare` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `telephoneCode` varchar(255) DEFAULT NULL,
  `telephoneNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountmgmtmst`
--

LOCK TABLES `accountmgmtmst` WRITE;
/*!40000 ALTER TABLE `accountmgmtmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountmgmtmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitymst`
--

DROP TABLE IF EXISTS `activitymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitymst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `activityCode` varchar(255) DEFAULT NULL,
  `activityDesc` varchar(255) DEFAULT NULL,
  `drCr` varchar(255) DEFAULT NULL,
  `finNonFin` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `moduleCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitymst`
--

LOCK TABLES `activitymst` WRITE;
/*!40000 ALTER TABLE `activitymst` DISABLE KEYS */;
/*!40000 ALTER TABLE `activitymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitystatusmst`
--

DROP TABLE IF EXISTS `activitystatusmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitystatusmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `fkActivityMstPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s91i8tv9e6rb51w2wopymihr4` (`fkActivityMstPk`),
  CONSTRAINT `FK_s91i8tv9e6rb51w2wopymihr4` FOREIGN KEY (`fkActivityMstPk`) REFERENCES `activitymst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitystatusmst`
--

LOCK TABLES `activitystatusmst` WRITE;
/*!40000 ALTER TABLE `activitystatusmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `activitystatusmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appconfig`
--

DROP TABLE IF EXISTS `appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `CustomerIdLen` int(11) DEFAULT NULL,
  `CustomerIdLenTypeCode` varchar(20) DEFAULT NULL,
  `amountFormatStr` varchar(20) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `cal` datetime DEFAULT NULL,
  `currFromDate` datetime DEFAULT NULL,
  `customerIdGenType` varchar(20) DEFAULT NULL,
  `dateFormatStr` varchar(20) DEFAULT NULL,
  `decimalCharacter` varchar(20) DEFAULT NULL,
  `digitSeparator` varchar(20) DEFAULT NULL,
  `effFromDate` date DEFAULT NULL,
  `effToDate` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `numberFormatStr` varchar(20) DEFAULT NULL,
  `paginationSize` int(11) DEFAULT NULL,
  `setNo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_22yuhw5qxayi3r1euvxofil4m` (`tenantId`,`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appconfig`
--

LOCK TABLES `appconfig` WRITE;
/*!40000 ALTER TABLE `appconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authevent`
--

DROP TABLE IF EXISTS `authevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authevent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authEventAction` varchar(200) DEFAULT NULL,
  `authEventCode` varchar(20) DEFAULT NULL,
  `authEventName` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authevent`
--

LOCK TABLES `authevent` WRITE;
/*!40000 ALTER TABLE `authevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `authevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmatrix`
--

DROP TABLE IF EXISTS `authmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmatrix` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authMatrixName` varchar(30) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `effFrom` date DEFAULT NULL,
  `effTill` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `fkAuthEventPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3h9eifn1v8ex6fedauxf7h7kw` (`fkAuthEventPk`),
  CONSTRAINT `FK_3h9eifn1v8ex6fedauxf7h7kw` FOREIGN KEY (`fkAuthEventPk`) REFERENCES `authevent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmatrix`
--

LOCK TABLES `authmatrix` WRITE;
/*!40000 ALTER TABLE `authmatrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmatrix_branchmst`
--

DROP TABLE IF EXISTS `authmatrix_branchmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmatrix_branchmst` (
  `authMatrix_id` bigint(20) NOT NULL,
  `branches_id` bigint(20) NOT NULL,
  KEY `FK_cv1ytultod6lfkpaowvinc3yg` (`branches_id`),
  KEY `FK_6s96wjxuwuuqq3u3t59ue0d1r` (`authMatrix_id`),
  CONSTRAINT `FK_6s96wjxuwuuqq3u3t59ue0d1r` FOREIGN KEY (`authMatrix_id`) REFERENCES `authmatrix` (`id`),
  CONSTRAINT `FK_cv1ytultod6lfkpaowvinc3yg` FOREIGN KEY (`branches_id`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmatrix_branchmst`
--

LOCK TABLES `authmatrix_branchmst` WRITE;
/*!40000 ALTER TABLE `authmatrix_branchmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmatrix_branchmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmatrix_currencymst`
--

DROP TABLE IF EXISTS `authmatrix_currencymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmatrix_currencymst` (
  `authMatrix_id` bigint(20) NOT NULL,
  `currencies_id` bigint(20) NOT NULL,
  KEY `FK_d2o600ge1s5djf9ly5bf5j9tv` (`currencies_id`),
  KEY `FK_hrj76ndujvmrwthy1voyct39f` (`authMatrix_id`),
  CONSTRAINT `FK_d2o600ge1s5djf9ly5bf5j9tv` FOREIGN KEY (`currencies_id`) REFERENCES `currencymst` (`id`),
  CONSTRAINT `FK_hrj76ndujvmrwthy1voyct39f` FOREIGN KEY (`authMatrix_id`) REFERENCES `authmatrix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmatrix_currencymst`
--

LOCK TABLES `authmatrix_currencymst` WRITE;
/*!40000 ALTER TABLE `authmatrix_currencymst` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmatrix_currencymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmatrixslab`
--

DROP TABLE IF EXISTS `authmatrixslab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmatrixslab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authMode` varchar(20) DEFAULT NULL,
  `authType` varchar(20) DEFAULT NULL,
  `basedOnCode` varchar(20) DEFAULT NULL,
  `countOfAuthorizers` int(11) DEFAULT NULL,
  `currencyISOCode` varchar(255) DEFAULT NULL,
  `fromRange` double DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `srNo` int(11) DEFAULT NULL,
  `toRange` double DEFAULT NULL,
  `fkAuthMatrixPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ny9nehbb1mhuvqx85clpwbt4q` (`fkAuthMatrixPk`),
  CONSTRAINT `FK_ny9nehbb1mhuvqx85clpwbt4q` FOREIGN KEY (`fkAuthMatrixPk`) REFERENCES `authmatrix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmatrixslab`
--

LOCK TABLES `authmatrixslab` WRITE;
/*!40000 ALTER TABLE `authmatrixslab` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmatrixslab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmatrixslabuser`
--

DROP TABLE IF EXISTS `authmatrixslabuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmatrixslabuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `roleCodes` varchar(30) DEFAULT NULL,
  `fkAuthMatrixSlabPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bp6wa84dmj0tj0m7ar3gi4t2y` (`fkAuthMatrixSlabPk`),
  CONSTRAINT `FK_bp6wa84dmj0tj0m7ar3gi4t2y` FOREIGN KEY (`fkAuthMatrixSlabPk`) REFERENCES `authmatrixslab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmatrixslabuser`
--

LOCK TABLES `authmatrixslabuser` WRITE;
/*!40000 ALTER TABLE `authmatrixslabuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmatrixslabuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authprocess`
--

DROP TABLE IF EXISTS `authprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authprocess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authEventCode` varchar(30) DEFAULT NULL,
  `authEventRefCode` varchar(50) DEFAULT NULL,
  `authEventRefNo` bigint(20) DEFAULT NULL,
  `authStatusCode` varchar(50) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `makerCode` varchar(50) DEFAULT NULL,
  `makerDateTime` datetime DEFAULT NULL,
  `makerId` bigint(20) DEFAULT NULL,
  `noOfAuthorizers` int(11) DEFAULT NULL,
  `tenantCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authprocess`
--

LOCK TABLES `authprocess` WRITE;
/*!40000 ALTER TABLE `authprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `authprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authprocessdtls`
--

DROP TABLE IF EXISTS `authprocessdtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authprocessdtls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `checkerAuthStatusCode` varchar(30) DEFAULT NULL,
  `checkerAuthStatusReasonCode` varchar(30) DEFAULT NULL,
  `checkerCode` varchar(30) DEFAULT NULL,
  `checkerDateTime` datetime DEFAULT NULL,
  `checkerId` bigint(20) DEFAULT NULL,
  `checkerRank` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `roleCode` varchar(200) DEFAULT NULL,
  `fkAuthProcessPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6hug3dx7qhtsejld7ygny8f76` (`fkAuthProcessPk`),
  CONSTRAINT `FK_6hug3dx7qhtsejld7ygny8f76` FOREIGN KEY (`fkAuthProcessPk`) REFERENCES `authprocess` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authprocessdtls`
--

LOCK TABLES `authprocessdtls` WRITE;
/*!40000 ALTER TABLE `authprocessdtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `authprocessdtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchmst`
--

DROP TABLE IF EXISTS `batchmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `balUdtTyp1Cr` varchar(255) DEFAULT NULL,
  `balUdtTyp1Dr` varchar(255) DEFAULT NULL,
  `balUdtTyp2Cr` varchar(255) DEFAULT NULL,
  `balUdtTyp2Dr` varchar(255) DEFAULT NULL,
  `balUdtTyp3Cr` varchar(255) DEFAULT NULL,
  `balUdtTyp3Dr` varchar(255) DEFAULT NULL,
  `balUdtTyp4Cr` varchar(255) DEFAULT NULL,
  `balUdtTyp4Dr` varchar(255) DEFAULT NULL,
  `batchCode` varchar(30) DEFAULT NULL,
  `batchName` varchar(50) DEFAULT NULL,
  `batchTypeCode` varchar(30) DEFAULT NULL,
  `bookType` varchar(255) DEFAULT NULL,
  `cancelUpToCr` varchar(255) DEFAULT NULL,
  `cancelUpToDr` varchar(255) DEFAULT NULL,
  `defDesc` varchar(255) DEFAULT NULL,
  `defFeffDays` int(11) DEFAULT NULL,
  `defOpenYN` bit(1) DEFAULT NULL,
  `defPostDays` int(11) DEFAULT NULL,
  `drCrVcPerm` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `maxCrAmt` double DEFAULT NULL,
  `maxDrAmt` double DEFAULT NULL,
  `onOffBatch` int(11) DEFAULT NULL,
  `opClDay1` int(11) DEFAULT NULL,
  `opClDay2` int(11) DEFAULT NULL,
  `opClDay3` int(11) DEFAULT NULL,
  `procStage1Cr` varchar(255) DEFAULT NULL,
  `procStage1Dr` varchar(255) DEFAULT NULL,
  `procStage2Cr` varchar(255) DEFAULT NULL,
  `procStage2Dr` varchar(255) DEFAULT NULL,
  `procStage3Cr` varchar(255) DEFAULT NULL,
  `procStage3Dr` varchar(255) DEFAULT NULL,
  `procStage4Cr` varchar(255) DEFAULT NULL,
  `procStage4Dr` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tallyType` varchar(255) DEFAULT NULL,
  `tellerBatchYN` bit(1) DEFAULT NULL,
  `vcEntryMgr` int(11) DEFAULT NULL,
  `fkBranchMstPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k1aw8h5j79n248sjp87sfg4ns` (`fkBranchMstPk`),
  CONSTRAINT `FK_k1aw8h5j79n248sjp87sfg4ns` FOREIGN KEY (`fkBranchMstPk`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchmst`
--

LOCK TABLES `batchmst` WRITE;
/*!40000 ALTER TABLE `batchmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_address`
--

DROP TABLE IF EXISTS `branch_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_address` (
  `BRANCH_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_l84sdx5071m7ja8iic2a3jg1m` (`BRANCH_ID`),
  CONSTRAINT `FK_l84sdx5071m7ja8iic2a3jg1m` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_address`
--

LOCK TABLES `branch_address` WRITE;
/*!40000 ALTER TABLE `branch_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_holiday`
--

DROP TABLE IF EXISTS `branch_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_holiday` (
  `branchId` bigint(20) NOT NULL,
  `holidayId` bigint(20) NOT NULL,
  KEY `FK_a6dbpbo41rn3621txq7rbwa8u` (`holidayId`),
  KEY `FK_j3588eok4mblvoxj6pxev2gmq` (`branchId`),
  CONSTRAINT `FK_a6dbpbo41rn3621txq7rbwa8u` FOREIGN KEY (`holidayId`) REFERENCES `holidaymst` (`id`),
  CONSTRAINT `FK_j3588eok4mblvoxj6pxev2gmq` FOREIGN KEY (`branchId`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_holiday`
--

LOCK TABLES `branch_holiday` WRITE;
/*!40000 ALTER TABLE `branch_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_module`
--

DROP TABLE IF EXISTS `branch_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_module` (
  `branchId` bigint(20) NOT NULL,
  `moduleId` bigint(20) NOT NULL,
  KEY `FK_hauxb0h8otkhb8n7k7wx4likr` (`moduleId`),
  KEY `FK_aom7ut4q19j24hnvvdcpg9m9m` (`branchId`),
  CONSTRAINT `FK_aom7ut4q19j24hnvvdcpg9m9m` FOREIGN KEY (`branchId`) REFERENCES `branchmst` (`id`),
  CONSTRAINT `FK_hauxb0h8otkhb8n7k7wx4likr` FOREIGN KEY (`moduleId`) REFERENCES `modulemst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_module`
--

LOCK TABLES `branch_module` WRITE;
/*!40000 ALTER TABLE `branch_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_product`
--

DROP TABLE IF EXISTS `branch_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_product` (
  `branchId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  KEY `FK_1s0bkfr2h6iuo88e3qkab705r` (`productId`),
  KEY `FK_ethg3gawbh6rnop6cm0t253e9` (`branchId`),
  CONSTRAINT `FK_1s0bkfr2h6iuo88e3qkab705r` FOREIGN KEY (`productId`) REFERENCES `productmst` (`id`),
  CONSTRAINT `FK_ethg3gawbh6rnop6cm0t253e9` FOREIGN KEY (`branchId`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_product`
--

LOCK TABLES `branch_product` WRITE;
/*!40000 ALTER TABLE `branch_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchmst`
--

DROP TABLE IF EXISTS `branchmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `authStatus` varchar(50) DEFAULT NULL,
  `baseCurrency` varchar(10) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `branchDayFromCode` varchar(20) DEFAULT NULL,
  `branchDayToCode` varchar(20) DEFAULT NULL,
  `branchFromTime` varchar(20) DEFAULT NULL,
  `branchName` varchar(100) DEFAULT NULL,
  `branchRefCode` varchar(30) DEFAULT NULL,
  `branchToTime` varchar(20) DEFAULT NULL,
  `branchTypeCode` varchar(30) DEFAULT NULL,
  `clusterNo` varchar(30) DEFAULT NULL,
  `contactPerson` varchar(100) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `districtCode` varchar(30) DEFAULT NULL,
  `emailId` varchar(200) DEFAULT NULL,
  `faxNumber` varchar(30) DEFAULT NULL,
  `finYearFromCode` varchar(20) DEFAULT NULL,
  `finYearToCode` varchar(20) DEFAULT NULL,
  `ipNo` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `municipalityCode` varchar(30) DEFAULT NULL,
  `nonWorkingHalfOffs` varchar(20) DEFAULT NULL,
  `parentBranchCode` varchar(20) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `stateCode` varchar(30) DEFAULT NULL,
  `tele1` varchar(30) DEFAULT NULL,
  `tele2` varchar(30) DEFAULT NULL,
  `villageCode` varchar(30) DEFAULT NULL,
  `weeklyHalfOff1Code` varchar(20) DEFAULT NULL,
  `weeklyHalfOff2Code` varchar(20) DEFAULT NULL,
  `weeklyOff1Code` varchar(20) DEFAULT NULL,
  `weeklyOff2Code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchmst`
--

LOCK TABLES `branchmst` WRITE;
/*!40000 ALTER TABLE `branchmst` DISABLE KEYS */;
INSERT INTO `branchmst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,'AUTHORIZED',NULL,'01',NULL,NULL,NULL,'Achanur',NULL,NULL,'HO',NULL,'RAMLAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'RAMLAL',NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,'AUTHORIZED',NULL,'02',NULL,NULL,NULL,'Adagal',NULL,NULL,'HO',NULL,'RAMLAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'RAMLAL',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branchmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrymst`
--

DROP TABLE IF EXISTS `countrymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrymst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `countryName` varchar(50) DEFAULT NULL,
  `countryType` varchar(20) DEFAULT NULL,
  `ecgcCoverYN` bit(1) DEFAULT NULL,
  `gracePrd` int(11) DEFAULT NULL,
  `gracePrdYN` bit(1) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isdCode` varchar(10) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `restrictedYN` bit(1) DEFAULT NULL,
  `zone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrymst`
--

LOCK TABLES `countrymst` WRITE;
/*!40000 ALTER TABLE `countrymst` DISABLE KEYS */;
INSERT INTO `countrymst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'IND','India','Open',NULL,10,NULL,'','91','Asia',NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'USA','America','Open',NULL,10,NULL,'','89','America',NULL,NULL);
/*!40000 ALTER TABLE `countrymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croptypeparam`
--

DROP TABLE IF EXISTS `croptypeparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croptypeparam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `ammount` double DEFAULT NULL,
  `authStatus` varchar(50) DEFAULT NULL,
  `cropType` varchar(20) DEFAULT NULL,
  `currencyCode` varchar(20) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mohi8r2sv61skaqo0l47trn73` (`tenantId`,`cropType`,`fromDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croptypeparam`
--

LOCK TABLES `croptypeparam` WRITE;
/*!40000 ALTER TABLE `croptypeparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `croptypeparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencymst`
--

DROP TABLE IF EXISTS `currencymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencymst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `currencyISOCode` varchar(10) DEFAULT NULL,
  `currencyName` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `majorUnit` varchar(20) DEFAULT NULL,
  `minorUnit` varchar(20) DEFAULT NULL,
  `minorUnitDecimals` int(11) DEFAULT NULL,
  `unitConversion` double DEFAULT NULL,
  `countryMst_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2ur6ek1s5rww5ggl6t1ur4cqb` (`countryMst_id`),
  CONSTRAINT `FK_2ur6ek1s5rww5ggl6t1ur4cqb` FOREIGN KEY (`countryMst_id`) REFERENCES `countrymst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencymst`
--

LOCK TABLES `currencymst` WRITE;
/*!40000 ALTER TABLE `currencymst` DISABLE KEYS */;
INSERT INTO `currencymst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'INR','Indian Rupee','',NULL,NULL,0,0,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'USD','US Dollar','',NULL,NULL,0,0,2);
/*!40000 ALTER TABLE `currencymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_rm02tgnfwfhx59hv38v4ubjec` (`CUSTOMER_ID`),
  CONSTRAINT `FK_rm02tgnfwfhx59hv38v4ubjec` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customermst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_asset_address`
--

DROP TABLE IF EXISTS `customer_asset_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_asset_address` (
  `ASSET_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_rp75ln99p1dusuh5ye0gtdmc8` (`ASSET_ID`),
  CONSTRAINT `FK_rp75ln99p1dusuh5ye0gtdmc8` FOREIGN KEY (`ASSET_ID`) REFERENCES `customerasset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_asset_address`
--

LOCK TABLES `customer_asset_address` WRITE;
/*!40000 ALTER TABLE `customer_asset_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_asset_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerasset`
--

DROP TABLE IF EXISTS `customerasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerasset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `approxMonetaryValue` double DEFAULT NULL,
  `areaRate` double DEFAULT NULL,
  `areaSize` double DEFAULT NULL,
  `osAmount` double DEFAULT NULL,
  `osLoanYN` bit(1) DEFAULT NULL,
  `plotNumber` varchar(30) DEFAULT NULL,
  `regNumber` varchar(30) DEFAULT NULL,
  `remarks1` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerasset`
--

LOCK TABLES `customerasset` WRITE;
/*!40000 ALTER TABLE `customerasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerbusinessdtls`
--

DROP TABLE IF EXISTS `customerbusinessdtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerbusinessdtls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `noOfStaff` int(11) DEFAULT NULL,
  `regCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerbusinessdtls`
--

LOCK TABLES `customerbusinessdtls` WRITE;
/*!40000 ALTER TABLE `customerbusinessdtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerbusinessdtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeremploymentdtls`
--

DROP TABLE IF EXISTS `customeremploymentdtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customeremploymentdtls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `DOR` varchar(20) DEFAULT NULL,
  `accountNumber` bigint(20) DEFAULT NULL,
  `accountType` varchar(20) DEFAULT NULL,
  `annualIncome` double DEFAULT NULL,
  `bankCode` varchar(20) DEFAULT NULL,
  `bankName` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `empNumber` varchar(20) DEFAULT NULL,
  `professionType` varchar(20) DEFAULT NULL,
  `yearsInService` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeremploymentdtls`
--

LOCK TABLES `customeremploymentdtls` WRITE;
/*!40000 ALTER TABLE `customeremploymentdtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `customeremploymentdtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerkycdocs`
--

DROP TABLE IF EXISTS `customerkycdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerkycdocs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `KYCType1` varchar(50) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `idNumber` varchar(30) DEFAULT NULL,
  `issuedBy` varchar(50) DEFAULT NULL,
  `issuedDate` date DEFAULT NULL,
  `proofType` varchar(30) DEFAULT NULL,
  `recievedDate` date DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerkycdocs`
--

LOCK TABLES `customerkycdocs` WRITE;
/*!40000 ALTER TABLE `customerkycdocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerkycdocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerkycfamily`
--

DROP TABLE IF EXISTS `customerkycfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerkycfamily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `familyMemberName` varchar(50) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `relationship1` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerkycfamily`
--

LOCK TABLES `customerkycfamily` WRITE;
/*!40000 ALTER TABLE `customerkycfamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerkycfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst`
--

DROP TABLE IF EXISTS `customermst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `AMLRating` varchar(40) DEFAULT NULL,
  `HNWCategory` varchar(30) DEFAULT NULL,
  `KYCType` varchar(30) DEFAULT NULL,
  `NPARating` varchar(30) DEFAULT NULL,
  `NPAReason` varchar(30) DEFAULT NULL,
  `PEPYN` bit(1) DEFAULT NULL,
  `TDSPercentage` varchar(30) DEFAULT NULL,
  `TDSReason` varchar(30) DEFAULT NULL,
  `TDSYN` bit(1) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `baseBranchCode` varchar(20) DEFAULT NULL,
  `baseTenantCode` varchar(30) DEFAULT NULL,
  `bloodGroup` varchar(30) DEFAULT NULL,
  `code` bigint(20) DEFAULT NULL,
  `custAdditionalInfo` varchar(50) DEFAULT NULL,
  `custMaritalStatus` varchar(255) DEFAULT NULL,
  `customerAmtCurrency` varchar(255) DEFAULT NULL,
  `customerAmtLimit` double DEFAULT NULL,
  `customerCaste` varchar(30) DEFAULT NULL,
  `customerCasteCategory` varchar(30) DEFAULT NULL,
  `customerCategory` varchar(30) DEFAULT NULL,
  `customerCode` varchar(30) NOT NULL,
  `emailId1` varchar(40) DEFAULT NULL,
  `emailId2` varchar(40) DEFAULT NULL,
  `faxNo` varchar(20) DEFAULT NULL,
  `mobile1` varchar(20) DEFAULT NULL,
  `mobile2` varchar(20) DEFAULT NULL,
  `officePhone1` varchar(20) DEFAULT NULL,
  `officePhone2` varchar(20) DEFAULT NULL,
  `residencePhone` varchar(20) DEFAULT NULL,
  `customerCreationBranch` varchar(30) DEFAULT NULL,
  `customerDOB` date DEFAULT NULL,
  `customerFName` varchar(100) DEFAULT NULL,
  `customerGender` varchar(255) DEFAULT NULL,
  `customerLName` varchar(50) DEFAULT NULL,
  `customerMName` varchar(50) DEFAULT NULL,
  `customerRegNo` varchar(20) DEFAULT NULL,
  `customerSalutation` varchar(10) DEFAULT NULL,
  `customerSince` date DEFAULT NULL,
  `customerTypeCode` varchar(30) DEFAULT NULL,
  `fatherSpouseName` varchar(30) DEFAULT NULL,
  `introducerNumber` varchar(30) DEFAULT NULL,
  `introducerYN` bit(1) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `issuedByCountry` varchar(30) DEFAULT NULL,
  `memberNumber` varchar(30) DEFAULT NULL,
  `memberType` varchar(30) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `noOfChildren` int(11) DEFAULT NULL,
  `numberOfDependants` int(11) DEFAULT NULL,
  `passportExpiryDate` date DEFAULT NULL,
  `passportIssuedDate` date DEFAULT NULL,
  `passportNumber` varchar(30) DEFAULT NULL,
  `photo` longblob,
  `qualifications` varchar(30) DEFAULT NULL,
  `relationshipOfficer` varchar(255) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `residenceType` varchar(30) DEFAULT NULL,
  `residentCountry` varchar(30) DEFAULT NULL,
  `residentYN` bit(1) DEFAULT NULL,
  `residentialStatus` varchar(30) DEFAULT NULL,
  `signature` longblob,
  `specialInstructions` varchar(30) DEFAULT NULL,
  `transactionFreeze` bit(1) DEFAULT NULL,
  `transactionFreezeReason` varchar(30) DEFAULT NULL,
  `visaIssuedDate` date DEFAULT NULL,
  `visaNumber` varchar(30) DEFAULT NULL,
  `visaType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ingkbvpoem04w0y80yanqd1n1` (`tenantId`,`customerCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst`
--

LOCK TABLES `customermst` WRITE;
/*!40000 ALTER TABLE `customermst` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst_customerasset`
--

DROP TABLE IF EXISTS `customermst_customerasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst_customerasset` (
  `CustomerMst_id` bigint(20) NOT NULL,
  `customerAssets_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_5r1w07l64fig7ek2w9vtu58cw` (`customerAssets_id`),
  KEY `FK_jh301hwlpps49btp8icfubacq` (`CustomerMst_id`),
  CONSTRAINT `FK_5r1w07l64fig7ek2w9vtu58cw` FOREIGN KEY (`customerAssets_id`) REFERENCES `customerasset` (`id`),
  CONSTRAINT `FK_jh301hwlpps49btp8icfubacq` FOREIGN KEY (`CustomerMst_id`) REFERENCES `customermst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst_customerasset`
--

LOCK TABLES `customermst_customerasset` WRITE;
/*!40000 ALTER TABLE `customermst_customerasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst_customerasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst_customerbusinessdtls`
--

DROP TABLE IF EXISTS `customermst_customerbusinessdtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst_customerbusinessdtls` (
  `CustomerMst_id` bigint(20) NOT NULL,
  `customerBusinessDtls_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_pgf2c82ptkuoyqa98bnxs9g91` (`customerBusinessDtls_id`),
  KEY `FK_ldsks1ylhenlnkknnjfqpk1f3` (`CustomerMst_id`),
  CONSTRAINT `FK_ldsks1ylhenlnkknnjfqpk1f3` FOREIGN KEY (`CustomerMst_id`) REFERENCES `customermst` (`id`),
  CONSTRAINT `FK_pgf2c82ptkuoyqa98bnxs9g91` FOREIGN KEY (`customerBusinessDtls_id`) REFERENCES `customerbusinessdtls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst_customerbusinessdtls`
--

LOCK TABLES `customermst_customerbusinessdtls` WRITE;
/*!40000 ALTER TABLE `customermst_customerbusinessdtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst_customerbusinessdtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst_customeremploymentdtls`
--

DROP TABLE IF EXISTS `customermst_customeremploymentdtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst_customeremploymentdtls` (
  `CustomerMst_id` bigint(20) NOT NULL,
  `customerEmploymentDtls_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_oxpwesjeju9undhc26ffi39br` (`customerEmploymentDtls_id`),
  KEY `FK_13anmy4wnj0vbjmrkpbhhulw3` (`CustomerMst_id`),
  CONSTRAINT `FK_13anmy4wnj0vbjmrkpbhhulw3` FOREIGN KEY (`CustomerMst_id`) REFERENCES `customermst` (`id`),
  CONSTRAINT `FK_oxpwesjeju9undhc26ffi39br` FOREIGN KEY (`customerEmploymentDtls_id`) REFERENCES `customeremploymentdtls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst_customeremploymentdtls`
--

LOCK TABLES `customermst_customeremploymentdtls` WRITE;
/*!40000 ALTER TABLE `customermst_customeremploymentdtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst_customeremploymentdtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst_customerkycdocs`
--

DROP TABLE IF EXISTS `customermst_customerkycdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst_customerkycdocs` (
  `CustomerMst_id` bigint(20) NOT NULL,
  `customerKYCDocs_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_os1i7vktqf91goksj0v18m6jj` (`customerKYCDocs_id`),
  KEY `FK_c4pvf9fpfn78ohvugyjxi1fqg` (`CustomerMst_id`),
  CONSTRAINT `FK_c4pvf9fpfn78ohvugyjxi1fqg` FOREIGN KEY (`CustomerMst_id`) REFERENCES `customermst` (`id`),
  CONSTRAINT `FK_os1i7vktqf91goksj0v18m6jj` FOREIGN KEY (`customerKYCDocs_id`) REFERENCES `customerkycdocs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst_customerkycdocs`
--

LOCK TABLES `customermst_customerkycdocs` WRITE;
/*!40000 ALTER TABLE `customermst_customerkycdocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst_customerkycdocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermst_customerkycfamily`
--

DROP TABLE IF EXISTS `customermst_customerkycfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermst_customerkycfamily` (
  `CustomerMst_id` bigint(20) NOT NULL,
  `customerKYCFamilies_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_9jw7rvb5lru6usbaikct3ve34` (`customerKYCFamilies_id`),
  KEY `FK_1x5vj1clsengkwb01k9sqc3j7` (`CustomerMst_id`),
  CONSTRAINT `FK_1x5vj1clsengkwb01k9sqc3j7` FOREIGN KEY (`CustomerMst_id`) REFERENCES `customermst` (`id`),
  CONSTRAINT `FK_9jw7rvb5lru6usbaikct3ve34` FOREIGN KEY (`customerKYCFamilies_id`) REFERENCES `customerkycfamily` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermst_customerkycfamily`
--

LOCK TABLES `customermst_customerkycfamily` WRITE;
/*!40000 ALTER TABLE `customermst_customerkycfamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `customermst_customerkycfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dedupconfig`
--

DROP TABLE IF EXISTS `dedupconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dedupconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `mandatoryYN` bit(1) DEFAULT NULL,
  `refDoc` varchar(20) DEFAULT NULL,
  `seqNumVal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_78xlroahsp2qt33t1oox1qq8p` (`tenantId`,`refDoc`,`seqNumVal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dedupconfig`
--

LOCK TABLES `dedupconfig` WRITE;
/*!40000 ALTER TABLE `dedupconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `dedupconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districtmst`
--

DROP TABLE IF EXISTS `districtmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districtmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `districtCode` varchar(20) DEFAULT NULL,
  `districtName` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `fkStateMstPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5ohr1kyomsa88emlvv4v7scqj` (`fkStateMstPk`),
  CONSTRAINT `FK_5ohr1kyomsa88emlvv4v7scqj` FOREIGN KEY (`fkStateMstPk`) REFERENCES `statemst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districtmst`
--

LOCK TABLES `districtmst` WRITE;
/*!40000 ALTER TABLE `districtmst` DISABLE KEYS */;
INSERT INTO `districtmst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'01','Ongolu','',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'02','Nellore','',1),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'03','Nagpur','',2),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'04','Mumbai','',2),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'05','Chandrapur','',2),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'06','Kattak','',3),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'07','Hyderabad','',1),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'08','Banglore','',5),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'09','Manglore','',5);
/*!40000 ALTER TABLE `districtmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfig`
--

DROP TABLE IF EXISTS `emailconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `emailConfigCode` varchar(20) DEFAULT NULL,
  `emailHost` varchar(1000) DEFAULT NULL,
  `fromPwd` varchar(1000) DEFAULT NULL,
  `fromUser` varchar(1000) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `smtpAuth` bit(1) DEFAULT NULL,
  `smtpEHLO` bit(1) DEFAULT NULL,
  `smtpPort` varchar(1000) DEFAULT NULL,
  `smtpStartTLSEnabled` bit(1) DEFAULT NULL,
  `transportProtocol` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dfd82futheu5h849rsmkclsrl` (`tenantId`,`emailConfigCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfig`
--

LOCK TABLES `emailconfig` WRITE;
/*!40000 ALTER TABLE `emailconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_address`
--

DROP TABLE IF EXISTS `employment_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment_address` (
  `EMPLOYMENT_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_tmlu8f53feo862tcojp0fhjxs` (`EMPLOYMENT_ID`),
  CONSTRAINT `FK_tmlu8f53feo862tcojp0fhjxs` FOREIGN KEY (`EMPLOYMENT_ID`) REFERENCES `customeremploymentdtls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_address`
--

LOCK TABLES `employment_address` WRITE;
/*!40000 ALTER TABLE `employment_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `employment_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialyear`
--

DROP TABLE IF EXISTS `financialyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financialyear` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `fyCode` varchar(30) DEFAULT NULL,
  `fyFrom` date DEFAULT NULL,
  `fyStatus` varchar(30) DEFAULT NULL,
  `fyTo` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3bw18tfcp7ar8u85obp0k2ppw` (`tenantId`,`fyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialyear`
--

LOCK TABLES `financialyear` WRITE;
/*!40000 ALTER TABLE `financialyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `financialyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glmst`
--

DROP TABLE IF EXISTS `glmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `currencyCode` varchar(10) DEFAULT NULL,
  `glCategory` varchar(30) DEFAULT NULL,
  `glCode` varchar(30) DEFAULT NULL,
  `glName` varchar(50) DEFAULT NULL,
  `glType` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `fyCode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8rfkdcbn6x0yug9ps3ofvqxof` (`tenantId`,`glCode`),
  UNIQUE KEY `UK_k1herkfc8aud4l11jsfsxvsrh` (`tenantId`,`glCode`,`fyCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glmst`
--

LOCK TABLES `glmst` WRITE;
/*!40000 ALTER TABLE `glmst` DISABLE KEYS */;
INSERT INTO `glmst` VALUES (1,'',NULL,'\0','',NULL,'','infraadmin','2015-02-24 19:45:17','001',1,'Authorized','INR1','EXTERNAL','GL001','GL NAME 001-2','SB','',NULL);
/*!40000 ALTER TABLE `glmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_unique_key`
--

DROP TABLE IF EXISTS `hibernate_unique_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_unique_key` (
  `next_hi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_unique_key`
--

LOCK TABLES `hibernate_unique_key` WRITE;
/*!40000 ALTER TABLE `hibernate_unique_key` DISABLE KEYS */;
INSERT INTO `hibernate_unique_key` VALUES (0);
/*!40000 ALTER TABLE `hibernate_unique_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidaybranchmap`
--

DROP TABLE IF EXISTS `holidaybranchmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaybranchmap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `holidayCode` varchar(20) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `setNo` bigint(20) DEFAULT NULL,
  `holidayDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jvubt4h55vm0rlbe5lq949542` (`tenantId`,`branchCode`,`holidayCode`),
  UNIQUE KEY `UK_d0jrh8bwfebx9xhxa24xgnv3f` (`tenantId`,`branchCode`,`holidayDate`,`holidayCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaybranchmap`
--

LOCK TABLES `holidaybranchmap` WRITE;
/*!40000 ALTER TABLE `holidaybranchmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaybranchmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidaymst`
--

DROP TABLE IF EXISTS `holidaymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaymst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `holidayCode` varchar(20) DEFAULT NULL,
  `holidayDate` datetime DEFAULT NULL,
  `holidayDesc` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rh77ipnh8bgcfmvq5lstsx2qu` (`tenantId`,`holidayCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaymst`
--

LOCK TABLES `holidaymst` WRITE;
/*!40000 ALTER TABLE `holidaymst` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidaymst_branchmst`
--

DROP TABLE IF EXISTS `holidaymst_branchmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidaymst_branchmst` (
  `HolidayMst_id` bigint(20) NOT NULL,
  `branches_id` bigint(20) NOT NULL,
  KEY `FK_pm5w3y81tsg0jtiwcta3l01q8` (`branches_id`),
  KEY `FK_cfu4mgkd7k121hof6s7a8dx75` (`HolidayMst_id`),
  CONSTRAINT `FK_cfu4mgkd7k121hof6s7a8dx75` FOREIGN KEY (`HolidayMst_id`) REFERENCES `holidaymst` (`id`),
  CONSTRAINT `FK_pm5w3y81tsg0jtiwcta3l01q8` FOREIGN KEY (`branches_id`) REFERENCES `branchmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaymst_branchmst`
--

LOCK TABLES `holidaymst_branchmst` WRITE;
/*!40000 ALTER TABLE `holidaymst_branchmst` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidaymst_branchmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languagemst`
--

DROP TABLE IF EXISTS `languagemst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languagemst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `languageCode` varchar(20) DEFAULT NULL,
  `languageName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9s2np0iace5d4q244w5nl5mvi` (`tenantId`,`languageCode`),
  UNIQUE KEY `UK_i6ig2nxmnhx77xros7yp1pcpj` (`languageCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languagemst`
--

LOCK TABLES `languagemst` WRITE;
/*!40000 ALTER TABLE `languagemst` DISABLE KEYS */;
INSERT INTO `languagemst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','English'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','hn','Hindi');
/*!40000 ALTER TABLE `languagemst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationmst`
--

DROP TABLE IF EXISTS `locationmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `locationCode` varchar(20) DEFAULT NULL,
  `locationName` varchar(50) DEFAULT NULL,
  `fkVillagePk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gtekn74i8utrskjt6mfjoca3v` (`fkVillagePk`),
  CONSTRAINT `FK_gtekn74i8utrskjt6mfjoca3v` FOREIGN KEY (`fkVillagePk`) REFERENCES `villagemst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationmst`
--

LOCK TABLES `locationmst` WRITE;
/*!40000 ALTER TABLE `locationmst` DISABLE KEYS */;
INSERT INTO `locationmst` VALUES (1,'','0000-00-00 00:00:00','\0','','0000-00-00 00:00:00','','','0000-00-00 00:00:00','001',0,'','LOC1','LOC NAME1',1);
/*!40000 ALTER TABLE `locationmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookupcode`
--

DROP TABLE IF EXISTS `lookupcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookupcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `lookupCode` varchar(30) DEFAULT NULL,
  `lookupCodeDesc` varchar(50) DEFAULT NULL,
  `lookupTypeCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookupcode`
--

LOCK TABLES `lookupcode` WRITE;
/*!40000 ALTER TABLE `lookupcode` DISABLE KEYS */;
INSERT INTO `lookupcode` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTTYPECODE','Customer type code','SYSTEM'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MARITALSTATUS','Marital status','USER'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CASTE','caste','USER'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CASTECATE','castecate','USER'),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','KYCTYPE','KYC Type','SYSTEM'),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ADDRESSTYPE','Address Type','USER'),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PROOFTYPE','Proof type','USER'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTCATE','Customer Category','SYSTEM'),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MEMBERTYPE','Member Type','USER'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','RESISTATUS','Resident Status','USER'),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PROFESSIONTYPE','Profession type','USER'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ACCOUNTTYPE','Account Type','USER'),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','VILLAGE','Village','USER'),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','TALUKA','Taluka','USER'),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','LOANTYPE','Loan type','USER'),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PAYFREQUENCY','Pay Frequency','USER'),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','SCRUTINYTYPE','Scrutiny Type','USER'),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CROPTYPE','Crop Type','USER'),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','FARMERTYPE','Farmer Type','USER'),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','FARMERCATEGORY','Farmer Category','USER'),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CASTETYPE','CasteType','USER'),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','NAMETYPE','Name Type ','USER'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','FREEZETYPE','Freeze Type','SYSTEM'),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','REASONS','Reasons','USER'),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','NAMETITLE','Name Title','USER'),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','RELATIONSHIP','Relationship','USER'),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MINORTYPE','Minor Type','USER'),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MODEOFOPERATION','Mode of Operation','SYSTEM'),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ACCOUNTNAME','Account Name','USER'),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ADDRESSTYPE','Address Type','USER'),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DAYS','Days','SYSTEM'),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MONTHS','Months','SYSTEM'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DISTRICTCATEGORY','District Category','USER'),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','VILLAGECATEGORY','Village Category','USER'),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PACSGRADE','PACS Grade','USER'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','BRANCHTYPE','Branch type','USER'),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTINT','Customer Internal','SYSTEM'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','FINNONFIN','Financial non financial','SYSTEM'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','BATCHSTATUS','Batch status','SYSTEM'),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','GENDER','Gender','USER'),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MODULETYPE','ModuleType','SYSTEM'),(42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','VCRTYPE','Voucher type','SYSTEM'),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ROLE','Role','USER'),(44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','USERCATEGORY','User category','SYSTEM'),(45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','BATCHTYPE','Batch type','SYSTEM'),(46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ASSETLIABILITY','Asset liability','SYSTEM'),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','EMAILCONFIGCODE','Email ConfigCode','USER'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','USERTYPE','User Type ','USER'),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','INTERESTPAY','Interest Pay','USER'),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ROUNDOFFOPTION','Roundoff Option','USER'),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','INTERESTCALCBALTYPE','Interest Calc Bal Type','USER'),(52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','INTERESTAPPFREQ','Interest App Freq','USER'),(53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DISCOUNTEDINTRATE','Discounted Int Rate','USER'),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PRODCALCTYPE','Prod Calc Type','USER'),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','INTERESTCHARGTYPE','Interest Charg Type','USER'),(56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','VCRENTRYLEVEL','Vcr Entry Level','USER'),(57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','ACCTOPENLEVEL','Acct Open Level','USER'),(58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','TYPEOFDEPOSIT','Type Of Deposit','USER'),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','RECONTYPE','Recon Type','USER'),(60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','PRODSTATUS','Prod Status','USER'),(61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','SEPR','Separator','USER'),(62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','VISATYPE','Visa Type','USER'),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTOMERSALUTATION','Customer Salutation','USER'),(64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DECIMALFORMAT','Decimal Format','SYSTEM'),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DIGITFORMAT','Digit Format','SYSTEM'),(66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DATEFORMAT','Date Format','SYSTEM'),(67,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','NUMBERFORMAT','Number Format','SYSTEM'),(68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','AMOUNTFORMAT','Amount Format ','SYSTEM'),(69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTIDLENTYPE','CustomerIdLenTypeCode','SYSTEM'),(70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','CUSTOMERID','Customer Id','SYSTEM'),(71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','HOLIDAYPERIOD','Holiday Period','USER'),(72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','MEMBERTYPE_ACCT','Member Type','USER'),(73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','DRAWINGPOWER','Drawing Power','USER'),(80,'','2015-01-01 00:00:00','\0','','2015-01-01 00:00:00','','','2015-01-01 00:00:00','001',0,'','ACCOUNTSTATUS','ACCOUNTSTATUS','SYSTEM');
/*!40000 ALTER TABLE `lookupcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookupcode_lookupvalue`
--

DROP TABLE IF EXISTS `lookupcode_lookupvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookupcode_lookupvalue` (
  `LookupCode_id` bigint(20) NOT NULL,
  `lookupValues_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_q1mdv8sfjav7mq6s2ecvpo9aw` (`lookupValues_id`),
  KEY `FK_8up5owmtbtb139d19y1jbqdjn` (`LookupCode_id`),
  CONSTRAINT `FK_8up5owmtbtb139d19y1jbqdjn` FOREIGN KEY (`LookupCode_id`) REFERENCES `lookupcode` (`id`),
  CONSTRAINT `FK_q1mdv8sfjav7mq6s2ecvpo9aw` FOREIGN KEY (`lookupValues_id`) REFERENCES `lookupvalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookupcode_lookupvalue`
--

LOCK TABLES `lookupcode_lookupvalue` WRITE;
/*!40000 ALTER TABLE `lookupcode_lookupvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `lookupcode_lookupvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookupvalue`
--

DROP TABLE IF EXISTS `lookupvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookupvalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `languageCode` varchar(10) DEFAULT NULL,
  `lookUpCode` varchar(30) DEFAULT NULL,
  `lookupDisplayValue` varchar(100) DEFAULT NULL,
  `lookupValueCode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookupvalue`
--

LOCK TABLES `lookupvalue` WRITE;
/*!40000 ALTER TABLE `lookupvalue` DISABLE KEYS */;
INSERT INTO `lookupvalue` VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTTYPECODE','External Customer','EXTERNAL'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MARITALSTATUS','Single','SINGLE'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MARITALSTATUS','Married','MARRIED'),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MARITALSTATUS','Widowed','WIDOWED'),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MARITALSTATUS','Divorced','DIVORCED'),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MARITALSTATUS','Separated','SEPARATED'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','KYCTYPE','EKYC','EKYC'),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','KYCTYPE','General','GENERAL'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ADDRESSTYPE','Present','PRESENT'),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ADDRESSTYPE','Correspondence Address','PERMANENT'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ADDRESSTYPE','Office Address','OFFICE'),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ADDRESSTYPE','Permanent Address','RESIDENCE'),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTE','Schedule Caste','SCHEDULE CASTE'),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTE','Upper Caste','UPPER CASTE'),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTE','Lower Caste','LOWER CASTE'),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROOFTYPE','Nationality Proof','NATIONALITYPROOF'),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROOFTYPE','Address Proof','ADDRESSPOOF'),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROOFTYPE','Photo Proof','PHOTOPROOF'),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTCATE','General','GENERAL'),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTCATE','Staff','STAFF'),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTCATE','Pensioner','PENSIONER'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTCATE','Trust Soceity','TRUSTSOCEITY'),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTCATE','Others','OTHER'),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MEMBERTYPE','Small Farmer','SMALLFARMER'),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MEMBERTYPE','Big Farmer','BIGFARMER'),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RESISTATUS','NRI','NRI'),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RESISTATUS','Foreigner','FOREIGNER'),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','LOANTYPE','KCC','KCC'),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','LOANTYPE','ST','ST'),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','LOANTYPE','MT','MT'),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','LOANTYPE','LT','LT'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Daily','DAILY'),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Weekly','WEEKLY'),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Fortnightly','FORTNIGHTLY'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Monthly','MONTHLY'),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Bimonthly','BIMONTHLY'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Quarterly','QUARTERLY'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Half yearly','HALFYEARLY'),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PAYFREQUENCY','Yearly','YEARLY'),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERCATEGORY','Small','SMALL'),(42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERCATEGORY','Big','BIG'),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERCATEGORY','Regularization','REGULARIZATION'),(44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERCATEGORY','Others','OTHERS'),(45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Aman Paddy (Local)                 ','AMANPADDY(LOCAL)'),(46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Aman Paddy (HYV)                   ','AMANPADDY(HYV)'),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Boro Paddy                         ','BOROPADDY'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Wheat                              ','WHEAT'),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Sugarcane                          ','SUGARCANE'),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Potato                             ','POTATO'),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Mustard                            ','MUSTARD'),(52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Til                                ','TIL'),(53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Rabi Vegetable (Hybrid)            ','RABIVEGETABLE(HYBRID)'),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Rabi Vegetable (Local)             ','RABIVEGETABLE(LOCAL)'),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Summer Vegetable                   ','SUMMERVEGETABLE'),(56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Onion                              ','ONION'),(57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Groundnut                          ','GROUNDNUT'),(58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Jute                               ','JUTE'),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Maize                              ','MAIZE'),(60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CROPTYPE','Pulses                             ','PULSES'),(61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','Small Farmer','SMALL FARMER                  '),(62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','Big Farmer','BIG FARMER                    '),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','Bhag chashi','BHAG CHASHI                   '),(64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','Minority','MINORITY                      '),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','s.c.','S.C.                          '),(66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FARMERTYPE','s.t.','S.T.                          '),(67,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Joint names','JOINTNAMES'),(68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','introducers name','INTRODUCERSNAME'),(69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Guardians names','GUARDIANSNAMES'),(70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Authorised signatories','AUTHORISEDSIGNATORIES'),(71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Proprietor name','PROPRIETORNAME'),(72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Proprietor-1','PROPRIETOR-1'),(73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Proprietor-2','PROPRIETOR-2'),(74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Instruction Or Information','INSTRUCTION/INFORMATION'),(75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Nominee name','NOMINEENAME-(ONLYCONV)'),(76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Partner','PARTNER'),(77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Address Proof','ADDRESSPROOF'),(78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETYPE','Director','DIRECTOR'),(79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FREEZETYPE','No freeze','NOFREEZE'),(80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FREEZETYPE','Debit freeze','DEBITFREEZE'),(81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FREEZETYPE','Credit freeze','CREDITFREEZE'),(82,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FREEZETYPE','Total freeze','TOTALFREEZE'),(83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FREEZETYPE','Internal A/C freeze','INTERNALA/CFREEZE'),(84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','A/C','A/C'),(85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Admiral','ADMIRAL'),(86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','CAPT','CAPT'),(87,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','CL','CL'),(88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','DR','DR'),(89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','General','GENERAL'),(90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Lieu tenant','LIEUTENANT'),(91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Major','MAJOR'),(92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Master','MASTER'),(93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','MD','MD'),(94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Messers','MESSERS'),(95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Miss','MISS'),(96,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Mr','MR'),(97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Mrs','MRS'),(98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Ms','MS'),(99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','SAYD','SAYD'),(100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','SMTI','SMTI'),(101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','Sri','SRI'),(102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NAMETITLE','The','THE'),(103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Daughter in law','DAUGHTER-IN-LAW'),(104,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Neice','NEICE'),(105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Father','FATHER'),(106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Mother','MOTHER'),(107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Husband','HUSBAND'),(108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Wife','WIFE'),(109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Brother','BROTHER'),(110,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Sister','SISTER'),(111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Nephew','NEPHEW'),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Daughter','DAUGHTER'),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Son','SON'),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Grand Daughter','GRANDDAUGHTER'),(115,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Grand Son','GRANDSON'),(116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Director','DIRECTOR'),(117,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Son of Director','SONOFDIRECTOR'),(118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Mother or Step Mother','MOTHER/STEPMOTHER'),(119,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Not related to any','NOTRELATEDTOANY'),(120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Cousin','COUSIN'),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Father in Law','FATHER-IN-LAW'),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Mother in law','MOTHER-IN-LAW'),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Self','SELF'),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Brother in Law','BROTHER-IN-LAW'),(125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Son in law','SON-IN-LAW'),(126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Grand Mother','GRANDMOTHER'),(127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RELATIONSHIP','Grand Father','GRANDFATHER'),(128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MINORTYPE','Legal Minor','LEGALMINOR'),(129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MINORTYPE','Natural Minor','NATURALMINOR'),(130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','Self','SELF'),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','joint','JOINT'),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Monday','MONDAY'),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Tuesday','TUESDAY'),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Wednesday','WEDNESDAY'),(135,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Thursday','THURSDAY'),(136,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Friday','FRIDAY'),(137,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Saturday','SATURDAY'),(138,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DAYS','Sunday','SUNDAY'),(139,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','January','JANUARY'),(140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','February','FEBRUARY'),(141,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','March','MARCH'),(142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','April','APRIL'),(143,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','May','MAY'),(144,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','June','JUNE'),(145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','July','JULY'),(146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','August','AUGUST'),(147,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','September','SEPTEMBER'),(148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','October','OCTOBER'),(149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','November','NOVEMBER'),(150,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MONTHS','December','DECEMBER'),(151,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DISTRICTCATEGORY','First Tier','FIRST TIER'),(152,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DISTRICTCATEGORY','Second Tier','SECOND TIER'),(153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DISTRICTCATEGORY','Third Tier','THIRD TIER'),(154,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VILLAGECATEGORY','First Tier','FIRST TIER'),(155,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VILLAGECATEGORY','Second Tier','SECOND TIER'),(156,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VILLAGECATEGORY','Third Tier','THIRD TIER'),(157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PACSGRADE','A(Stronger)','A (Strongest)'),(158,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PACSGRADE','B','B                     '),(159,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BRANCHTYPE','HO','HO'),(160,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BRANCHTYPE','RO','RO'),(161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BRANCHTYPE','BO','BO'),(162,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTINT','Customer','CUSTOMER'),(163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTINT','Internal','INTERNAL'),(164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Hindu','HINDU'),(165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Muslim','MUSLIM'),(166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Christan','CHRISTAN'),(167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Sikh','SIKH'),(168,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Maratha','MARATHA'),(169,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Lingayat','LINGAYAT'),(170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CASTECATE','Others','OTHERS'),(171,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FINNONFIN','Financial','FINANCIAL'),(172,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','FINNONFIN','Non Financial','NON-FINANCIAL'),(173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHSTATUS','Open','OPEN'),(174,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHSTATUS','Close','CLOSE'),(175,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHSTATUS','Pending','PENDING'),(176,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHSTATUS','Suspended','SUSPENDED'),(177,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','GENDER','Male','MALE'),(178,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','GENDER','Female','FEMALE'),(179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRTYPE','Journal','Journal'),(180,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRTYPE','Expense','Expense'),(181,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRTYPE','Contra','Contra'),(182,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHTYPE','Cash','CASH'),(183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHTYPE','Transfer','TRANSFER'),(184,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','BATCHTYPE','Clearing','CLEARING'),(185,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ASSETLIABILITY','Asset','ASSET'),(186,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ASSETLIABILITY','Liability','LIABILITY'),(187,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','USERTYPE','Internal User','INTERNAL'),(188,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','USERTYPE','External User','EXTERNAL'),(189,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','USERTYPE','Webuser','WEBUSER'),(190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTTYPECODE','Internal Customer_hn','INTERNAL'),(191,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTTYPECODE','External Customer_hn','EXTERNAL'),(192,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MARITALSTATUS','Single_hn','SINGLE'),(193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MARITALSTATUS','Married_hn','MARRIED'),(194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MARITALSTATUS','Widowed_hn','WIDOWED'),(195,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MARITALSTATUS','Divorced_hn','DIVORCED'),(196,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MARITALSTATUS','Separated_hn','SEPARATED'),(197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','KYCTYPE','EKYC_hn','EKYC'),(198,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','KYCTYPE','General_hn','GENERAL'),(199,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ADDRESSTYPE','Present_hn','PRESENT'),(200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ADDRESSTYPE','Correspondence Address_hn','PERMANENT'),(201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ADDRESSTYPE','Office Address_hn','OFFICE'),(202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ADDRESSTYPE','Permanent Address_hn','RESIDENCE'),(203,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTE','Schedule Caste_hn','SCHEDULE CASTE'),(204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTE','Upper Caste_hn','UPPER CASTE'),(205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTE','Lower Caste_hn','LOWER CASTE'),(206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROOFTYPE','Nationality Proof_hn','NATIONALITYPROOF'),(207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROOFTYPE','Address Proof_hn','ADDRESSPOOF'),(208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROOFTYPE','Photo Proof_hn','PHOTOPROOF'),(209,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTCATE','General_hn','GENERAL'),(210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTCATE','Staff_hn','STAFF'),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTCATE','Pensioner_hn','PENSIONER'),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTCATE','Trust Soceity_hn','TRUSTSOCEITY'),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTCATE','Others_hn','OTHER'),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MEMBERTYPE','Small Farmer_hn','SMALLFARMER'),(215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MEMBERTYPE','Big Farmer_hn','BIGFARMER'),(216,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RESISTATUS','NRI_hn','NRI'),(217,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RESISTATUS','Foreigner_hn','FOREIGNER'),(218,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','LOANTYPE','KCC_hn','KCC'),(219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','LOANTYPE','ST_hn','ST'),(220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','LOANTYPE','MT_hn','MT'),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','LOANTYPE','LT_hn','LT'),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Daily_hn','DAILY'),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Weekly_hn','WEEKLY'),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Fortnightly_hn','FORTNIGHTLY'),(225,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Monthly_hn','MONTHLY'),(226,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Bimonthly_hn','BIMONTHLY'),(227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Quarterly_hn','QUARTERLY'),(228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Half yearly_hn','HALFYEARLY'),(229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PAYFREQUENCY','Yearly_hn','YEARLY'),(230,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERCATEGORY','Small_hn','SMALL'),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERCATEGORY','Big_hn','BIG'),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERCATEGORY','Regularizations_hn','REGULARIZATIONS'),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERCATEGORY','Others_hn','OTHERS'),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Aman Paddy (Local)_hn                 ','AMANPADDY(LOCAL)'),(235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Aman Paddy (HYV)_hn                   ','AMANPADDY(HYV)'),(236,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Boro Paddy_hn                         ','BOROPADDY'),(237,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Wheat_hn                              ','WHEAT'),(238,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Sugarcane_hn                          ','SUGARCANE'),(239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Potato_hn                             ','POTATO'),(240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Mustard_hn                            ','MUSTARD'),(241,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Til_hn                                ','TIL'),(242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Rabi Vegetable (Hybrid)_hn            ','RABIVEGETABLES(HYBRID)'),(243,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Rabi Vegetable (Local)_hn             ','RABIVEGETABLES(LOCAL)'),(244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Onion_hn                              ','ONION'),(245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Groundnut_hn                          ','GROUNDNUT'),(246,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Jute_hn                               ','JUTE'),(247,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Maize_hn                              ','MAIZE'),(248,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CROPTYPE','Pulses_hn                             ','PULSES'),(249,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','Small Farmer_hn','SMALL FARMER                  '),(250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','Big Farmer_hn','BIG FARMER                    '),(251,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','Bhag chashi_hn','BHAG CHASHI                   '),(252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','Minority_hn','MINORITY                      '),(253,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','s.c._hn','S.C.                          '),(254,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FARMERTYPE','s.t._hn','S.T.                          '),(255,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Joint names_hn','JOINTNAMES'),(256,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Introducers name_hn','INTRODUCERSNAME'),(257,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Guardians names_hn','GUARDIANSNAMES'),(258,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Authorized signatures_hn','AUTHORIZEDSIGNATURIES'),(259,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Proprietor name_hn','PROPRIETORNAME'),(260,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Proprietor-1_hn','PROPRIETOR-1'),(261,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Proprietor-2_hn','PROPRIETOR-2'),(262,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Instruction Or Information_hn','INSTRUCTION/INFORMATION'),(263,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Nominee name_hn','NOMINEENAME-(ONLYCONV)'),(264,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Partner_hn','PARTNER'),(265,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Address Proof_hn','ADDRESSPROOF'),(266,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETYPE','Director_hn','DIRECTOR'),(267,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FREEZETYPE','No freeze_hn','NOFREEZE'),(268,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FREEZETYPE','Debit freeze_hn','DEBITFREEZE'),(269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FREEZETYPE','Credit freeze_hn','CREDITFREEZE'),(270,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FREEZETYPE','Total freeze_hn','TOTALFREEZE'),(271,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FREEZETYPE','Internal A/C freeze_hn','INTERNALA/CFREEZE'),(272,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','A/C_hn','A/C'),(273,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Admiral_hn','ADMIRAL'),(274,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','CAPT_hn','CAPT'),(275,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','CL_hn','CL'),(276,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','DR_hn','DR'),(277,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','General_hn','GENERAL'),(278,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Lieutenant_hn','LIEUTENANT'),(279,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Major_hn','MAJOR'),(280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Master_hn','MASTER'),(281,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','MD_hn','MD'),(282,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Messers_hn','MESSERS'),(283,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Miss_hn','MISS'),(284,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Mr_hn','MR'),(285,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Mrs_hn','MRS'),(286,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Ms_hn','MS'),(287,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','SAYD_hn','SAYD'),(288,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','SMTI_hn','SMTI'),(289,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','Sri_hn','SRI'),(290,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','NAMETITLE','The_hn','THE'),(291,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Daughter in law_hn','DAUGHTER-IN-LAW'),(292,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Neice_hn','NEICE'),(293,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Father_hn','FATHER'),(294,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Mother_hn','MOTHER'),(295,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Husband_hn','HUSBAND'),(296,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Wife_hn','WIFE'),(297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Brother_hn','BROTHER'),(298,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Sister_hn','SISTER'),(299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Nephew_hn','NEPHEW'),(300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Daughter_hn','DAUGHTER'),(301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Son_hn','SON'),(302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Grand Daughter_hn','GRANDDAUGHTER'),(303,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Grand Son_hn','GRANDSON'),(304,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Director_hn','DIRECTOR'),(305,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Son of Director_hn','SONOFDIRECTOR'),(306,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Mother or Step Mother_hn','MOTHER/STEPMOTHER'),(307,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Not related to any_hn','NOTRELATEDTOANY'),(308,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Cousin_hn','COUSIN'),(309,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Father in law_hn','FATHER-IN-LAW'),(310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Mother in law_hn','MOTHER-IN-LAW'),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Self_hn','SELF'),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Brother in Law_hn','BROTHER-IN-LAW'),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Son in law_hn','SONINLAW'),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Grand Mother_hn','GRANDMOTHER'),(315,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RELATIONSHIP','Grand Father_hn','GRANDFATHER'),(316,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MINORTYPE','Legal Minor_hn','LEGALMINOR'),(317,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MINORTYPE','Natural Minor_hn','NATURALMINOR'),(318,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','Self_hn','SELF'),(319,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','joint_hn','JOINT'),(320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Monday_hn','MONDAY'),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Tuesday_hn','TUESDAY'),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Wednesday_hn','WEDNESDAY'),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Thursday_hn','THURSDAY'),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Friday_hn','FRIDAY'),(325,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Saturday_hn','SATURDAY'),(326,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DAYS','Sunday_hn','SUNDAY'),(327,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','January_hn','JANUARY'),(328,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','February_hn','FEBRUARY'),(329,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','March_hn','MARCH'),(330,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','April_hn','APRIL'),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','May_hn','MAY'),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','June_hn','JUNE'),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','July_hn','JULY'),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','August_hn','AUGUST'),(335,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','September_hn','SEPTEMBER'),(336,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','October_hn','OCTOBER'),(337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','November_hn','NOVEMBER'),(338,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MONTHS','December_hn','DECEMBER'),(339,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DISTRICTCATEGORY','First Tier_hn','FIRST TIER'),(340,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DISTRICTCATEGORY','Second Tier_hn','SECOND TIER'),(341,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DISTRICTCATEGORY','Third Tier_hn','THIRD TIER'),(342,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VILLAGECATEGORY','First Tier_hn','FIRST TIER'),(343,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VILLAGECATEGORY','Second Tier_hn','SECOND TIER'),(344,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VILLAGECATEGORY','Third Tier_hn','THIRD TIER'),(345,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PACSGRADE','A(Stronger)_hn','A (Strongest)'),(346,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PACSGRADE','B_hn','B                     '),(347,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BRANCHTYPE','HO_hn','HO'),(348,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BRANCHTYPE','RO_hn','RO'),(349,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BRANCHTYPE','BO_hn','BO'),(350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTINT','Customer_hn','CUSTOMER'),(351,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTINT','Internal_hn','INTERNAL'),(352,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Hindu_hn','HINDU'),(353,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Muslim_hn','MUSLIM'),(354,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Christan_hn','CHRISTAN'),(355,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Sikh_hn','SIKH'),(356,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Maratha_hn','MARATHA'),(357,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Lingayat_hn','LINGAYAT'),(358,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CASTECATE','Others_hn','OTHERS'),(359,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FINNONFIN','Financial_hn','FINANCIAL'),(360,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','FINNONFIN','Non Financial_hn','NON-FINANCIAL'),(361,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHSTATUS','Open_hn','OPEN'),(362,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHSTATUS','Close_hn','CLOSE'),(363,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHSTATUS','Pending_hn','PENDING'),(364,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHSTATUS','Suspended_hn','SUSPENDED'),(365,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','GENDER','Male_hn','MALE'),(366,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','GENDER','Female_hn','FEMALE'),(367,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRTYPE','Journal_hn','Journal'),(368,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRTYPE','Expense_hn','Expense'),(369,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRTYPE','Contra_hn','Contra'),(370,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHTYPE','Cash_hn','CASH'),(371,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHTYPE','Transfer_hn','TRANSFER'),(372,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','BATCHTYPE','Clearing_hn','CLEARING'),(373,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ASSETLIABILITY','Asset_hn','ASSET'),(374,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ASSETLIABILITY','Liability_hn','LIABILITY'),(375,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','USERTYPE','Internal User_hn','INTERNAL'),(376,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','USERTYPE','External User_hn','EXTERNAL'),(377,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','USERTYPE','Webuser_hn','WEBUSER'),(378,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','EMAILCONFIGCODE','New User','NEWUSER'),(379,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','EMAILCONFIGCODE','Reset Password','RESETPASSWORD'),(380,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTPAY','pay','PAY'),(381,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTPAY','receive','RECEIVE'),(382,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTPAY','pay_hn','PAY'),(383,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTPAY','receive_hn','RECEIVE'),(384,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 0.01','NEAREST0.01'),(385,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 0.05','NEAREST0.05'),(386,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 0.10','NEAREST0.10'),(387,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 0.25','NEAREST0.25'),(388,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 0.50','NEAREST0.50'),(389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 1.00','NEAREST1.00'),(390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 5.00','NEAREST5.00'),(391,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest H','NEARESTH'),(392,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 25.00','NEAREST25.00'),(393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 50.00','NEAREST50.00'),(394,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','Nearest 100.00','NEAREST100.00'),(395,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','LOWER 10 RUPEES','LOWER10RUPEES'),(396,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','HIGHER 5 PAISE','HIGHER5PAISE'),(397,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','HIGHER 50 PAISE','HIGHER50PAISE'),(398,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','HIGHER 1 RUPEE','HIGHER1RUPEE'),(399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','HIGHER 2 RUPEES','HIGHER2RUPEES'),(400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','HIGHER 10 RUPEES','HIGHER10RUPEES'),(401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ROUNDOFFOPTION','NO ROUNDING','NOROUNDING'),(402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 0.01_hn','NEAREST0.01'),(403,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 0.05_hn','NEAREST0.05'),(404,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 0.10_hn','NEAREST0.10'),(405,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 0.25_hn','NEAREST0.25'),(406,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 0.50_hn','NEAREST0.50'),(407,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 1.00_hn','NEAREST1.00'),(408,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 5.00_hn','NEAREST5.00'),(409,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest H_hn','NEARESTH'),(410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 25.00_hn','NEAREST25.00'),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 50.00_hn','NEAREST50.00'),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','Nearest 100.00_hn','NEAREST100.00'),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','LOWER 10 RUPEES_hn','LOWER10RUPEES'),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','HIGHER 5 PAISE_hn','HIGHER5PAISE'),(415,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','HIGHER 50 PAISE_hn','HIGHER50PAISE'),(416,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','HIGHER 1 RUPEE_hn','HIGHER1RUPEE'),(417,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','HIGHER 2 RUPEES_hn','HIGHER2RUPEES'),(418,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','HIGHER 10 RUPEES_hn','HIGHER10RUPEES'),(419,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ROUNDOFFOPTION','NO ROUNDING_hn','NOROUNDING'),(420,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCALCBALTYPE','CLEAR BALANCE','CLEARBALANCE'),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCALCBALTYPE','TOTAL BALANCE ','TOTALBALANCE'),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCALCBALTYPE','VALUE BALANCE','VALUEBALANCE'),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCALCBALTYPE','CLEAR BALANCE_hn','CLEARBALANCE'),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCALCBALTYPE','TOTAL BALANCE_hn','TOTALBALANCE'),(425,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCALCBALTYPE','VALUE BALANCE_hn','VALUEBALANCE'),(426,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','HALFYEARLY','HALFYEARLY'),(427,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','MONTHLY','MONTHLY'),(428,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','QUATERLY','QUATERLY'),(429,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','USER DEFINED FREQUENCY','USERDEFINEDFREQUENCY'),(430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','WEEKLY','WEEKLY'),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTAPPFREQ','YEARLY','YEARLY'),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','HALFYEARLY_hn','HALFYEARLY'),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','MONTHLY_hn','MONTHLY'),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','QUATERLY_hn','QUATERLY'),(435,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','USER DEFINED FREQUENCY_hn','USERDEFINEDFREQUENCY'),(436,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','WEEKLY_hn','WEEKLY'),(437,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTAPPFREQ','YEARLY_hn','YEARLY'),(438,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DISCOUNTEDINTRATE','No','NO'),(439,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DISCOUNTEDINTRATE','Yes','YES'),(440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DISCOUNTEDINTRATE','No_hn','NO'),(441,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DISCOUNTEDINTRATE','Yes_hn','YES'),(442,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODCALCTYPE','DAILY PRODUCT SLAB WISE','DAILYPRDSLABWISE'),(443,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODCALCTYPE','DAILY PRODUCT BALANCE-FLAT','DAILYPRDBALANCE-FLAT'),(444,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODCALCTYPE','MINIMUM MONTHLY BALANCE','MINMONTHLYBALANCE'),(445,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODCALCTYPE','KISSAN CREDIT CARD INDIVIDUAL','KISSAN CC INDIVIDUAL'),(446,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODCALCTYPE','KISSAN CREDIT CARD ','KISSAN CC'),(447,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODCALCTYPE','DAILY PRODUCT SLAB WISE_hn','DAILYPRDSLABWISE'),(448,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODCALCTYPE','DAILYPRODUCTBALANCE-FLAT_hn','DAILYPRDBALANCE-FLAT'),(449,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODCALCTYPE','MINIMUM MONTHLY BALANCE_hn','MINMONTHLYBALANCE'),(450,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODCALCTYPE','KISSAN CREDIT CARD INDIVIDUAL_hn','KISSAN CC INDIVIDUAL'),(451,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODCALCTYPE','KISSAN CREDIT CARD_hn ','KISSAN CC'),(452,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCHARGTYPE','CLEAR BALANCE','CLEARBALANCE'),(453,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCHARGTYPE','TOTAL BALANCE ','TOTALBALANCE'),(454,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','INTERESTCHARGTYPE','VALUE BALANCE','VALUEBALANCE'),(455,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCHARGTYPE','CLEAR BALANCE_hn','CLEARBALANCE'),(456,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCHARGTYPE','TOTAL BALANCE_hn','TOTALBALANCE'),(457,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','INTERESTCHARGTYPE','VALUE BALANCE_hn','VALUEBALANCE'),(458,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRENTRYLEVEL','ACCOUNT','ACCOUNT'),(459,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRENTRYLEVEL','PRODUCT','PRODUCT'),(460,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRENTRYLEVEL','SUB ACCOUNT','SUBACCOUNT'),(461,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VCRENTRYLEVEL','SUB SUB ACCOUNT','SUBSUBACCOUNT'),(462,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRENTRYLEVEL','ACCOUNT_hn','ACCOUNT'),(463,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRENTRYLEVEL','PRODUCT_hn','PRODUCT'),(464,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRENTRYLEVEL','SUB ACCOUNT_hn','SUBACCOUNT'),(465,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VCRENTRYLEVEL','SUB SUB ACCOUNT_hn','SUBSUBACCOUNT'),(466,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCTOPENLEVEL','ACCOUNT','ACCOUNT'),(467,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCTOPENLEVEL','PRODUCT','PRODUCT'),(468,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCTOPENLEVEL','SUB ACCOUNT','SUBACCOUNT'),(469,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCTOPENLEVEL','SUB SUB ACCOUNT','SUBSUBACCOUNT'),(470,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCTOPENLEVEL','ACCOUNT_hn','ACCOUNT'),(471,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCTOPENLEVEL','PRODUCT_hn','PRODUCT'),(472,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCTOPENLEVEL','SUB ACCOUNT_hn','SUBACCOUNT'),(473,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCTOPENLEVEL','SUB SUB ACCOUNT_hn','SUBSUBACCOUNT'),(474,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODULETYPE','SAVINGS ACCOUNT','SAVINGSACCOUNT'),(475,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODULETYPE','CURRENT DEPOSITS','CURRENTDEPOSITS'),(476,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODULETYPE','CASH CREDIT','CASHCREDIT'),(477,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODULETYPE','OVER DRAFT','OVERDRAFT'),(478,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODULETYPE','SAFE CUSTODY','SAFECUSTODY'),(479,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODULETYPE','SAVINGS ACCOUNT_hn','SAVINGSACCOUNT'),(480,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODULETYPE','CURRENT DEPOSITS_hn','CURRENTDEPOSITS'),(481,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODULETYPE','CASH CREDIT_hn','CASHCREDIT'),(482,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODULETYPE','OVER DRAFT_hn','OVERDRAFT'),(483,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODULETYPE','SAFE CUSTODY_hn','SAFECUSTODY'),(484,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','TYPEOFDEPOSIT','LOCAL DEPOSIT','LOCALDEPOSIT'),(485,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','TYPEOFDEPOSIT','NRO DEPOSIT','NRODEPOSIT'),(486,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','TYPEOFDEPOSIT','LOCAL DEPOSIT_hn','LOCALDEPOSIT'),(487,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','TYPEOFDEPOSIT','NRO DEPOSIT_hn','NRODEPOSIT'),(488,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RECONTYPE','BOTH','BOTH'),(489,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RECONTYPE','CREDIT','CREDIT'),(490,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RECONTYPE','DEBIT','DEBIT'),(491,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','RECONTYPE','NONE','NONE'),(492,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RECONTYPE','BOTH_hn','BOTH'),(493,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RECONTYPE','CREDIT_hn','CREDIT'),(494,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RECONTYPE','DEBIT_hn','DEBIT'),(495,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','RECONTYPE','NONE_hn','NONE'),(496,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODSTATUS','NORMAL/OPERATIVE','NORMAL/OPERATIVE'),(497,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODSTATUS','NEW','NEW'),(498,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODSTATUS','CLOSED','CLOSED'),(499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODSTATUS','NON OPERATIVE','NONOPERATIVE'),(500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PRODSTATUS','DORMANT','DORMANT'),(501,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODSTATUS','NORMAL/OPERATIVE_hn','NORMAL/OPERATIVE'),(502,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODSTATUS','NEW_hn','NEW'),(503,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODSTATUS','CLOSED_hn','CLOSED'),(504,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODSTATUS','NON OPERATIVE_hn','NONOPERATIVE'),(505,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PRODSTATUS','DORMANT_hn','DORMANT'),(506,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SEPR','BLANK','BLANK()'),(507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SEPR','SLASH','SLASH(/)'),(508,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SEPR','HIPHEN','HIPHEN(-)'),(509,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SEPR','DOT','DOT(.)'),(510,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SEPR','BLANK_hn','BLANK()'),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SEPR','SLASH_hn','SLASH(/)'),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SEPR','HIPHEN_hn','HIPHEN(-)'),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SEPR','DOT_hn','DOT(.)'),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VISATYPE','WORKING VISA','WORKINGVISA'),(515,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','VISATYPE','BUSINESS VISA','BUSINESSVISA'),(516,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VISATYPE','WORKING VISA_hn','WORKINGVISA'),(517,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','VISATYPE','BUSINESS VISA_hn','BUSINESSVISA'),(518,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SALUTATION','Mr.','Mr.'),(519,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SALUTATION','Ms.','Ms.'),(520,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SALUTATION','Mrs.','Mrs.'),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','SALUTATION','Dr','Dr'),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SALUTATION','Mr._hn','Mr.'),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SALUTATION','Ms._hn','Ms.'),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SALUTATION','Mrs._hn','Mrs.'),(525,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','SALUTATION','Dr_hn','Dr'),(526,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROFESSIONTYPE','SERVICE','SERVICE'),(527,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROFESSIONTYPE','SELF EMPLOYED','SELFEMPLOYED'),(528,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','PROFESSIONTYPE','BUSINESS','BUSINESS'),(529,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROFESSIONTYPE','SERVICE_hn','SERVICE'),(530,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROFESSIONTYPE','SELF EMPLOYED_hn','SELFEMPLOYED'),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','PROFESSIONTYPE','BUSINESS_hn','BUSINESS'),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','CURRENT ACCOUNT','CURRENTACCOUNT'),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','SAVINGS ACCOUNT','SAVINGSACCOUNT'),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','CURRENT ACCOUNT_hn','CURRENTACCOUNT'),(535,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','SAVINGS ACCOUNT_hn','SAVINGSACCOUNT'),(536,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DECIMALFORMAT','DOT(.)','DOT(.)'),(537,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DECIMALFORMAT','COMMA(,)','COMMA(,)'),(538,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DIGITFORMAT','DOT(.)','DOT(.)'),(539,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DIGITFORMAT','COMMA(,)','COMMA(,)'),(540,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DATEFORMAT','dd-mm-yyyy','dd-mm-yyyy'),(541,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DATEFORMAT','mm-dd-yyyy','mm-dd-yyyy'),(542,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DATEFORMAT','yyyy-mm-dd','yyyy-mm-dd'),(543,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DATEFORMAT','yyyy-dd-mm','yyyy-dd-mm'),(544,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NUMBERFORMAT','000s','000s'),(545,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','NUMBERFORMAT','00s','00s'),(546,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','AMOUNTFORMAT','$000s','$000s'),(547,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','AMOUNTFORMAT','$00s','$00s'),(548,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','AMOUNTFORMAT','000s$','000s$'),(549,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','AMOUNTFORMAT','00s$','00s$'),(550,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTIDLENTYPE','FIXED','FIXED'),(551,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTIDLENTYPE','VARIABLE','VARIABLE'),(552,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTIDLENTYPE','FIXED_hn','FIXED'),(553,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTIDLENTYPE','VARIABLE_hn','VARIABLE'),(554,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTOMERID','AUTO','AUTO'),(555,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','CUSTOMERID','MANUAL','MANUAL'),(556,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTOMERID','AUTO_hn','AUTO'),(557,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','CUSTOMERID','MANUAL_hn','MANUAL'),(558,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','HOLIDAYPERIOD','HP1','HP1'),(559,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','HOLIDAYPERIOD','HP2','HP2'),(560,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','HOLIDAYPERIOD','HP1_hn','HP1'),(561,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','HOLIDAYPERIOD','HP2_hn','HP2'),(562,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','A/C_en','A/C'),(563,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Admiral_en','ADMIRAL'),(564,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','CAPT_en','CAPT'),(565,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','CL_en','CL'),(566,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','DR_en','DR'),(567,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','General_en','GENERAL'),(568,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Lieu tenant_en','LIEUTENANT'),(569,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Major_en','MAJOR'),(570,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Master_en','MASTER'),(571,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','MD_en','MD'),(572,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Messers_en','MESSERS'),(573,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Miss_en','MISS'),(574,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Mr_en','MR'),(575,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Mrs_en','MRS'),(576,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Ms_en','MS'),(577,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','SAYD_en','SAYD'),(578,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','SMTI_en','SMTI'),(579,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','Sri_en','SRI'),(580,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTNAME','The_en','THE'),(581,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','A/C_hn','A/C'),(582,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Admiral_hn','ADMIRAL'),(583,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','CAPT_hn','CAPT'),(584,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','CL_hn','CL'),(585,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','DR_hn','DR'),(586,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','General_hn','GENERAL'),(587,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Lieu tenant_hn','LIEUTENANT'),(588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Major_hn','MAJOR'),(589,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Master_hn','MASTER'),(590,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','MD_hn','MD'),(591,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Messers_hn','MESSERS'),(592,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Miss_hn','MISS'),(593,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Mr_hn','MR'),(594,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Mrs_hn','MRS'),(595,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Ms_hn','MS'),(596,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','SAYD_hn','SAYD'),(597,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','SMTI_hn','SMTI'),(598,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','Sri_hn','SRI'),(599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTNAME','The_hn','THE'),(600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','NORMALACCOUNT','NORMALACCOUNT'),(601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','STAFFACCOUNT','STAFFACCOUNT'),(602,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','PROPRAITORY FIRM/TRADING A/C ','PROPRAITORY FIRM/TRADING A/C '),(603,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','PENSION ','PENSION '),(604,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','CO-OP SOCIETY ','CO-OP SOCIETY '),(605,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','N.R.E. ACCOUNT ','N.R.E. ACCOUNT '),(606,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','N.R.O. ACCOUNT ','N.R.O. ACCOUNT '),(607,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','SPECIAL','SPECIAL'),(608,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','MINOR ACCOUNT ','MINOR ACCOUNT '),(609,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','INSTITUTIONAL','INSTITUTIONAL'),(610,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','ACCOUNTTYPE','OTHER INSTITUTIONAL A/C ','OTHER INSTITUTIONAL A/C '),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','NORMALACCOUNT_hn','NORMALACCOUNT'),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','STAFFACCOUNT_hn','STAFFACCOUNT'),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','PROPRAITORY FIRM/TRADING A/C_hn','PROPRAITORY FIRM/TRADING A/C '),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','PENSION_hn','PENSION '),(615,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','CO-OP SOCIETY_hn ','CO-OP SOCIETY '),(616,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','N.R.E. ACCOUNT_hn ','N.R.E. ACCOUNT '),(617,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','N.R.O. ACCOUNT_hn ','N.R.O. ACCOUNT '),(618,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','SPECIAL_hn','SPECIAL'),(619,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','MINOR ACCOUNT_hn ','MINOR ACCOUNT '),(620,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','INSTITUTIONAL_hn','INSTITUTIONAL'),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','ACCOUNTTYPE','OTHER INSTITUTIONAL A/C_hn ','OTHER INSTITUTIONAL A/C '),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','EITHER OR SURVIVOR ','EITHERORSURVIVOR '),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','FORMER OR SURVIVOR','FORMERORSURVIVOR'),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','ANY ONE SINGLE OR SURVIVOR ','ANYONESINGLEORSURVIVOR '),(625,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','ANY TWO JOINTLY ','ANYTWOJOINTLY '),(626,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','ANY THREE JOINTLY OR SURVIVOR','ANYTHREEJOINTLYORSURVIVOR'),(627,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','KARTA ','KARTA '),(628,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','PARTNERS SIGN JOINTLY ','PARTNERSSIGNJOINTLY '),(629,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MODEOFOPERATION','MINOR GREATER THAN 13YRS ','MINORGREATERTHAN13YRS '),(630,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','EITHER OR SURVIVOR_hn ','EITHERORSURVIVOR '),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','FORMER OR SURVIVOR_hn','FORMERORSURVIVOR'),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','ANY ONE SINGLE OR SURVIVOR_hn ','ANYONESINGLEORSURVIVOR '),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','ANY TWO JOINTLY_hn ','ANYTWOJOINTLY '),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','ANY THREE JOINTLY OR SURVIVOR_hn','ANYTHREEJOINTLYORSURVIVOR'),(635,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','KARTA_hn ','KARTA '),(636,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','PARTNERS SIGN JOINTLY_hn ','PARTNERSSIGNJOINTLY '),(637,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MODEOFOPERATION','MINOR GREATER THAN 13YRS_hn ','MINORGREATERTHAN13YRS '),(638,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','INCOME TAX DEPT. INSTRUCTION ','INCOMETAXDEPTINSTRUCTION '),(639,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','CREDIT DEPARTMENT MEMO','CREDITDEPARTMENTMEMO'),(640,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','MINOR TURNED MAJOR ','MINORTURNEDMAJOR '),(641,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','BANK MANAGER INSTRUCTION ','BANKMANAGERINSTRUCTION '),(642,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','A/C TR TO OD AG. DEP. ','A/CTRTOODAGDEP. '),(643,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','SYSTEM REQUIREMENT ','SYSTEMREQUIREMENT '),(644,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','LATE RETURN INTIMATED','LATERETURNINTIMATED'),(645,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','AS PER THE CLIENT REQUEST ','ASPERTHECLIENTREQUEST '),(646,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS','COURT ORDER ','COURTORDER '),(647,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','REASONS',' POLICE DEPARTMENT ORDER ',' POLICEDEPARTMENTORDER '),(648,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','INCOME TAX DEPT. INSTRUCTION_hn ','INCOMETAXDEPTINSTRUCTION '),(649,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','CREDIT DEPARTMENT MEMO_hn','CREDITDEPARTMENTMEMO'),(650,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','MINOR TURNED MAJOR_hn ','MINORTURNEDMAJOR '),(651,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','BANK MANAGER INSTRUCTION_hn ','BANKMANAGERINSTRUCTION '),(652,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','A/C TR TO OD AG. DEP_hn ','A/CTRTOODAGDEP. '),(653,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','SYSTEM REQUIREMENT_hn ','SYSTEMREQUIREMENT '),(654,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','LATE RETURN INTIMATED_hn','LATERETURNINTIMATED'),(655,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','AS PER THE CLIENT REQUEST_hn ','ASPERTHECLIENTREQUEST '),(656,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS','COURT ORDER_hn ','COURTORDER '),(657,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','REASONS',' POLICE DEPARTMENT ORDER_hn ',' POLICEDEPARTMENTORDER '),(658,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MEMBERTYPE_ACCT','REGULAR MEMBER','REGULARMEMBER'),(659,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MEMBERTYPE_ACCT','NOMINAL MEMBER ','NOMINALMEMBER '),(660,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','MEMBERTYPE_ACCT','NON MEMBER ','NONMEMBER '),(661,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MEMBERTYPE_ACCT','REGULAR MEMBER_hn','REGULARMEMBER'),(662,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MEMBERTYPE_ACCT','NOMINAL MEMBER_hn ','NOMINALMEMBER '),(663,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','MEMBERTYPE_ACCT','NON MEMBER_hn ','NONMEMBER '),(664,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DRAWINGPOWER','DAILY','DAILY'),(665,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DRAWINGPOWER','MONTHLY','MONTHLY'),(666,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DRAWINGPOWER','NO','NO'),(667,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','en','DRAWINGPOWER','YEAR','YEAR'),(668,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DRAWINGPOWER','DAILY_hn','DAILY'),(669,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DRAWINGPOWER','MONTHLY_hn','MONTHLY'),(670,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DRAWINGPOWER','NO_hn','NO'),(671,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','hn','DRAWINGPOWER','YEAR_hn','YEAR');
/*!40000 ALTER TABLE `lookupvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menumst`
--

DROP TABLE IF EXISTS `menumst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menumst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authMode` int(11) DEFAULT NULL,
  `authorizeAction` int(11) DEFAULT NULL,
  `createAction` int(11) DEFAULT NULL,
  `deleteAction` int(11) DEFAULT NULL,
  `disableAction` int(11) DEFAULT NULL,
  `downloadAction` int(11) DEFAULT NULL,
  `emailAction` int(11) DEFAULT NULL,
  `enableAction` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isMakerChecker` bit(1) DEFAULT NULL,
  `languageCode` varchar(10) DEFAULT NULL,
  `menuCode` varchar(20) DEFAULT NULL,
  `menuFilePath` varchar(500) DEFAULT NULL,
  `menuIcon` varchar(255) DEFAULT NULL,
  `menuName` varchar(100) DEFAULT NULL,
  `printAction` int(11) DEFAULT NULL,
  `rejectAction` int(11) DEFAULT NULL,
  `searchAction` int(11) DEFAULT NULL,
  `sectionCode` varchar(30) DEFAULT NULL,
  `sectionDisplayName` varchar(30) DEFAULT NULL,
  `smsAction` int(11) DEFAULT NULL,
  `updateAction` int(11) DEFAULT NULL,
  `viewAction` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fv5x150lu15rv879lx7jwaiy0` (`tenantId`,`menuCode`,`languageCode`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menumst`
--

LOCK TABLES `menumst` WRITE;
/*!40000 ALTER TABLE `menumst` DISABLE KEYS */;
INSERT INTO `menumst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','BRANCHMGMT','branchList.action',NULL,'Branch Management',0,0,0,'MASTERS',NULL,0,0,0),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','USERMGMT','userList.action',NULL,'User Management',0,0,0,'MASTERS',NULL,0,0,0),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','PRODUCTMGMT','productList.action',NULL,'Product Management',0,0,0,'MASTERS',NULL,0,0,0),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','CUSTOMER','customerList.action',NULL,'Customer Management',0,0,0,'MASTERS',NULL,0,0,0),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','HOLIDAY','holidayList.action',NULL,'Holiday Management',0,0,0,'MASTERS',NULL,0,0,0),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','ROLEMGMT','roleList.action',NULL,'Role Management',0,0,0,'MASTERS',NULL,0,0,0),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','PRDACNOMST','prdAcNoList.action',NULL,'Account Management',0,0,0,'MASTERS',NULL,0,0,0),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','PARAMSCHK','paramChkList.action',NULL,'Parameters - Checking Ac',0,0,0,'PARAMETERS',NULL,0,0,0),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','PARAMSLOAN','paramLoanList.action',NULL,'Parameters - Loan Ac',0,0,0,'PARAMETERS',NULL,0,0,0),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','APPCONFIG','appConfig.action',NULL,'Application Config',0,0,0,'PARAMETERS',NULL,0,0,0),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','PRDACNOCONFIG','prdAcConfigList',NULL,'Account Number Config',0,0,0,'PARAMETERS',NULL,0,0,0),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','TXNCONFIG','txnClientConfigCRUD.action',NULL,'Transaction Config',0,0,0,'PARAMETERS',NULL,0,0,0),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','BRANCHHOLIDAYS','branchHolidaysList.action',NULL,'Branch Holiday Mapping',0,0,0,'PARAMETERS',NULL,0,0,0),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','RESETPWD','resetPassword.action',NULL,'Reset Password',0,0,0,'ADMINISTRATION',NULL,0,0,0),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','UNLOCKUSER','unlockUser.action',NULL,'Unlock User',0,0,0,'ADMINISTRATION',NULL,0,0,0),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,0,0,0,0,0,0,0,'','\0','en','TRANSACTIONS','txn.action',NULL,'Transactions',0,0,0,'TRANSACTIONS',NULL,0,0,0),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','\0','en','GLMGMT','GLMstList.action',NULL,'GL Management',NULL,NULL,NULL,'MASTERS',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menumst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulemst`
--

DROP TABLE IF EXISTS `modulemst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulemst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `moduleCode` varchar(20) DEFAULT NULL,
  `moduleDesc` varchar(200) DEFAULT NULL,
  `moduleName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulemst`
--

LOCK TABLES `modulemst` WRITE;
/*!40000 ALTER TABLE `modulemst` DISABLE KEYS */;
INSERT INTO `modulemst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','SB',NULL,'Saving'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','LOANS',NULL,'Loans');
/*!40000 ALTER TABLE `modulemst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipalitymst`
--

DROP TABLE IF EXISTS `municipalitymst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipalitymst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `municipalityCode` varchar(20) DEFAULT NULL,
  `municipalityName` varchar(100) DEFAULT NULL,
  `fkDistrictPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lvpcxyntv9b28nx2xnyf5i74v` (`fkDistrictPk`),
  CONSTRAINT `FK_lvpcxyntv9b28nx2xnyf5i74v` FOREIGN KEY (`fkDistrictPk`) REFERENCES `districtmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipalitymst`
--

LOCK TABLES `municipalitymst` WRITE;
/*!40000 ALTER TABLE `municipalitymst` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipalitymst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paramcheckingac`
--

DROP TABLE IF EXISTS `paramcheckingac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paramcheckingac` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `adhocInterestRate` double DEFAULT NULL,
  `afterMonth` varchar(255) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `dayOfMonth` varchar(255) DEFAULT NULL,
  `daysCountPerYear` varchar(255) DEFAULT NULL,
  `defaultTransferBatch` varchar(255) DEFAULT NULL,
  `discountedInterestRate` varchar(255) DEFAULT NULL,
  `effectiveFrom` date DEFAULT NULL,
  `effectiveTill` date DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `intAcNo` varchar(255) DEFAULT NULL,
  `intRecvAcNo` varchar(255) DEFAULT NULL,
  `intResAcNo` varchar(255) DEFAULT NULL,
  `interestApplicationFrequency` varchar(255) DEFAULT NULL,
  `interestCalculationBalancingType` varchar(255) DEFAULT NULL,
  `interestPayOrReceiveCustomer` varchar(255) DEFAULT NULL,
  `interestTax` double DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `lastAcNo` varchar(255) DEFAULT NULL,
  `maximumAdhocInterestRate` double DEFAULT NULL,
  `maximumInterestRate` double DEFAULT NULL,
  `minimumProductTODCharge` double DEFAULT NULL,
  `minimumSBInterestAmount` double DEFAULT NULL,
  `minimumTODChargeAmount` double DEFAULT NULL,
  `moduleCode` varchar(20) DEFAULT NULL,
  `moveAcToInoperativeHead` varchar(255) DEFAULT NULL,
  `moveAccountToInDormantHead` varchar(255) DEFAULT NULL,
  `nonPerpormingAssetPanelRate` double DEFAULT NULL,
  `penalIntAcNo` varchar(255) DEFAULT NULL,
  `penalInterestRate` double DEFAULT NULL,
  `prdAcNo` varchar(50) DEFAULT NULL,
  `prodCode` varchar(20) DEFAULT NULL,
  `productCalculationType` varchar(255) DEFAULT NULL,
  `roundOffOption` varchar(255) DEFAULT NULL,
  `setNumber` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tds` bit(1) DEFAULT NULL,
  `tdsAcNo` varchar(255) DEFAULT NULL,
  `tdsPercent` double DEFAULT NULL,
  `temporaryOverdraftInterestRate` double DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `valueMaxMonth` varchar(255) DEFAULT NULL,
  `afterMonthsDormant` varchar(255) DEFAULT NULL,
  `afterMonthsInOperative` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5dxgp7uw1pj8dc48l14g0ad76` (`tenantId`,`moduleCode`,`prodCode`,`branchCode`),
  UNIQUE KEY `UK_1tdcnxp1ofdoruxn3wict72j` (`tenantId`,`moduleCode`,`prodCode`,`branchCode`,`effectiveFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paramcheckingac`
--

LOCK TABLES `paramcheckingac` WRITE;
/*!40000 ALTER TABLE `paramcheckingac` DISABLE KEYS */;
/*!40000 ALTER TABLE `paramcheckingac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paramloanac`
--

DROP TABLE IF EXISTS `paramloanac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paramloanac` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `acceptNonPerformingAccountDate` bit(1) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `chargeFullMonthInterestClosure` bit(1) DEFAULT NULL,
  `deathInsurance` double DEFAULT NULL,
  `defaultTransferBatch` varchar(50) DEFAULT NULL,
  `discoutedInterestRate` bit(1) DEFAULT NULL,
  `effectiveFrom` date DEFAULT NULL,
  `effectiveTill` date DEFAULT NULL,
  `equated` bit(1) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `funded` bit(1) DEFAULT NULL,
  `graceDayInterest` int(11) DEFAULT NULL,
  `graceDaysInstallment` int(11) DEFAULT NULL,
  `guaranteeDeposit` double DEFAULT NULL,
  `guaranteeFund` double DEFAULT NULL,
  `holidayPeriod` varchar(20) DEFAULT NULL,
  `interestApplicationFrequency` varchar(20) DEFAULT NULL,
  `interestChargeType` varchar(20) DEFAULT NULL,
  `interestTax` double DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `lastAccount` varchar(50) DEFAULT NULL,
  `loanType` varchar(20) DEFAULT NULL,
  `maxPenalInterestRate` double DEFAULT NULL,
  `maximumAmount` double DEFAULT NULL,
  `maximumSanctionLimit` float DEFAULT NULL,
  `maximumTerm` int(11) DEFAULT NULL,
  `minimumAmount` double DEFAULT NULL,
  `minimumClosureTerm` int(11) DEFAULT NULL,
  `minimumDaysOfInterest` int(11) DEFAULT NULL,
  `minimumTerm` double DEFAULT NULL,
  `moduleCode` varchar(255) DEFAULT NULL,
  `monthValueDate` int(11) DEFAULT NULL,
  `notPerformingAccountpenalRate` double DEFAULT NULL,
  `npaAIntRecvAc` varchar(50) DEFAULT NULL,
  `npaAIntResAc` varchar(50) DEFAULT NULL,
  `npaOCRecvAc` varchar(50) DEFAULT NULL,
  `npaOCResAc` varchar(50) DEFAULT NULL,
  `npaPIntRecvAc` varchar(50) DEFAULT NULL,
  `npaPIntResAc` varchar(50) DEFAULT NULL,
  `numOfAccount` int(11) DEFAULT NULL,
  `numberOfDaysInYear` int(11) DEFAULT NULL,
  `penalInterestRate` double DEFAULT NULL,
  `prodCode` varchar(255) DEFAULT NULL,
  `productCalculationType` varchar(50) DEFAULT NULL,
  `roundOff` varchar(20) DEFAULT NULL,
  `setNumber` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `unRecovExpAc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ek85qwbjh8mr5ailhb7d1m8h` (`tenantId`,`moduleCode`,`prodCode`,`branchCode`),
  UNIQUE KEY `UK_f601twl7o018kryg2iitt8sdx` (`tenantId`,`moduleCode`,`prodCode`,`branchCode`,`effectiveFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paramloanac`
--

LOCK TABLES `paramloanac` WRITE;
/*!40000 ALTER TABLE `paramloanac` DISABLE KEYS */;
/*!40000 ALTER TABLE `paramloanac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prdacnomst`
--

DROP TABLE IF EXISTS `prdacnomst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prdacnomst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `accountName` varchar(50) DEFAULT NULL,
  `accountName1` varchar(50) DEFAULT NULL,
  `accountNumber` varchar(50) DEFAULT NULL,
  `accountStatus` varchar(50) DEFAULT NULL,
  `accountType` varchar(50) DEFAULT NULL,
  `additionalInformation1` varchar(100) DEFAULT NULL,
  `additionalInformation2` varchar(100) DEFAULT NULL,
  `authStatus` varchar(50) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `closedUser` varchar(50) DEFAULT NULL,
  `closedUserDate` varchar(50) DEFAULT NULL,
  `currencyCode` varchar(20) DEFAULT NULL,
  `currencyCode1` varchar(50) DEFAULT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `customerNumber` varchar(20) DEFAULT NULL,
  `dateOfEstablishment` varchar(50) DEFAULT NULL,
  `documentFileNumber` varchar(50) DEFAULT NULL,
  `drawingPowerNDM` varchar(50) DEFAULT NULL,
  `freezeType` varchar(50) DEFAULT NULL,
  `hnwCustCat` varchar(50) DEFAULT NULL,
  `holder1DOB` varchar(50) DEFAULT NULL,
  `holder1Gender` varchar(20) DEFAULT NULL,
  `holder1Minor` varchar(50) DEFAULT NULL,
  `holder1Name` varchar(100) DEFAULT NULL,
  `holder2DOB` varchar(50) DEFAULT NULL,
  `holder2Gender` varchar(50) DEFAULT NULL,
  `holder2Minor` varchar(50) DEFAULT NULL,
  `holder2Name` varchar(50) DEFAULT NULL,
  `holder3DOB` varchar(50) DEFAULT NULL,
  `holder3Gender` varchar(50) DEFAULT NULL,
  `holder3Minor` varchar(50) DEFAULT NULL,
  `holder3Name` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `memberNumber` varchar(50) DEFAULT NULL,
  `memberType` varchar(50) DEFAULT NULL,
  `minorType` varchar(50) DEFAULT NULL,
  `modeOfOperation` varchar(50) DEFAULT NULL,
  `moduleCode` varchar(20) DEFAULT NULL,
  `nominee1DOB` varchar(50) DEFAULT NULL,
  `nominee1Gender` varchar(50) DEFAULT NULL,
  `nominee1Minor` varchar(50) DEFAULT NULL,
  `nominee1Name` varchar(50) DEFAULT NULL,
  `nominee2DOB` varchar(50) DEFAULT NULL,
  `nominee2Gender` varchar(50) DEFAULT NULL,
  `nominee2Minor` varchar(50) DEFAULT NULL,
  `nominee2Name` varchar(50) DEFAULT NULL,
  `nominee3DOB` varchar(50) DEFAULT NULL,
  `nominee3Gender` varchar(50) DEFAULT NULL,
  `nominee3Minor` varchar(50) DEFAULT NULL,
  `nominee3Name` varchar(50) DEFAULT NULL,
  `openUser` varchar(50) DEFAULT NULL,
  `openUserDate` varchar(50) DEFAULT NULL,
  `payingAccount` varchar(50) DEFAULT NULL,
  `productCode` varchar(20) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `reasonForMember` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prdacnomst`
--

LOCK TABLES `prdacnomst` WRITE;
/*!40000 ALTER TABLE `prdacnomst` DISABLE KEYS */;
/*!40000 ALTER TABLE `prdacnomst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prdacnumberconfig`
--

DROP TABLE IF EXISTS `prdacnumberconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prdacnumberconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `accountLen` int(11) DEFAULT NULL,
  `accountRank` int(11) DEFAULT NULL,
  `accountYN` bit(1) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `branchLen` int(11) DEFAULT NULL,
  `branchRank` int(11) DEFAULT NULL,
  `branchYN` bit(1) DEFAULT NULL,
  `currencyLen` int(11) DEFAULT NULL,
  `currencyRank` int(11) DEFAULT NULL,
  `currencyYN` bit(1) DEFAULT NULL,
  `customerLen` int(11) DEFAULT NULL,
  `customerRank` int(11) DEFAULT NULL,
  `customerYN` bit(1) DEFAULT NULL,
  `effFromDate` date DEFAULT NULL,
  `effTillDate` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `moduleCode` varchar(255) DEFAULT NULL,
  `productCode` varchar(255) DEFAULT NULL,
  `productLen` int(11) DEFAULT NULL,
  `productRank` int(11) DEFAULT NULL,
  `productYN` bit(1) DEFAULT NULL,
  `sepr` varchar(255) DEFAULT NULL,
  `subAccountLen` int(11) DEFAULT NULL,
  `subAccountRank` int(11) DEFAULT NULL,
  `subAccountYN` bit(1) DEFAULT NULL,
  `totalAccountLen` int(11) DEFAULT NULL,
  `totalSubAccountLen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_p1s5lj01rgssg5fsv4mbgmgir` (`tenantId`,`moduleCode`,`productCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prdacnumberconfig`
--

LOCK TABLES `prdacnumberconfig` WRITE;
/*!40000 ALTER TABLE `prdacnumberconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `prdacnumberconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productmst`
--

DROP TABLE IF EXISTS `productmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `accruedYN` bit(1) DEFAULT NULL,
  `assetLiability` varchar(255) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `autoGenAcNoYN` bit(1) DEFAULT NULL,
  `autoGenSubAcNoYN` bit(1) DEFAULT NULL,
  `cashCrYN` bit(1) DEFAULT NULL,
  `cashDrYN` bit(1) DEFAULT NULL,
  `clearingCrYN` bit(1) DEFAULT NULL,
  `clearingDrYN` bit(1) DEFAULT NULL,
  `conditionalAssetGL` varchar(255) DEFAULT NULL,
  `conditionalLiabilityGL` varchar(255) DEFAULT NULL,
  `currencyCode` varchar(10) DEFAULT NULL,
  `customerInternal` varchar(255) DEFAULT NULL,
  `finNonFin` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `minBalChqBook` double DEFAULT NULL,
  `minBalNonChqBook` double DEFAULT NULL,
  `moduleCode` varchar(30) DEFAULT NULL,
  `moduleType` varchar(255) DEFAULT NULL,
  `parentProductCode` varchar(20) DEFAULT NULL,
  `prdStatus` varchar(255) DEFAULT NULL,
  `productCode` varchar(20) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productTypeCode` varchar(30) DEFAULT NULL,
  `reconType` varchar(255) DEFAULT NULL,
  `transferCrYN` bit(1) DEFAULT NULL,
  `transferDrYN` bit(1) DEFAULT NULL,
  `typeOfDeposit` varchar(255) DEFAULT NULL,
  `vcrEntryLevel` varchar(255) DEFAULT NULL,
  `vcrOpenLevel` varchar(255) DEFAULT NULL,
  `generalLadger` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pgpdw42t44vs1yqt2pkl83pbb` (`tenantId`,`moduleCode`,`productCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productmst`
--

LOCK TABLES `productmst` WRITE;
/*!40000 ALTER TABLE `productmst` DISABLE KEYS */;
INSERT INTO `productmst` VALUES (1,'infraadmin','2015-02-24 20:42:11','\0','',NULL,'','',NULL,'001',0,'\0','ASSET','Authorized','','\0','','\0','\0','\0','ASSET','ASSET',NULL,'INTERNAL','FINANCIAL','',0,0,'SB','','','ASSET','01','Salary Ac','','BOTH','\0','\0','LOCALDEPOSIT','PRODUCT','PRODUCT',NULL);
/*!40000 ALTER TABLE `productmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productnameaddress`
--

DROP TABLE IF EXISTS `productnameaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productnameaddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `catDesc` varchar(200) DEFAULT NULL,
  `catType` varchar(50) DEFAULT NULL,
  `cateogry` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `maxNumber` int(11) DEFAULT NULL,
  `minNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productnameaddress`
--

LOCK TABLES `productnameaddress` WRITE;
/*!40000 ALTER TABLE `productnameaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `productnameaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolemenuactionaccess`
--

DROP TABLE IF EXISTS `rolemenuactionaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolemenuactionaccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authorizeAction` int(11) DEFAULT NULL,
  `createAction` int(11) DEFAULT NULL,
  `deleteAction` int(11) DEFAULT NULL,
  `disableAction` int(11) DEFAULT NULL,
  `downloadAction` int(11) DEFAULT NULL,
  `emailAction` int(11) DEFAULT NULL,
  `enableAction` int(11) DEFAULT NULL,
  `menuCode` varchar(255) DEFAULT NULL,
  `printAction` int(11) DEFAULT NULL,
  `rejectAction` int(11) DEFAULT NULL,
  `roleMstCode` varchar(255) DEFAULT NULL,
  `searchAction` int(11) DEFAULT NULL,
  `smsAction` int(11) DEFAULT NULL,
  `updateAction` int(11) DEFAULT NULL,
  `viewAction` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemenuactionaccess`
--

LOCK TABLES `rolemenuactionaccess` WRITE;
/*!40000 ALTER TABLE `rolemenuactionaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolemenuactionaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolemst`
--

DROP TABLE IF EXISTS `rolemst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolemst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `roleCode` varchar(20) DEFAULT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemst`
--

LOCK TABLES `rolemst` WRITE;
/*!40000 ALTER TABLE `rolemst` DISABLE KEYS */;
INSERT INTO `rolemst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','INFRAADMIN','INFRAADMIN'),(2,'infraadmin','2015-02-24 21:12:05','\0','',NULL,'','',NULL,'001',1,'','','CUSTADMIN','CUSTADMIN'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','BRANCHMGR','MANAGER'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'AUTHORIZED','','BRANCHOPR','TELLER');
/*!40000 ALTER TABLE `rolemst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `screenName` varchar(200) DEFAULT NULL,
  `screenType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_215vb1n50d9vn50pucg438uij` (`screenName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_screenrow`
--

DROP TABLE IF EXISTS `screen_screenrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_screenrow` (
  `Screen_id` bigint(20) NOT NULL,
  `rows_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_7uw0if2ncspq810d4042a9u3g` (`rows_id`),
  KEY `FK_9uyb87o30sr69pyb2e6gc08k6` (`Screen_id`),
  CONSTRAINT `FK_7uw0if2ncspq810d4042a9u3g` FOREIGN KEY (`rows_id`) REFERENCES `screenrow` (`id`),
  CONSTRAINT `FK_9uyb87o30sr69pyb2e6gc08k6` FOREIGN KEY (`Screen_id`) REFERENCES `screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_screenrow`
--

LOCK TABLES `screen_screenrow` WRITE;
/*!40000 ALTER TABLE `screen_screenrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_screenrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenelement`
--

DROP TABLE IF EXISTS `screenelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenelement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `lookupCode` varchar(60) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `screenDataType` varchar(255) DEFAULT NULL,
  `screenUIType` varchar(255) DEFAULT NULL,
  `value` varchar(400) DEFAULT NULL,
  `displayName` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenelement`
--

LOCK TABLES `screenelement` WRITE;
/*!40000 ALTER TABLE `screenelement` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenelementtransaction`
--

DROP TABLE IF EXISTS `screenelementtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenelementtransaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `activityCode` varchar(255) DEFAULT NULL,
  `attachmentValue` longblob,
  `dateValue` datetime DEFAULT NULL,
  `decimalValue` decimal(19,2) DEFAULT NULL,
  `longValue` bigint(20) DEFAULT NULL,
  `productAccountNumber` varchar(255) DEFAULT NULL,
  `screenDataType` int(11) DEFAULT NULL,
  `screenId` bigint(20) DEFAULT NULL,
  `textValue` varchar(500) DEFAULT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `screenElementId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pg10by6qo2ton0smwfyr5nvn9` (`screenElementId`),
  CONSTRAINT `FK_pg10by6qo2ton0smwfyr5nvn9` FOREIGN KEY (`screenElementId`) REFERENCES `screenelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenelementtransaction`
--

LOCK TABLES `screenelementtransaction` WRITE;
/*!40000 ALTER TABLE `screenelementtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenelementtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenmapper`
--

DROP TABLE IF EXISTS `screenmapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenmapper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `activityCode` varchar(60) NOT NULL,
  `branchCode` varchar(60) NOT NULL,
  `moduleCode` varchar(60) NOT NULL,
  `productCode` varchar(60) NOT NULL,
  `balancesScreen_ID` bigint(20) DEFAULT NULL,
  `infoScreen_ID` bigint(20) DEFAULT NULL,
  `transactionScreen_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rgx59bo4l037iddhikivyo3jp` (`tenantId`,`moduleCode`,`productCode`,`activityCode`,`branchCode`),
  KEY `FK_hwvmbmj1nvyuns912cdo62av9` (`balancesScreen_ID`),
  KEY `FK_6pixbackfxbl97mb37qd3d2wt` (`infoScreen_ID`),
  KEY `FK_iftu52jui1mcsn75utqv6s694` (`transactionScreen_ID`),
  CONSTRAINT `FK_6pixbackfxbl97mb37qd3d2wt` FOREIGN KEY (`infoScreen_ID`) REFERENCES `screen` (`id`),
  CONSTRAINT `FK_hwvmbmj1nvyuns912cdo62av9` FOREIGN KEY (`balancesScreen_ID`) REFERENCES `screen` (`id`),
  CONSTRAINT `FK_iftu52jui1mcsn75utqv6s694` FOREIGN KEY (`transactionScreen_ID`) REFERENCES `screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenmapper`
--

LOCK TABLES `screenmapper` WRITE;
/*!40000 ALTER TABLE `screenmapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenmapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenrow`
--

DROP TABLE IF EXISTS `screenrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenrow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenrow`
--

LOCK TABLES `screenrow` WRITE;
/*!40000 ALTER TABLE `screenrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenrow_screenelement`
--

DROP TABLE IF EXISTS `screenrow_screenelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenrow_screenelement` (
  `ScreenRow_id` bigint(20) NOT NULL,
  `screenElements_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_r4cxo6q26t867y6dbshlarae8` (`screenElements_id`),
  KEY `FK_lct97k1gvhmewdqsbfyh3og46` (`ScreenRow_id`),
  CONSTRAINT `FK_lct97k1gvhmewdqsbfyh3og46` FOREIGN KEY (`ScreenRow_id`) REFERENCES `screenrow` (`id`),
  CONSTRAINT `FK_r4cxo6q26t867y6dbshlarae8` FOREIGN KEY (`screenElements_id`) REFERENCES `screenelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenrow_screenelement`
--

LOCK TABLES `screenrow_screenelement` WRITE;
/*!40000 ALTER TABLE `screenrow_screenelement` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenrow_screenelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenrowtransaction`
--

DROP TABLE IF EXISTS `screenrowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenrowtransaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `screenRowId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t1hl6g9wcw9pt98hn3wto9722` (`screenRowId`),
  CONSTRAINT `FK_t1hl6g9wcw9pt98hn3wto9722` FOREIGN KEY (`screenRowId`) REFERENCES `screenrow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenrowtransaction`
--

LOCK TABLES `screenrowtransaction` WRITE;
/*!40000 ALTER TABLE `screenrowtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenrowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenrowtransaction_screenelementtransaction`
--

DROP TABLE IF EXISTS `screenrowtransaction_screenelementtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenrowtransaction_screenelementtransaction` (
  `ScreenRowTransaction_id` bigint(20) NOT NULL,
  `elementTransactions_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_dxxbq1tqotyhkv8ibu8ih3e7g` (`elementTransactions_id`),
  KEY `FK_hpopjf6ps4jfjemvrq70ivyvg` (`ScreenRowTransaction_id`),
  CONSTRAINT `FK_dxxbq1tqotyhkv8ibu8ih3e7g` FOREIGN KEY (`elementTransactions_id`) REFERENCES `screenelementtransaction` (`id`),
  CONSTRAINT `FK_hpopjf6ps4jfjemvrq70ivyvg` FOREIGN KEY (`ScreenRowTransaction_id`) REFERENCES `screenrowtransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenrowtransaction_screenelementtransaction`
--

LOCK TABLES `screenrowtransaction_screenelementtransaction` WRITE;
/*!40000 ALTER TABLE `screenrowtransaction_screenelementtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenrowtransaction_screenelementtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screentransaction`
--

DROP TABLE IF EXISTS `screentransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentransaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `screenId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_110tigh308eudksjhhhusfswo` (`screenId`),
  CONSTRAINT `FK_110tigh308eudksjhhhusfswo` FOREIGN KEY (`screenId`) REFERENCES `screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screentransaction`
--

LOCK TABLES `screentransaction` WRITE;
/*!40000 ALTER TABLE `screentransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `screentransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screentransaction_screenrowtransaction`
--

DROP TABLE IF EXISTS `screentransaction_screenrowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentransaction_screenrowtransaction` (
  `ScreenTransaction_id` bigint(20) NOT NULL,
  `rowTransactions_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hjamne95dhhacm3jir4kihxqv` (`rowTransactions_id`),
  KEY `FK_2y0s6e9q9cm5mnqvfuovu2tu1` (`ScreenTransaction_id`),
  CONSTRAINT `FK_2y0s6e9q9cm5mnqvfuovu2tu1` FOREIGN KEY (`ScreenTransaction_id`) REFERENCES `screentransaction` (`id`),
  CONSTRAINT `FK_hjamne95dhhacm3jir4kihxqv` FOREIGN KEY (`rowTransactions_id`) REFERENCES `screenrowtransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screentransaction_screenrowtransaction`
--

LOCK TABLES `screentransaction_screenrowtransaction` WRITE;
/*!40000 ALTER TABLE `screentransaction_screenrowtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `screentransaction_screenrowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionmst`
--

DROP TABLE IF EXISTS `sectionmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectionmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `languageCode` varchar(10) DEFAULT NULL,
  `sectionCode` varchar(20) DEFAULT NULL,
  `sectionIcon` varchar(255) DEFAULT NULL,
  `sectionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionmst`
--

LOCK TABLES `sectionmst` WRITE;
/*!40000 ALTER TABLE `sectionmst` DISABLE KEYS */;
INSERT INTO `sectionmst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','MASTERS',NULL,'MASTERS'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','PARAMETERS',NULL,'PARAMETERS'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','TRANSACTIONS',NULL,'TRANSACTIONS'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','ADMINISTRATION',NULL,'ADMINISTRATION'),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','en','REPORTS',NULL,'REPORTS');
/*!40000 ALTER TABLE `sectionmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemst`
--

DROP TABLE IF EXISTS `statemst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statemst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `stateCode` varchar(20) DEFAULT NULL,
  `stateName` varchar(50) DEFAULT NULL,
  `fkCountryPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b0kdvleu2c86mj0pcovkh4ocd` (`fkCountryPk`),
  CONSTRAINT `FK_b0kdvleu2c86mj0pcovkh4ocd` FOREIGN KEY (`fkCountryPk`) REFERENCES `countrymst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemst`
--

LOCK TABLES `statemst` WRITE;
/*!40000 ALTER TABLE `statemst` DISABLE KEYS */;
INSERT INTO `statemst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','MH','Maharashtra',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','TN','Tamilnadu',1),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','OD','Odisa',1),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','GJ','Gujarat',1),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','KT','Karnataka',1),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',NULL,'','CA','California',2);
/*!40000 ALTER TABLE `statemst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_address`
--

DROP TABLE IF EXISTS `tenant_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_address` (
  `TENANT_ID` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `addressType` varchar(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `municipalityId` bigint(20) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `villageId` bigint(20) DEFAULT NULL,
  `Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_5hqjp2oqsrtnqo1yt35k42uvq` (`TENANT_ID`),
  CONSTRAINT `FK_5hqjp2oqsrtnqo1yt35k42uvq` FOREIGN KEY (`TENANT_ID`) REFERENCES `tenantmst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_address`
--

LOCK TABLES `tenant_address` WRITE;
/*!40000 ALTER TABLE `tenant_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenantgrpmst`
--

DROP TABLE IF EXISTS `tenantgrpmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenantgrpmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isActive` bit(1) DEFAULT NULL,
  `tenantGrpCode` varchar(20) DEFAULT NULL,
  `tenantGrpName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3l3oj0u33ywfsj1cldixc9ddg` (`tenantGrpCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenantgrpmst`
--

LOCK TABLES `tenantgrpmst` WRITE;
/*!40000 ALTER TABLE `tenantgrpmst` DISABLE KEYS */;
INSERT INTO `tenantgrpmst` VALUES (1,'','01','Bagalkot DCCB');
/*!40000 ALTER TABLE `tenantgrpmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenantmst`
--

DROP TABLE IF EXISTS `tenantmst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenantmst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estbDate` date DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `parentTenantCode` varchar(20) DEFAULT NULL,
  `tenantGrpCode` varchar(20) DEFAULT NULL,
  `tenantId` varchar(20) DEFAULT NULL,
  `tenantName` varchar(100) DEFAULT NULL,
  `tenantURL` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1xqnqcumhladdjw2q1f9yokjb` (`tenantId`),
  UNIQUE KEY `UK_1sogy81c2hlbd6hq51jhvdbd5` (`tenantName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenantmst`
--

LOCK TABLES `tenantmst` WRITE;
/*!40000 ALTER TABLE `tenantmst` DISABLE KEYS */;
INSERT INTO `tenantmst` VALUES (1,NULL,'',NULL,'01','001','Achanur','');
/*!40000 ALTER TABLE `tenantmst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbranch_rolemap`
--

DROP TABLE IF EXISTS `userbranch_rolemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbranch_rolemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `roleCode` varchar(20) DEFAULT NULL,
  `fkUserBranchPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_guw7n0uf8s3ps8x48ekn7nehj` (`fkUserBranchPk`),
  CONSTRAINT `FK_guw7n0uf8s3ps8x48ekn7nehj` FOREIGN KEY (`fkUserBranchPk`) REFERENCES `userbranchmap` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbranch_rolemap`
--

LOCK TABLES `userbranch_rolemap` WRITE;
/*!40000 ALTER TABLE `userbranch_rolemap` DISABLE KEYS */;
INSERT INTO `userbranch_rolemap` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'','INFRAADMIN',1),(2,'',NULL,'\0','',NULL,'','',NULL,'001',0,'','CUSTADMIN',2),(3,'',NULL,'\0','',NULL,'','',NULL,'001',0,'','CUSTADMIN',3),(4,'',NULL,'\0','',NULL,'','',NULL,'001',0,'','CUSTADMIN',4),(5,'',NULL,'\0','',NULL,'','',NULL,'001',0,'','INFRAADMIN',5),(6,'',NULL,'\0','',NULL,'','',NULL,'001',0,'','INFRAADMIN',6);
/*!40000 ALTER TABLE `userbranch_rolemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbranchmap`
--

DROP TABLE IF EXISTS `userbranchmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbranchmap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `branchCode` varchar(20) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `loginId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbranchmap`
--

LOCK TABLES `userbranchmap` WRITE;
/*!40000 ALTER TABLE `userbranchmap` DISABLE KEYS */;
INSERT INTO `userbranchmap` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'01','','INFRAADMIN'),(2,'infraadmin','2015-02-23 19:58:49','\0','',NULL,'','',NULL,'001',0,'01','','Nazneen'),(3,'infraadmin','2015-02-23 19:58:49','\0','',NULL,'','',NULL,'001',0,'02','','Nazneen'),(4,'infraadmin','2015-02-23 20:01:58','\0','',NULL,'','',NULL,'001',0,'01','','Nazneen'),(5,'infraadmin','2015-02-24 19:48:08','\0','',NULL,'','',NULL,'001',0,'01','','INFRAADMIN'),(6,'infraadmin','2015-02-24 19:48:17','\0','',NULL,'','',NULL,'001',0,'01','','INFRAADMIN');
/*!40000 ALTER TABLE `userbranchmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermst`
--

DROP TABLE IF EXISTS `usermst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `allowConcurrentLogin` bit(1) DEFAULT NULL,
  `authStatus` varchar(30) DEFAULT NULL,
  `consequetiveBadLoginCount` int(11) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `forceMinLoginFreqDays` int(11) DEFAULT NULL,
  `forceMinLoginFreqYN` bit(1) DEFAULT NULL,
  `forcePwdChgDays` int(11) DEFAULT NULL,
  `forcePwdChgYN` bit(1) DEFAULT NULL,
  `inActiveFromDateTime` datetime DEFAULT NULL,
  `inActiveTillDateTime` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isUserLocked` bit(1) DEFAULT NULL,
  `isUserLoggedin` bit(1) DEFAULT NULL,
  `lastSuccessfulLoginDateTime` datetime DEFAULT NULL,
  `loginId` varchar(20) NOT NULL,
  `loginSession` varchar(1000) DEFAULT NULL,
  `maxConseBadLoginPerDay` int(11) DEFAULT NULL,
  `nextPwdChgOn` date DEFAULT NULL,
  `permissionNo` varchar(30) DEFAULT NULL,
  `prevPwdChgOn` datetime DEFAULT NULL,
  `pwd` varchar(1200) DEFAULT NULL,
  `pwdSalt` varchar(1200) DEFAULT NULL,
  `reportingUserCode` varchar(255) DEFAULT NULL,
  `roleCode` varchar(1000) NOT NULL,
  `userBaseBranchCode` varchar(255) DEFAULT NULL,
  `userCode` varchar(20) DEFAULT NULL,
  `userDisplayName` varchar(30) DEFAULT NULL,
  `userFName` varchar(30) DEFAULT NULL,
  `userLName` varchar(30) DEFAULT NULL,
  `userMName` varchar(30) DEFAULT NULL,
  `userSalutation` varchar(10) DEFAULT NULL,
  `userTypeCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4iww3rmntv53qiimnnw7rb301` (`tenantId`,`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermst`
--

LOCK TABLES `usermst` WRITE;
/*!40000 ALTER TABLE `usermst` DISABLE KEYS */;
INSERT INTO `usermst` VALUES (1,'infraadmin','2015-02-24 19:48:17',NULL,NULL,NULL,NULL,NULL,NULL,'001',262,'','AUTHORIZED',0,'mahesh.laddha@infrasofttech.com',NULL,NULL,NULL,'\0',NULL,NULL,'','\0','','2015-02-25 21:40:09','INFRAADMIN',NULL,NULL,NULL,'perm001',NULL,'925f43c3cfb956bbe3c6aa8023ba7ad5cfa21d104186fffc69e768e55940d9653b1cd36fba614fba2e1844f4436da20f83750c6ec1db356da154691bdd71a9b1','1234567890',NULL,'INFRAADMIN',NULL,'INFRAADMIN','INFRASOFT','Infrasoft','Administrator','','Mr.','INTERNAL'),(2,'infraadmin','2015-02-23 20:01:58','\0','',NULL,'','',NULL,'001',30,'','',0,'nazneen.ansari@gmail.com',0,'\0',0,'',NULL,NULL,'','\0','\0','2015-02-23 20:10:28','Nazneen','',0,NULL,'122345',NULL,'f61cf7bbb4a39530a30a191d7162039fffa2e677ee6230e03878fe66494e8c04dbff39c627e815a306ab5976db42634a41e44766e3b7d887c34ad5c6f09685ec','c969bc1246338206241ebfac26868b797a7872557ed6d7c8e7c0d42f98ffd96414c7d3d6e223e585cb6b0482a68b11020cb044bb59852b16380d738d0591e25d','','INFRAADMIN','','Nazneen','naz','Nazneen','Ansari','','Ms.','EXTERNAL');
/*!40000 ALTER TABLE `usermst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermst_userbranchmap`
--

DROP TABLE IF EXISTS `usermst_userbranchmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermst_userbranchmap` (
  `UserMst_id` bigint(20) NOT NULL,
  `userBranchMaps_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ph6l4xrxc0inhvn4ar26dcji0` (`userBranchMaps_id`),
  KEY `FK_2ol5n3cqor8nhsag0ghgnr3cq` (`UserMst_id`),
  CONSTRAINT `FK_2ol5n3cqor8nhsag0ghgnr3cq` FOREIGN KEY (`UserMst_id`) REFERENCES `usermst` (`id`),
  CONSTRAINT `FK_ph6l4xrxc0inhvn4ar26dcji0` FOREIGN KEY (`userBranchMaps_id`) REFERENCES `userbranchmap` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermst_userbranchmap`
--

LOCK TABLES `usermst_userbranchmap` WRITE;
/*!40000 ALTER TABLE `usermst_userbranchmap` DISABLE KEYS */;
INSERT INTO `usermst_userbranchmap` VALUES (1,6),(2,4);
/*!40000 ALTER TABLE `usermst_userbranchmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villagemst`
--

DROP TABLE IF EXISTS `villagemst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villagemst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(55) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deprecated` bit(1) DEFAULT NULL,
  `deprecatedBy` varchar(55) DEFAULT NULL,
  `deprecatedDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lastModifiedBy` varchar(55) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `tenantId` varchar(150) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `agriLandArea` double DEFAULT NULL,
  `blockCode` varchar(50) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `mandalCode` varchar(50) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `revenueVillageCode` varchar(50) DEFAULT NULL,
  `serviceAreaCode` varchar(50) DEFAULT NULL,
  `subDivisionThana` varchar(50) DEFAULT NULL,
  `villageCode` varchar(20) DEFAULT NULL,
  `villageName` varchar(50) DEFAULT NULL,
  `fkDistrictPk` bigint(20) DEFAULT NULL,
  `fkMunicipalityPk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bftfc6ttoch2cwf9pg8q8nony` (`fkDistrictPk`),
  KEY `FK_8fgra1f8flkyw0r5acxlufoqe` (`fkMunicipalityPk`),
  CONSTRAINT `FK_8fgra1f8flkyw0r5acxlufoqe` FOREIGN KEY (`fkMunicipalityPk`) REFERENCES `municipalitymst` (`id`),
  CONSTRAINT `FK_bftfc6ttoch2cwf9pg8q8nony` FOREIGN KEY (`fkDistrictPk`) REFERENCES `districtmst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villagemst`
--

LOCK TABLES `villagemst` WRITE;
/*!40000 ALTER TABLE `villagemst` DISABLE KEYS */;
INSERT INTO `villagemst` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,20,'001','01','','01',250000,'05','05','05','02','Kalyan',NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,21,'002','02','','02',250001,'06','06','06','03','Amravati',NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,22,'003','03','','03',250002,'07','07','07','04','Hingna',NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,23,'004','04','','04',250003,'08','08','08','05','Thane',NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,24,'005','05','','05',250004,'09','09','09','06','Tambram',NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,25,'006','06','','06',250005,'10','10','10','07','Solapur',NULL,NULL);
/*!40000 ALTER TABLE `villagemst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-28 11:07:24
