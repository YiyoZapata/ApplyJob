-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para vacantes_react
CREATE DATABASE IF NOT EXISTS `vacantes_react` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vacantes_react`;

-- Volcando estructura para tabla vacantes_react.company
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(45) DEFAULT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` longtext NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vacantes_react.company: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vacantes_react.job
CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `until_date` date NOT NULL,
  `city` varchar(45) NOT NULL,
  `job_type` varchar(45) NOT NULL,
  `experience` varchar(45) NOT NULL,
  `deleted` tinyint DEFAULT '0',
  `company_id` int NOT NULL,
  PRIMARY KEY (`job_id`,`company_id`),
  KEY `fk_job_company_idx` (`company_id`),
  CONSTRAINT `fk_job_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vacantes_react.job: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vacantes_react.job_persons_apply
CREATE TABLE IF NOT EXISTS `job_persons_apply` (
  `job_job_id` int NOT NULL,
  `persons_id` int NOT NULL,
  `salary` decimal(10,0) DEFAULT '0',
  `deleted` tinyint DEFAULT '0',
  `selected` tinyint DEFAULT '0',
  PRIMARY KEY (`job_job_id`,`persons_id`),
  KEY `fk_job_has_persons_persons1_idx` (`persons_id`),
  KEY `fk_job_has_persons_job1_idx` (`job_job_id`),
  CONSTRAINT `fk_job_has_persons_job1` FOREIGN KEY (`job_job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `fk_job_has_persons_persons1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vacantes_react.job_persons_apply: ~0 rows (aproximadamente)

-- Volcando estructura para tabla vacantes_react.persons
CREATE TABLE IF NOT EXISTS `persons` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `img` longtext,
  `deleted` tinyint DEFAULT '0',
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla vacantes_react.persons: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
