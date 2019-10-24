-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aeps_2_0
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` text NOT NULL,
  `ProductVersion` text NOT NULL,
  PRIMARY KEY (`MigrationId`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClaimType` text,
  `ClaimValue` text,
  `RoleId` varchar(127) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(127) NOT NULL,
  `ConcurrencyStamp` text,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClaimType` text,
  `ClaimValue` text,
  `UserId` varchar(127) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_AspNetUserClaims_AspNetUsers_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(127) NOT NULL,
  `ProviderKey` varchar(127) NOT NULL,
  `ProviderDisplayName` text,
  `UserId` varchar(127) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `FK_AspNetUserLogins_AspNetUsers_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(127) NOT NULL,
  `RoleId` varchar(127) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `FK_AspNetUserRoles_AspNetRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(127) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `ConcurrencyStamp` text,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `LockoutEnabled` bit(1) NOT NULL,
  `LockoutEnd` timestamp NULL DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `PasswordHash` text,
  `PhoneNumber` text,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `SecurityStamp` text,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(127) NOT NULL,
  `LoginProvider` varchar(127) NOT NULL,
  `Name` varchar(127) NOT NULL,
  `Value` text,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_countries`
--

DROP TABLE IF EXISTS `con_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(100) NOT NULL COMMENT 'name of country',
  `iso2` char(2) NOT NULL,
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'extern identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This table has the list of countries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_municipalities`
--

DROP TABLE IF EXISTS `con_municipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_municipalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `state` int(11) NOT NULL COMMENT 'id of state',
  `name` varchar(150) NOT NULL COMMENT 'name',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'extern identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_con_states_con_municipalities_idx` (`state`),
  CONSTRAINT `fk_con_states_con_municipalities` FOREIGN KEY (`state`) REFERENCES `con_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='This table has the list of municipalities - administrative level 3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_states`
--

DROP TABLE IF EXISTS `con_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `country` int(11) NOT NULL COMMENT 'id of country',
  `name` varchar(150) NOT NULL COMMENT 'name',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'extern identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_con_countries_con_state_idx` (`country`),
  CONSTRAINT `fk_con_countries_con_state` FOREIGN KEY (`country`) REFERENCES `con_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table has the list of states - administrative level 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_answers`
--

DROP TABLE IF EXISTS `far_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_answers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `value_raw` text COMMENT 'the value which has taken in field',
  `value_fixed` text NOT NULL COMMENT 'the value which has been transformed ',
  `validated` tinyint(4) NOT NULL COMMENT 'it sets if the answer could be used to analyze or not',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_far_answers_idx` (`event`),
  KEY `fk_frm_questions_far_answers_idx` (`question`),
  CONSTRAINT `fk_far_production_events_far_answers` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_answers` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_farms`
--

DROP TABLE IF EXISTS `far_farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_farms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `farmer` bigint(20) NOT NULL COMMENT 'id of person who is the owner of the farm',
  `name` varchar(250) NOT NULL COMMENT 'farm name',
  `latitude` double NOT NULL COMMENT 'decimal latitud [-90,90]. place where is located the house',
  `longitude` double NOT NULL COMMENT 'decimal longitud [-180,180]. place where is located the house',
  `location_comments` varchar(700) DEFAULT NULL COMMENT 'hint for arriving to the farm',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the farm is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external indicator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_soc_people_far_farms_farmer_idx` (`farmer`),
  CONSTRAINT `fk_soc_people_far_farms_farmer` FOREIGN KEY (`farmer`) REFERENCES `soc_people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='This table has the information about farms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_plots`
--

DROP TABLE IF EXISTS `far_plots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_plots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `farm` bigint(20) NOT NULL COMMENT 'id of farm which it belongs',
  `name` varchar(500) NOT NULL COMMENT 'name of plot',
  `latitude` double NOT NULL COMMENT 'decimal latitud [-90,90]. place where is located the plot',
  `longitude` double NOT NULL COMMENT 'decimal longitud [-180,180]. place where is located the plot',
  `altitude` double NOT NULL COMMENT 'distance above sea level',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the plot is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external indicator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_far_farms_far_plots_idx` (`farm`),
  CONSTRAINT `fk_far_farms_far_plots` FOREIGN KEY (`farm`) REFERENCES `far_farms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='This table has the information about farms plots';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_production_events`
