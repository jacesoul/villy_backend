-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: villys
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (52,1,1,6);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'carts','cart'),(1,'contenttypes','contenttype'),(12,'orders','order'),(16,'orders','orderitem'),(13,'orders','orderliststatus'),(14,'orders','orderstatus'),(15,'orders','shipment'),(6,'products','efficacy'),(7,'products','product'),(9,'products','productefficacy'),(8,'products','productsummary'),(11,'reviews','review'),(2,'sessions','session'),(5,'users','point'),(4,'users','pointhistory'),(3,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'products','0001_initial','2021-07-14 17:30:20.526764'),(2,'orders','0001_initial','2021-07-14 17:30:20.727879'),(3,'users','0001_initial','2021-07-14 17:30:20.803646'),(4,'carts','0001_initial','2021-07-14 17:30:20.836700'),(5,'carts','0002_cart_user','2021-07-14 17:30:20.863050'),(6,'contenttypes','0001_initial','2021-07-14 17:30:20.886169'),(7,'contenttypes','0002_remove_content_type_name','2021-07-14 17:30:20.925266'),(8,'orders','0002_order_user','2021-07-14 17:30:20.959550'),(9,'reviews','0001_initial','2021-07-14 17:30:21.011653'),(10,'sessions','0001_initial','2021-07-14 17:30:21.027706');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efficacies`
--

DROP TABLE IF EXISTS `efficacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efficacies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `icon_url` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efficacies`
--

LOCK TABLES `efficacies` WRITE;
/*!40000 ALTER TABLE `efficacies` DISABLE KEYS */;
INSERT INTO `efficacies` VALUES (1,'2021-07-14 17:33:47.494474','2021-07-14 17:33:47.494553','모발','images/bone.svg'),(2,'2021-07-14 17:33:47.500756','2021-07-14 17:33:47.500780','뼈','images/hairstyle.svg'),(3,'2021-07-14 17:33:47.505452','2021-07-14 17:33:47.505547','피부','images/height.svg'),(4,'2021-07-14 17:33:47.508235','2021-07-14 17:33:47.508259','성장','images/therapy.svg');
/*!40000 ALTER TABLE `efficacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `order_list_status_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `shipment_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_412ad78b_fk_orders_id` (`order_id`),
  KEY `order_items_order_list_status_id_7832487a_fk_order_lis` (`order_list_status_id`),
  KEY `order_items_product_id_dd557d5a_fk_products_id` (`product_id`),
  KEY `order_items_shipment_id_4dd7044b_fk_shipments_id` (`shipment_id`),
  CONSTRAINT `order_items_order_id_412ad78b_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_order_list_status_id_7832487a_fk_order_lis` FOREIGN KEY (`order_list_status_id`) REFERENCES `order_list_statuses` (`id`),
  CONSTRAINT `order_items_product_id_dd557d5a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_items_shipment_id_4dd7044b_fk_shipments_id` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,'2021-07-14 17:59:04.863073','2021-07-14 17:59:04.863090',1,1,1,5,1),(2,'2021-07-14 17:59:04.870171','2021-07-14 17:59:04.870197',1,1,1,6,1),(3,'2021-07-14 17:59:04.876619','2021-07-14 17:59:04.876639',1,1,1,8,1),(4,'2021-07-14 17:59:33.865244','2021-07-14 17:59:33.865264',1,2,1,5,1),(5,'2021-07-14 17:59:33.872982','2021-07-14 17:59:33.873001',1,2,1,6,1),(6,'2021-07-14 17:59:33.879036','2021-07-14 17:59:33.879053',1,2,1,8,1),(7,'2021-07-14 18:00:35.250720','2021-07-14 18:00:35.250740',1,3,1,5,1),(8,'2021-07-14 18:00:35.256672','2021-07-14 18:00:35.256691',1,3,1,6,1),(9,'2021-07-14 18:00:35.262550','2021-07-14 18:00:35.262568',1,3,1,8,1),(10,'2021-07-14 18:05:22.974979','2021-07-14 18:05:22.975002',2,4,1,1,1),(11,'2021-07-14 18:05:22.979660','2021-07-14 18:05:22.979682',1,4,1,2,1),(12,'2021-07-14 18:06:34.481967','2021-07-14 18:06:34.481995',1,5,1,1,1),(13,'2021-07-14 18:06:34.489161','2021-07-14 18:06:34.489186',1,5,1,2,1),(14,'2021-07-14 18:06:34.496090','2021-07-14 18:06:34.496111',1,5,1,3,1),(15,'2021-07-15 11:06:18.186331','2021-07-15 11:06:18.186350',2,6,1,1,1),(16,'2021-07-15 11:06:18.191132','2021-07-15 11:06:18.191152',1,6,1,2,1),(17,'2021-07-15 11:06:43.064413','2021-07-15 11:06:43.064433',2,7,1,1,1),(18,'2021-07-15 11:06:43.069556','2021-07-15 11:06:43.069576',1,7,1,2,1),(19,'2021-07-15 11:09:43.935267','2021-07-15 11:09:43.935306',2,8,1,1,1),(20,'2021-07-15 11:09:43.941348','2021-07-15 11:09:43.941374',1,8,1,2,1),(21,'2021-07-15 11:11:46.670346','2021-07-15 11:11:46.670411',2,9,1,1,1),(22,'2021-07-15 11:11:46.675110','2021-07-15 11:11:46.675133',1,9,1,2,1),(23,'2021-07-15 11:14:17.887912','2021-07-15 11:14:17.887931',2,10,1,1,1),(24,'2021-07-15 11:14:17.891403','2021-07-15 11:14:17.891419',1,10,1,2,1),(25,'2021-07-15 11:14:23.840745','2021-07-15 11:14:23.840766',2,11,1,7,1),(26,'2021-07-15 11:14:23.845232','2021-07-15 11:14:23.845252',1,11,1,8,1),(27,'2021-07-15 11:14:23.851202','2021-07-15 11:14:23.851220',1,11,1,1,1),(28,'2021-07-15 11:14:23.859760','2021-07-15 11:14:23.859840',1,11,1,2,1),(29,'2021-07-15 11:14:23.867128','2021-07-15 11:14:23.867145',1,11,1,6,1),(30,'2021-07-15 11:23:28.607497','2021-07-15 11:23:28.607514',2,12,1,1,1),(31,'2021-07-15 11:23:28.612821','2021-07-15 11:23:28.612842',1,12,1,2,1),(32,'2021-07-15 11:42:57.325462','2021-07-15 11:42:57.325480',2,13,1,1,1),(33,'2021-07-15 11:42:57.331011','2021-07-15 11:42:57.331031',1,13,1,2,1),(34,'2021-07-15 11:46:09.823551','2021-07-15 11:46:09.823572',1,14,1,1,1),(35,'2021-07-15 11:46:09.831527','2021-07-15 11:46:09.831548',1,14,1,5,1),(36,'2021-07-15 11:47:35.018855','2021-07-15 11:47:35.018890',1,15,1,9,1),(37,'2021-07-15 11:47:35.023943','2021-07-15 11:47:35.023962',1,15,1,10,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list_statuses`
