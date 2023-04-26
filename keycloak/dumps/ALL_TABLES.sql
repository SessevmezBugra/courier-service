-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('14909f0e-8565-4320-8fc3-fe9dd72b415b','e5913f6a-d8e7-4af1-b155-bfdbe02fd495');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('002d8f87-286f-4ff7-97d9-e2188a72c4a7',NULL,'idp-create-user-if-unique','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','70b911f8-2f01-47c1-ba8c-be6dd201f21f',2,10,_binary '\0',NULL,'b3ff9839-9af6-457a-92e2-65f49c41ed4a'),('01a23c25-27eb-45e4-ac41-fc37b2ba955e',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','dbe14ab2-58ca-4f78-97f1-de4fa8fff9bf',1,30,_binary '','cc207243-d08c-494d-85ab-782f2f6d0a67',NULL),('022c2952-6b16-4e01-a1ff-29c99125f4e5',NULL,'registration-user-creation','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c7e03d5e-4695-49e2-b9ca-f74b033677d6',0,20,_binary '\0',NULL,NULL),('045c11b1-ec9d-4dca-8bb7-5ea55fdd1640',NULL,'direct-grant-validate-password','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','dbe14ab2-58ca-4f78-97f1-de4fa8fff9bf',0,20,_binary '\0',NULL,NULL),('053d04a1-0b67-4f41-9fcf-f74c308950ab',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','02f07c40-a6d7-46e6-963c-2be57e0f6a8b',2,20,_binary '','6002b327-bf83-4e2b-b4e4-305f6fd155c1',NULL),('0afdc266-133d-4bd9-bf64-54fd013ceef7',NULL,'auth-spnego','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','69c93174-f628-4e6b-9afc-58be326ed173',3,30,_binary '\0',NULL,NULL),('0e60f748-1273-4a8c-b59d-aa7d1a7f38a4',NULL,'conditional-user-configured','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','3f09eed8-f05b-4414-a5ae-0988b9f389d7',0,10,_binary '\0',NULL,NULL),('108549c0-8eee-4bab-aac6-352ecc3700f4',NULL,'conditional-user-configured','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','ab7cea6c-7ff5-4dff-b61f-a1e66768f1bc',0,10,_binary '\0',NULL,NULL),('148a5b28-e8bf-4616-b756-1eb7f1c8fbf4',NULL,'conditional-user-configured','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','9aa8388d-bfc2-47db-8dc4-cf58c703acaa',0,10,_binary '\0',NULL,NULL),('1832e745-8d91-4c5d-9299-ed7d6ec19574',NULL,'http-basic-authenticator','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','ea0e83a9-dfb6-4f1e-9140-3b3b365642b1',0,10,_binary '\0',NULL,NULL),('1ae7f6f1-602d-4e61-a1cd-e46a67b9013e',NULL,'direct-grant-validate-username','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','dbe14ab2-58ca-4f78-97f1-de4fa8fff9bf',0,10,_binary '\0',NULL,NULL),('1ded6bb3-05e4-44ff-9c90-b728b249eba6',NULL,'auth-username-password-form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','29cb428e-290d-4eb5-b5f4-31ad2b9cf3ad',0,10,_binary '\0',NULL,NULL),('200a6f32-ac47-43bc-9b88-10ea196f3c6f',NULL,'auth-otp-form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','a5cc7397-377b-4694-8092-a2ee6ccd87be',0,20,_binary '\0',NULL,NULL),('20304fc5-a4dc-422e-a72f-d6bb9f760b43',NULL,'direct-grant-validate-password','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','fdcf216d-93e9-4449-a79b-09915dec5dce',0,20,_binary '\0',NULL,NULL),('2175323e-bdbf-4868-b4aa-bd3ffe3a3ebc',NULL,'client-x509','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1cea36f1-e933-4685-9f94-904983f38aa7',2,40,_binary '\0',NULL,NULL),('2c23ecb2-7fe6-4f15-9670-99df31a10f73',NULL,'no-cookie-redirect','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','08a413a8-6dbf-4a8b-ae63-ea43a8506cdb',0,10,_binary '\0',NULL,NULL),('2d6476ed-6f04-40cb-9b2e-0f81b39694e5',NULL,'auth-otp-form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','f9793705-a145-458d-a0cf-d13e6e2d6c37',0,20,_binary '\0',NULL,NULL),('2da933d9-1b4e-4a4c-a757-03dac363c110',NULL,'conditional-user-configured','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','cc207243-d08c-494d-85ab-782f2f6d0a67',0,10,_binary '\0',NULL,NULL),('320efbcb-0ba3-45fd-a22f-785b0ff5861b',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','08a413a8-6dbf-4a8b-ae63-ea43a8506cdb',0,20,_binary '','69c93174-f628-4e6b-9afc-58be326ed173',NULL),('360d7210-431b-41ac-82a4-c1b3e5f5b5e6',NULL,'idp-email-verification','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','02f07c40-a6d7-46e6-963c-2be57e0f6a8b',2,10,_binary '\0',NULL,NULL),('37f1242d-caec-4ab2-bba2-d0cc1d9cdef1',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','2e840722-60fa-44e3-b647-567644e08be9',1,20,_binary '','a5cc7397-377b-4694-8092-a2ee6ccd87be',NULL),('3c1206c7-889c-4e5a-b578-9dba4b54ed36',NULL,'conditional-user-configured','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','a5cc7397-377b-4694-8092-a2ee6ccd87be',0,10,_binary '\0',NULL,NULL),('3f92e373-dc84-4ca7-9e03-90c2fffe20ee',NULL,'auth-otp-form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','ab7cea6c-7ff5-4dff-b61f-a1e66768f1bc',0,20,_binary '\0',NULL,NULL),('440ca931-4fc7-45b3-b790-741ac2382230',NULL,'client-secret','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1cea36f1-e933-4685-9f94-904983f38aa7',2,10,_binary '\0',NULL,NULL),('46860038-c8c3-429a-a4dc-1c711c166b13',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','eb368547-7e3f-4f1d-8497-0b77f1f3b5de',2,30,_binary '','29cb428e-290d-4eb5-b5f4-31ad2b9cf3ad',NULL),('486eeb86-63ab-45ac-9590-4c214b49843b',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','8dcf4208-84b8-42d5-8169-efe74838f6d8',1,20,_binary '','412ebb2d-921b-4c88-8c51-c1a1e2c6fb3b',NULL),('48fa8adc-96a2-451c-a991-040894ea8959',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','29cb428e-290d-4eb5-b5f4-31ad2b9cf3ad',1,20,_binary '','f9793705-a145-458d-a0cf-d13e6e2d6c37',NULL),('49b66d68-b996-4ded-86ff-cb77a6714c21',NULL,'basic-auth-otp','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','69c93174-f628-4e6b-9afc-58be326ed173',3,20,_binary '\0',NULL,NULL),('4b2f9814-e8a3-4804-94f4-30a836860222',NULL,'identity-provider-redirector','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','eb368547-7e3f-4f1d-8497-0b77f1f3b5de',2,25,_binary '\0',NULL,NULL),('4c461874-2819-4646-9b58-9578ca4d4e9b',NULL,'idp-review-profile','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1eed7501-8d89-4851-9b13-8f41f2f39ba4',0,10,_binary '\0',NULL,'f0d48d8f-a0f5-4454-8525-370127629ccb'),('4e89c288-9020-4b73-b187-c3786efca132',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d5a4a85e-ba0d-48da-bdcb-82c398ae67fa',1,40,_binary '','3f09eed8-f05b-4414-a5ae-0988b9f389d7',NULL),('523b4cb2-324c-448a-a4ca-4938ad538647',NULL,'registration-password-action','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','57130b41-9a97-4258-b4ed-7161143c56cd',0,50,_binary '\0',NULL,NULL),('563ce9e5-950c-4a5e-8464-0d4135e7236d',NULL,'registration-password-action','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c7e03d5e-4695-49e2-b9ca-f74b033677d6',0,50,_binary '\0',NULL,NULL),('56d380e4-2a6e-4c98-9b04-b86b73350eff',NULL,'http-basic-authenticator','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','555282c3-6add-48a9-9a3d-8f1973174282',0,10,_binary '\0',NULL,NULL),('59f26f1c-9a00-4122-9918-b5fe9cd9c1dc',NULL,'reset-password','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d5a4a85e-ba0d-48da-bdcb-82c398ae67fa',0,30,_binary '\0',NULL,NULL),('5dcb52a5-dab5-43b0-869b-7d50bc08d9b6',NULL,'auth-cookie','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','eb368547-7e3f-4f1d-8497-0b77f1f3b5de',2,10,_binary '\0',NULL,NULL),('624fb863-16fb-4f50-8899-c096d52272c1',NULL,'auth-spnego','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','eb368547-7e3f-4f1d-8497-0b77f1f3b5de',3,20,_binary '\0',NULL,NULL),('6299fedd-1baf-4a9b-a200-d04ac71e412e',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','70b911f8-2f01-47c1-ba8c-be6dd201f21f',2,20,_binary '','051083bd-db5b-4cac-b2c0-bc78a5b858dd',NULL),('636d4ab2-d9e4-496b-a7b4-659ca44c88ea',NULL,'client-secret','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','d5c16d23-71b3-4187-85f7-996a2c9070b3',2,10,_binary '\0',NULL,NULL),('655f9cb9-7634-4f74-9c39-596d98211e6f',NULL,'registration-profile-action','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','57130b41-9a97-4258-b4ed-7161143c56cd',0,40,_binary '\0',NULL,NULL),('69681be7-4221-4538-9464-2518d6282631',NULL,'client-jwt','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1cea36f1-e933-4685-9f94-904983f38aa7',2,20,_binary '\0',NULL,NULL),('6a8ef06c-0b01-43e4-beaf-eb50885555ef',NULL,'conditional-user-configured','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','412ebb2d-921b-4c88-8c51-c1a1e2c6fb3b',0,10,_binary '\0',NULL,NULL),('6ab3248c-4879-42a1-b86a-543605da6a24',NULL,'idp-username-password-form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','6002b327-bf83-4e2b-b4e4-305f6fd155c1',0,10,_binary '\0',NULL,NULL),('71136172-7e37-4974-94f2-21d43dbd9c78',NULL,'registration-page-form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','b16a7861-2289-450b-873c-af9ac0367b2f',0,10,_binary '','c7e03d5e-4695-49e2-b9ca-f74b033677d6',NULL),('75b856ee-850e-4d90-973f-87d806bd6937',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','74789af9-1055-4af0-8da4-f798bdf1cd2e',2,20,_binary '','5aa3f910-8526-4c9a-9a30-ad9295c1eada',NULL),('768ed8e1-49f8-4cc6-8e22-58c804e5caf1',NULL,'client-x509','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','d5c16d23-71b3-4187-85f7-996a2c9070b3',2,40,_binary '\0',NULL,NULL),('76f52df2-0eab-4b48-b3f9-ec5c5e50876b',NULL,'direct-grant-validate-otp','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','cc207243-d08c-494d-85ab-782f2f6d0a67',0,20,_binary '\0',NULL,NULL),('78cce2d8-583e-4d09-a509-370bf31d97ed',NULL,'no-cookie-redirect','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','5e7ae147-c1ae-472d-9b49-e2e1aa23b50a',0,10,_binary '\0',NULL,NULL),('7bf2ae65-e515-4cb6-befd-883cebd51851',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','78d6a920-b9b6-494a-a6cc-53b4776a1243',0,20,_binary '','70b911f8-2f01-47c1-ba8c-be6dd201f21f',NULL),('809adcee-5cb4-4ef1-baef-2b325b36bbac',NULL,'conditional-user-configured','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','f9793705-a145-458d-a0cf-d13e6e2d6c37',0,10,_binary '\0',NULL,NULL),('80b5cb90-f82c-46e0-8d7f-8bb4ac8c4704',NULL,'idp-username-password-form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','8dcf4208-84b8-42d5-8169-efe74838f6d8',0,10,_binary '\0',NULL,NULL),('80ee9085-8abc-41a4-b9b0-f76061ca7540',NULL,'registration-recaptcha-action','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','57130b41-9a97-4258-b4ed-7161143c56cd',3,60,_binary '\0',NULL,NULL),('81baf6f7-3e02-47a6-8c23-8fc98132ffda',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','5e7ae147-c1ae-472d-9b49-e2e1aa23b50a',0,20,_binary '','82d20d31-d2b9-48a0-95fa-010ed0ccfce4',NULL),('85e948ea-56d2-4c5e-8e58-2bd067e7f52a',NULL,'registration-recaptcha-action','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c7e03d5e-4695-49e2-b9ca-f74b033677d6',3,60,_binary '\0',NULL,NULL),('8a7e9bf6-d962-4925-b4dd-890b5fbc952c',NULL,'direct-grant-validate-username','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','fdcf216d-93e9-4449-a79b-09915dec5dce',0,10,_binary '\0',NULL,NULL),('8cfc8ed9-e158-4afd-b9ff-10265c5968ca',NULL,'idp-confirm-link','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','5aa3f910-8526-4c9a-9a30-ad9295c1eada',0,10,_binary '\0',NULL,NULL),('90de2f61-6cae-4b99-81b5-6d72096a01a8',NULL,'auth-spnego','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','bbd56b64-39e5-4dc0-a2b5-729821b5997c',3,20,_binary '\0',NULL,NULL),('9158e4e4-c735-491a-a5bf-7e49884a8fa5',NULL,'idp-email-verification','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','fb0857fe-633d-4991-b543-119ecd1a7cb6',2,10,_binary '\0',NULL,NULL),('97339af7-3327-4b52-9a66-82799875a57b',NULL,'identity-provider-redirector','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','bbd56b64-39e5-4dc0-a2b5-729821b5997c',2,25,_binary '\0',NULL,NULL),('97ebc158-8766-4f1e-9b4d-7872cd489a3e',NULL,'idp-confirm-link','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','051083bd-db5b-4cac-b2c0-bc78a5b858dd',0,10,_binary '\0',NULL,NULL),('9916da23-85eb-4f2f-9157-be43e739205d',NULL,'docker-http-basic-authenticator','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','47e649df-6358-4dca-a9f0-cfe1fd54a3cc',0,10,_binary '\0',NULL,NULL),('9cf7c78b-67d6-4d4c-99c3-72875e52750f',NULL,'reset-otp','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','3f09eed8-f05b-4414-a5ae-0988b9f389d7',0,20,_binary '\0',NULL,NULL),('a288cd1b-c888-4710-854b-09952fbeb569',NULL,'basic-auth','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','82d20d31-d2b9-48a0-95fa-010ed0ccfce4',0,10,_binary '\0',NULL,NULL),('a8388a91-8299-4c56-ac47-c959e1dc2b7f',NULL,'auth-otp-form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','412ebb2d-921b-4c88-8c51-c1a1e2c6fb3b',0,20,_binary '\0',NULL,NULL),('ac21d8c8-4976-4c7a-8344-f3a8bbdea927',NULL,'basic-auth','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','69c93174-f628-4e6b-9afc-58be326ed173',0,10,_binary '\0',NULL,NULL),('bc151391-49b0-41ed-ba5d-b20ae800c3fd',NULL,'registration-user-creation','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','57130b41-9a97-4258-b4ed-7161143c56cd',0,20,_binary '\0',NULL,NULL),('bd0cc625-e5b8-45cc-90b4-9a836f705603',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','051083bd-db5b-4cac-b2c0-bc78a5b858dd',0,20,_binary '','02f07c40-a6d7-46e6-963c-2be57e0f6a8b',NULL),('c01afb03-c603-431f-893d-882cfaa16593',NULL,'reset-credentials-choose-user','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d5a4a85e-ba0d-48da-bdcb-82c398ae67fa',0,10,_binary '\0',NULL,NULL),('c6b976cd-0b82-4d5d-a527-496f0645bd8c',NULL,'docker-http-basic-authenticator','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','272a564c-031e-499f-9bcb-28b5b989ef91',0,10,_binary '\0',NULL,NULL),('c9b4aa7b-db87-4bce-bda3-38dbef538d8b',NULL,'registration-profile-action','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c7e03d5e-4695-49e2-b9ca-f74b033677d6',0,40,_binary '\0',NULL,NULL),('ca46f174-0d69-4c15-854d-923b589e926c',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','fdcf216d-93e9-4449-a79b-09915dec5dce',1,30,_binary '','9aa8388d-bfc2-47db-8dc4-cf58c703acaa',NULL),('cc7c8e31-8d2b-4049-9778-663820e9b1a2',NULL,'client-secret-jwt','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','d5c16d23-71b3-4187-85f7-996a2c9070b3',2,30,_binary '\0',NULL,NULL),('ccbd8841-fcb4-4fa1-b768-7f137cb5c995',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7116fad7-7079-4f89-95c6-a90665d1a8a2',1,40,_binary '','f1a529a9-fb62-41ba-95e1-a0f4eec5c500',NULL),('d0c8f340-1819-4704-a9ee-0fe207971381',NULL,'reset-password','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7116fad7-7079-4f89-95c6-a90665d1a8a2',0,30,_binary '\0',NULL,NULL),('d1c4d652-d837-4151-83db-a6647e2f283c',NULL,'reset-credentials-choose-user','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7116fad7-7079-4f89-95c6-a90665d1a8a2',0,10,_binary '\0',NULL,NULL),('d43dbd5b-d528-4fdf-9155-a1fb10573057',NULL,'registration-page-form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','a8a5cf55-8a83-4918-b243-55a19461fb0a',0,10,_binary '','57130b41-9a97-4258-b4ed-7161143c56cd',NULL),('d4860c2e-327a-4522-b9b2-ba7d936093f8',NULL,'client-jwt','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','d5c16d23-71b3-4187-85f7-996a2c9070b3',2,20,_binary '\0',NULL,NULL),('d5d5a2da-57a5-4896-be35-7c93723ddcd3',NULL,'auth-username-password-form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','2e840722-60fa-44e3-b647-567644e08be9',0,10,_binary '\0',NULL,NULL),('d6d7f3e5-49f5-4bc5-a674-7a2a22e21210',NULL,'conditional-user-configured','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f1a529a9-fb62-41ba-95e1-a0f4eec5c500',0,10,_binary '\0',NULL,NULL),('d8972e05-d7af-41ed-8fb5-3659ae5bfeaa',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','6002b327-bf83-4e2b-b4e4-305f6fd155c1',1,20,_binary '','ab7cea6c-7ff5-4dff-b61f-a1e66768f1bc',NULL),('d89e659a-7490-4935-b1b1-ce9c5fe87f59',NULL,'direct-grant-validate-otp','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','9aa8388d-bfc2-47db-8dc4-cf58c703acaa',0,20,_binary '\0',NULL,NULL),('e0852dae-1fc1-4143-8283-6b6c11586023',NULL,'auth-cookie','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','bbd56b64-39e5-4dc0-a2b5-729821b5997c',2,10,_binary '\0',NULL,NULL),('e0ff3912-4352-46ac-91df-b75626e9b826',NULL,'reset-credential-email','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7116fad7-7079-4f89-95c6-a90665d1a8a2',0,20,_binary '\0',NULL,NULL),('e3c33115-c4b7-4af2-8e65-9fe5847ceb4c',NULL,'reset-credential-email','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d5a4a85e-ba0d-48da-bdcb-82c398ae67fa',0,20,_binary '\0',NULL,NULL),('e806711d-e3cb-4be7-86b3-eeadd92ac70c',NULL,'basic-auth-otp','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','82d20d31-d2b9-48a0-95fa-010ed0ccfce4',3,20,_binary '\0',NULL,NULL),('e87bd7a4-9065-4faf-b704-def247debda4',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1eed7501-8d89-4851-9b13-8f41f2f39ba4',0,20,_binary '','74789af9-1055-4af0-8da4-f798bdf1cd2e',NULL),('e9005b7b-cd0c-4251-b348-cb8e9f3e7296',NULL,'idp-review-profile','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','78d6a920-b9b6-494a-a6cc-53b4776a1243',0,10,_binary '\0',NULL,'4a86f97d-1dd0-40d7-a8d8-127241530fb4'),('e9888552-8a86-4976-90c7-7c8033a003e5',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','5aa3f910-8526-4c9a-9a30-ad9295c1eada',0,20,_binary '','fb0857fe-633d-4991-b543-119ecd1a7cb6',NULL),('ef99bfbd-f800-4902-a281-ec3613a97643',NULL,'client-secret-jwt','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1cea36f1-e933-4685-9f94-904983f38aa7',2,30,_binary '\0',NULL,NULL),('f470b6be-ee2d-461b-bc98-6b9a716504df',NULL,NULL,'be56e6b2-8164-47ac-8780-e1c5e3bf60aa','bbd56b64-39e5-4dc0-a2b5-729821b5997c',2,30,_binary '','2e840722-60fa-44e3-b647-567644e08be9',NULL),('f5f240f1-8e8d-498d-84c3-45b805a8ab7c',NULL,'auth-spnego','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','82d20d31-d2b9-48a0-95fa-010ed0ccfce4',3,30,_binary '\0',NULL,NULL),('fa48415f-2cb8-49c5-97ce-fa00c235836a',NULL,'idp-create-user-if-unique','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','74789af9-1055-4af0-8da4-f798bdf1cd2e',2,10,_binary '\0',NULL,'50ba94c8-b6bf-46f1-bbb9-0df259fa36b7'),('fb8a0274-67f4-46d7-8fba-b7d4805ea8c0',NULL,NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','fb0857fe-633d-4991-b543-119ecd1a7cb6',2,20,_binary '','8dcf4208-84b8-42d5-8169-efe74838f6d8',NULL),('ffecbc9e-ce0a-4db7-b2d1-fe3a9f0f2dde',NULL,'reset-otp','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f1a529a9-fb62-41ba-95e1-a0f4eec5c500',0,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('02f07c40-a6d7-46e6-963c-2be57e0f6a8b','Account verification options','Method with which to verity the existing account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('051083bd-db5b-4cac-b2c0-bc78a5b858dd','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('08a413a8-6dbf-4a8b-ae63-ea43a8506cdb','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('1cea36f1-e933-4685-9f94-904983f38aa7','clients','Base authentication for clients','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','client-flow',_binary '',_binary ''),('1eed7501-8d89-4851-9b13-8f41f2f39ba4','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('272a564c-031e-499f-9bcb-28b5b989ef91','docker auth','Used by Docker clients to authenticate against the IDP','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('29cb428e-290d-4eb5-b5f4-31ad2b9cf3ad','forms','Username, password, otp and other auth forms.','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('2e840722-60fa-44e3-b647-567644e08be9','forms','Username, password, otp and other auth forms.','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('3f09eed8-f05b-4414-a5ae-0988b9f389d7','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('412ebb2d-921b-4c88-8c51-c1a1e2c6fb3b','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('47e649df-6358-4dca-a9f0-cfe1fd54a3cc','docker auth','Used by Docker clients to authenticate against the IDP','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('555282c3-6add-48a9-9a3d-8f1973174282','saml ecp','SAML ECP Profile Authentication Flow','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('57130b41-9a97-4258-b4ed-7161143c56cd','registration form','registration form','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','form-flow',_binary '\0',_binary ''),('5aa3f910-8526-4c9a-9a30-ad9295c1eada','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('5e7ae147-c1ae-472d-9b49-e2e1aa23b50a','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('6002b327-bf83-4e2b-b4e4-305f6fd155c1','Verify Existing Account by Re-authentication','Reauthentication of existing account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('69c93174-f628-4e6b-9afc-58be326ed173','Authentication Options','Authentication options.','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('70b911f8-2f01-47c1-ba8c-be6dd201f21f','User creation or linking','Flow for the existing/non-existing user alternatives','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('7116fad7-7079-4f89-95c6-a90665d1a8a2','reset credentials','Reset credentials for a user if they forgot their password or something','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('74789af9-1055-4af0-8da4-f798bdf1cd2e','User creation or linking','Flow for the existing/non-existing user alternatives','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('78d6a920-b9b6-494a-a6cc-53b4776a1243','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('82d20d31-d2b9-48a0-95fa-010ed0ccfce4','Authentication Options','Authentication options.','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('8dcf4208-84b8-42d5-8169-efe74838f6d8','Verify Existing Account by Re-authentication','Reauthentication of existing account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('9aa8388d-bfc2-47db-8dc4-cf58c703acaa','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('a5cc7397-377b-4694-8092-a2ee6ccd87be','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('a8a5cf55-8a83-4918-b243-55a19461fb0a','registration','registration flow','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('ab7cea6c-7ff5-4dff-b61f-a1e66768f1bc','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('b16a7861-2289-450b-873c-af9ac0367b2f','registration','registration flow','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('bbd56b64-39e5-4dc0-a2b5-729821b5997c','browser','browser based authentication','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('c7e03d5e-4695-49e2-b9ca-f74b033677d6','registration form','registration form','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','form-flow',_binary '\0',_binary ''),('cc207243-d08c-494d-85ab-782f2f6d0a67','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('d5a4a85e-ba0d-48da-bdcb-82c398ae67fa','reset credentials','Reset credentials for a user if they forgot their password or something','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('d5c16d23-71b3-4187-85f7-996a2c9070b3','clients','Base authentication for clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','client-flow',_binary '',_binary ''),('dbe14ab2-58ca-4f78-97f1-de4fa8fff9bf','direct grant','OpenID Connect Resource Owner Grant','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('ea0e83a9-dfb6-4f1e-9140-3b3b365642b1','saml ecp','SAML ECP Profile Authentication Flow','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary ''),('eb368547-7e3f-4f1d-8497-0b77f1f3b5de','browser','browser based authentication','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '',_binary ''),('f1a529a9-fb62-41ba-95e1-a0f4eec5c500','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '\0',_binary ''),('f9793705-a145-458d-a0cf-d13e6e2d6c37','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('fb0857fe-633d-4991-b543-119ecd1a7cb6','Account verification options','Method with which to verity the existing account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','basic-flow',_binary '\0',_binary ''),('fdcf216d-93e9-4449-a79b-09915dec5dce','direct grant','OpenID Connect Resource Owner Grant','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('4a86f97d-1dd0-40d7-a8d8-127241530fb4','review profile config','be56e6b2-8164-47ac-8780-e1c5e3bf60aa'),('50ba94c8-b6bf-46f1-bbb9-0df259fa36b7','create unique user config','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e'),('b3ff9839-9af6-457a-92e2-65f49c41ed4a','create unique user config','be56e6b2-8164-47ac-8780-e1c5e3bf60aa'),('f0d48d8f-a0f5-4454-8525-370127629ccb','review profile config','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('4a86f97d-1dd0-40d7-a8d8-127241530fb4','missing','update.profile.on.first.login'),('50ba94c8-b6bf-46f1-bbb9-0df259fa36b7','false','require.password.update.after.registration'),('b3ff9839-9af6-457a-92e2-65f49c41ed4a','false','require.password.update.after.registration'),('f0d48d8f-a0f5-4454-8525-370127629ccb','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0114a760-ef06-42e8-8acb-29b100774141',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('1413fb73-1f88-4846-be38-37d65378512d',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/migros/console/',_binary '\0',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7f6fa78e-8112-4488-8dec-a266080415b5',_binary '',_binary '\0','migros-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,0,_binary '\0',_binary '\0','migros Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b1127102-57bb-40d9-8eae-80ad22caba17',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b5302a7e-405d-4640-b3ce-9e30930bf4e2',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/migros/account/',_binary '\0',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/migros/account/',_binary '\0',NULL,_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',_binary '',_binary '','courier-service',0,_binary '\0','EibaodHOIeQt7HjYlptxMW9rEWEdIAsp','',_binary '\0','*',_binary '\0','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','openid-connect',-1,_binary '',_binary '\0','',_binary '','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('538f9fd9-dcee-4bee-8b17-1c71eb70867e','pkce.code.challenge.method','S256'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','post.logout.redirect.uris','+'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','post.logout.redirect.uris','+'),('b1127102-57bb-40d9-8eae-80ad22caba17','pkce.code.challenge.method','S256'),('b1127102-57bb-40d9-8eae-80ad22caba17','post.logout.redirect.uris','+'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','pkce.code.challenge.method','S256'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','post.logout.redirect.uris','+'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','post.logout.redirect.uris','+'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','pkce.code.challenge.method','S256'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','post.logout.redirect.uris','+'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','access.token.lifespan','6000'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','acr.loa.map','{}'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','backchannel.logout.revoke.offline.tokens','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','backchannel.logout.session.required','true'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','client_credentials.use_refresh_token','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','client.secret.creation.time','1681976294'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','display.on.consent.screen','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','oauth2.device.authorization.grant.enabled','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','oidc.ciba.grant.enabled','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','require.pushed.authorization.requests','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','tls.client.certificate.bound.access.tokens','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','token.response.type.bearer.lower-case','false'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','use.refresh.tokens','true');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('02fcfc94-43fd-45c6-a020-285fb5282afd','offline_access','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect built-in scope: offline_access','openid-connect'),('07d3e91b-153d-46f3-83ec-681491277122','role_list','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','SAML role list','saml'),('130b3dc7-71ea-40cc-97a1-2e73b18f46f9','address','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect built-in scope: address','openid-connect'),('1cf93d7f-d7b9-43df-95d2-2e43f2783297','address','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect built-in scope: address','openid-connect'),('1e60de03-951c-4057-b516-138d0d5c8663','web-origins','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('32c147dd-aba8-4603-ab92-41f6d27df67a','email','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect built-in scope: email','openid-connect'),('33ff7051-f19b-4f78-b242-6c265d91f05a','offline_access','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect built-in scope: offline_access','openid-connect'),('60ef6e4b-3237-4c1b-a572-cdabadaed95b','phone','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect built-in scope: phone','openid-connect'),('7ab2dd48-8ca1-4162-9ee7-caba9b1b1e07','role_list','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','SAML role list','saml'),('7fe0f941-d846-4b83-be21-6543f103ff5e','acr','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('83d2e492-a1d8-4960-bb81-73766f553d08','roles','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect scope for add user roles to the access token','openid-connect'),('97a95718-e3c7-44ba-8495-b008682c5bac','web-origins','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('9bbd0424-5f2f-4fec-9253-3d11bcf10b53','profile','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect built-in scope: profile','openid-connect'),('ada3183e-4276-4269-a17f-abf07e77738a','microprofile-jwt','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','Microprofile - JWT built-in scope','openid-connect'),('c095b916-b80b-41ef-9756-c9f8efd265f6','acr','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('c0fc6154-820d-4b43-9693-94a7fd71a1b9','roles','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect scope for add user roles to the access token','openid-connect'),('e629e355-c05a-4400-9146-943516db1490','microprofile-jwt','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','Microprofile - JWT built-in scope','openid-connect'),('e91f7994-e4cf-44b2-807b-0d83a413ee65','profile','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','OpenID Connect built-in scope: profile','openid-connect'),('f4afb4c7-f546-4ba1-af99-ff81f181bf2f','phone','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect built-in scope: phone','openid-connect'),('fbc1f020-473e-422c-9935-ecb6ae695c1b','email','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','OpenID Connect built-in scope: email','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('02fcfc94-43fd-45c6-a020-285fb5282afd','${offlineAccessScopeConsentText}','consent.screen.text'),('02fcfc94-43fd-45c6-a020-285fb5282afd','true','display.on.consent.screen'),('07d3e91b-153d-46f3-83ec-681491277122','${samlRoleListScopeConsentText}','consent.screen.text'),('07d3e91b-153d-46f3-83ec-681491277122','true','display.on.consent.screen'),('130b3dc7-71ea-40cc-97a1-2e73b18f46f9','${addressScopeConsentText}','consent.screen.text'),('130b3dc7-71ea-40cc-97a1-2e73b18f46f9','true','display.on.consent.screen'),('130b3dc7-71ea-40cc-97a1-2e73b18f46f9','true','include.in.token.scope'),('1cf93d7f-d7b9-43df-95d2-2e43f2783297','${addressScopeConsentText}','consent.screen.text'),('1cf93d7f-d7b9-43df-95d2-2e43f2783297','true','display.on.consent.screen'),('1cf93d7f-d7b9-43df-95d2-2e43f2783297','true','include.in.token.scope'),('1e60de03-951c-4057-b516-138d0d5c8663','','consent.screen.text'),('1e60de03-951c-4057-b516-138d0d5c8663','false','display.on.consent.screen'),('1e60de03-951c-4057-b516-138d0d5c8663','false','include.in.token.scope'),('32c147dd-aba8-4603-ab92-41f6d27df67a','${emailScopeConsentText}','consent.screen.text'),('32c147dd-aba8-4603-ab92-41f6d27df67a','true','display.on.consent.screen'),('32c147dd-aba8-4603-ab92-41f6d27df67a','true','include.in.token.scope'),('33ff7051-f19b-4f78-b242-6c265d91f05a','${offlineAccessScopeConsentText}','consent.screen.text'),('33ff7051-f19b-4f78-b242-6c265d91f05a','true','display.on.consent.screen'),('60ef6e4b-3237-4c1b-a572-cdabadaed95b','${phoneScopeConsentText}','consent.screen.text'),('60ef6e4b-3237-4c1b-a572-cdabadaed95b','true','display.on.consent.screen'),('60ef6e4b-3237-4c1b-a572-cdabadaed95b','true','include.in.token.scope'),('7ab2dd48-8ca1-4162-9ee7-caba9b1b1e07','${samlRoleListScopeConsentText}','consent.screen.text'),('7ab2dd48-8ca1-4162-9ee7-caba9b1b1e07','true','display.on.consent.screen'),('7fe0f941-d846-4b83-be21-6543f103ff5e','false','display.on.consent.screen'),('7fe0f941-d846-4b83-be21-6543f103ff5e','false','include.in.token.scope'),('83d2e492-a1d8-4960-bb81-73766f553d08','${rolesScopeConsentText}','consent.screen.text'),('83d2e492-a1d8-4960-bb81-73766f553d08','true','display.on.consent.screen'),('83d2e492-a1d8-4960-bb81-73766f553d08','false','include.in.token.scope'),('97a95718-e3c7-44ba-8495-b008682c5bac','','consent.screen.text'),('97a95718-e3c7-44ba-8495-b008682c5bac','false','display.on.consent.screen'),('97a95718-e3c7-44ba-8495-b008682c5bac','false','include.in.token.scope'),('9bbd0424-5f2f-4fec-9253-3d11bcf10b53','${profileScopeConsentText}','consent.screen.text'),('9bbd0424-5f2f-4fec-9253-3d11bcf10b53','true','display.on.consent.screen'),('9bbd0424-5f2f-4fec-9253-3d11bcf10b53','true','include.in.token.scope'),('ada3183e-4276-4269-a17f-abf07e77738a','false','display.on.consent.screen'),('ada3183e-4276-4269-a17f-abf07e77738a','true','include.in.token.scope'),('c095b916-b80b-41ef-9756-c9f8efd265f6','false','display.on.consent.screen'),('c095b916-b80b-41ef-9756-c9f8efd265f6','false','include.in.token.scope'),('c0fc6154-820d-4b43-9693-94a7fd71a1b9','${rolesScopeConsentText}','consent.screen.text'),('c0fc6154-820d-4b43-9693-94a7fd71a1b9','true','display.on.consent.screen'),('c0fc6154-820d-4b43-9693-94a7fd71a1b9','false','include.in.token.scope'),('e629e355-c05a-4400-9146-943516db1490','false','display.on.consent.screen'),('e629e355-c05a-4400-9146-943516db1490','true','include.in.token.scope'),('e91f7994-e4cf-44b2-807b-0d83a413ee65','${profileScopeConsentText}','consent.screen.text'),('e91f7994-e4cf-44b2-807b-0d83a413ee65','true','display.on.consent.screen'),('e91f7994-e4cf-44b2-807b-0d83a413ee65','true','include.in.token.scope'),('f4afb4c7-f546-4ba1-af99-ff81f181bf2f','${phoneScopeConsentText}','consent.screen.text'),('f4afb4c7-f546-4ba1-af99-ff81f181bf2f','true','display.on.consent.screen'),('f4afb4c7-f546-4ba1-af99-ff81f181bf2f','true','include.in.token.scope'),('fbc1f020-473e-422c-9935-ecb6ae695c1b','${emailScopeConsentText}','consent.screen.text'),('fbc1f020-473e-422c-9935-ecb6ae695c1b','true','display.on.consent.screen'),('fbc1f020-473e-422c-9935-ecb6ae695c1b','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0114a760-ef06-42e8-8acb-29b100774141','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('0114a760-ef06-42e8-8acb-29b100774141','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('0114a760-ef06-42e8-8acb-29b100774141','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('0114a760-ef06-42e8-8acb-29b100774141','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('0114a760-ef06-42e8-8acb-29b100774141','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('0114a760-ef06-42e8-8acb-29b100774141','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('0114a760-ef06-42e8-8acb-29b100774141','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('0114a760-ef06-42e8-8acb-29b100774141','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('0114a760-ef06-42e8-8acb-29b100774141','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('1413fb73-1f88-4846-be38-37d65378512d','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('1413fb73-1f88-4846-be38-37d65378512d','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('1413fb73-1f88-4846-be38-37d65378512d','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('1413fb73-1f88-4846-be38-37d65378512d','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('1413fb73-1f88-4846-be38-37d65378512d','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('1413fb73-1f88-4846-be38-37d65378512d','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('1413fb73-1f88-4846-be38-37d65378512d','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('1413fb73-1f88-4846-be38-37d65378512d','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('1413fb73-1f88-4846-be38-37d65378512d','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('538f9fd9-dcee-4bee-8b17-1c71eb70867e','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('54eee947-ee4b-45c4-936f-a2f8cf7bd611','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('8def3445-6bfa-439d-b48f-9640c3b80bc3','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('8def3445-6bfa-439d-b48f-9640c3b80bc3','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('8def3445-6bfa-439d-b48f-9640c3b80bc3','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('8def3445-6bfa-439d-b48f-9640c3b80bc3','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('8def3445-6bfa-439d-b48f-9640c3b80bc3','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('b1127102-57bb-40d9-8eae-80ad22caba17','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('b1127102-57bb-40d9-8eae-80ad22caba17','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('b1127102-57bb-40d9-8eae-80ad22caba17','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('b1127102-57bb-40d9-8eae-80ad22caba17','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('b1127102-57bb-40d9-8eae-80ad22caba17','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('b1127102-57bb-40d9-8eae-80ad22caba17','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('b1127102-57bb-40d9-8eae-80ad22caba17','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('b1127102-57bb-40d9-8eae-80ad22caba17','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('b1127102-57bb-40d9-8eae-80ad22caba17','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('b5302a7e-405d-4640-b3ce-9e30930bf4e2','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('ba0cfa9d-8972-43f8-91c4-5f06ac83af8a','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('f46d8878-4fa8-4e7c-abf2-4ba929888b2d','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary ''),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('02fcfc94-43fd-45c6-a020-285fb5282afd','bac5b47b-d355-4c82-8df2-d21984119083'),('33ff7051-f19b-4f78-b242-6c265d91f05a','895a1815-b3d9-49fe-b2bf-e5b0ff8b5b6e');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('1c4639af-7529-41d5-82cd-7f77b4029def','aes-generated','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','aes-generated','org.keycloak.keys.KeyProvider','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL),('24458917-5124-4420-adb2-5bc17202849b','aes-generated','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','aes-generated','org.keycloak.keys.KeyProvider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL),('25c137ef-0015-4ea6-baa2-2d01dd163201','rsa-generated','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','rsa-generated','org.keycloak.keys.KeyProvider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL),('32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','Allowed Protocol Mapper Types','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','authenticated'),('353bd5a9-25a8-42af-9be8-2900958ff98b','Consent Required','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous'),('38308151-12dd-490f-80b0-10672141ee98','hmac-generated','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','hmac-generated','org.keycloak.keys.KeyProvider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL),('42071fd9-c4af-484e-8e6b-87d30152baae','Full Scope Disabled','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('45d0f58a-0ecb-400f-92f3-c47ccdd83c92','Allowed Protocol Mapper Types','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous'),('633a3fc7-38c4-43ea-affb-aa6957fcaada','Allowed Protocol Mapper Types','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('7c65471a-f0a6-41c0-81f9-7400011a7780','Consent Required','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('7cf4e7b6-4d33-4f97-b1c2-8fadf5fcc823','Allowed Client Scopes','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous'),('8a1b8717-2738-48e4-a341-222200225377','Allowed Client Scopes','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','authenticated'),('8b8dd2fa-4ccb-4993-a9bc-66fd7ff523b2','Max Clients Limit','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous'),('8fb2fe3a-39ab-41e1-a1ae-1af61ed72ce6','hmac-generated','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','hmac-generated','org.keycloak.keys.KeyProvider','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL),('959673cc-e5be-497c-9763-559ccf859dcb','Allowed Protocol Mapper Types','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','authenticated'),('aa3f2e77-d8bf-48d7-bb2d-50f8963ef5f8','rsa-generated','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','rsa-generated','org.keycloak.keys.KeyProvider','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL),('aca44195-cb63-45f2-b877-1e82d332ec7d','Allowed Client Scopes','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','authenticated'),('afd25daa-400b-41dc-a75d-465561c2e428','rsa-enc-generated','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','rsa-enc-generated','org.keycloak.keys.KeyProvider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL),('c73ac29e-c5cc-469f-81b3-93122b727111','Allowed Client Scopes','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('ca76293b-a3c1-48b9-bfac-50301be9255b','Max Clients Limit','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('cfc7ab4f-0e50-4824-b76b-087cda93b2d2','Trusted Hosts','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous'),('d5e93a84-4907-47bc-a864-ea4a7327e8b3','rsa-enc-generated','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','rsa-enc-generated','org.keycloak.keys.KeyProvider','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL),('e6191d17-f850-465e-b7e5-1d0d48f39504','Trusted Hosts','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','anonymous'),('e83943e2-3959-49d3-996c-a566be210732',NULL,'9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL),('fdebdf9d-21a9-4891-a326-1ead4d2650ce','Full Scope Disabled','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('05e65a40-68bb-44b8-a46a-15e48c5cf45d','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','oidc-full-name-mapper'),('0c6562fe-6e7d-4578-828d-7575d26d9dae','8a1b8717-2738-48e4-a341-222200225377','allow-default-scopes','true'),('0eb1cd05-62bb-4dcc-8fdb-8a97a19adf41','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('0fcd52c4-3de8-4cee-8c7e-a9c7dd392c99','38308151-12dd-490f-80b0-10672141ee98','algorithm','HS256'),('0fe3f1d5-285f-4e68-9c54-430d0b058cbc','1c4639af-7529-41d5-82cd-7f77b4029def','priority','100'),('18a86af5-0edf-422d-86ec-f01735afd1a2','aa3f2e77-d8bf-48d7-bb2d-50f8963ef5f8','privateKey','MIIEpAIBAAKCAQEAtBkQrZD1St1cN4+l/eko0iK+OMIegb2S0ojZwgnF98GAC5nZ9KH6hTSgSnEgtmWYB7PFqmFq76C3oNCDiIbF0fPRZ43He5CzPebz+zKkNmbt0rRA2OEn8xqUdIgsQSUJp3Zs5YZKUee4z3nt7hwkpixqhvsies5xI/cS0WkeSj+eqmnomBstQpyBfJNwGVpLc/e9nq7MgqjaZmhu5eSMYclQ5yYayi/LqLPfRnjOHo4LuhidtxHHCjQcopAxW0nbwNeCYMJ02/XpiVGZJ87OQ503evqIuIb6PQm8MyeBKG3DA1qLqLk6xUKm9SvYgvE3u2Xk6pIptuuvgWSdPOOcvQIDAQABAoIBAArR5q/xduCEjrcX05UpnjY3DXlDev8NxfW4GxJj8UItRzrAh4OsUkIRI1WAQ8LcNQIMHuKu758YkhpV7KZrJ79cB/H8u/CvL4BB5oPqSvX/FmgDmacYqoRvIwl36jtlCkDGsKF+1pWNImFJ+1gZgL+AXktgaHXlqTkhQul/Mz6qnJsk9DNOVxoEpid4wnnhhV7Suq3uGRFCCAuahPH8n+PpUf89o8sU2Qc2cHIK9MpU2Hg//LE12NapVM3PJIIjsfAg+EAdcSxUSgUAG50pJe9Gmdjbh40z9Q6buXJ3TlTecwUoOo83y3HcSIxXrYKqR9Ip4sESuIW5TmcQgqf6zlECgYEA6Dx4bKPOdQ0UC8kWGq5INs5tPmIKFbj0CmFttcCZvoWjnoeS86Ni6UqWKVzLwZiFlW5gNITQNjrbZTylGN5p64DvCzeekE6Io+ISg3K5OWQ7VG+Db5d/7Mz5jgJ2JaBSXtgSeQROJntgAd8QP0XMoOymJ9QwwURww2NrleDksisCgYEAxobPHDrf8EZ0P9uclt88yBNfZnyoa5TiEUdOFbMEdkRFj9VphGJ9NSdyxvWtpRqEE08+uLOFfDsi6m25W4Dvn+XoGBOH2dxk+Gn9l7+yo37yVCAugsIh3dnGqZVK7EuLqfs3ckyIjfuIrQVyxsXed6gPb2SRKHCgn/pTmJ9YwLcCgYB/hByXgoYtbUXxhrN1aPbL6SLA2zIwZULSpFaKMrv4igaiWEzPLIp2EHdNNN/IaEgJGfcHP1nYPQ8Ukm0Qr6c3Ia+f2CVflU+ftNV3ibm8kpWlMinYTzZ1vsLUP/PBiztPSpMyEbQbmyjHPkT8iQXn4qkFO5Sduke0cVW0kSzhywKBgQCckAwdk0Cv2KAtDCB9yyfAEacWyBB6ZzuxrK4j5r4KFuVU/VTtlk5v8OBPj8iVgEfQgppQRyNqSajLgCTByPkw/LsA4cYtReZLEitv1TooPiEVvxtu+3KB5xEJBDfGCf3m27tqZHj8n/W1napaoAlGDD+/9WuUnN3PzDbJEkGIGQKBgQCbJjQaxWNZ6EQQfryf75IHUYNgkuuY0J5VszaunvAVKbALvn+BeHVYzdiAIMLTP7h6vr1VKkiDKM7pdG6ZzJjw29/vAl5Yf/Y4q+i9ZuSmpWFNaHP+BacbB5kGfigoVgx4ZR9f8PAmseihE7kPlKy8KThrKcxIVzDj9aJoT3iICA=='),('18f2523a-122d-4996-90d6-cf001f8b85b4','ca76293b-a3c1-48b9-bfac-50301be9255b','max-clients','200'),('1d9e4866-966e-4ed8-b78f-1d8ff800d098','25c137ef-0015-4ea6-baa2-2d01dd163201','keyUse','SIG'),('233697d1-3991-4606-843a-2f90d47db4e2','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('27ea1795-8e00-4749-802b-e537fd8f5d3d','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','oidc-address-mapper'),('29aff78f-79f3-47bc-8534-62ce4d293faf','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2bd9f76c-7ef2-4b31-998d-a375b810b6f3','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2da767f7-6e15-4182-8083-4e9ed565de40','aa3f2e77-d8bf-48d7-bb2d-50f8963ef5f8','certificate','MIICmzCCAYMCBgGHnZAvdTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDIwMDcyNjI0WhcNMzMwNDIwMDcyODA0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC0GRCtkPVK3Vw3j6X96SjSIr44wh6BvZLSiNnCCcX3wYALmdn0ofqFNKBKcSC2ZZgHs8WqYWrvoLeg0IOIhsXR89Fnjcd7kLM95vP7MqQ2Zu3StEDY4SfzGpR0iCxBJQmndmzlhkpR57jPee3uHCSmLGqG+yJ6znEj9xLRaR5KP56qaeiYGy1CnIF8k3AZWktz972ersyCqNpmaG7l5IxhyVDnJhrKL8uos99GeM4ejgu6GJ23EccKNByikDFbSdvA14JgwnTb9emJUZknzs5DnTd6+oi4hvo9CbwzJ4EobcMDWououTrFQqb1K9iC8Te7ZeTqkim266+BZJ0845y9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFK4TVhizJndGri8UpGROFL/lnQSCK4+u9NSdLq2jthjapUgg3HIUAKUIWIOimf71std+VIUCZw3gLrRzpPVB9cDuviJAVVgZZxv35lJVwKNyoAtuhBeFyHwfViOszsaXqW9LOZ70ljG4gTkLgHb3FgCAP7NfytrQKiCDmnoAdmu0/333q+Xx9YE7VgAly9zCANTO9axmSQ6BSf7PBoyD8kU3XWqqo+/VazHL9PHgWk+L/Q+cfk+MD8QILDCIM4KDwDRs/xVacNiKolNYOCN82KVZ3VaLnLfDXSt6rEb3kN5etPVRTUK+8p6rv2ySdfgcyO7kR0/2Nua04yM8uKdaBI='),('2e91edf6-2d28-4df0-ab27-10f95c070a70','8fb2fe3a-39ab-41e1-a1ae-1af61ed72ce6','kid','2bc95ac8-ded1-4e99-be61-4d8522f34463'),('31911822-389b-4944-bd0d-161398d62451','c73ac29e-c5cc-469f-81b3-93122b727111','allow-default-scopes','true'),('34762c3b-650e-4973-b9af-91fcaa642f54','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3c70f70c-06be-4a66-8598-fca3757a0911','24458917-5124-4420-adb2-5bc17202849b','secret','baYaPNRRSstEkCO4tZhefw'),('426fd9fa-7c22-4375-9d0f-7b5972fa34ba','afd25daa-400b-41dc-a75d-465561c2e428','privateKey','MIIEpAIBAAKCAQEAzYSuf9zcK7AmWG+9Q8vM0L6nD/HuEL1VlTb4SS8XMUl1RiMGbGHSMzUQWjCZ76FDrTupbybmbpSheUow4LbyjqXvAgPAEr9yJ9DaSYiFcIdN3k6N7qb7TVeetQd5sVDBbzzH3z+/Sc3ouYGvleRV/u3nBnQGWzXW5Jzcqm84z/nTyUYnJ608R+esOkDu3A/qpr7ITCzqoex3nkqWnVmg0QwP14baPJo6YzF/KeR/jaX4n1yru7m9oWWJcCKbr+B1Bw5t3+2CZPcJDXMqFzZFM8S7k7+SuopIId6QHgmL5oxG3WjglF1U9tCRF6AWuciPVLGXP+GuuchvKUVSwXgM4wIDAQABAoIBABCEUE3gXyV3s6051bkkIOLJ371NUTexL7adQ1kGWtPQNoebewGs3urUoerNqyFyEXFTsStIsg5DDbMkvkbhDR9fwJSl3oLjNfZzN4ffW/IOPbjXEVsTunCd0Rh1cFdKyTD6bonHosT4snJuNMFUJ4Ekd4OyQWyFKC8ZWDauV5+HLJWUYeacVhU6UNPtEQY8PJRVwQCMyKv0KBOv+oULRu3itta9aRv4/GYeVaq2sAXESX06lKQrhGQ2CFaL9iC1o6ZK0/nV4oXubWYMv2vqXIZrcPVGto2cGdNRCp6nJjf2BHEvZj3MQdKqyqusp5JVfRbC0hCBw3APnv78RLbynCECgYEA7Rl5BzJ6vGcP3AugXP5UoVIOmD/ukCFEUjVFKMM4MldwwqdHFpDlsRdl2z38WWVPvjmactgLMijaX843qORi+Wx6VOsvgT5uLJ8iTOjp74+1/1qVXcsnMsbr+kUPs0yqsf0ZEb2Cy3pYoYOE/qwO58QfQHIInt/ZTcBEN4170VMCgYEA3ea52qXpacjQIYjLMsfxrxS1XzphMTOUEiuhiWjkVkMW9v2XTvPg2He/NT8mLmXzyqFxDxoDk081ixrhPksvgPQiJ8v4Q42gkGPoSvI7yZ8y4O72NU7pZ7g55CoPPQM+itqViONFrgpdI2q6QwVD3YDs5dTOhHZKv0v5fWwblDECgYAdZQQRNVvsEabws+xMuydI3MB8daig687pljsdw54q95Y+O7jfflVLsEfrd3LarmnFfqS8SjaRIGl6aTmTUcVHgQBlmMbJ8jB8jboV6OZf0eRRZSyRdUdFz02gOIGqy/15lZRPE7ysd12XoJOTc0dhynnJZpnVAJGTRxvt+zd3iwKBgQCC2C33E6XSzqqLW5IV23hTeK6J/G6bCILjQ/74e3VIuD6uXVH/KCcI/XMt/pKRAWUDsrZr5Tb+gdJct/jhNoxISaxqMwetLbHj8kVjC/rdJJZntABR5roSgrsAIxzhKSyTy9go43qO6WWKIMC8DDq8Pe1yiE1OJkJlEnOG1VxdwQKBgQDUvIj7kVyVBgl19b60CCKphSqBOBYnNTJOcb0njTcb3d10E4oWtsCnWdpxA+DRuVJSI+wNZCqlgl/xNZOkXYyU3iYIJVWP2xbBOvaa8pAUXf91+U/3nblL1TiBhcwvL6EqeWYuRF11+RNNBlOlGj/wx2DuIBCZ35q32TB9Z2H5WQ=='),('4a7732d2-ad09-4a9a-a3f1-c1f863cf7529','24458917-5124-4420-adb2-5bc17202849b','priority','100'),('4c8f0374-89fe-4f22-b1a2-bb33becef0a7','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('53b99065-2231-4fcd-8721-c2c750044c9b','25c137ef-0015-4ea6-baa2-2d01dd163201','certificate','MIICmzCCAYMCBgGHnZb5ezANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtaWdyb3MwHhcNMjMwNDIwMDczMzQ5WhcNMzMwNDIwMDczNTI5WjARMQ8wDQYDVQQDDAZtaWdyb3MwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDbG1a/Slx4iDAHEyHSW/ZGNC3/4ia5PSlZG/+mP1ZEBQvwQIwkBfDzjeyuHIObAXCSQEswKhEK3wW+2NWTHj9/LsK+vqcip8mXdXP0FWWxBmu2F00ZdpVSOhYH8JYlZW1Es8Zr1ZTgvUreIuWBkrFL8HRI+zx5KbDz3G/KokFq3LL8dCd6dzP5GBXQQpTOpl56RPdNfojpHQv2tYzVjwPlwmqM467MaydI19Ezceeg55VXafHXmIAtEmEc/zsouyVcVwvz6UWYyotNOE2iLEZrPwgXe2cx+SDhvM1gzGUlSZhTgeKKTsBQUM6DNL9sU0MR/CDcfCC0MsEyWVnP2UpxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACZ+Sg6NIuYdCkEkH34zaCK6WvI5YTV+JGp7YfXsdIym85kiMkZ2CmYUJPA0CoQaE6K+43L0d97fWQs3zhNrStwzc+KA1Rj3qQuXU21yTyChndYTTE70ivMxpnE1NkVIRQfsUitNxdQ1QMa5r40lSSkxL929akkIIvzRYnOzHCjBWH7kGQqzGw7hT9jT1t7TKhVTasspTqpOqXXcFg+Sz5G8mbS1YFUZ0cQ91aAFD2q+NtpDIQ9C/f35SlnZFSCApOAc5xlu1+XIVgfRJOXDuZ0Z03hzMMgTU93EAoVf7aVKB1zCHeL5Eyc2cFdm2WhRgihvJBTNTMrMlhm+Pk6mKAo='),('58604085-cae9-444c-ac91-b7c7cc2937f6','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','saml-role-list-mapper'),('5b5c6338-b935-4584-81fa-699af33dabad','aa3f2e77-d8bf-48d7-bb2d-50f8963ef5f8','priority','100'),('5ea7e2d2-066d-4d45-bafa-aef1d29dbb37','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('671f5564-9b30-4330-83d4-5551213b55ea','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('67653872-806d-4f91-886b-e0cc00673978','cfc7ab4f-0e50-4824-b76b-087cda93b2d2','client-uris-must-match','true'),('68605dbe-c792-46bd-8066-5fdf617ea701','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','oidc-address-mapper'),('6b645dd4-5dce-4f36-be6f-f8fc2b79c959','d5e93a84-4907-47bc-a864-ea4a7327e8b3','priority','100'),('6f8fe882-80c7-4f90-a659-40517b147f40','8fb2fe3a-39ab-41e1-a1ae-1af61ed72ce6','secret','27Y-cr382FQlDPmqe3GNphcRaQKsl4EioY9lSH8L7Q2UprKmW6a9LRVIoy7dRkiJkUGrkhQaBdhbOnOqYjuZmA'),('70d0e6ca-7286-41bf-b0e0-66067b05bca1','8fb2fe3a-39ab-41e1-a1ae-1af61ed72ce6','algorithm','HS256'),('76da3590-afda-4b94-a2c0-2146b5775de0','1c4639af-7529-41d5-82cd-7f77b4029def','secret','inqj99GMO9Qyl_OxcM_MoA'),('7730626a-11cf-4444-a6c8-98dbdc091293','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','saml-role-list-mapper'),('77bd7cdc-14de-414a-8035-26b7a9c20011','25c137ef-0015-4ea6-baa2-2d01dd163201','priority','100'),('799d1122-0eef-44f9-9a70-16b6ad004129','d5e93a84-4907-47bc-a864-ea4a7327e8b3','keyUse','ENC'),('79e8f6cc-cb80-491c-b813-ed64472321b7','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','saml-user-property-mapper'),('7ad270f4-2dbf-4bcf-be8e-d4c00e6b19b1','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','oidc-full-name-mapper'),('7d754d98-39e6-4072-82d2-86065b598849','cfc7ab4f-0e50-4824-b76b-087cda93b2d2','host-sending-registration-request-must-match','true'),('82a37cec-2f67-4ce5-9ad1-227671954645','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('83c871e5-86bc-42c4-818b-a2cf88657b80','e6191d17-f850-465e-b7e5-1d0d48f39504','host-sending-registration-request-must-match','true'),('85c02812-ff22-45dd-ab92-8604608a4744','38308151-12dd-490f-80b0-10672141ee98','priority','100'),('860d7e57-fd8d-4101-b6a6-51e0af328829','d5e93a84-4907-47bc-a864-ea4a7327e8b3','algorithm','RSA-OAEP'),('8629f695-3843-4301-9205-8f933b4682d2','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','oidc-address-mapper'),('894fa4ad-1af0-451d-a97f-895e6112dc76','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('8a364f72-113e-490c-9670-15d57c576865','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9414515f-14cb-4b62-888c-5f83de225914','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('95780da5-8570-4554-9bd1-2c82d8e21322','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('969ec868-244f-4888-93af-e01e7783dc72','d5e93a84-4907-47bc-a864-ea4a7327e8b3','certificate','MIICmzCCAYMCBgGHnZAv9TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDIwMDcyNjI1WhcNMzMwNDIwMDcyODA1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtSXGpPbcDLSOBeCuMJND4W/WcIwMPKoF5UObHQ+WT+/FqYmJbOlEDMOlexRxUloFY02SIBBtOGQhR2jAvH7L9OiQ94uw0Zm585Tg5PJ1J5+ijiBz7OX3MX73QUsKh4ye5d4Gk3NoqMQZj15+ymgCWwAEoLTutkDjtjQWPiRapMGGHjXRPbdZBieOsjHy598GRtFd7JJsvJ5SJl+nEtKrwi71Y7/vfx3PY+EHUCZnWSgeKObEGeZ1zYBEGAOzPvoljyHmX/CZ5f1hZW1jLdN0z4S6P4f5wO5M5F89GgF5tpVmBC+e3rVrPSfq3cM2SWC4HDbYJdpL5JUy5F3Rib2iVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFnbCS1Qp3+4bIDqosZB/1QFgRiSURIxcV9p0UDSrUoVBeKIJFTCPt3JYCzfrYrSLNvJxAgo7SDL2OTIJgi1p6xSXAovPySUpFxAOZm+6DRmc8adzVJbEXAgaBKSjXJN7JGWKqDuaEUmQG7ZQxgi5NAvAe9zlbYRcUFdKWVeCNw0pIk7C/sJ2fTJl+M0D9tlrrE1tGAtzVO0faEzDTYSFMLndue5/RFqwa/oBjTCzvktBfH7v6I3aGtUzI2tWndQB48wtknXn9KkybEYvRORxo84V7zF1WHz/phQ3w0RUgHOzl9elwam8KjEiYJcbU4YmFVuHY2CBq58qkezhpce560='),('9bade7d0-2a02-462e-ae38-f99015a3abb6','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9c64bd0c-5103-4b45-a85d-b8dfdd3a89ea','aca44195-cb63-45f2-b877-1e82d332ec7d','allow-default-scopes','true'),('9d6ad595-077c-440e-9993-6dd43c1ae8cc','e6191d17-f850-465e-b7e5-1d0d48f39504','client-uris-must-match','true'),('a75d3345-40e8-4dde-9aae-21f5a74dcf0c','afd25daa-400b-41dc-a75d-465561c2e428','priority','100'),('a8b5b72e-7994-4e6b-a4f0-07122a352844','24458917-5124-4420-adb2-5bc17202849b','kid','fc5aa4f4-aba0-432d-9e58-e85ae7644f6a'),('aa36f88e-f459-40c7-92ff-59bde898db81','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ad66fc68-a20c-4612-a62e-7f0dcc4430e2','8fb2fe3a-39ab-41e1-a1ae-1af61ed72ce6','priority','100'),('b32ad763-d812-4411-bb1d-06d724b7b8c2','25c137ef-0015-4ea6-baa2-2d01dd163201','privateKey','MIIEowIBAAKCAQEA2xtWv0pceIgwBxMh0lv2RjQt/+ImuT0pWRv/pj9WRAUL8ECMJAXw843srhyDmwFwkkBLMCoRCt8FvtjVkx4/fy7Cvr6nIqfJl3Vz9BVlsQZrthdNGXaVUjoWB/CWJWVtRLPGa9WU4L1K3iLlgZKxS/B0SPs8eSmw89xvyqJBatyy/HQnencz+RgV0EKUzqZeekT3TX6I6R0L9rWM1Y8D5cJqjOOuzGsnSNfRM3HnoOeVV2nx15iALRJhHP87KLslXFcL8+lFmMqLTThNoixGaz8IF3tnMfkg4bzNYMxlJUmYU4Hiik7AUFDOgzS/bFNDEfwg3HwgtDLBMllZz9lKcQIDAQABAoIBABmfaNWV7Jpr0rIBGsNu3a34DCkQWVbwQBWboJngbkYmEO9XnQvZZgQVZMg3rWxDDtcLjb9kK/oJerKGyPMbZnGJFl0YDpOO65Q6uASjO/EnvxDcSLfhljS3djwXdneJFO4j1+BkabSeblLr4cr1TKaEyBSAzOGeboMWFDyuHNhSH3H4f9Q+Ur/qIF9Q/RTa7LtAgzBWJ1h8O0uF9sUBYv7saeY2wr87qXpS2vx2dv/hleRjV1wPx+S58iYSLg49JiPYbnhI27i10XF89Ju6RafLXATfDXGEC/2zdyzRUxsajdE29Nj/4rYtQ6CJrInhKCAYh3S/iioNdvJ2n7FUOMECgYEA86xD/wPI4rgZRnkFJN+aooDvoJI0roSk9earYoyvD45WPYihyCiAtvWNCtnH/DUw2YAhc3cC4ng5b1IUFoUKT41ndyEubJXLb7HBESX79MCRy2hxiehc5wi5Br9BTF5gOgOEXnmo2otPvFEbdjIaBq+qP8yhTdGKVj+6GQHUD+MCgYEA5jDswfVoEj9/EUv4nSqi7gFxLp6mlxj+GyXo8/BrLYRV+ATFE1VnvieXBfjhYuzDXhz8voflHdK3C3IOR11N0PcRLJUGEiUmUVek/rvTR3F0/iVQ3lZjH5n32u44QpVJRVW1spA5A37+EkTlAgb+YTgToY3AI0Q08aF3oc71ZJsCgYEAzXsKB+VIJK+8WKo7BUIuIzT5XX2NQVGHzfkLs1oRUdvkq5UpYCGPkTl2C51kwDCWlgMvsi+81f8t58reN7NO45DJnDL19AlJeVH7Dhvq4RT2nQHhJLs2hHjdlmv3g4/eM2291PFgy5JI1fPLZZuQSO0fcxd7OqUls9+fbfEVw6MCgYBK8LKjkpmHF1Tu9KTDxhW1FpMaclwZ5PEVNYpZoHPEJck3LZZbbPqRVaI9N4FpC1uvUBCYlvVoeClPeJpdcWrcFRNqSDnpvl5zLO1yYQOvxqgn9U4WlFlA+IdQpy15v9BS2kyFDZ8CHF3q5LMJre0zCWaaueNLl/EEmWSxMQeC8QKBgBCmDA8DJL25ztiPYisPThu8gGRqpruzLoL/7bUUmzQ7GkhwH7G3pIfM8PZNP2GeALWxNpzARhXONahyJUmrFSxZnUa5I7v2xE7q80Yky0X3d3Y4+CChD//Wb9PV1JhHgvwpe7EVs3eiZ2EQJhNVxenghbDY0AcA9BcfDc92uab0'),('bd49c727-3a02-4274-a46d-9f32774f81f2','d5e93a84-4907-47bc-a864-ea4a7327e8b3','privateKey','MIIEpAIBAAKCAQEArUlxqT23Ay0jgXgrjCTQ+Fv1nCMDDyqBeVDmx0Plk/vxamJiWzpRAzDpXsUcVJaBWNNkiAQbThkIUdowLx+y/TokPeLsNGZufOU4OTydSefoo4gc+zl9zF+90FLCoeMnuXeBpNzaKjEGY9efspoAlsABKC07rZA47Y0Fj4kWqTBhh410T23WQYnjrIx8uffBkbRXeySbLyeUiZfpxLSq8Iu9WO/738dz2PhB1AmZ1koHijmxBnmdc2ARBgDsz76JY8h5l/wmeX9YWVtYy3TdM+Euj+H+cDuTORfPRoBebaVZgQvnt61az0n6t3DNklguBw22CXaS+SVMuRd0Ym9olQIDAQABAoIBAFQISqMct3RF3nL5eHy0mdXmmluGKwSewzy2e8Nj7J/vzGmfnjzJMeIPRQxdH9jxR3ZwxM6k1yzvPLaczUL850qfeFW+hnb+uVO9wJ8ZAtmFKa6r4gn+HkAOqbiteY8R3gC1sFvncbCGJ6ghN2NgBSsVnzoBfXA0gTbJbUnm2+NdMurPWQKOh0fWdfP1YGdiiBF0hdMz+pmIXraeDXlaDCTGopj4VCE1cFzjN6Lu67PFGssS1igBzwR9G51iE5T1bJfgqvzoCasP0upz7YKgZSVYAysgaUdA47deI4B9d4f6ygsPbekyk+QoAxo48hkn4cTrDrtwedFs7yz08QQrsP0CgYEA5HMDE6c5fAEemUa6l/wqlQcl5hvmdMKrltsmelktiVtPe7r0TlsZ+sBefTAIkHFmM3Wvxml0hBF0eMoq3NN0+HTgRAbnegeBRefC2CpQ7TKxyjIgk0NjoHkt+vborAdpxwvEXLrSmXIhJyWby0uJBpp2AHJRwLRMfZNb2OdWBbMCgYEAwi9i2j3tynsUILWF0WcpOW32yWaTE670mz90EYrVfMrmgaiXod/RGrQXl9IZW6niOI72qriqV4JhplelHJl7rkJvxzLkVpW6ppuGHvbxwYM1r+HGP5uRZtR8w5NJwVqnp9ZvxTzCjIhPw0nRn4cpaYzjE2/K+O8w0IzD2RPXxJcCgYAXf3EAk4HJLIBOOcU1nt1uaMbQLWx99AwcPzxs90FE0JyTWH6KlLpOXX0amVc4LEHb5y4GVZCDiRwW1IymHCX67GKo/KDQn3b/jsAu5eNfEojRCGjrXNIhjnVZTA5Qq46Ix8AR3bGN0Pxx/19QANv+TuL2Vsvr61+2xvJ6lAj4GwKBgQCEaOtvBWtv9hzzcNOexklF78Wn71m6wkHo2ou6qoCIZ5JmNx+uMX/URZkQ3SKNbnnjNxjbsK/2m+EaHAlqRv4fBQ5TNlCc+dwcX1BFLP4MhfvFwp38IYg0JhAtC/Hu9nH78CymwZenXAuHjn5x2ShT4M22IzS0KeWPT2z8SJuIYQKBgQCmApIR+rzgv4uAVYQQ6fNgdfEAx8DLersvas85ggLN3LvMfHe4nKVgKTWh/hpBm3XE5ZCNdrqDKepvBho8oY518qRv/ujlyAJr+k8S3EvWXd1b8Ot+6O89ifzH6DzZhDm0acnXEPWZ7WBE/O74e2AV0d9yfL+jQQj5Hx1pGhf5+A=='),('c14e883a-b1d8-4cae-8a99-60a57258956b','38308151-12dd-490f-80b0-10672141ee98','kid','3c6b5c32-7e3d-43db-97a5-edfd23919bad'),('c4e46a4c-0951-4a99-ac2a-68eeae9e8228','afd25daa-400b-41dc-a75d-465561c2e428','certificate','MIICmzCCAYMCBgGHnZb6yDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtaWdyb3MwHhcNMjMwNDIwMDczMzUwWhcNMzMwNDIwMDczNTMwWjARMQ8wDQYDVQQDDAZtaWdyb3MwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNhK5/3NwrsCZYb71Dy8zQvqcP8e4QvVWVNvhJLxcxSXVGIwZsYdIzNRBaMJnvoUOtO6lvJuZulKF5SjDgtvKOpe8CA8ASv3In0NpJiIVwh03eTo3upvtNV561B3mxUMFvPMffP79Jzei5ga+V5FX+7ecGdAZbNdbknNyqbzjP+dPJRicnrTxH56w6QO7cD+qmvshMLOqh7HeeSpadWaDRDA/Xhto8mjpjMX8p5H+NpfifXKu7ub2hZYlwIpuv4HUHDm3f7YJk9wkNcyoXNkUzxLuTv5K6ikgh3pAeCYvmjEbdaOCUXVT20JEXoBa5yI9UsZc/4a65yG8pRVLBeAzjAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABlJRwK2rAIYYvEcyzeYm/vaWtrnEOL0VBvenfwhJTwg2nTiy8VEoVnZl7ZmfT48O9goBPnpRoZqqEfV0jE8L+oGigsHZUTogIh+s1VPz4+NtjvaUd4NicRq9ckb7vcjcU0ywmh/rOHGTnImmoqRoWg+ZvWkY4y72u5p9LEf/FERwpn6F8PMr3Cj0QG0M+eD8DcuO5nDXNUo+ZPvDMDP0VbsUGHJSSEA3CLhz8tIOcshfXjxc+ghDgYXbrHkDkaYjaBrtfL3zTawrhvuewlgA+oZ5DQKhOEOCYIPa0IlpTaH3GiR/U0IMCIRY1yKuTUNejMr6xvEOExLxArN+O2RCpo='),('c5955921-cb5a-4476-a04f-6d0722bf065d','38308151-12dd-490f-80b0-10672141ee98','secret','50qtU5zbUwFQ5WVDq19bfX7RxhVtYtnswhL2xB8H472kuT7DK9ZktlVW3mnEZVGiWRGINk2D4RpSRrJqq3miZg'),('cf057595-338b-4d44-a16b-1712c1306844','aa3f2e77-d8bf-48d7-bb2d-50f8963ef5f8','keyUse','SIG'),('d237f098-fdd8-48dc-be44-ddb4af855673','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','oidc-address-mapper'),('d25e6061-93c9-44a6-8144-b682a1d8918a','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','saml-user-property-mapper'),('d64e79f3-dec4-4789-881a-8ff4dd7e58d6','7cf4e7b6-4d33-4f97-b1c2-8fadf5fcc823','allow-default-scopes','true'),('d6ef418b-0aef-4681-964a-095b0f26e339','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','oidc-full-name-mapper'),('db6c032d-44b2-4407-8dd4-802dbae3004c','32cf5191-f73a-4a1a-a6f1-de9c0ba0bef0','allowed-protocol-mapper-types','saml-user-property-mapper'),('ddad175c-4d32-47a2-94bf-7aad6c2311ec','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('def2f9fb-70b6-4bfc-8c43-8dc2c1653009','afd25daa-400b-41dc-a75d-465561c2e428','algorithm','RSA-OAEP'),('e4134538-13f2-4829-b39d-01ad93572c90','45d0f58a-0ecb-400f-92f3-c47ccdd83c92','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e504377b-0931-4f7e-b2a1-4129635e0514','8b8dd2fa-4ccb-4993-a9bc-66fd7ff523b2','max-clients','200'),('ea0cc250-0129-477f-aace-ce1672fd4ed1','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','saml-user-property-mapper'),('ec7c326a-cb98-4f26-96f0-5d66543d4580','1c4639af-7529-41d5-82cd-7f77b4029def','kid','b8f8a9c7-27f0-4cc4-b2fc-6db217d57338'),('f3bdfcec-2ee4-47e6-b406-0f683b644a11','afd25daa-400b-41dc-a75d-465561c2e428','keyUse','ENC'),('f667f1da-a5b5-4c6c-b869-8086b368f22c','959673cc-e5be-497c-9763-559ccf859dcb','allowed-protocol-mapper-types','saml-role-list-mapper'),('fb75c4a1-b31a-45ca-b9e0-80716cb1ed7c','633a3fc7-38c4-43ea-affb-aa6957fcaada','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0d4d2e6e-83f1-44d0-82be-fee7eb968fc4','ebd080f3-61df-41bc-996b-973a9d4a3be8'),('0e6edecc-ce9e-44f8-81af-4561eea87259','34f7d329-86b6-4030-873b-7d06ff813b9f'),('3a17f7c4-a837-4f05-9b4c-9f17fe95c8c0','99a51e39-4cd3-47aa-a571-2edf6baf5410'),('3a17f7c4-a837-4f05-9b4c-9f17fe95c8c0','bba33893-c19b-4759-892a-f2c56e29d287'),('4c3fc0e7-0eba-4feb-ad9f-271468fc6d80','32e61a8f-cdf3-441a-ab73-386a414db068'),('69376087-9a84-4d02-b570-f68d7dc5846d','f93c6aa0-40d0-44d5-bfeb-e4b30d60c91b'),('84888b26-ed50-4788-b538-07e910fe4805','20dc59a7-57fc-46c4-b7bd-d4f9fd2684ad'),('84888b26-ed50-4788-b538-07e910fe4805','30e1ac5a-c4e9-4b44-81e7-17d1449cd012'),('893ee80a-c1cb-43e5-b2cd-ea867a0fe1bd','c127cb86-fe20-4b5e-bdde-3b2feeebb9a5'),('b4d4616a-5f62-4c94-9b51-989da8bb4381','e6e8a564-08ca-4516-b1cb-5e57c6b1c5bd'),('bcf666b6-2ba5-495a-b679-119ad3629bf4','69376087-9a84-4d02-b570-f68d7dc5846d'),('bcf666b6-2ba5-495a-b679-119ad3629bf4','7b8192a3-8b26-4409-9758-7c6f6dc51257'),('bcf666b6-2ba5-495a-b679-119ad3629bf4','800b47f5-744e-4394-8122-570422486ab8'),('bcf666b6-2ba5-495a-b679-119ad3629bf4','bac5b47b-d355-4c82-8df2-d21984119083'),('cf14f423-ba51-403c-ac41-19da730ee27c','80a3d7c8-618a-48a3-b4ff-f406a2fdd3a6'),('cf14f423-ba51-403c-ac41-19da730ee27c','b5e22814-d6c1-4cbe-9452-7b12050e50f5'),('d1525678-2f80-459d-8c97-0040844edc54','0d4d2e6e-83f1-44d0-82be-fee7eb968fc4'),('d1525678-2f80-459d-8c97-0040844edc54','17d3753b-5798-4aac-bfab-703b41477441'),('d1525678-2f80-459d-8c97-0040844edc54','32a87267-1abb-407d-bfc0-beb4185f65a6'),('d1525678-2f80-459d-8c97-0040844edc54','37320bad-ed84-4a39-9e68-53a76dbeec61'),('d1525678-2f80-459d-8c97-0040844edc54','3a17f7c4-a837-4f05-9b4c-9f17fe95c8c0'),('d1525678-2f80-459d-8c97-0040844edc54','3a7d75d1-54ed-4dc4-8a63-922be29b7029'),('d1525678-2f80-459d-8c97-0040844edc54','7cd1420d-6cc7-49b1-8b08-d909c1855219'),('d1525678-2f80-459d-8c97-0040844edc54','7f41b1b7-df35-46ef-883d-e39c58ec8160'),('d1525678-2f80-459d-8c97-0040844edc54','88d01ca0-6a7d-4752-9bb8-952ec9d5bf14'),('d1525678-2f80-459d-8c97-0040844edc54','99a51e39-4cd3-47aa-a571-2edf6baf5410'),('d1525678-2f80-459d-8c97-0040844edc54','9fd59689-3dbb-42a1-93fe-117673d9e9d2'),('d1525678-2f80-459d-8c97-0040844edc54','a325a417-e8cf-4fdb-8e19-7a32a138353a'),('d1525678-2f80-459d-8c97-0040844edc54','b755bdd6-b3a1-476a-af66-0acc406b3fe5'),('d1525678-2f80-459d-8c97-0040844edc54','bba33893-c19b-4759-892a-f2c56e29d287'),('d1525678-2f80-459d-8c97-0040844edc54','c47fe89d-8fdb-4c0f-8fbf-8defcd2a9b5e'),('d1525678-2f80-459d-8c97-0040844edc54','c9283d31-da39-4c4e-a488-87bbc5d1aab7'),('d1525678-2f80-459d-8c97-0040844edc54','ebd080f3-61df-41bc-996b-973a9d4a3be8'),('d1525678-2f80-459d-8c97-0040844edc54','f9f08e3e-8f01-424e-ab0f-52c6d72bcfa2'),('efde4911-0e12-4535-a032-322faf8e79a8','006d1800-f19e-4e38-9a6d-1ff9560f3792'),('efde4911-0e12-4535-a032-322faf8e79a8','057e1bd3-e237-4145-8618-a8944a658f6a'),('efde4911-0e12-4535-a032-322faf8e79a8','0c774f16-1467-4027-b1b2-5a7f3d4bacca'),('efde4911-0e12-4535-a032-322faf8e79a8','1f98b599-9bcd-4c4c-9033-1a887d485706'),('efde4911-0e12-4535-a032-322faf8e79a8','20dc59a7-57fc-46c4-b7bd-d4f9fd2684ad'),('efde4911-0e12-4535-a032-322faf8e79a8','240dc91c-441a-4d19-95a3-1d256426a08c'),('efde4911-0e12-4535-a032-322faf8e79a8','25987e89-8c62-41ed-b617-4149b5a4a6de'),('efde4911-0e12-4535-a032-322faf8e79a8','2ee871a4-d938-41c5-8f74-2cde6e52710a'),('efde4911-0e12-4535-a032-322faf8e79a8','30e1ac5a-c4e9-4b44-81e7-17d1449cd012'),('efde4911-0e12-4535-a032-322faf8e79a8','32e61a8f-cdf3-441a-ab73-386a414db068'),('efde4911-0e12-4535-a032-322faf8e79a8','44a8516a-2b2c-4056-bcf0-5d525777ff77'),('efde4911-0e12-4535-a032-322faf8e79a8','4c3fc0e7-0eba-4feb-ad9f-271468fc6d80'),('efde4911-0e12-4535-a032-322faf8e79a8','549bd2f2-dd77-475f-babc-2eb0b2d206b8'),('efde4911-0e12-4535-a032-322faf8e79a8','63134816-fb3e-4a38-bec5-ddb78c42302e'),('efde4911-0e12-4535-a032-322faf8e79a8','67c2e89b-b2a2-4c6c-ad5d-b128cff367d2'),('efde4911-0e12-4535-a032-322faf8e79a8','6e15eeb0-5386-4ef3-b4e3-bb5c9fe13f8e'),('efde4911-0e12-4535-a032-322faf8e79a8','7b4e51fc-46d0-46dd-b4f5-51bce05ae4c6'),('efde4911-0e12-4535-a032-322faf8e79a8','80a3d7c8-618a-48a3-b4ff-f406a2fdd3a6'),('efde4911-0e12-4535-a032-322faf8e79a8','82b7b2e1-fa20-4d19-8607-bca558c24c4a'),('efde4911-0e12-4535-a032-322faf8e79a8','84888b26-ed50-4788-b538-07e910fe4805'),('efde4911-0e12-4535-a032-322faf8e79a8','97f2bfd8-07bb-4862-8796-86394f5a7e6d'),('efde4911-0e12-4535-a032-322faf8e79a8','a283bab5-7576-41e0-b835-7223b4d88ae3'),('efde4911-0e12-4535-a032-322faf8e79a8','a80b9a52-0346-45e3-9079-d1b9ad2c576e'),('efde4911-0e12-4535-a032-322faf8e79a8','b4d4616a-5f62-4c94-9b51-989da8bb4381'),('efde4911-0e12-4535-a032-322faf8e79a8','b5e22814-d6c1-4cbe-9452-7b12050e50f5'),('efde4911-0e12-4535-a032-322faf8e79a8','baf9399d-9f5b-4026-9145-d19797a91196'),('efde4911-0e12-4535-a032-322faf8e79a8','ccc7e73d-2aa6-45bb-b173-3a93aedd2d83'),('efde4911-0e12-4535-a032-322faf8e79a8','cf14f423-ba51-403c-ac41-19da730ee27c'),('efde4911-0e12-4535-a032-322faf8e79a8','d54aad11-a8df-46a8-81e7-4d78efd8c1ac'),('efde4911-0e12-4535-a032-322faf8e79a8','d8a7e471-0ed5-460f-81d9-e297e5685faf'),('efde4911-0e12-4535-a032-322faf8e79a8','e40e4327-5436-456f-949c-f44598f49e69'),('efde4911-0e12-4535-a032-322faf8e79a8','e6e35e72-3e9b-46cd-a00d-3efcfbde9698'),('efde4911-0e12-4535-a032-322faf8e79a8','e6e8a564-08ca-4516-b1cb-5e57c6b1c5bd'),('efde4911-0e12-4535-a032-322faf8e79a8','e9ffc34f-c1ae-4191-aa0e-6fe5b91abe79'),('efde4911-0e12-4535-a032-322faf8e79a8','ec53ffaf-8b6c-4f46-b89c-dfba365e0a40'),('efde4911-0e12-4535-a032-322faf8e79a8','fb0fb0db-d483-4799-8eed-ea96a1b32a86'),('efde4911-0e12-4535-a032-322faf8e79a8','ff7480e5-7bd7-4076-9d6c-8e8b22458f25'),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','895a1815-b3d9-49fe-b2bf-e5b0ff8b5b6e'),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','9fec1df2-44c2-4952-b8a4-9989f0a22b46'),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','a84e0d4e-9f74-4dba-829e-e39b53c07c22'),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','fd47d567-36f4-4271-bc1f-a7e8c957df9c'),('fd47d567-36f4-4271-bc1f-a7e8c957df9c','26d50ccc-9082-4f18-a9d1-177571bc11a0');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('1ebac11d-e089-4440-9c88-ca4011896807',NULL,'password','1f00d413-5c41-4c48-8e0d-a0f47135d715',1682112010110,'My password','{\"value\":\"wRLF57+18eMrfnlUBrbIrfb4W64el+9tehMsK31UC/8=\",\"salt\":\"HsRoKJKI7EKYGkeXYbV7IA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('2b44ee43-dc3b-43e9-8494-69035704b34f',NULL,'password','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b',1681975685866,NULL,'{\"value\":\"//b1aeuswQ8CXaNEKjP05RMdxs1/OHPV6bxMSu0q0aY=\",\"salt\":\"S3p1dix5naeE429AMjlUKw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-04-20 07:27:40',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-04-20 07:27:40',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-04-20 07:27:41',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-04-20 07:27:41',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-04-20 07:27:42',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-04-20 07:27:42',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-04-20 07:27:44',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-04-20 07:27:44',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-04-20 07:27:44',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-04-20 07:27:45',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-04-20 07:27:46',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-04-20 07:27:46',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-04-20 07:27:46',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-20 07:27:46',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-20 07:27:46',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-20 07:27:46',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-20 07:27:46',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-04-20 07:27:47',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-04-20 07:27:48',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-04-20 07:27:48',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-04-20 07:27:48',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-04-20 07:27:48',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-04-20 07:27:48',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-04-20 07:27:49',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-04-20 07:27:49',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-04-20 07:27:49',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-04-20 07:27:50',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-04-20 07:27:50',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-04-20 07:27:51',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-04-20 07:27:51',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-04-20 07:27:51',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-04-20 07:27:51',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-20 07:27:51',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-20 07:27:51',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-20 07:27:53',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-04-20 07:27:53',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-20 07:27:53',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'1975656610'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-04-20 07:27:53',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-04-20 07:27:53',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-20 07:27:53',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-20 07:27:53',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-04-20 07:27:53',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-20 07:27:54',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-04-20 07:27:54',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-20 07:27:54',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-20 07:27:54',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-20 07:27:54',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-20 07:27:55',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-20 07:27:55',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-04-20 07:27:56',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-04-20 07:27:56',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-04-20 07:27:56',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-04-20 07:27:56',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-04-20 07:27:56',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-20 07:27:56',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-20 07:27:57',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-20 07:27:57',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-20 07:27:59',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-04-20 07:27:59',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-04-20 07:27:59',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-04-20 07:28:00',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-04-20 07:28:00',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-04-20 07:28:00',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-04-20 07:28:00',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-04-20 07:28:00',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-04-20 07:28:00',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-04-20 07:28:00',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-04-20 07:28:00',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-04-20 07:28:00',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-04-20 07:28:00',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'1975656610'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-04-20 07:28:00',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'1975656610'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-20 07:28:00',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-20 07:28:00',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-20 07:28:00',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-20 07:28:01',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-20 07:28:01',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-20 07:28:01',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-20 07:28:01',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-20 07:28:01',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-20 07:28:01',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-20 07:28:01',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-20 07:28:01',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-20 07:28:01',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-20 07:28:01',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'1975656610'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-20 07:28:01',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-04-20 07:28:02',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.16.1',NULL,NULL,'1975656610'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-04-20 07:28:02',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-04-20 07:28:02',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.16.1',NULL,NULL,'1975656610'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'1975656610'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'1975656610'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-20 07:28:02',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'1975656610'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-20 07:28:02',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-04-20 07:28:02',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.16.1',NULL,NULL,'1975656610'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-04-20 07:28:02',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-04-20 07:28:02',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'1975656610'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-04-20 07:28:02',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-20 07:28:02',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-20 07:28:02',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'1975656610'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-20 07:28:03',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'1975656610'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2023-04-20 07:28:03',111,'EXECUTED','8:8806cb33d2a546ce770384bf98cf6eac','customChange','',NULL,'4.16.1',NULL,NULL,'1975656610');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','07d3e91b-153d-46f3-83ec-681491277122',_binary ''),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1cf93d7f-d7b9-43df-95d2-2e43f2783297',_binary '\0'),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','33ff7051-f19b-4f78-b242-6c265d91f05a',_binary '\0'),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','7fe0f941-d846-4b83-be21-6543f103ff5e',_binary ''),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','83d2e492-a1d8-4960-bb81-73766f553d08',_binary ''),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','97a95718-e3c7-44ba-8495-b008682c5bac',_binary ''),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','9bbd0424-5f2f-4fec-9253-3d11bcf10b53',_binary ''),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','e629e355-c05a-4400-9146-943516db1490',_binary '\0'),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','f4afb4c7-f546-4ba1-af99-ff81f181bf2f',_binary '\0'),('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','fbc1f020-473e-422c-9935-ecb6ae695c1b',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','02fcfc94-43fd-45c6-a020-285fb5282afd',_binary '\0'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','130b3dc7-71ea-40cc-97a1-2e73b18f46f9',_binary '\0'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','1e60de03-951c-4057-b516-138d0d5c8663',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','32c147dd-aba8-4603-ab92-41f6d27df67a',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','60ef6e4b-3237-4c1b-a572-cdabadaed95b',_binary '\0'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7ab2dd48-8ca1-4162-9ee7-caba9b1b1e07',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','ada3183e-4276-4269-a17f-abf07e77738a',_binary '\0'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c095b916-b80b-41ef-9756-c9f8efd265f6',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','c0fc6154-820d-4b43-9693-94a7fd71a1b9',_binary ''),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','e91f7994-e4cf-44b2-807b-0d83a413ee65',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('006d1800-f19e-4e38-9a6d-1ff9560f3792','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-events}','view-events','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('057e1bd3-e237-4145-8618-a8944a658f6a','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-authorization}','manage-authorization','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('0c774f16-1467-4027-b1b2-5a7f3d4bacca','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-events}','view-events','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('0d4d2e6e-83f1-44d0-82be-fee7eb968fc4','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-clients}','view-clients','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('0e6edecc-ce9e-44f8-81af-4561eea87259','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_manage-consent}','manage-consent','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('17d3753b-5798-4aac-bfab-703b41477441','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-realm}','view-realm','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('1c02c140-48e6-4194-be0a-e3390fea0548','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_delete-account}','delete-account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('1f98b599-9bcd-4c4c-9033-1a887d485706','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-users}','manage-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('20dc59a7-57fc-46c4-b7bd-d4f9fd2684ad','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_query-users}','query-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('240dc91c-441a-4d19-95a3-1d256426a08c','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-events}','manage-events','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('25987e89-8c62-41ed-b617-4149b5a4a6de','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_create-client}','create-client','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('26d50ccc-9082-4f18-a9d1-177571bc11a0','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_manage-account-links}','manage-account-links','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('2deef474-861e-4387-8501-4abcc56aaba8','b5302a7e-405d-4640-b3ce-9e30930bf4e2',_binary '','${role_read-token}','read-token','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','b5302a7e-405d-4640-b3ce-9e30930bf4e2',NULL),('2ee871a4-d938-41c5-8f74-2cde6e52710a','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_create-client}','create-client','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('30e1ac5a-c4e9-4b44-81e7-17d1449cd012','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_query-groups}','query-groups','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('32a87267-1abb-407d-bfc0-beb4185f65a6','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_create-client}','create-client','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('32e61a8f-cdf3-441a-ab73-386a414db068','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_query-clients}','query-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('34f7d329-86b6-4030-873b-7d06ff813b9f','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_view-consent}','view-consent','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('37320bad-ed84-4a39-9e68-53a76dbeec61','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_impersonation}','impersonation','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('3a17f7c4-a837-4f05-9b4c-9f17fe95c8c0','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-users}','view-users','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('3a7d75d1-54ed-4dc4-8a63-922be29b7029','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-events}','view-events','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('44a8516a-2b2c-4056-bcf0-5d525777ff77','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_impersonation}','impersonation','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('4a2218d2-837c-4096-8e5a-848aed1b0e79','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_view-groups}','view-groups','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('4c3fc0e7-0eba-4feb-ad9f-271468fc6d80','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-clients}','view-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('4ce160c3-d3e2-4a16-aeae-b44814ab3426','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_view-applications}','view-applications','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('549bd2f2-dd77-475f-babc-2eb0b2d206b8','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-identity-providers}','view-identity-providers','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('63134816-fb3e-4a38-bec5-ddb78c42302e','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-authorization}','manage-authorization','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('67c2e89b-b2a2-4c6c-ad5d-b128cff367d2','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-clients}','manage-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('69376087-9a84-4d02-b570-f68d7dc5846d','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_manage-account}','manage-account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('6e15eeb0-5386-4ef3-b4e3-bb5c9fe13f8e','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-events}','manage-events','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('7b4e51fc-46d0-46dd-b4f5-51bce05ae4c6','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-realm}','view-realm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('7b8192a3-8b26-4409-9758-7c6f6dc51257','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0','${role_uma_authorization}','uma_authorization','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,NULL),('7cd1420d-6cc7-49b1-8b08-d909c1855219','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-authorization}','manage-authorization','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('7f41b1b7-df35-46ef-883d-e39c58ec8160','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_query-realms}','query-realms','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('800b47f5-744e-4394-8122-570422486ab8','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_view-profile}','view-profile','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('80a3d7c8-618a-48a3-b4ff-f406a2fdd3a6','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_query-users}','query-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('82b7b2e1-fa20-4d19-8607-bca558c24c4a','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_impersonation}','impersonation','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('84888b26-ed50-4788-b538-07e910fe4805','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-users}','view-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('88d01ca0-6a7d-4752-9bb8-952ec9d5bf14','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-users}','manage-users','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('893ee80a-c1cb-43e5-b2cd-ea867a0fe1bd','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_manage-consent}','manage-consent','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('895a1815-b3d9-49fe-b2bf-e5b0ff8b5b6e','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '\0','${role_offline-access}','offline_access','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL,NULL),('89cb3197-829d-4738-b79e-d613fbd827c1','ba0cfa9d-8972-43f8-91c4-5f06ac83af8a',_binary '','${role_read-token}','read-token','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','ba0cfa9d-8972-43f8-91c4-5f06ac83af8a',NULL),('97f2bfd8-07bb-4862-8796-86394f5a7e6d','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-realm}','manage-realm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('99a51e39-4cd3-47aa-a571-2edf6baf5410','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_query-users}','query-users','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('9fd59689-3dbb-42a1-93fe-117673d9e9d2','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-events}','manage-events','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('9fec1df2-44c2-4952-b8a4-9989f0a22b46','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '\0','${role_uma_authorization}','uma_authorization','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL,NULL),('a283bab5-7576-41e0-b835-7223b4d88ae3','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-identity-providers}','manage-identity-providers','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('a325a417-e8cf-4fdb-8e19-7a32a138353a','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-authorization}','view-authorization','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('a80b9a52-0346-45e3-9079-d1b9ad2c576e','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-identity-providers}','manage-identity-providers','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('a84e0d4e-9f74-4dba-829e-e39b53c07c22','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_view-profile}','view-profile','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('b4d4616a-5f62-4c94-9b51-989da8bb4381','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-clients}','view-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('b5e22814-d6c1-4cbe-9452-7b12050e50f5','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_query-groups}','query-groups','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('b755bdd6-b3a1-476a-af66-0acc406b3fe5','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-clients}','manage-clients','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('bac5b47b-d355-4c82-8df2-d21984119083','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0','${role_offline-access}','offline_access','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,NULL),('baf9399d-9f5b-4026-9145-d19797a91196','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-authorization}','view-authorization','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('bba33893-c19b-4759-892a-f2c56e29d287','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_query-groups}','query-groups','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('bcf666b6-2ba5-495a-b679-119ad3629bf4','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0','${role_default-roles}','default-roles-master','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,NULL),('c127cb86-fe20-4b5e-bdde-3b2feeebb9a5','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_view-consent}','view-consent','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('c47fe89d-8fdb-4c0f-8fbf-8defcd2a9b5e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_view-identity-providers}','view-identity-providers','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('c9283d31-da39-4c4e-a488-87bbc5d1aab7','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-realm}','manage-realm','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('ccc7e73d-2aa6-45bb-b173-3a93aedd2d83','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-users}','manage-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('cf14f423-ba51-403c-ac41-19da730ee27c','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-users}','view-users','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('d1525678-2f80-459d-8c97-0040844edc54','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_realm-admin}','realm-admin','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('d54aad11-a8df-46a8-81e7-4d78efd8c1ac','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_manage-clients}','manage-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('d5783327-86ee-4050-9be3-b156af332d72','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',_binary '',NULL,'uma_protection','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL),('d8a7e471-0ed5-460f-81d9-e297e5685faf','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_query-realms}','query-realms','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('dd24f839-8171-4a51-ba47-8f146a33f836','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_view-applications}','view-applications','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('e40e4327-5436-456f-949c-f44598f49e69','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_view-realm}','view-realm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('e6e35e72-3e9b-46cd-a00d-3efcfbde9698','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0','${role_create-realm}','create-realm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,NULL),('e6e8a564-08ca-4516-b1cb-5e57c6b1c5bd','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_query-clients}','query-clients','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('e9ffc34f-c1ae-4191-aa0e-6fe5b91abe79','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-identity-providers}','view-identity-providers','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('ebd080f3-61df-41bc-996b-973a9d4a3be8','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_query-clients}','query-clients','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('ec0ba1e3-7f71-4448-8b00-c460620e86c2','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_delete-account}','delete-account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('ec53ffaf-8b6c-4f46-b89c-dfba365e0a40','7f6fa78e-8112-4488-8dec-a266080415b5',_binary '','${role_query-realms}','query-realms','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','7f6fa78e-8112-4488-8dec-a266080415b5',NULL),('ef3df24d-bf92-42ed-91c4-d9165b6ef6bf','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_view-groups}','view-groups','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('efde4911-0e12-4535-a032-322faf8e79a8','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0','${role_admin}','admin','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',NULL,NULL),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '\0','${role_default-roles}','default-roles-migros','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',NULL,NULL),('f93c6aa0-40d0-44d5-bfeb-e4b30d60c91b','8def3445-6bfa-439d-b48f-9640c3b80bc3',_binary '','${role_manage-account-links}','manage-account-links','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','8def3445-6bfa-439d-b48f-9640c3b80bc3',NULL),('f9f08e3e-8f01-424e-ab0f-52c6d72bcfa2','54eee947-ee4b-45c4-936f-a2f8cf7bd611',_binary '','${role_manage-identity-providers}','manage-identity-providers','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','54eee947-ee4b-45c4-936f-a2f8cf7bd611',NULL),('fb0fb0db-d483-4799-8eed-ea96a1b32a86','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_manage-realm}','manage-realm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL),('fd47d567-36f4-4271-bc1f-a7e8c957df9c','d285ec78-68f9-4a71-897d-7e1b1f58dadd',_binary '','${role_manage-account}','manage-account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','d285ec78-68f9-4a71-897d-7e1b1f58dadd',NULL),('ff7480e5-7bd7-4076-9d6c-8e8b22458f25','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',_binary '','${role_view-authorization}','view-authorization','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('n30hk','21.0.2',1681975683);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('14909f0e-8565-4320-8fc3-fe9dd72b415b','defaultResourceType','urn:courier-service:resources:default'),('e5913f6a-d8e7-4af1-b155-bfdbe02fd495','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0441ce07-9ebe-47ce-8379-75ba483d389f','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('0645cb46-f3e7-45aa-a780-e2fd3bf2e087','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'1e60de03-951c-4057-b516-138d0d5c8663'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','address','openid-connect','oidc-address-mapper',NULL,'130b3dc7-71ea-40cc-97a1-2e73b18f46f9'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('107ec5df-14f0-4adf-b319-7b1705e842ec','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('17b7062a-ab2a-4646-b718-926afdcab7f8','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4afb4c7-f546-4ba1-af99-ff81f181bf2f'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4afb4c7-f546-4ba1-af99-ff81f181bf2f'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('23f81139-781c-46ea-900b-9942e6810d11','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('280e3827-e658-4afe-b07d-117c4a11c300','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('2db4aab8-0282-4114-8bb2-9874d39c20da','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('313d6b9a-c380-4868-ba90-490fe633f97c','role list','saml','saml-role-list-mapper',NULL,'7ab2dd48-8ca1-4162-9ee7-caba9b1b1e07'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'c0fc6154-820d-4b43-9693-94a7fd71a1b9'),('4362a93e-c257-4b8d-9767-2ea6c697050f','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('4af60d6c-65d7-454a-97e8-2ef67586d227','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ada3183e-4276-4269-a17f-abf07e77738a'),('4cdbae87-db78-49c1-9a77-8117f54b103d','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('500f4e49-17b2-4be8-a7c4-0354e6857b7a','acr loa level','openid-connect','oidc-acr-mapper',NULL,'c095b916-b80b-41ef-9756-c9f8efd265f6'),('5314f9a7-4dc0-4a3e-804b-5bbaaa5c1faa','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'83d2e492-a1d8-4960-bb81-73766f553d08'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'fbc1f020-473e-422c-9935-ecb6ae695c1b'),('6b22d6c5-8995-4cc3-a95f-2ae3bc18ab0d','full name','openid-connect','oidc-full-name-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('6db69087-1974-4e4c-b0f7-0863621842dd','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL),('73434e64-3556-48a2-b8ed-82b11e380c1c','locale','openid-connect','oidc-usermodel-attribute-mapper','538f9fd9-dcee-4bee-8b17-1c71eb70867e',NULL),('781e73d6-0e0f-4383-8b52-21d92a03876d','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL),('7d23438c-fb4f-45f8-8ede-34c392f06042','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL),('800848db-06fc-4e35-a3b2-503ecf9948c7','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'97a95718-e3c7-44ba-8495-b008682c5bac'),('878e4783-4847-4970-acfa-4cca3c15c718','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('89805eae-39df-40b3-8baf-231eda0d7e26','address','openid-connect','oidc-address-mapper',NULL,'1cf93d7f-d7b9-43df-95d2-2e43f2783297'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'83d2e492-a1d8-4960-bb81-73766f553d08'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'83d2e492-a1d8-4960-bb81-73766f553d08'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('a352b196-3598-46a0-83a7-db2c3904369f','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c0fc6154-820d-4b43-9693-94a7fd71a1b9'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('b26183d2-353b-4563-abf5-45697f401251','audience resolve','openid-connect','oidc-audience-resolve-mapper','b1127102-57bb-40d9-8eae-80ad22caba17',NULL),('b27848e5-8771-410b-a356-e152298a0537','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ada3183e-4276-4269-a17f-abf07e77738a'),('b4e383fa-5e1e-4a07-a701-8028d5172641','audience resolve','openid-connect','oidc-audience-resolve-mapper','ecd28e06-a518-4c3e-bfb0-362cee7d3d71',NULL),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'e629e355-c05a-4400-9146-943516db1490'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','email','openid-connect','oidc-usermodel-property-mapper',NULL,'32c147dd-aba8-4603-ab92-41f6d27df67a'),('bcd9b419-e4b8-47ea-921e-f167b5a6ff98','acr loa level','openid-connect','oidc-acr-mapper',NULL,'7fe0f941-d846-4b83-be21-6543f103ff5e'),('bd4e3cd5-1787-468c-8706-19f186161039','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('cbe591ba-a77a-4062-86a2-6663465c51f4','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60ef6e4b-3237-4c1b-a572-cdabadaed95b'),('d1bb8787-3d14-466b-9ec9-766af9071275','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','email','openid-connect','oidc-usermodel-property-mapper',NULL,'fbc1f020-473e-422c-9935-ecb6ae695c1b'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('e4e01675-d998-4695-b854-79dd3f4004b1','role list','saml','saml-role-list-mapper',NULL,'07d3e91b-153d-46f3-83ec-681491277122'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60ef6e4b-3237-4c1b-a572-cdabadaed95b'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','username','openid-connect','oidc-usermodel-property-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('ecb5b4d5-7262-44e8-b1a9-b40e5e5d1fdf','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'c0fc6154-820d-4b43-9693-94a7fd71a1b9'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('f27367aa-661a-4ef1-bb51-1fcecb948564','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e629e355-c05a-4400-9146-943516db1490'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'32c147dd-aba8-4603-ab92-41f6d27df67a'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','username','openid-connect','oidc-usermodel-property-mapper',NULL,'e91f7994-e4cf-44b2-807b-0d83a413ee65'),('fb0c7f31-3247-4094-9471-f4373c24e752','full name','openid-connect','oidc-full-name-mapper',NULL,'9bbd0424-5f2f-4fec-9253-3d11bcf10b53'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','locale','openid-connect','oidc-usermodel-attribute-mapper','c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0441ce07-9ebe-47ce-8379-75ba483d389f','true','access.token.claim'),('0441ce07-9ebe-47ce-8379-75ba483d389f','middle_name','claim.name'),('0441ce07-9ebe-47ce-8379-75ba483d389f','true','id.token.claim'),('0441ce07-9ebe-47ce-8379-75ba483d389f','String','jsonType.label'),('0441ce07-9ebe-47ce-8379-75ba483d389f','middleName','user.attribute'),('0441ce07-9ebe-47ce-8379-75ba483d389f','true','userinfo.token.claim'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','true','access.token.claim'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','true','id.token.claim'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','country','user.attribute.country'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','formatted','user.attribute.formatted'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','locality','user.attribute.locality'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','postal_code','user.attribute.postal_code'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','region','user.attribute.region'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','street','user.attribute.street'),('0b9c6cf3-ec2c-482a-a243-8d60f46bb4b2','true','userinfo.token.claim'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','true','access.token.claim'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','given_name','claim.name'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','true','id.token.claim'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','String','jsonType.label'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','firstName','user.attribute'),('0fb8b8e1-ec57-4c0b-b8c6-d2c92946bd65','true','userinfo.token.claim'),('107ec5df-14f0-4adf-b319-7b1705e842ec','true','access.token.claim'),('107ec5df-14f0-4adf-b319-7b1705e842ec','gender','claim.name'),('107ec5df-14f0-4adf-b319-7b1705e842ec','true','id.token.claim'),('107ec5df-14f0-4adf-b319-7b1705e842ec','String','jsonType.label'),('107ec5df-14f0-4adf-b319-7b1705e842ec','gender','user.attribute'),('107ec5df-14f0-4adf-b319-7b1705e842ec','true','userinfo.token.claim'),('17b7062a-ab2a-4646-b718-926afdcab7f8','true','access.token.claim'),('17b7062a-ab2a-4646-b718-926afdcab7f8','phone_number','claim.name'),('17b7062a-ab2a-4646-b718-926afdcab7f8','true','id.token.claim'),('17b7062a-ab2a-4646-b718-926afdcab7f8','String','jsonType.label'),('17b7062a-ab2a-4646-b718-926afdcab7f8','phoneNumber','user.attribute'),('17b7062a-ab2a-4646-b718-926afdcab7f8','true','userinfo.token.claim'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','true','access.token.claim'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','phone_number_verified','claim.name'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','true','id.token.claim'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','boolean','jsonType.label'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','phoneNumberVerified','user.attribute'),('1e7ae299-9c00-496c-a4f4-ee8ce92d35ee','true','userinfo.token.claim'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','true','access.token.claim'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','picture','claim.name'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','true','id.token.claim'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','String','jsonType.label'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','picture','user.attribute'),('216ee544-b6a9-4161-9f22-4f5f3e57a73c','true','userinfo.token.claim'),('23f81139-781c-46ea-900b-9942e6810d11','true','access.token.claim'),('23f81139-781c-46ea-900b-9942e6810d11','zoneinfo','claim.name'),('23f81139-781c-46ea-900b-9942e6810d11','true','id.token.claim'),('23f81139-781c-46ea-900b-9942e6810d11','String','jsonType.label'),('23f81139-781c-46ea-900b-9942e6810d11','zoneinfo','user.attribute'),('23f81139-781c-46ea-900b-9942e6810d11','true','userinfo.token.claim'),('280e3827-e658-4afe-b07d-117c4a11c300','true','access.token.claim'),('280e3827-e658-4afe-b07d-117c4a11c300','middle_name','claim.name'),('280e3827-e658-4afe-b07d-117c4a11c300','true','id.token.claim'),('280e3827-e658-4afe-b07d-117c4a11c300','String','jsonType.label'),('280e3827-e658-4afe-b07d-117c4a11c300','middleName','user.attribute'),('280e3827-e658-4afe-b07d-117c4a11c300','true','userinfo.token.claim'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','true','access.token.claim'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','profile','claim.name'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','true','id.token.claim'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','String','jsonType.label'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','profile','user.attribute'),('2a7d0507-3224-401d-b0ce-f92d1334cd4f','true','userinfo.token.claim'),('2db4aab8-0282-4114-8bb2-9874d39c20da','true','access.token.claim'),('2db4aab8-0282-4114-8bb2-9874d39c20da','birthdate','claim.name'),('2db4aab8-0282-4114-8bb2-9874d39c20da','true','id.token.claim'),('2db4aab8-0282-4114-8bb2-9874d39c20da','String','jsonType.label'),('2db4aab8-0282-4114-8bb2-9874d39c20da','birthdate','user.attribute'),('2db4aab8-0282-4114-8bb2-9874d39c20da','true','userinfo.token.claim'),('313d6b9a-c380-4868-ba90-490fe633f97c','Role','attribute.name'),('313d6b9a-c380-4868-ba90-490fe633f97c','Basic','attribute.nameformat'),('313d6b9a-c380-4868-ba90-490fe633f97c','false','single'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','true','access.token.claim'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','resource_access.${client_id}.roles','claim.name'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','String','jsonType.label'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','true','multivalued'),('38fc2e61-8708-401f-af63-fe1c3012eb4e','foo','user.attribute'),('4362a93e-c257-4b8d-9767-2ea6c697050f','true','access.token.claim'),('4362a93e-c257-4b8d-9767-2ea6c697050f','zoneinfo','claim.name'),('4362a93e-c257-4b8d-9767-2ea6c697050f','true','id.token.claim'),('4362a93e-c257-4b8d-9767-2ea6c697050f','String','jsonType.label'),('4362a93e-c257-4b8d-9767-2ea6c697050f','zoneinfo','user.attribute'),('4362a93e-c257-4b8d-9767-2ea6c697050f','true','userinfo.token.claim'),('4af60d6c-65d7-454a-97e8-2ef67586d227','true','access.token.claim'),('4af60d6c-65d7-454a-97e8-2ef67586d227','groups','claim.name'),('4af60d6c-65d7-454a-97e8-2ef67586d227','true','id.token.claim'),('4af60d6c-65d7-454a-97e8-2ef67586d227','String','jsonType.label'),('4af60d6c-65d7-454a-97e8-2ef67586d227','true','multivalued'),('4af60d6c-65d7-454a-97e8-2ef67586d227','foo','user.attribute'),('4cdbae87-db78-49c1-9a77-8117f54b103d','true','access.token.claim'),('4cdbae87-db78-49c1-9a77-8117f54b103d','gender','claim.name'),('4cdbae87-db78-49c1-9a77-8117f54b103d','true','id.token.claim'),('4cdbae87-db78-49c1-9a77-8117f54b103d','String','jsonType.label'),('4cdbae87-db78-49c1-9a77-8117f54b103d','gender','user.attribute'),('4cdbae87-db78-49c1-9a77-8117f54b103d','true','userinfo.token.claim'),('500f4e49-17b2-4be8-a7c4-0354e6857b7a','true','access.token.claim'),('500f4e49-17b2-4be8-a7c4-0354e6857b7a','true','id.token.claim'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','true','access.token.claim'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','updated_at','claim.name'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','true','id.token.claim'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','long','jsonType.label'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','updatedAt','user.attribute'),('5b77455f-4f41-41dd-812c-5b5b9d49f493','true','userinfo.token.claim'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','true','access.token.claim'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','email_verified','claim.name'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','true','id.token.claim'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','boolean','jsonType.label'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','emailVerified','user.attribute'),('64064d23-e8cb-4466-b24e-b8b719e3fefe','true','userinfo.token.claim'),('6b22d6c5-8995-4cc3-a95f-2ae3bc18ab0d','true','access.token.claim'),('6b22d6c5-8995-4cc3-a95f-2ae3bc18ab0d','true','id.token.claim'),('6b22d6c5-8995-4cc3-a95f-2ae3bc18ab0d','true','userinfo.token.claim'),('6db69087-1974-4e4c-b0f7-0863621842dd','true','access.token.claim'),('6db69087-1974-4e4c-b0f7-0863621842dd','clientAddress','claim.name'),('6db69087-1974-4e4c-b0f7-0863621842dd','true','id.token.claim'),('6db69087-1974-4e4c-b0f7-0863621842dd','String','jsonType.label'),('6db69087-1974-4e4c-b0f7-0863621842dd','clientAddress','user.session.note'),('73434e64-3556-48a2-b8ed-82b11e380c1c','true','access.token.claim'),('73434e64-3556-48a2-b8ed-82b11e380c1c','locale','claim.name'),('73434e64-3556-48a2-b8ed-82b11e380c1c','true','id.token.claim'),('73434e64-3556-48a2-b8ed-82b11e380c1c','String','jsonType.label'),('73434e64-3556-48a2-b8ed-82b11e380c1c','locale','user.attribute'),('73434e64-3556-48a2-b8ed-82b11e380c1c','true','userinfo.token.claim'),('781e73d6-0e0f-4383-8b52-21d92a03876d','true','access.token.claim'),('781e73d6-0e0f-4383-8b52-21d92a03876d','clientId','claim.name'),('781e73d6-0e0f-4383-8b52-21d92a03876d','true','id.token.claim'),('781e73d6-0e0f-4383-8b52-21d92a03876d','String','jsonType.label'),('781e73d6-0e0f-4383-8b52-21d92a03876d','clientId','user.session.note'),('7d23438c-fb4f-45f8-8ede-34c392f06042','true','access.token.claim'),('7d23438c-fb4f-45f8-8ede-34c392f06042','clientHost','claim.name'),('7d23438c-fb4f-45f8-8ede-34c392f06042','true','id.token.claim'),('7d23438c-fb4f-45f8-8ede-34c392f06042','String','jsonType.label'),('7d23438c-fb4f-45f8-8ede-34c392f06042','clientHost','user.session.note'),('878e4783-4847-4970-acfa-4cca3c15c718','true','access.token.claim'),('878e4783-4847-4970-acfa-4cca3c15c718','family_name','claim.name'),('878e4783-4847-4970-acfa-4cca3c15c718','true','id.token.claim'),('878e4783-4847-4970-acfa-4cca3c15c718','String','jsonType.label'),('878e4783-4847-4970-acfa-4cca3c15c718','lastName','user.attribute'),('878e4783-4847-4970-acfa-4cca3c15c718','true','userinfo.token.claim'),('89805eae-39df-40b3-8baf-231eda0d7e26','true','access.token.claim'),('89805eae-39df-40b3-8baf-231eda0d7e26','true','id.token.claim'),('89805eae-39df-40b3-8baf-231eda0d7e26','country','user.attribute.country'),('89805eae-39df-40b3-8baf-231eda0d7e26','formatted','user.attribute.formatted'),('89805eae-39df-40b3-8baf-231eda0d7e26','locality','user.attribute.locality'),('89805eae-39df-40b3-8baf-231eda0d7e26','postal_code','user.attribute.postal_code'),('89805eae-39df-40b3-8baf-231eda0d7e26','region','user.attribute.region'),('89805eae-39df-40b3-8baf-231eda0d7e26','street','user.attribute.street'),('89805eae-39df-40b3-8baf-231eda0d7e26','true','userinfo.token.claim'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','true','access.token.claim'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','nickname','claim.name'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','true','id.token.claim'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','String','jsonType.label'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','nickname','user.attribute'),('8d106a07-88b4-4ec3-9a75-9829218fd89b','true','userinfo.token.claim'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','true','access.token.claim'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','resource_access.${client_id}.roles','claim.name'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','String','jsonType.label'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','true','multivalued'),('9577fc0c-4c10-4331-a5e0-efc9111fa6f5','foo','user.attribute'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','true','access.token.claim'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','realm_access.roles','claim.name'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','String','jsonType.label'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','true','multivalued'),('a03fe74f-f5df-4df1-9ff3-6c868ed7874c','foo','user.attribute'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','true','access.token.claim'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','family_name','claim.name'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','true','id.token.claim'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','String','jsonType.label'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','lastName','user.attribute'),('a2faa248-7aa9-46a5-aa91-47ff44767e11','true','userinfo.token.claim'),('a352b196-3598-46a0-83a7-db2c3904369f','true','access.token.claim'),('a352b196-3598-46a0-83a7-db2c3904369f','realm_access.roles','claim.name'),('a352b196-3598-46a0-83a7-db2c3904369f','String','jsonType.label'),('a352b196-3598-46a0-83a7-db2c3904369f','true','multivalued'),('a352b196-3598-46a0-83a7-db2c3904369f','foo','user.attribute'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','true','access.token.claim'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','birthdate','claim.name'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','true','id.token.claim'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','String','jsonType.label'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','birthdate','user.attribute'),('ac15e579-cccf-4f35-8015-cd046c8d58a2','true','userinfo.token.claim'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','true','access.token.claim'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','given_name','claim.name'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','true','id.token.claim'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','String','jsonType.label'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','firstName','user.attribute'),('aea0a95d-86ad-468d-8cf6-42d6e7e591b4','true','userinfo.token.claim'),('b27848e5-8771-410b-a356-e152298a0537','true','access.token.claim'),('b27848e5-8771-410b-a356-e152298a0537','upn','claim.name'),('b27848e5-8771-410b-a356-e152298a0537','true','id.token.claim'),('b27848e5-8771-410b-a356-e152298a0537','String','jsonType.label'),('b27848e5-8771-410b-a356-e152298a0537','username','user.attribute'),('b27848e5-8771-410b-a356-e152298a0537','true','userinfo.token.claim'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','true','access.token.claim'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','upn','claim.name'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','true','id.token.claim'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','String','jsonType.label'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','username','user.attribute'),('ba4db7f1-a3d8-4cc5-9861-1599f5d780ec','true','userinfo.token.claim'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','true','access.token.claim'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','email','claim.name'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','true','id.token.claim'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','String','jsonType.label'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','email','user.attribute'),('bb2bbdcc-496a-42c6-adcf-6ebd78f17094','true','userinfo.token.claim'),('bcd9b419-e4b8-47ea-921e-f167b5a6ff98','true','access.token.claim'),('bcd9b419-e4b8-47ea-921e-f167b5a6ff98','true','id.token.claim'),('bd4e3cd5-1787-468c-8706-19f186161039','true','access.token.claim'),('bd4e3cd5-1787-468c-8706-19f186161039','nickname','claim.name'),('bd4e3cd5-1787-468c-8706-19f186161039','true','id.token.claim'),('bd4e3cd5-1787-468c-8706-19f186161039','String','jsonType.label'),('bd4e3cd5-1787-468c-8706-19f186161039','nickname','user.attribute'),('bd4e3cd5-1787-468c-8706-19f186161039','true','userinfo.token.claim'),('cbe591ba-a77a-4062-86a2-6663465c51f4','true','access.token.claim'),('cbe591ba-a77a-4062-86a2-6663465c51f4','locale','claim.name'),('cbe591ba-a77a-4062-86a2-6663465c51f4','true','id.token.claim'),('cbe591ba-a77a-4062-86a2-6663465c51f4','String','jsonType.label'),('cbe591ba-a77a-4062-86a2-6663465c51f4','locale','user.attribute'),('cbe591ba-a77a-4062-86a2-6663465c51f4','true','userinfo.token.claim'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','true','access.token.claim'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','phone_number','claim.name'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','true','id.token.claim'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','String','jsonType.label'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','phoneNumber','user.attribute'),('cc58deb6-b91e-4a3a-bde0-a9c1792abea8','true','userinfo.token.claim'),('d1bb8787-3d14-466b-9ec9-766af9071275','true','access.token.claim'),('d1bb8787-3d14-466b-9ec9-766af9071275','locale','claim.name'),('d1bb8787-3d14-466b-9ec9-766af9071275','true','id.token.claim'),('d1bb8787-3d14-466b-9ec9-766af9071275','String','jsonType.label'),('d1bb8787-3d14-466b-9ec9-766af9071275','locale','user.attribute'),('d1bb8787-3d14-466b-9ec9-766af9071275','true','userinfo.token.claim'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','true','access.token.claim'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','website','claim.name'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','true','id.token.claim'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','String','jsonType.label'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','website','user.attribute'),('d3ab9611-e859-4370-b4ac-d8799a059b5e','true','userinfo.token.claim'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','true','access.token.claim'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','email','claim.name'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','true','id.token.claim'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','String','jsonType.label'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','email','user.attribute'),('d6a4211a-9f95-4ee9-b930-1a160d228f80','true','userinfo.token.claim'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','true','access.token.claim'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','website','claim.name'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','true','id.token.claim'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','String','jsonType.label'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','website','user.attribute'),('ddedd0c5-406a-4cbc-b887-c37881bfd21b','true','userinfo.token.claim'),('e4e01675-d998-4695-b854-79dd3f4004b1','Role','attribute.name'),('e4e01675-d998-4695-b854-79dd3f4004b1','Basic','attribute.nameformat'),('e4e01675-d998-4695-b854-79dd3f4004b1','false','single'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','true','access.token.claim'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','picture','claim.name'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','true','id.token.claim'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','String','jsonType.label'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','picture','user.attribute'),('e96af2e5-9762-41f7-a633-ee0b696f0d9c','true','userinfo.token.claim'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','true','access.token.claim'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','phone_number_verified','claim.name'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','true','id.token.claim'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','boolean','jsonType.label'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','phoneNumberVerified','user.attribute'),('eab9faf3-43fa-4f9a-9c78-36c835e5b979','true','userinfo.token.claim'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','true','access.token.claim'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','preferred_username','claim.name'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','true','id.token.claim'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','String','jsonType.label'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','username','user.attribute'),('ec59aa2b-ce19-493d-bba2-24dd423d6a55','true','userinfo.token.claim'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','true','access.token.claim'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','updated_at','claim.name'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','true','id.token.claim'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','long','jsonType.label'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','updatedAt','user.attribute'),('ee6ab12e-cdd0-4798-afe1-f1a2383e04ae','true','userinfo.token.claim'),('f27367aa-661a-4ef1-bb51-1fcecb948564','true','access.token.claim'),('f27367aa-661a-4ef1-bb51-1fcecb948564','groups','claim.name'),('f27367aa-661a-4ef1-bb51-1fcecb948564','true','id.token.claim'),('f27367aa-661a-4ef1-bb51-1fcecb948564','String','jsonType.label'),('f27367aa-661a-4ef1-bb51-1fcecb948564','true','multivalued'),('f27367aa-661a-4ef1-bb51-1fcecb948564','foo','user.attribute'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','true','access.token.claim'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','email_verified','claim.name'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','true','id.token.claim'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','boolean','jsonType.label'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','emailVerified','user.attribute'),('f3a90e29-5cf0-405b-83d3-64ccebe47479','true','userinfo.token.claim'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','true','access.token.claim'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','profile','claim.name'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','true','id.token.claim'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','String','jsonType.label'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','profile','user.attribute'),('f4f6542f-0296-4df4-bf6b-e1db8497d771','true','userinfo.token.claim'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','true','access.token.claim'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','preferred_username','claim.name'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','true','id.token.claim'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','String','jsonType.label'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','username','user.attribute'),('f8005c85-3bfc-4892-9490-f8b4841cec7b','true','userinfo.token.claim'),('fb0c7f31-3247-4094-9471-f4373c24e752','true','access.token.claim'),('fb0c7f31-3247-4094-9471-f4373c24e752','true','id.token.claim'),('fb0c7f31-3247-4094-9471-f4373c24e752','true','userinfo.token.claim'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','true','access.token.claim'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','locale','claim.name'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','true','id.token.claim'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','String','jsonType.label'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','locale','user.attribute'),('fd7d0c1e-ec82-4a0f-9329-903839adb223','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'migros',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','7f6fa78e-8112-4488-8dec-a266080415b5',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','eb368547-7e3f-4f1d-8497-0b77f1f3b5de','a8a5cf55-8a83-4918-b243-55a19461fb0a','dbe14ab2-58ca-4f78-97f1-de4fa8fff9bf','d5a4a85e-ba0d-48da-bdcb-82c398ae67fa','1cea36f1-e933-4685-9f94-904983f38aa7',2592000,_binary '\0',900,_binary '',_binary '\0','47e649df-6358-4dca-a9f0-cfe1fd54a3cc',0,_binary '\0',0,0,'f067d09a-f071-4bf3-9f28-ba883a2a1a69'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','f46d8878-4fa8-4e7c-abf2-4ba929888b2d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','bbd56b64-39e5-4dc0-a2b5-729821b5997c','b16a7861-2289-450b-873c-af9ac0367b2f','fdcf216d-93e9-4449-a79b-09915dec5dce','7116fad7-7079-4f89-95c6-a90665d1a8a2','d5c16d23-71b3-4187-85f7-996a2c9070b3',2592000,_binary '\0',900,_binary '',_binary '\0','272a564c-031e-499f-9bcb-28b5b989ef91',0,_binary '\0',0,0,'bcf666b6-2ba5-495a-b679-119ad3629bf4');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',''),('_browser_header.contentSecurityPolicyReportOnly','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',''),('_browser_header.strictTransportSecurity','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','nosniff'),('_browser_header.xContentTypeOptions','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','nosniff'),('_browser_header.xFrameOptions','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','SAMEORIGIN'),('_browser_header.xFrameOptions','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','SAMEORIGIN'),('_browser_header.xRobotsTag','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','none'),('_browser_header.xRobotsTag','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','none'),('_browser_header.xXSSProtection','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1; mode=block'),('_browser_header.xXSSProtection','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','1; mode=block'),('acr.loa.map','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','{}'),('actionTokenGeneratedByAdminLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','43200'),('actionTokenGeneratedByUserLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','300'),('bruteForceProtected','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('bruteForceProtected','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','false'),('cibaAuthRequestedUserHint','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','login_hint'),('cibaBackchannelTokenDeliveryMode','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','poll'),('cibaExpiresIn','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','120'),('cibaInterval','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','5'),('client-policies.policies','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','{\"policies\":[]}'),('client-policies.profiles','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('clientOfflineSessionMaxLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('clientSessionIdleTimeout','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('clientSessionMaxLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('defaultSignatureAlgorithm','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','RS256'),('defaultSignatureAlgorithm','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','RS256'),('displayName','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',''),('displayName','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','Keycloak'),('displayNameHtml','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',''),('displayNameHtml','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','30'),('failureFactor','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','30'),('frontendUrl','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','http://localhost:8090'),('maxDeltaTimeSeconds','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','43200'),('maxDeltaTimeSeconds','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','43200'),('maxFailureWaitSeconds','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','900'),('maxFailureWaitSeconds','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','900'),('minimumQuickLoginWaitSeconds','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','60'),('minimumQuickLoginWaitSeconds','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','60'),('oauth2DeviceCodeLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','600'),('oauth2DevicePollingInterval','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','5'),('offlineSessionMaxLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','5184000'),('offlineSessionMaxLifespan','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','5184000'),('offlineSessionMaxLifespanEnabled','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('offlineSessionMaxLifespanEnabled','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','false'),('parRequestUriLifespan','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','60'),('permanentLockout','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('permanentLockout','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','false'),('quickLoginCheckMilliSeconds','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','1000'),('quickLoginCheckMilliSeconds','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','1000'),('realmReusableOtpCode','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('realmReusableOtpCode','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','false'),('waitIncrementSeconds','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','60'),('waitIncrementSeconds','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','60'),('webAuthnPolicyAttestationConveyancePreference','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyAuthenticatorAttachment','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','false'),('webAuthnPolicyCreateTimeout','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('webAuthnPolicyCreateTimeoutPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','0'),('webAuthnPolicyRequireResidentKey','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyRpEntityName','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','keycloak'),('webAuthnPolicyRpId','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',''),('webAuthnPolicyRpIdPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',''),('webAuthnPolicySignatureAlgorithms','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','ES256'),('webAuthnPolicyUserVerificationRequirement','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','jboss-logging'),('be56e6b2-8164-47ac-8780-e1c5e3bf60aa','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e'),('password','password',_binary '',_binary '','be56e6b2-8164-47ac-8780-e1c5e3bf60aa');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('538f9fd9-dcee-4bee-8b17-1c71eb70867e','/admin/migros/console/*'),('8def3445-6bfa-439d-b48f-9640c3b80bc3','/realms/master/account/*'),('b1127102-57bb-40d9-8eae-80ad22caba17','/realms/master/account/*'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','/admin/master/console/*'),('d285ec78-68f9-4a71-897d-7e1b1f58dadd','/realms/migros/account/*'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','/realms/migros/account/*'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('1170625f-9654-43aa-bdca-13389208e379','VERIFY_EMAIL','Verify Email','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','VERIFY_EMAIL',50),('3f18fa33-4e30-4a91-b1c2-5c7315557c82','webauthn-register-passwordless','Webauthn Register Passwordless','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','webauthn-register-passwordless',80),('519340fa-92b9-44bb-b544-3e2d0a5cae53','update_user_locale','Update User Locale','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','update_user_locale',1000),('614f31cd-a0a8-40f2-bab2-0741e17bd620','webauthn-register','Webauthn Register','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','webauthn-register',70),('6b5a1571-025d-4446-9870-528102d5b8df','webauthn-register-passwordless','Webauthn Register Passwordless','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','webauthn-register-passwordless',80),('808f2a87-ba39-49f2-be69-4e81220ef1c6','delete_account','Delete Account','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0',_binary '\0','delete_account',60),('87d55fee-8841-477a-bcc3-48cf4e3590cd','UPDATE_PROFILE','Update Profile','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','UPDATE_PROFILE',40),('8be2d88f-f499-40ca-bcea-d3172af011f2','CONFIGURE_TOTP','Configure OTP','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','CONFIGURE_TOTP',10),('9ae40af6-3187-4823-a29d-8ed5416b6aa5','update_user_locale','Update User Locale','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','update_user_locale',1000),('a06ab163-f941-4a16-97a0-e8bc3466b0b2','UPDATE_PASSWORD','Update Password','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a3168540-48dd-45f1-a7f1-9830d3d67e16','UPDATE_PASSWORD','Update Password','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a9758422-2991-4dde-8e4f-0d34140a939b','delete_account','Delete Account','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '\0',_binary '\0','delete_account',60),('b9e40684-0455-4cd3-bcf5-af5828eb41fd','TERMS_AND_CONDITIONS','Terms and Conditions','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('c25a33ac-52c6-4965-bacd-a1aa33897866','TERMS_AND_CONDITIONS','Terms and Conditions','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('c7253b63-b9e8-4897-86b2-2abf0fbb339f','CONFIGURE_TOTP','Configure OTP','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','CONFIGURE_TOTP',10),('fc388bd6-5c9c-49a0-84a4-ae5bf9dbfe76','webauthn-register','Webauthn Register','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','webauthn-register',70),('fed39dcf-5c15-4da7-99b0-e17f1df046d7','UPDATE_PROFILE','Update Profile','be56e6b2-8164-47ac-8780-e1c5e3bf60aa',_binary '',_binary '\0','UPDATE_PROFILE',40),('ffb74c12-05d3-455d-98c7-38a64ca24114','VERIFY_EMAIL','Verify Email','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',_binary '','0',1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('14909f0e-8565-4320-8fc3-fe9dd72b415b','Default Permission','A permission that applies to the default resource type','resource','1','0','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL),('e5913f6a-d8e7-4af1-b155-bfdbe02fd495','Default Policy','A policy that grants access only for users within this realm','js','0','0','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('d7307ece-51fb-4113-9260-0a61278b9b15','Default Resource','urn:courier-service:resources:default',NULL,'f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('d7307ece-51fb-4113-9260-0a61278b9b15','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('b1127102-57bb-40d9-8eae-80ad22caba17','4a2218d2-837c-4096-8e5a-848aed1b0e79'),('b1127102-57bb-40d9-8eae-80ad22caba17','69376087-9a84-4d02-b570-f68d7dc5846d'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','ef3df24d-bf92-42ed-91c4-d9165b6ef6bf'),('ecd28e06-a518-4c3e-bfb0-362cee7d3d71','fd47d567-36f4-4271-bc1f-a7e8c957df9c');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('1f00d413-5c41-4c48-8e0d-a0f47135d715',NULL,'258876f7-0a80-43af-b6bb-d0bd3c5c4f83',_binary '',_binary '',NULL,'Test','User','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','test-user@gmail.com',1682111986261,NULL,0),('640b7b73-5eec-4ef0-ad55-9d8b0a0d739b','sessevmezbugra@gmail.com','sessevmezbugra@gmail.com',_binary '',_binary '',NULL,'Buğra','Sessevmez','be56e6b2-8164-47ac-8780-e1c5e3bf60aa','admin',1681975685699,NULL,0),('ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9',NULL,'26a0a021-9f5d-45fd-8aa3-b7a4573473d1',_binary '',_binary '',NULL,'','','9ce3f8b6-05f3-4f64-b611-87940c0e2c2e','service-account-courier-service',1681976294266,'f50e1ab4-a0a6-4088-a572-6ce5e5e1babe',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('f067d09a-f071-4bf3-9f28-ba883a2a1a69','1f00d413-5c41-4c48-8e0d-a0f47135d715'),('006d1800-f19e-4e38-9a6d-1ff9560f3792','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('057e1bd3-e237-4145-8618-a8944a658f6a','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('0c774f16-1467-4027-b1b2-5a7f3d4bacca','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('0e6edecc-ce9e-44f8-81af-4561eea87259','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('1f98b599-9bcd-4c4c-9033-1a887d485706','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('20dc59a7-57fc-46c4-b7bd-d4f9fd2684ad','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('240dc91c-441a-4d19-95a3-1d256426a08c','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('25987e89-8c62-41ed-b617-4149b5a4a6de','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('2ee871a4-d938-41c5-8f74-2cde6e52710a','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('30e1ac5a-c4e9-4b44-81e7-17d1449cd012','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('32e61a8f-cdf3-441a-ab73-386a414db068','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('34f7d329-86b6-4030-873b-7d06ff813b9f','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('44a8516a-2b2c-4056-bcf0-5d525777ff77','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('4a2218d2-837c-4096-8e5a-848aed1b0e79','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('4c3fc0e7-0eba-4feb-ad9f-271468fc6d80','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('4ce160c3-d3e2-4a16-aeae-b44814ab3426','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('549bd2f2-dd77-475f-babc-2eb0b2d206b8','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('63134816-fb3e-4a38-bec5-ddb78c42302e','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('67c2e89b-b2a2-4c6c-ad5d-b128cff367d2','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('69376087-9a84-4d02-b570-f68d7dc5846d','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('6e15eeb0-5386-4ef3-b4e3-bb5c9fe13f8e','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('7b4e51fc-46d0-46dd-b4f5-51bce05ae4c6','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('7b8192a3-8b26-4409-9758-7c6f6dc51257','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('800b47f5-744e-4394-8122-570422486ab8','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('80a3d7c8-618a-48a3-b4ff-f406a2fdd3a6','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('82b7b2e1-fa20-4d19-8607-bca558c24c4a','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('84888b26-ed50-4788-b538-07e910fe4805','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('89cb3197-829d-4738-b79e-d613fbd827c1','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('97f2bfd8-07bb-4862-8796-86394f5a7e6d','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('a283bab5-7576-41e0-b835-7223b4d88ae3','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('a80b9a52-0346-45e3-9079-d1b9ad2c576e','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('b4d4616a-5f62-4c94-9b51-989da8bb4381','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('b5e22814-d6c1-4cbe-9452-7b12050e50f5','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('bac5b47b-d355-4c82-8df2-d21984119083','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('baf9399d-9f5b-4026-9145-d19797a91196','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('bcf666b6-2ba5-495a-b679-119ad3629bf4','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('ccc7e73d-2aa6-45bb-b173-3a93aedd2d83','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('cf14f423-ba51-403c-ac41-19da730ee27c','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('d54aad11-a8df-46a8-81e7-4d78efd8c1ac','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('d8a7e471-0ed5-460f-81d9-e297e5685faf','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('e40e4327-5436-456f-949c-f44598f49e69','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('e6e35e72-3e9b-46cd-a00d-3efcfbde9698','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('e6e8a564-08ca-4516-b1cb-5e57c6b1c5bd','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('e9ffc34f-c1ae-4191-aa0e-6fe5b91abe79','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('ec0ba1e3-7f71-4448-8b00-c460620e86c2','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('ec53ffaf-8b6c-4f46-b89c-dfba365e0a40','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('efde4911-0e12-4535-a032-322faf8e79a8','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('f93c6aa0-40d0-44d5-bfeb-e4b30d60c91b','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('fb0fb0db-d483-4799-8eed-ea96a1b32a86','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('ff7480e5-7bd7-4076-9d6c-8e8b22458f25','640b7b73-5eec-4ef0-ad55-9d8b0a0d739b'),('0d4d2e6e-83f1-44d0-82be-fee7eb968fc4','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('17d3753b-5798-4aac-bfab-703b41477441','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('1c02c140-48e6-4194-be0a-e3390fea0548','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('26d50ccc-9082-4f18-a9d1-177571bc11a0','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('2deef474-861e-4387-8501-4abcc56aaba8','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('32a87267-1abb-407d-bfc0-beb4185f65a6','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('37320bad-ed84-4a39-9e68-53a76dbeec61','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('3a17f7c4-a837-4f05-9b4c-9f17fe95c8c0','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('3a7d75d1-54ed-4dc4-8a63-922be29b7029','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('7cd1420d-6cc7-49b1-8b08-d909c1855219','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('7f41b1b7-df35-46ef-883d-e39c58ec8160','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('88d01ca0-6a7d-4752-9bb8-952ec9d5bf14','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('893ee80a-c1cb-43e5-b2cd-ea867a0fe1bd','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('895a1815-b3d9-49fe-b2bf-e5b0ff8b5b6e','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('99a51e39-4cd3-47aa-a571-2edf6baf5410','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('9fd59689-3dbb-42a1-93fe-117673d9e9d2','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('9fec1df2-44c2-4952-b8a4-9989f0a22b46','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('a325a417-e8cf-4fdb-8e19-7a32a138353a','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('a84e0d4e-9f74-4dba-829e-e39b53c07c22','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('b755bdd6-b3a1-476a-af66-0acc406b3fe5','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('bba33893-c19b-4759-892a-f2c56e29d287','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('c127cb86-fe20-4b5e-bdde-3b2feeebb9a5','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('c47fe89d-8fdb-4c0f-8fbf-8defcd2a9b5e','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('c9283d31-da39-4c4e-a488-87bbc5d1aab7','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('d1525678-2f80-459d-8c97-0040844edc54','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('d5783327-86ee-4050-9be3-b156af332d72','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('dd24f839-8171-4a51-ba47-8f146a33f836','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('ebd080f3-61df-41bc-996b-973a9d4a3be8','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('ef3df24d-bf92-42ed-91c4-d9165b6ef6bf','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('f067d09a-f071-4bf3-9f28-ba883a2a1a69','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('f9f08e3e-8f01-424e-ab0f-52c6d72bcfa2','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9'),('fd47d567-36f4-4271-bc1f-a7e8c957df9c','ad7e2847-bdf7-4f5e-88e4-265b8cd1b2d9');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('538f9fd9-dcee-4bee-8b17-1c71eb70867e','+'),('c7ff1eb7-6ff6-477e-b0c3-a7b0709bfcd6','+'),('f50e1ab4-a0a6-4088-a572-6ce5e5e1babe','*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26  6:43:42