--

DROP TABLE IF EXISTS `far_production_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_production_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `plot` bigint(20) NOT NULL COMMENT 'id of plot',
  `form` int(11) NOT NULL COMMENT 'id of form',
  `technical` bigint(20) NOT NULL COMMENT 'id of person who supports the event',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the production event is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` varchar(45) NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_far_plots_far_production_events_idx` (`plot`),
  KEY `fk_frm_forms_far_production_events_idx` (`form`),
  KEY `fk_soc_technical_assitants_far_production_events_idx` (`technical`),
  CONSTRAINT `fk_far_plots_far_production_events` FOREIGN KEY (`plot`) REFERENCES `far_plots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_forms_far_production_events` FOREIGN KEY (`form`) REFERENCES `frm_forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_soc_technical_assitants_far_production_events` FOREIGN KEY (`technical`) REFERENCES `soc_technical_assistants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='This table has the history about production events in';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_responses_bool`
--

DROP TABLE IF EXISTS `far_responses_bool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_responses_bool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `raw_value` tinyint(4) DEFAULT NULL COMMENT 'the value which has taken in field',
  `fixed_value` tinyint(4) DEFAULT NULL COMMENT 'the value which has been transformed ',
  `validated` tinyint(4) NOT NULL COMMENT 'it sets if the answer was validated correctly or not',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_far_responses_bool_idx` (`event`),
  KEY `fk_frm_questions_far_responses_bool_idx` (`question`),
  CONSTRAINT `fk_far_production_events_far_responses_bool` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_responses_bool` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event for question with the boolean values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_responses_date`
--

DROP TABLE IF EXISTS `far_responses_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_responses_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `raw_value` datetime DEFAULT NULL COMMENT 'the value which has taken in field',
  `fixed_value` datetime DEFAULT NULL COMMENT 'the value which has been transformed ',
  `validated` tinyint(4) NOT NULL COMMENT 'it sets if the answer was validated correctly or not',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_frm_responses_date_idx` (`event`),
  KEY `fk_frm_questions_far_responses_date_idx` (`question`),
  CONSTRAINT `fk_far_production_events_frm_responses_date` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_responses_date` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event for question with the date values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_responses_numeric`
--

DROP TABLE IF EXISTS `far_responses_numeric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_responses_numeric` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `raw_value` double DEFAULT NULL COMMENT 'the value which has taken in field',
  `fixed_value` double DEFAULT NULL COMMENT 'the value which has been transformed ',
  `raw_units` varchar(45) DEFAULT NULL COMMENT 'original units',
  `fixed_units` varchar(45) DEFAULT NULL COMMENT 'fixed units',
  `validated` tinyint(4) NOT NULL COMMENT 'it sets if the answer was validated correctly or not',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_far_responses_numeric_idx` (`event`),
  KEY `fk_frm_questions_far_responses_numeric_idx` (`question`),
  CONSTRAINT `fk_far_production_events_far_responses_numeric` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_responses_numeric` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1887 DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event for question with the numeric values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_responses_options`
--

DROP TABLE IF EXISTS `far_responses_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_responses_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `option` int(11) NOT NULL COMMENT 'id of option',
  `value` varchar(250) NOT NULL COMMENT 'name of option. it is to keep the traceability in each answer',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_far_responses_options_idx` (`event`),
  KEY `fk_frm_question_far_responses_options_idx` (`question`),
  KEY `fk_frm_options_far_responses_options_idx` (`option`),
  CONSTRAINT `fk_far_production_events_far_responses_options` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_options_far_responses_options` FOREIGN KEY (`option`) REFERENCES `frm_options` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_responses_options` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1747 DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event for question with the unique or multiple type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `far_responses_text`
--