--

DROP TABLE IF EXISTS `order_list_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list_statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list_statuses`
--

LOCK TABLES `order_list_statuses` WRITE;
/*!40000 ALTER TABLE `order_list_statuses` DISABLE KEYS */;
INSERT INTO `order_list_statuses` VALUES (1,'주문완료'),(2,'주문실패'),(3,'결제완료'),(4,'결제오류');
/*!40000 ALTER TABLE `order_list_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'상품 준비중'),(2,'출고 대기'),(3,'배송중'),(4,'배송완료'),(5,'교환(반품)접수'),(6,'교환(반품)중'),(7,'교환(반품)완료'),(8,'주문 취소 접수'),(9,'주문 취소');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_number` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `order_status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_status_id_05e726df_fk_order_statuses_id` (`order_status_id`),
  KEY `orders_user_id_7e2523fb_fk_users_id` (`user_id`),
  CONSTRAINT `orders_order_status_id_05e726df_fk_order_statuses_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-07-14 17:59:04.857637','2021-07-14 17:59:04.857660','c7c6344e-37ce-4f0d-b45f-2f41f90d49be',1,1),(2,'2021-07-14 17:59:33.856242','2021-07-14 17:59:33.856269','b903221e-02c1-42fd-a0cb-258432ff764f',1,1),(3,'2021-07-14 18:00:35.242561','2021-07-14 18:00:35.242585','217bb55a-3e9f-4206-93c2-915ee5b4c0c8',1,1),(4,'2021-07-14 18:05:22.966633','2021-07-14 18:05:22.966653','dd18455e-4110-46c7-8842-8787038aa29e',1,1),(5,'2021-07-14 18:06:34.472712','2021-07-14 18:06:34.472738','e905a7fe-f12f-460e-862c-c600cdfab539',1,1),(6,'2021-07-15 11:06:18.170418','2021-07-15 11:06:18.170450','24a26760-c7e4-4610-98cc-25be16825ba9',1,1),(7,'2021-07-15 11:06:43.057052','2021-07-15 11:06:43.057072','9b9a1bcd-cb09-43bb-a47d-249bd8af336b',1,1),(8,'2021-07-15 11:09:43.925729','2021-07-15 11:09:43.925769','72002ae3-e064-4068-a6d5-7ebcfc74ddc4',1,1),(9,'2021-07-15 11:11:46.665240','2021-07-15 11:11:46.665263','fd1fc088-2285-4a79-8462-d6b2aa0aafe2',1,6),(10,'2021-07-15 11:14:17.882482','2021-07-15 11:14:17.882503','6c0a93a2-8d3d-4e94-a0cb-3e5071df7f9b',1,6),(11,'2021-07-15 11:14:23.834523','2021-07-15 11:14:23.834547','87f8d8fd-6e95-4dc9-8996-a58d75f504bc',1,6),(12,'2021-07-15 11:23:28.600178','2021-07-15 11:23:28.600223','aff5f34f-07b0-4df4-8983-44c4efdeee8c',1,6),(13,'2021-07-15 11:42:57.319291','2021-07-15 11:42:57.319334','07ecc888-84fb-43f7-ad67-f7a61a9964c7',1,6),(14,'2021-07-15 11:46:09.815456','2021-07-15 11:46:09.815478','f6a0075c-a7e8-42ae-b2e8-39ed3e146be8',1,6),(15,'2021-07-15 11:47:35.013784','2021-07-15 11:47:35.013803','8d100062-442a-4a08-8f6d-a9f3bf67f939',1,6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_histories`
--

DROP TABLE IF EXISTS `point_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_histories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `point` int NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `point_histories_order_id_99a5ddc8_fk_orders_id` (`order_id`),
  CONSTRAINT `point_histories_order_id_99a5ddc8_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_histories`
--

LOCK TABLES `point_histories` WRITE;
/*!40000 ALTER TABLE `point_histories` DISABLE KEYS */;
INSERT INTO `point_histories` VALUES (1,'2021-07-14 17:59:04.859948','2021-07-14 17:59:04.859968',35700,1),(2,'2021-07-14 17:59:33.858638','2021-07-14 17:59:33.858661',35700,2),(3,'2021-07-14 18:00:35.245731','2021-07-14 18:00:35.245751',35700,3),(4,'2021-07-14 18:05:22.968845','2021-07-14 18:05:22.968870',51400,4),(5,'2021-07-14 18:06:34.476229','2021-07-14 18:06:34.476250',43900,5),(6,'2021-07-15 11:06:18.173166','2021-07-15 11:06:18.173181',51400,6),(7,'2021-07-15 11:06:43.059038','2021-07-15 11:06:43.059055',51400,7),(8,'2021-07-15 11:09:43.928168','2021-07-15 11:09:43.928189',51400,8),(9,'2021-07-15 11:11:46.666967','2021-07-15 11:11:46.666986',51400,9),(10,'2021-07-15 11:14:17.884158','2021-07-15 11:14:17.884180',51400,10),(11,'2021-07-15 11:14:23.836283','2021-07-15 11:14:23.836303',97700,11),(12,'2021-07-15 11:23:28.602603','2021-07-15 11:23:28.602623',51400,12),(13,'2021-07-15 11:42:57.322259','2021-07-15 11:42:57.322278',51400,13),(14,'2021-07-15 11:46:09.818104','2021-07-15 11:46:09.818123',31400,14),(15,'2021-07-15 11:47:35.015356','2021-07-15 11:47:35.015374',41300,15);
/*!40000 ALTER TABLE `point_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `points_user_id_46b20113_fk_users_id` (`user_id`),
  CONSTRAINT `points_user_id_46b20113_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,'2021-07-14 17:37:00.783814','2021-07-14 17:37:00.783831',643400.00,1),(2,'2021-07-15 10:53:28.864378','2021-07-15 10:53:28.864398',1000000.00,5),(3,'2021-07-15 11:01:14.860851','2021-07-15 11:01:14.860893',624000.00,6);
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_efficacies`
--

DROP TABLE IF EXISTS `product_efficacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_efficacies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `efficacy_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_efficacies_efficacy_id_929a4324_fk_efficacies_id` (`efficacy_id`),
  KEY `product_efficacies_product_id_e781edfe_fk_products_id` (`product_id`),
  CONSTRAINT `product_efficacies_efficacy_id_929a4324_fk_efficacies_id` FOREIGN KEY (`efficacy_id`) REFERENCES `efficacies` (`id`),
  CONSTRAINT `product_efficacies_product_id_e781edfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_efficacies`
--

LOCK TABLES `product_efficacies` WRITE;
/*!40000 ALTER TABLE `product_efficacies` DISABLE KEYS */;
INSERT INTO `product_efficacies` VALUES (1,1,6),(2,1,4),(3,1,8),(4,1,9),(5,2,6),(6,2,7),(7,2,10),(8,3,1),(9,3,3),(10,3,6),(11,3,8),(12,4,1),(13,4,2),(14,4,5),(15,4,9);
/*!40000 ALTER TABLE `product_efficacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_summaries`
--

DROP TABLE IF EXISTS `product_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_summaries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `summary` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_summaries_product_id_e01c6576_fk_products_id` (`product_id`),
  CONSTRAINT `product_summaries_product_id_e01c6576_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_summaries`
--

LOCK TABLES `product_summaries` WRITE;
/*!40000 ALTER TABLE `product_summaries` DISABLE KEYS */;
INSERT INTO `product_summaries` VALUES (1,'눈의 성장과 발육지원',1),(2,'야맹증, 감염 예방',1),(3,'피부 점막을 정상으로 유지',1),(4,'스트레스완화에 도움',2),(5,'신체의 성장 지원',2),(6,'건강한 피부, 탄력있는 피부 유지',2),(7,'신경과민 및 불면증 개선',3),(8,'만성두통과 편두통 예방',3),(9,'머리카락의 윤기 개선',3),(10,'아미노산의 이용에 도움',4),(11,'단백질과 지방의 체내 이용 향상',4),(12,'면역체게 강화',4),(13,'노인 남성의 피로 해소와 체력증진에 도움',5),(14,'위장, 입 안의 점막 보호',5),(15,'기형아 예방',5),(16,'두피의 혈액순환을 개선',6),(17,'백혈구 기능 개선을 통한 면역 강화',6),(18,'강력한 항상화제',6),(19,'뼈의 형성과 유지에 필요',7),(20,'골다공증발생 위험감소에 도움',7),(21,'칼슘과 인이 흡수되고 이용되는데 필요',7),(22,'몸의 산화 방지',8),(23,'근육의 기능 정상화 유지',8),(24,'머리카락에 수분을 공급',8),(25,'피부염 예방',9),(26,'성장 정지 예방',9),(27,'백발방지 및 탈.모.방.지',9),(28,'뼈 조직의 단백질 합성',10),(29,'내출혈을 예방',10),(30,'미용시술에 의한 멍 진행을 단축시킴',10);
/*!40000 ALTER TABLE `product_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tablet` int NOT NULL,
  `thumbnail_image_url` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2021-07-14 17:33:07.945980','2021-07-14 17:33:07.946017','VitaminA','비타민 A는 눈과 피부를 튼튼하게 유지 시켜주고\\n 면역력 향상에 도움을 준다.\\n 피부의 세포를 유지하고 피지와 땀의 분비를 촉진하여\\n 피부를 부드럽고 매끄럽게 해준다.',19500.00,30,'https://media.vlpt.us/images/tycode4/post/24263285-e7d8-4849-9e74-753b7bfdd0fc/image01.png'),(2,'2021-07-14 17:33:07.954464','2021-07-14 17:33:07.954497','VitaminB2','비타민 B2는 건강한 피부, 손톱, 발톱, 그리고 머리털을 만드는 효능이 있다.\\n 특히, 성장과 세포 재생을 도와고 구내염을 예방하기도 한다.\\n 체내 유해한 활성 산소를 제어하는 항산화제 역할을 한다.',12400.00,30,'https://media.vlpt.us/images/tycode4/post/ef9a0db5-40b2-41ac-9924-af3b1f5ed639/image02.png'),(3,'2021-07-14 17:33:07.957064','2021-07-14 17:33:07.957088','VitaminB3','비타민 B3는 음주 후에 숙취를 유발하는 물질인 아세트알데하이드의 분해를 돕는다.\\n 따라서 비타민 B3가 부족하면 술에 심하게 취하거나 숙취가 생길 수 있다.\\n 또한 피부병, 구토, 변비, 설사, 소화장애, 두통, 피로, 기억상실 등의 증상이 나타날 수 있다.',12000.00,30,'https://media.vlpt.us/images/tycode4/post/e19ba196-a244-4b23-ab65-b77fc2508829/image03.png'),(4,'2021-07-14 17:33:07.962148','2021-07-14 17:33:07.962165','VitaminB6','비타민 B6는 단백질과 아미노산의 대사를 촉진하고 신경전달물질 합성에 보조 효소로 작용한다.\\n 비타민 B6의 일부인 피리독신은 온몸에 산소를 전달하는 헤모글로빈을 만드는데 도움을 준다.',10600.00,30,'https://media.vlpt.us/images/tycode4/post/311abab7-7a5c-4b94-a094-887f2f34741f/image04.png'),(5,'2021-07-14 17:33:07.963548','2021-07-14 17:33:07.963571','VitaminB9','비타민 B9는 DNA 합성 및 복구, 세포 분열 및 세포 성장을 포함한 수많은 신체 기능에 필요하다.\\n 태아의 신경과 혈관 발달에 중요하에 임산부와 노인에게 좋다.',11900.00,30,'https://media.vlpt.us/images/tycode4/post/ae9ce327-fecf-425e-a7b3-9d35cba0c7fe/image05.png'),(6,'2021-07-14 17:33:07.964671','2021-07-14 17:33:07.964691','VitmainC','비타민 C는 뼈, 피부 및 결합 조직을 형성, 성장 및 복구하는 데 필수적인 요소이다.\\n 또한 혈관의 정상 기능에 필수적인 역할을 한다.\\n 체내에서 적혈구를 만드는 데 필요한 철분을 흡수하는 데도 도움을 준다.',13900.00,30,'https://media.vlpt.us/images/tycode4/post/4dc751c0-5ffa-45bf-98fc-c86a254980c4/image08.png'),(7,'2021-07-14 17:33:07.965907','2021-07-14 17:33:07.965927','VitmainD','비타민 D는 지용성 비타민으로 칼슘 농도와 골밀도를 유지시켜 골다공증 위험을 예방하며 면역력을 높이는 역할을 한다.\\n 충분한 섭취는 행복 호르몬 또는 세로토닌 합성에 관여해 우울감을 감소시켜준다.\\n 또한 세포 성장을 조절하여 암을 예방하는 데 도움을 준다.',21000.00,30,'https://media.vlpt.us/images/tycode4/post/f84ef205-b328-4b6e-8aba-a482cce98f29/image07.png'),(8,'2021-07-14 17:33:07.979305','2021-07-14 17:33:07.979327','VitaminE','비타민 E는 혈액 순환을 촉힌하며 이는 머리카락 성장에 잇어서 필수적이다.\\n 그리고 항산화 작용으로 콜레스테롤 수치를 낮춰주고 노화방지에 도움을 준다.\\n 우리 몸에 좋지 않은 화학 반응으로부터 세포를 보호하는 역할을 한다.',9900.00,30,'https://media.vlpt.us/images/tycode4/post/4dc751c0-5ffa-45bf-98fc-c86a254980c4/image08.png'),(9,'2021-07-14 17:33:07.981080','2021-07-14 17:33:07.981103','VitaminH','비타민 H는 탄수화물, 아미노산, 지방 등 대사에 관여한다.\\n 골수의 기능을 도와 혈구의 형성을 원할하게 하며 남성 호르몬 분비에도 관여한다.\\n 또한 모발조직 생성에 필요한 영양성분이다.',27500.00,30,'https://media.vlpt.us/images/tycode4/post/cca0fc2e-723c-4485-8073-b1847855cadf/image06.png'),(10,'2021-07-14 17:33:07.982186','2021-07-14 17:33:07.982202','VitaminK','비타민 K는 지용성 비타민의 한 종류로서 상처가 났을 때 빠르게 혈액이 응고되어 과다 출혈을 막아준다.\\n 그리고 칼슘의 흡수를 도와 뼈 건강을 지켜주는 역할을 한다.',13800.00,30,'https://media.vlpt.us/images/tycode4/post/ecb45e90-f5c5-48d4-bc43-ce5db67c5332/image10.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tracking_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,'JU CallTaxi',1234512345),(2,'MJ소한통운',1234512346),(3,'창원글로스틱',1234512347),(4,'Crystal LEE',1234512348),(5,'YUN팡',1234512349),(6,'(주)원GIN',1234512340);
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2021-07-14 17:37:00.780795','2021-07-14 17:37:00.780821','kim2@naver.com','$2b$12$GU6s04SSnw6zy7TRKxPwHe/g1/oQHdCy3Dw1pmW4pBvzu8Oc38CpG','김마지막','010-0000-0005'),(5,'2021-07-15 10:53:28.845100','2021-07-15 10:53:28.845133','kim99@naver.com','$2b$12$FTc6IIvRj0.JiUST1fIXp.BZOHR2claOYgQ7zlfmJ75lfU1dztozm','마지막','010-0000-9999'),(6,'2021-07-15 11:01:14.855729','2021-07-15 11:01:14.855834','kim100@naver.com','$2b$12$qt4/cX9EsxR33kIuvoR9Tuu9r8AQdul5zyZSfJLbNhZGD2/j.pukS','김백씨','010-1000-1000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-15 13:23:32
