-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: {Insert Here}
-- ------------------------------------------------------
-- Server version	8.0.32

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `INV_ID` varchar(4) NOT NULL,
  `COND` varchar(10) NOT NULL,
  `LOCATION_NUMBER` varchar(3) NOT NULL,
  `ITEM_NAME` varchar(45) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `ISPART` tinyint DEFAULT NULL,
  `ISMACHINERY` tinyint DEFAULT NULL,
  PRIMARY KEY (`INV_ID`,`COND`,`LOCATION_NUMBER`),
  KEY `WAREHOUSENUM2_idx` (`LOCATION_NUMBER`),
  CONSTRAINT `Lnum` FOREIGN KEY (`LOCATION_NUMBER`) REFERENCES `location` (`LNO`)
);
--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` VALUES ('001','New','001','5\" Screw',25,1,0),('002','New','001','Cat 5 Ether',3,1,0),('003','New','002','Cat 5 Ether',5,1,0),('004','Used','001','HP Sheet Feeder',1,1,0),('005','New','002','A4 Paper Pack',30,1,0),('006','New','001','8\" Washers',10,1,0),('007','Used','003','OFFICE JET',1,0,1),('008','New','004','CANON MF260',5,0,1),('011','New','002','Lenovo M11',17,0,1);

--
-- Table structure for table `it_employee`
--

DROP TABLE IF EXISTS `it_employee`;

CREATE TABLE `it_employee` (
  `UNAME` varchar(45) NOT NULL,
  `LOCATION_NUMBER` varchar(3) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UNAME`),
  KEY `LNOIT_idx` (`LOCATION_NUMBER`),
  CONSTRAINT `LNOIT` FOREIGN KEY (`LOCATION_NUMBER`) REFERENCES `location` (`LNO`)
);
--
-- Dumping data for table `it_employee`
--

INSERT INTO `it_employee` VALUES ('Admin','001','password');


--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `LNO` varchar(3) NOT NULL,
  `LOCATION_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LNO`)
);

--
-- Dumping data for table `location`
--

INSERT INTO `location` VALUES ('',''),('001','Rockville'),('002','Edgewood'),('003','Toyota Edgewood'),('004','CDJR Dundalk'),('005','Honda Laurel');

--
-- Table structure for table `machinery`
--

CREATE TABLE `machinery` (
  `INV_ID` varchar(4) NOT NULL,
  `COND` varchar(10) NOT NULL,
  `MACHINE_TYPE` varchar(45) DEFAULT NULL,
  `LOCATION_NUMBER` varchar(3) NOT NULL,
  PRIMARY KEY (`INV_ID`,`COND`,`LOCATION_NUMBER`),
  KEY `CONDITIONM_idx` (`COND`),
  KEY `WAREHOUSE_NUMBERM_idx` (`LOCATION_NUMBER`),
  KEY `tetdsfcasrdfge_idx` (`COND`),
  CONSTRAINT `INV_IDM` FOREIGN KEY (`INV_ID`, `COND`, `LOCATION_NUMBER`) REFERENCES `inventory` (`INV_ID`, `COND`, `LOCATION_NUMBER`)
);

--
-- Dumping data for table `machinery`
--


INSERT INTO `machinery` VALUES ('007','Used','Colored Printer','003'),('008','New','Laser Printer','004'),('011','New','Desktop','002');


--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;

CREATE TABLE `part` (
  `INV_ID` varchar(4) NOT NULL,
  `COND` varchar(10) NOT NULL,
  `LOCATION_NUMBER` varchar(3) NOT NULL,
  `PART_TYPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`INV_ID`,`COND`,`LOCATION_NUMBER`),
  CONSTRAINT `INV_ID` FOREIGN KEY (`INV_ID`, `COND`, `LOCATION_NUMBER`) REFERENCES `inventory` (`INV_ID`, `COND`, `LOCATION_NUMBER`)
);
--
-- Dumping data for table `part`
--

INSERT INTO `part` VALUES ('001','New','001','Fastener'),('002','New','001','Cable'),('003','New','002','Cable'),('004','Used','001','Printer'),('005','New','002','A4 Paper Pack'),('006','New','001','Fastener');


-- Dump completed on 2023-05-04 21:24:28