DROP TABLE IF EXISTS `far_responses_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `far_responses_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `event` bigint(20) NOT NULL COMMENT 'id of production event',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `raw_value` text COMMENT 'the value which has taken in field',
  `fixed_value` text COMMENT 'the value which has been transformed ',
  `validated` tinyint(4) NOT NULL COMMENT 'it sets if the answer was validated correctly or not',
  PRIMARY KEY (`id`),
  KEY `fk_far_production_events_far_responses_text_idx` (`event`),
  KEY `fk_frm_questions_far_responses_text_idx` (`question`),
  CONSTRAINT `fk_far_production_events_far_responses_text` FOREIGN KEY (`event`) REFERENCES `far_production_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_questions_far_responses_text` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8 COMMENT='This table has the forms answers of each production event for question with the text values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_blocks`
--

DROP TABLE IF EXISTS `frm_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(250) NOT NULL COMMENT 'machine name of the section',
  `title` varchar(250) NOT NULL COMMENT 'block title',
  `description` varchar(500) NOT NULL COMMENT 'short description of the block',
  `repeat` tinyint(4) NOT NULL COMMENT 'it sets if the block can repeat again',
  `times` int(11) NOT NULL COMMENT 'it sets the amount times that a block can repeat',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the block is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='This table has the list of blocks or sections to add to the forms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_blocks_forms`
--

DROP TABLE IF EXISTS `frm_blocks_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_blocks_forms` (
  `form` int(11) NOT NULL COMMENT 'id of form',
  `block` int(11) NOT NULL COMMENT 'id of block',
  `order` int(11) NOT NULL COMMENT 'It sets the order of block in each form. between the value is higher will be lower',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the configuration is able or disable',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`form`,`block`),
  KEY `fk_frm_blocks_frm_blocks_frm_forms_idx` (`block`),
  KEY `fk_frm_forms_frm_blocks_frm_forms_idx` (`form`),
  CONSTRAINT `fk_frm_blocks_frm_blocks_frm_forms` FOREIGN KEY (`block`) REFERENCES `frm_blocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_frm_forms_frm_blocks_frm_forms` FOREIGN KEY (`form`) REFERENCES `frm_forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table has the relationship between forms and blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_forms`
--

DROP TABLE IF EXISTS `frm_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(250) NOT NULL COMMENT 'machine name of the form',
  `title` varchar(250) NOT NULL COMMENT 'form title',
  `description` varchar(500) NOT NULL COMMENT 'short description of the form',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the form is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='This table has the list of forms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_forms_settings`
--

DROP TABLE IF EXISTS `frm_forms_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_forms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `form` int(11) NOT NULL COMMENT 'id of form',
  `app` enum('all','odk','pdi') NOT NULL COMMENT 'it sets the application which is gonna be used [all, odk, pdi]',
  `name` varchar(500) NOT NULL COMMENT 'name of variable for setttings',
  `value` text NOT NULL COMMENT 'value of variable for setttings',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_frm_forms_frm_forms_settings_idx` (`form`),
  CONSTRAINT `fk_frm_forms_frm_forms_settings` FOREIGN KEY (`form`) REFERENCES `frm_forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='This table has the list of settings for forms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_options`
--

DROP TABLE IF EXISTS `frm_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `name` varchar(250) NOT NULL COMMENT 'machine name of the option',
  `label` varchar(400) NOT NULL COMMENT 'label for option',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the option is able or disable',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_frm_questions_frm_options_idx` (`question`),
  CONSTRAINT `fk_frm_questions_frm_options` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8 COMMENT='This table has the list of options for questions, the questions have to be unique or multiple';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_questions`
--

DROP TABLE IF EXISTS `frm_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `block` int(11) NOT NULL COMMENT 'id of block',
  `name` varchar(250) NOT NULL COMMENT 'machine name of the question',
  `label` varchar(400) NOT NULL COMMENT 'label for question',
  `description` varchar(500) NOT NULL COMMENT 'short description of the question',
  `type` enum('string','int','double','bool','date','time','datetime','unique','multiple') NOT NULL COMMENT 'it sets the type of answer that it will hope gets in the question [string, int, ''double, bool, unique, multiple, geopoint, date, time, datetime, file)]',
  `order` int(11) NOT NULL COMMENT 'It sets the order of the question in each block. between the value is higher will be lower',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if the question is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_frm_blocks_frm_questions_idx` (`block`),
  CONSTRAINT `fk_frm_blocks_frm_questions` FOREIGN KEY (`block`) REFERENCES `frm_blocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8 COMMENT='This table has the list of questions for the forms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frm_questions_rules`
--

DROP TABLE IF EXISTS `frm_questions_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_questions_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `question` int(11) NOT NULL COMMENT 'id of question',
  `app` enum('all','odk','pdi') NOT NULL COMMENT 'it sets the application which is gonna be validated [all, odk, pdi]',
  `type` enum('required','constraint','relevant','appearance','calculation','choice_filter') NOT NULL COMMENT 'it sets which is kind of validation to check [required, constraint, relevant, appearance, calculation, choice_filter]',
  `message` text COMMENT 'this message will show when the rule will be broken',
  `rule` text NOT NULL COMMENT 'rule in terms of application',
  PRIMARY KEY (`id`),
  KEY `fk_frm_questions_frm_questions_rules_idx` (`question`),
  CONSTRAINT `fk_frm_questions_frm_questions_rules` FOREIGN KEY (`question`) REFERENCES `frm_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1292 DEFAULT CHARSET=utf8 COMMENT='This table has the list of rules for each question. A rule depends of the application in where is gonna be validated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soc_associations`
--

DROP TABLE IF EXISTS `soc_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soc_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(250) NOT NULL COMMENT 'name of association',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if association is able or disable',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table has the information about associations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soc_people`
--

DROP TABLE IF EXISTS `soc_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soc_people` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `municipality` int(11) NOT NULL COMMENT 'id of municipality where person lives',
  `kind_document` enum('N','P','O') NOT NULL COMMENT 'kind of document of person. N = national document, P = passaport, O = other',
  `sex` enum('F','M','O') NOT NULL COMMENT 'sex of person. F = female, M = male, O = other',
  `document` varchar(45) NOT NULL COMMENT 'number of identification of the person',
  `name` varchar(100) NOT NULL COMMENT 'name of person',
  `last_name` varchar(100) NOT NULL COMMENT 'last name of person',
  `cellphone` varchar(25) NOT NULL COMMENT 'number of cellphone person',
  `address` varchar(100) NOT NULL COMMENT 'address where person lives',
  `email` varchar(500) DEFAULT NULL COMMENT 'email',
  `ext_id` varchar(100) DEFAULT NULL COMMENT 'external identificator',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_con_municipalities_soc_people_idx` (`municipality`),
  CONSTRAINT `fk_con_municipalities_soc_people` FOREIGN KEY (`municipality`) REFERENCES `con_municipalities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='This table has the information about people. It has personal information about farmers and technical assistans';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soc_technical_assistants`
--

DROP TABLE IF EXISTS `soc_technical_assistants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soc_technical_assistants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `person` bigint(20) NOT NULL COMMENT 'id of person - it sets the personal information of technical assistant',
  `association` int(11) NOT NULL COMMENT 'id of association which is belonged',
  `enable` tinyint(4) NOT NULL COMMENT 'it sets if technical assistant is able or disable',
  `created` datetime NOT NULL COMMENT 'date when it was created',
  `updated` datetime NOT NULL COMMENT 'date when it was updated',
  PRIMARY KEY (`id`),
  KEY `fk_soc_people_soc_technical_assistants_idx` (`person`),
  KEY `fk_soc_associations_soc_technical_assistants_idx` (`association`),
  CONSTRAINT `fk_soc_associations_soc_technical_assistants` FOREIGN KEY (`association`) REFERENCES `soc_associations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_soc_people_soc_technical_assistants` FOREIGN KEY (`person`) REFERENCES `soc_people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table has the information about who people are technical assistants';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-24 14:50:01
