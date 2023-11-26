-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: taskmanagement
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_created_by_foreign` (`created_by`),
  CONSTRAINT `comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,4,2,'Expedita delectus sint cum pariatur nulla fugiat.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(2,9,3,'Asperiores aliquid quo quis architecto id veniam eos.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(3,2,1,'Eaque voluptatem excepturi assumenda ullam.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(4,4,4,'Quis necessitatibus repellendus hic vitae est occaecati modi doloribus.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(5,1,1,'Nobis nemo ab nulla.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(6,7,4,'Voluptates in veritatis eum occaecati omnis.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(7,12,2,'Dolore et doloribus quidem in.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(8,12,4,'Est praesentium voluptatem numquam harum cum commodi.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(9,12,4,'Veniam ea provident tempore veniam qui enim adipisci similique.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(10,7,3,'Repellendus beatae magni fugiat quaerat voluptatem.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(11,3,4,'Omnis magni quod aut odio.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(12,2,3,'Pariatur at laborum atque vero dicta.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(13,7,2,'Et alias ratione perspiciatis qui consequatur vel eius unde.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(14,7,2,'Aut iure unde nobis inventore nemo omnis.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(15,1,2,'Molestiae magnam hic quod iure assumenda dignissimos.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(16,11,1,'Rem dignissimos recusandae dolores facere molestiae dolorem blanditiis.',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(17,3,1,'Eos deserunt nemo inventore unde.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(18,5,4,'Voluptas nihil amet nihil aut.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(19,12,4,'Et quod vitae vitae dignissimos a consequatur dignissimos veniam.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(20,3,3,'Deserunt et veritatis quisquam ratione et enim exercitationem temporibus.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(21,8,3,'Dolores molestiae vitae sit voluptas blanditiis.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(22,6,1,'Totam asperiores itaque et pariatur et.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(23,8,1,'Perspiciatis rem quo sapiente sint repellendus.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(24,9,1,'Assumenda accusamus aut et reprehenderit architecto consequatur.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(25,5,4,'Culpa quasi et excepturi et quibusdam in.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(26,8,1,'Temporibus aut rerum exercitationem fugiat atque fugiat.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(27,2,3,'Quasi accusantium est blanditiis.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(28,8,4,'Perspiciatis modi dolor rerum tempora pariatur nostrum voluptatem.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(29,7,2,'Qui excepturi aut mollitia laborum.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(30,4,2,'Quia cupiditate eos qui fuga aut.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(31,9,1,'Dolorum in hic illo esse sit aut.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(32,13,3,'Vitae amet sed dolorem reiciendis.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(33,13,2,'Rem quo et dolores voluptas.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(34,6,2,'Alias aut veniam in illum facilis.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(35,12,2,'Quo et qui vitae voluptas molestiae laudantium animi.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50'),(36,8,2,'Fuga et voluptas cumque debitis.',NULL,'2023-09-12 18:20:50','2023-09-12 18:20:50');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_feedback`
--

DROP TABLE IF EXISTS `customer_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_user` bigint unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1.)Todo 2.)In Progress 3.) Completed 4.) Revision 5.) Archived ',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_feedback_fk_user_foreign` (`fk_user`),
  CONSTRAINT `customer_feedback_fk_user_foreign` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_feedback`
--

LOCK TABLES `customer_feedback` WRITE;
/*!40000 ALTER TABLE `customer_feedback` DISABLE KEYS */;
INSERT INTO `customer_feedback` VALUES (1,5,'ipsum','Occaecati quia maxime error eligendi suscipit qui.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(2,5,'voluptatem','Necessitatibus molestiae quam quaerat harum.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(3,4,'commodi','Aperiam similique itaque aliquid quis magnam in.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(4,5,'eveniet','Omnis repudiandae dignissimos perferendis quod maxime.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(5,4,'amet','Ipsa provident eos veniam sed saepe suscipit illo.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(6,5,'iste','Aut et dolor quae in expedita blanditiis odio dolor.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(7,5,'placeat','Tempora esse omnis qui accusantium.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(8,2,'vel','Eum repellat sint est nemo.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(9,1,'id','Et earum qui odit.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(10,1,'molestiae','Inventore recusandae quia ullam blanditiis ut eligendi.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(11,3,'maiores','Ut provident sit aperiam est molestiae qui ut.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(12,3,'voluptas','Et itaque voluptatem suscipit magnam et.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(13,2,'alias','Doloremque aliquid voluptas non tenetur omnis.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(14,5,'pariatur','Alias voluptas doloremque qui quibusdam placeat.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(15,1,'et','Qui beatae provident est maxime sunt.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(16,4,'molestias','Nam reprehenderit aut ducimus in.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(17,3,'recusandae','Voluptatum rem est blanditiis.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(18,1,'neque','Nobis adipisci quas veniam velit et est et.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(19,4,'eum','Itaque quos deserunt praesentium libero repellendus sint qui.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(20,2,'voluptatem','Cupiditate nulla nemo occaecati iste magni dolore.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(21,1,'nihil','Voluptate consequuntur consequatur rerum cumque molestiae.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(22,4,'nisi','Repellat voluptas et qui reprehenderit quia id.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(23,3,'saepe','Qui exercitationem assumenda labore commodi nulla et ut.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(24,4,'consequatur','Repudiandae amet aut ut dolorem ad vel suscipit.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(25,5,'quia','Quidem nobis aut et dignissimos occaecati magnam nostrum.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(26,1,'rem','Omnis aut repellat odit quas aut.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(27,3,'illum','Voluptates molestias laboriosam quo a veniam.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(28,5,'repudiandae','Consectetur natus quas animi reprehenderit.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(29,3,'a','Cupiditate neque voluptatem cumque mollitia et.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(30,5,'sed','Id occaecati assumenda sed.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(31,4,'velit','Id et autem et quaerat dolores.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(32,2,'quo','Atque autem debitis laboriosam voluptatibus ut.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(33,1,'nihil','Quas ea ea laboriosam et laudantium similique.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(34,4,'ut','Et repudiandae nulla veritatis est aut.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(35,4,'quisquam','Eum et illum eveniet in laudantium consequatur earum vel.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(36,5,'sit','Quam laboriosam vitae delectus.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(37,3,'sed','Est dolores ad occaecati veniam omnis blanditiis.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(38,4,'in','A incidunt accusamus corporis accusamus.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(39,4,'repudiandae','Sint consectetur cumque doloremque provident et et ut.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(40,2,'ad','Qui ratione consequatur enim illum beatae enim.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(41,1,'consequatur','Aut et eveniet impedit quis libero.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(42,5,'aliquid','Nobis consequatur voluptatem qui rerum.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(43,4,'placeat','Pariatur cumque quas autem nesciunt modi.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(44,1,'dolores','Cupiditate aut nobis temporibus id voluptas deserunt.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(45,4,'officia','Quia magni qui labore voluptate accusantium ipsa.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(46,3,'ullam','Est rerum et voluptates quas officiis est rerum beatae.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(47,1,'ratione','Libero repellat dignissimos est consequuntur omnis voluptatum suscipit.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(48,5,'dolores','Quas voluptatem eligendi aut laboriosam.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(49,4,'molestias','Omnis non qui illo neque sunt.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(50,4,'quaerat','Voluptas sunt quos est voluptatem earum qui.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(51,4,'omnis','Ad labore fugit et sed perspiciatis ipsum voluptas.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(52,4,'est','Pariatur soluta enim ad a voluptatibus.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(53,3,'omnis','Quia fuga culpa voluptas assumenda.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(54,2,'alias','Eos quis est itaque.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(55,4,'eum','Ut maiores voluptatem fugiat perferendis doloribus.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(56,5,'quae','Explicabo et ut repellat eius sequi aliquam odio hic.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(57,4,'nemo','Repudiandae error velit porro qui quia.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(58,4,'quidem','Dignissimos officiis ut voluptatem omnis nam.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(59,4,'ut','Nesciunt quaerat occaecati ut doloribus impedit.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(60,1,'fugit','Enim sint ducimus minus quis perferendis ab veniam.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(61,1,'et','Odit quo a corporis qui ex.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(62,3,'ratione','Sed magni qui rerum ducimus at nulla in.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(63,4,'doloribus','Mollitia a exercitationem sed quaerat quaerat qui.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(64,2,'quod','Quibusdam eum aspernatur totam ut nesciunt libero.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(65,2,'optio','Magnam et vel sunt tempore sit nesciunt fugit laboriosam.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(66,3,'molestiae','Veritatis omnis ipsa voluptatem reiciendis.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(67,2,'suscipit','Aut rerum vel quia reprehenderit fuga et.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(68,2,'hic','Officia et culpa sapiente voluptatum quasi quisquam natus cumque.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(69,2,'dolorem','Laudantium atque corporis enim ullam nostrum ipsum.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(70,3,'aut','Quis optio et vel corrupti autem sequi ipsum aut.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(71,1,'dolores','Quaerat aliquid qui qui aut repellat.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(72,3,'aut','Ea animi quae sit non.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(73,1,'laboriosam','Possimus beatae labore sint eum illo.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(74,5,'ducimus','Fuga nisi magnam commodi iusto dolor labore assumenda omnis.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(75,4,'repellendus','Possimus eaque est quos ratione necessitatibus et.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(76,2,'unde','Voluptas sed hic illo consequuntur in nulla quo.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(77,5,'id','Vitae nesciunt amet incidunt cupiditate facilis iure et.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(78,2,'optio','Deleniti ad corrupti aliquam nulla eum aliquid.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(79,1,'velit','Odio qui sint aliquam sequi dicta incidunt occaecati.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(80,5,'est','Qui corporis cumque error non aliquam quia.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(81,5,'aspernatur','Reiciendis facilis totam similique dignissimos porro voluptas fugiat.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(82,2,'accusamus','Magnam est recusandae rerum porro accusantium nemo.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(83,3,'deleniti','Occaecati illo est quis debitis enim ut placeat.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(84,1,'occaecati','Atque minima nihil voluptatibus voluptatem laborum eaque labore qui.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(85,3,'tenetur','Corrupti consequatur tempora quis est accusamus voluptas non.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(86,1,'consequatur','Vero animi animi ut illum.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(87,1,'repudiandae','Omnis corrupti ipsam necessitatibus et necessitatibus sint.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(88,4,'voluptatem','Optio commodi odit iusto veniam et minus.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(89,4,'ut','Dolorem et consequatur esse nihil ut velit.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(90,3,'aliquid','Velit totam qui nesciunt quidem.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(91,5,'qui','Qui numquam voluptates esse sint odit mollitia.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(92,3,'est','Doloremque ipsa velit facilis excepturi qui.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(93,5,'optio','Dolores et aut consequatur deleniti.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(94,2,'fugit','Repudiandae cum aut sint unde unde voluptates debitis.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(95,4,'quam','Voluptatum fugiat in unde dolores.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(96,1,'asperiores','Eum excepturi aperiam omnis eos.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(97,4,'consequatur','Sapiente sapiente culpa tenetur beatae suscipit.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(98,4,'dolorem','Voluptatum autem ullam earum eum.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(99,3,'quos','Incidunt dolor quia distinctio autem consequatur nihil dolorum.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(100,4,'odit','Autem non sit minima doloremque eum.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(101,1,'consectetur','Ratione et ratione eligendi praesentium.','5',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(102,4,'itaque','Enim magni ex veniam a ipsa sunt consequatur et.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(103,2,'optio','Ex fugit architecto unde quia quas harum occaecati.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(104,3,'mollitia','Molestias rerum voluptatem harum voluptatem totam.','1',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(105,3,'occaecati','Odit numquam vero et quam.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(106,5,'sequi','Aliquam et nesciunt neque fugiat.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(107,3,'eos','Suscipit recusandae laudantium voluptatem.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(108,5,'doloribus','Autem labore aliquam voluptatem repellendus facere.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(109,4,'itaque','Vitae labore ut sit repellendus et voluptatem qui nihil.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(110,3,'optio','Voluptate dignissimos voluptate pariatur in molestias id non.','3',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(111,3,'aut','Asperiores aut tenetur non ullam nihil et.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(112,2,'laudantium','Aut inventore tempore impedit at ut dolor.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(113,1,'autem','Laboriosam placeat dolores dolorum consequatur.','5',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(114,1,'at','Natus cum quo laboriosam sit ea saepe.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(115,3,'velit','Dolor eum deserunt assumenda assumenda delectus.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(116,3,'nesciunt','Deserunt eaque adipisci sit quae ut aliquam rerum.','4',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(117,2,'necessitatibus','Voluptates qui eos repellat voluptatem atque nam quia.','2',0,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(118,1,'quia','Eos dolor nam optio omnis.','2',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(119,1,'quas','Voluptas modi quo temporibus animi dicta ut dolore.','1',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(120,5,'eos','Ut minus necessitatibus sunt quod et fugiat.','3',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(121,4,'deleniti','Aut sunt provident maiores nihil reiciendis sit.','4',1,'2023-11-03 02:10:25','2023-11-03 02:10:25',NULL),(122,1,'Nemo edit.','Fugiat doloribus repellat cum et ad odio mollitia.','2',0,'2023-11-03 02:10:26','2023-11-05 03:16:28',NULL),(123,2,'qui','Facilis voluptatibus soluta assumenda dolorem.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(124,2,'est','Ab provident facere dolorem consequatur qui qui rerum.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(125,1,'distinctio','Et ea qui et dolorem accusamus.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(126,4,'et','Unde sed ut aut necessitatibus dolores.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(127,2,'cupiditate','Placeat ut qui hic enim.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(128,4,'corrupti','Beatae adipisci voluptas culpa voluptatem sint.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(129,1,'magni','Est praesentium eum enim omnis doloribus ut laboriosam.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(130,4,'et','Quo perferendis qui ut ad nihil et.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(131,2,'id','Ut ducimus dicta architecto dolores tempora magni.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(132,5,'aliquam','Voluptatem porro repellat quia commodi porro ducimus.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(133,4,'eveniet','Tempore esse suscipit harum illum distinctio quos est voluptatum.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(134,5,'ut','Vel suscipit qui culpa occaecati.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(135,3,'autem','Est et beatae fugiat eos aliquid corrupti quia unde.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(136,2,'voluptas','Accusamus quod molestiae quia et odio tempora officiis.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(137,5,'nihil','Et omnis atque et dolorem unde ut est necessitatibus.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(138,4,'a','Error qui voluptatum accusamus consequatur dolorem sit recusandae asperiores.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(139,3,'quo','Cum voluptatem soluta hic adipisci iusto iste.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(140,3,'neque','Dolore voluptatum doloribus deserunt magni ut.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(141,4,'expedita','Fugit ut vel sit saepe.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(142,1,'eaque','Aut at sunt placeat et veniam in et.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(143,1,'aut','Ratione adipisci et et sint repudiandae.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(144,5,'saepe','Labore consectetur dolorum est vel pariatur consequuntur voluptate voluptas.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(145,1,'laudantium','Corrupti nostrum dolores ut architecto dolorem.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(146,1,'aliquid','Perferendis sint dolores ab facere labore et veritatis.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(147,5,'dolores','Voluptatibus quia itaque fuga tenetur explicabo beatae.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(148,1,'voluptas','Omnis vel voluptas molestiae quia et.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(149,2,'quos','Doloremque officiis labore adipisci omnis dolorem numquam.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(150,5,'voluptas','Voluptas voluptatem pariatur dolor sit voluptates.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(151,1,'quisquam','Veritatis dolor tempore nulla fugiat.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(152,2,'eius','Pariatur porro dolores et unde assumenda velit.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(153,5,'libero','Magni qui placeat ipsam minima fugit culpa enim.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(154,2,'voluptatum','Vitae et praesentium quia animi.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(155,3,'mollitia','Minima non tempore voluptatem maxime corporis.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(156,1,'vel','Nihil aperiam sequi quia tenetur asperiores molestiae quo.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(157,2,'ut','Magnam odit velit laboriosam commodi veniam voluptas.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(158,4,'iste','Tenetur minima atque voluptatem omnis perspiciatis accusantium.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(159,2,'sapiente','Beatae eligendi perferendis laudantium est.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(160,4,'ipsa','Tempora quis delectus molestiae.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(161,2,'aut','Enim aut minima neque eveniet.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(162,1,'dolorem','Eveniet saepe perferendis eum et perferendis suscipit.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(163,4,'quam','Labore neque optio temporibus exercitationem cumque facilis eligendi ut.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(164,4,'qui','Similique beatae sed incidunt consequatur eum praesentium.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(165,2,'fugiat','Harum natus ipsam ut molestias quidem eligendi.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(166,1,'quaerat','Ea omnis omnis quas ea et.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(167,4,'cum','Repellat et eum magni delectus quisquam.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(168,2,'expedita','In alias earum est minima qui enim quis.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(169,3,'quo','Non quod veniam quos repellendus.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(170,5,'saepe','Qui mollitia pariatur illo velit deserunt iure.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(171,5,'atque','Veritatis debitis veniam velit delectus dolor.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(172,2,'in','Temporibus qui sint nihil minima hic repellendus.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(173,1,'ut','Explicabo consequatur sed ut recusandae est.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(174,2,'saepe','Quis tempore consequuntur autem aperiam.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(175,3,'alias','Odio dolorem aut provident autem.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(176,5,'assumenda','Cupiditate ipsa voluptatem est asperiores ea recusandae.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(177,3,'veniam','Harum eos facilis corrupti quia.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(178,2,'eum','Deserunt tenetur ipsam modi nesciunt sequi.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(179,2,'qui','Dicta ut error ut quibusdam.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(180,2,'omnis','Deserunt molestiae magnam ullam.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(181,2,'consequatur','Architecto quasi dicta sint quis.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(182,4,'natus','Quas in ut aspernatur ut.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(183,2,'placeat','Consectetur nemo tenetur consequatur nostrum ab repellendus tempore.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(184,5,'eum','Dolore in ratione nihil eos.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(185,4,'rerum','Perferendis libero ratione sed ex.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(186,2,'eum','Itaque et ea modi ipsam fugiat et.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(187,5,'doloribus','Nostrum illum qui est omnis consequatur.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(188,5,'ut','Eos ratione cupiditate quasi esse tenetur.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(189,2,'possimus','Aut quaerat saepe sed nam.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(190,2,'nam','Sit sequi ex sed quam ut.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(191,2,'quod','Ipsum ut et quo quaerat.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(192,5,'blanditiis','Asperiores aut eius ex velit.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(193,2,'quaerat','Et maiores aliquid quia cum similique doloremque.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(194,1,'occaecati','Reiciendis porro laudantium explicabo magni autem dicta esse.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(195,4,'earum','Nam libero nemo ipsam nulla.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(196,1,'eum','Aut perferendis est eius sed pariatur numquam est.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(197,5,'aut','Ut optio magnam sequi fuga ipsa.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(198,2,'qui','Harum totam id corporis cupiditate ut delectus omnis.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(199,3,'nihil','In dolor nihil quidem voluptas explicabo.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(200,1,'ipsa','Est rerum qui amet id assumenda aut.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(201,3,'ut','Voluptatem in reiciendis ipsum et laudantium quia non.','2',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(202,2,'voluptatibus','Ex accusantium ut sequi voluptatem qui consequatur.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(203,2,'sed','Similique et quia est vitae voluptatem debitis ut repellat.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(204,1,'necessitatibus','Ut officia recusandae eligendi est et similique.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(205,1,'vel','Aut pariatur debitis aut beatae ratione.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(206,3,'ut','Sit perspiciatis facilis ut cumque vel corporis.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(207,5,'non','Et illum tenetur repudiandae ut.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(208,3,'sapiente','Dignissimos ut aut suscipit cupiditate.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(209,3,'debitis','Sit et veritatis nam voluptas facilis est.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(210,5,'eius','Aliquid a aliquid vel eaque suscipit expedita perspiciatis suscipit.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(211,3,'cupiditate','Perspiciatis vitae ratione voluptas consequatur enim voluptas.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(212,3,'rerum','Maxime ipsa placeat eum omnis.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(213,3,'enim','Ratione exercitationem quo ut consequuntur.','4',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(214,3,'esse','Aut nulla qui quis ea non cupiditate similique.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(215,3,'corporis','Sed in exercitationem quos ullam.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(216,4,'exercitationem','Qui similique non quia eius aperiam sit amet quam.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(217,5,'quas','Aspernatur porro voluptas atque saepe ipsa doloribus.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(218,1,'atque','Vitae ut aut cupiditate dolore qui.','1',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(219,5,'nulla','Facere earum et id in dolor explicabo.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(220,5,'voluptatibus','Qui odit sit voluptatum eos.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(221,4,'unde','Asperiores sint delectus consequatur tenetur.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(222,2,'sequi','Autem sed mollitia vitae quos.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(223,3,'a','Aut pariatur sapiente cumque quae.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(224,3,'aliquam','Omnis suscipit sint tempora est minus nisi aut.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(225,1,'inventore','Unde perspiciatis eaque facilis autem et.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(226,1,'dolorem','Molestiae voluptate repellat qui at.','3',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(227,3,'voluptate','Dolores ut esse consequatur at nam quos optio et.','5',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(228,1,'aut','Iure ut enim eum non quaerat nobis.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(229,3,'qui','Fuga quos dolores eos excepturi ipsam facilis.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(230,4,'odit','Qui dolores vero ut dignissimos qui aut.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(231,5,'nihil','Ad qui voluptatum voluptas.','4',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(232,3,'illo','Corporis praesentium velit et consequatur voluptas suscipit.','5',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(233,3,'nam','Corrupti cupiditate dolores omnis quasi.','1',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(234,2,'a','Veritatis voluptas est ut aut voluptatum exercitationem.','2',0,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL),(235,4,'laboriosam','Fuga ut voluptas dolorem quas sed atque in.','3',1,'2023-11-03 02:10:26','2023-11-03 02:10:26',NULL);
/*!40000 ALTER TABLE `customer_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_user` bigint unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feeds_user_id_foreign` (`fk_user`),
  CONSTRAINT `feeds_user_id_foreign` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,2,'et test','Qui pariatur ab qui ipsa ipsum laboriosam non voluptatem.',1,'2023-10-30 05:30:09','2023-11-04 10:31:44',NULL),(2,2,'nostrum','Enim sit rerum veritatis rem quod sint.',1,'2023-10-30 05:30:09','2023-11-04 10:32:01','2023-11-04 10:32:01'),(3,1,'porro','Omnis minus ut eos provident et dolores nihil.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(4,3,'sit','Quisquam sit reprehenderit dicta aperiam aut.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(5,3,'ullam','Qui harum omnis quo dicta.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(6,2,'quod','Ducimus ipsum libero suscipit velit.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(7,4,'nobis','Amet quo ratione modi consequatur ipsam ut totam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(8,2,'vero','Repellendus aut dolor iste rerum assumenda aliquam ipsa.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(9,1,'dolores','Non sunt qui nulla sed.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(10,1,'accusantium','Laborum commodi doloremque excepturi.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(11,3,'qui','Veritatis voluptatem dolore reprehenderit consequatur dolor praesentium itaque.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(12,3,'fuga','Quos nemo voluptatum sunt deleniti voluptatem velit iusto.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(13,1,'rerum','Est suscipit minus in.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(14,2,'laboriosam','Harum voluptatem dignissimos nihil quibusdam eveniet.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(15,2,'consequuntur','A qui ex veritatis eligendi fuga.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(16,3,'corporis','Praesentium expedita quibusdam quo eligendi qui quo.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(17,1,'non','Repellendus amet repellendus fuga aut voluptas autem sunt.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(18,1,'doloribus','Ea ullam expedita omnis quasi est dolorum eos et.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(19,1,'molestias','Eum aut aspernatur et non at consequatur harum sed.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(20,3,'odio','Nesciunt et dolorem minima est.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(21,4,'ut','Iusto ea impedit odio soluta est provident nobis.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(22,4,'dignissimos','Iste ut aliquid labore.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(23,2,'quis','Cumque commodi ut voluptates reiciendis facilis eum dolores.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(24,3,'molestiae','Et minus quam in voluptatem eligendi possimus et.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(25,3,'eum','Laborum quasi placeat maiores quas necessitatibus.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(26,4,'similique','Et voluptatibus nisi illo voluptatem sit rerum eum.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(27,1,'consequatur','Totam consequatur est ut facilis.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(28,2,'consectetur','Ipsum reprehenderit praesentium at laudantium nostrum aut.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(29,3,'ab','Exercitationem ex error sint dignissimos exercitationem.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(30,3,'expedita','Maiores commodi deleniti numquam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(31,1,'eos','Et aut maiores dicta veniam dolorum officiis.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(32,1,'dolorem','Eligendi nemo similique sapiente omnis et occaecati nulla at.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(33,2,'quibusdam','Pariatur sed exercitationem perspiciatis explicabo tempore dolorem non corporis.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(34,4,'delectus','Eveniet repellendus qui vitae laboriosam qui voluptate.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(35,2,'quam','Reiciendis ea officiis rem incidunt voluptatem earum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(36,3,'sint','Nihil eos consectetur voluptates sed.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(37,3,'quidem','A iste cupiditate sunt similique assumenda vitae qui dolores.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(38,1,'repudiandae','Molestiae vel voluptatem veniam maiores voluptatem.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(39,2,'est','Et inventore labore voluptatem distinctio magnam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(40,4,'doloremque','Unde ipsam est commodi debitis laboriosam harum quisquam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(41,4,'ea','Aspernatur inventore dolore dolores nostrum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(42,3,'eaque','Cum natus optio non numquam ipsam sint facilis reprehenderit.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(43,4,'minima','Dicta magnam ipsa minus blanditiis debitis culpa incidunt.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(44,3,'veniam','Aperiam quibusdam sint doloribus quia.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(45,1,'explicabo','Atque harum culpa quo repellendus.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(46,3,'magnam','Tempore autem sapiente est minima.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(47,4,'aliquid','Iste autem ut numquam voluptatem non.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(48,3,'earum','Assumenda quasi eos quae.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(49,1,'in','Vel veniam nihil est voluptatem.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(50,3,'aliquam','In laboriosam doloribus tempora et pariatur tempore.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(51,1,'totam','Blanditiis animi est mollitia nihil quisquam.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(52,1,'id','Laboriosam et illum delectus quia voluptatum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(53,1,'perspiciatis','Occaecati quibusdam ut iure possimus laboriosam laboriosam perferendis velit.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(54,3,'impedit','A qui facere et animi voluptate et distinctio.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(55,1,'itaque','Suscipit voluptas expedita molestiae est.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(56,4,'pariatur','Voluptatem mollitia iure perspiciatis qui.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(57,3,'quisquam','Dolores animi aspernatur natus aut id maiores nulla ut.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(58,3,'fugit','Praesentium minus vitae adipisci qui nihil laborum nostrum qui.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(59,4,'voluptatum','Nostrum sed nihil voluptas numquam omnis explicabo velit sed.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(60,1,'iure','Sit illum rerum ut voluptas.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(61,1,'officia','Ducimus aspernatur officia rerum quod aut laboriosam.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(62,1,'dicta','Quisquam exercitationem ea minima enim totam.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(63,3,'vel','Qui ex culpa voluptatem dignissimos reiciendis.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(64,3,'numquam','Ex ea ullam itaque.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(65,2,'voluptatibus','Vel omnis delectus corporis corrupti.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(66,4,'excepturi','Officia aut maiores itaque quia.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(67,2,'nihil','Quod voluptatem consequatur inventore possimus qui.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(68,4,'at','Adipisci qui repudiandae voluptatem porro.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(69,2,'exercitationem','Maxime qui illum est alias itaque voluptatum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(70,2,'libero','Cumque esse beatae sit.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(71,3,'dolore','Repellendus fugit sed quis minus labore dolorem.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(72,4,'blanditiis','Nemo qui vitae expedita.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(73,1,'deleniti','Et id ipsum eius voluptatem at.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(74,3,'adipisci','Sunt quasi quam explicabo hic.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(75,4,'ipsam','Tempore omnis quaerat similique repellat sit aperiam.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(76,1,'necessitatibus','Et at corporis aut voluptas harum.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(77,4,'ipsa','Assumenda autem non voluptas sunt exercitationem autem vitae.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(78,4,'voluptate','Et magni sit magni.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(79,4,'natus','Dolor dolorum corrupti vel et error atque et.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(80,2,'velit','Est et et et neque nam sequi.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(81,4,'amet','Quia repudiandae sequi molestias eos molestiae voluptatibus.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(82,2,'illum','Est ea sit voluptatum maiores.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(83,4,'autem','Odit eveniet eos voluptas consectetur ut quisquam perspiciatis ullam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(84,4,'nulla','Voluptatibus ipsa numquam consequatur at inventore molestias doloribus.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(85,1,'nisi','Et veritatis nostrum quia soluta natus temporibus.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(86,2,'eligendi','Rerum ratione magnam assumenda nesciunt non veritatis delectus.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(87,4,'animi','Est ut est ab optio ipsam consectetur.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(88,3,'sapiente','Nemo id repellat molestiae.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(89,1,'dolor','Nesciunt ut itaque est.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(90,4,'soluta','Et et vel laboriosam expedita id.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(91,4,'inventore','Cumque qui est et commodi voluptatibus nulla.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(92,1,'quas','Aperiam et inventore recusandae est animi quidem.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(93,2,'aspernatur','Id mollitia rerum sit dicta.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(94,1,'sed','Esse ex rerum voluptatibus exercitationem laborum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(95,4,'ratione','Non quam repudiandae ut rerum eligendi quo.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(96,4,'quo','Voluptatem quo dolores voluptates laboriosam doloremque laboriosam.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(97,2,'voluptas','Voluptas voluptatibus repudiandae veritatis dolorem nostrum numquam ut neque.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(98,4,'suscipit','Non alias officia dolor voluptatem.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(99,3,'alias','Libero ratione ut voluptates velit minus dolores cum nulla.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(100,4,'minus','Reiciendis eos deleniti rerum quis.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(101,1,'vitae','Earum ut ut quasi vero aut.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(102,4,'ducimus','Vel odit modi pariatur veritatis fugit pariatur voluptatum.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(103,1,'neque','Atque numquam numquam fugiat veniam ipsum quibusdam et.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(104,4,'enim','Dolore rerum facilis dolorem ad eius quas.',0,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(105,3,'iusto','Unde possimus dicta molestias consequatur ipsam ut doloribus.',1,'2023-10-30 05:30:09','2023-10-30 05:30:09',NULL),(106,1,'New Task Category Created','Task Category: Finance has been created by superadmin@admin.com',1,'2023-11-03 01:20:52','2023-11-03 01:20:52',NULL),(107,1,'New Task Category Created','Task Category: Finance has been created by superadmin@admin.com',1,'2023-11-03 01:20:52','2023-11-03 01:20:52',NULL),(108,1,'Task Category: \"\n            Health\" Created','Task Category: Health has been created by superadmin@admin.com',1,'2023-11-03 01:27:43','2023-11-03 01:27:43',NULL);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Project A','test',NULL,'2023-10-22 05:49:27','2023-10-22 05:49:27');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guards`
--

DROP TABLE IF EXISTS `guards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guards_created_by_foreign` (`created_by`),
  CONSTRAINT `guards_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guards`
--

LOCK TABLES `guards` WRITE;
/*!40000 ALTER TABLE `guards` DISABLE KEYS */;
INSERT INTO `guards` VALUES (1,'web',1,2,'2023-09-12 18:20:50','2023-09-12 18:20:50');
/*!40000 ALTER TABLE `guards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(5,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2019_12_14_000001_create_personal_access_tokens_table',1),(7,'2023_03_26_084305_create_permission_tables',1),(8,'2023_03_31_114218_create_post_categories_table',1),(9,'2023_03_31_114652_create_posts_table',1),(10,'2023_04_09_115055_create_guards_table',1),(11,'2023_04_13_153510_create_notifications_table',1),(12,'2023_04_21_103844_create_task_categories_table',1),(13,'2023_04_21_103856_create_tasks_table',1),(14,'2023_04_22_060907_create_comments_table',1),(15,'2023_09_27_132224_create_task_attachments_table',2),(16,'2023_10_22_080000_create_groups_table',3),(17,'2023_10_22_081010_create_user_group_table',4),(18,'2023_10_29_193332_create_feeds_table',5),(19,'2023_11_03_044253_create_customer_feedback_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(3,'App\\Models\\User',1),(4,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',2),(4,'App\\Models\\User',2),(3,'App\\Models\\User',3),(4,'App\\Models\\User',3),(4,'App\\Models\\User',4);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_group` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifications_FK` (`fk_group`),
  CONSTRAINT `notifications_FK` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1bde113e-ead3-4dec-8bcd-2446c79b6965',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"_Status for task number 20 assigned to admin@admin.com has changed to Completed\"}','2023-09-21 21:55:53','2023-09-21 21:26:06','2023-09-21 21:55:53'),('2bcdda87-85fc-482f-949e-796ad83cdaf4',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 20 assigned to user@admin.com has changed to Archived\"}',NULL,'2023-09-30 04:07:13','2023-09-30 04:07:13'),('2cf4549b-8ac9-4b9e-9559-0ac35b65f6c8',NULL,'App\\Notifications\\TaskStatusNotification','App\\Models\\User',4,'{\"name\":\"Inventore recusandae vel ab debitis ut et voluptas.\",\"email\":\"user@admin.com\",\"message\":\"Task number 2 has changed status to Completed\"}',NULL,'2023-11-02 02:26:43','2023-11-02 02:26:43'),('302ebe1c-8a69-4d9a-98e1-5b36f07030ad',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 20 assigned to user@admin.com has changed to Archived\"}',NULL,'2023-09-30 04:07:13','2023-09-30 04:07:13'),('32aad77d-1abe-4989-9334-9a5d890ddc2a',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been assigned to writer@admin.com\"}','2023-09-21 21:56:02','2023-09-21 21:37:33','2023-09-21 21:56:02'),('47759182-83e1-4d7d-a220-f139b293a361',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Priority for task number 20 assigned to writer@admin.com has changed to High\"}',NULL,'2023-09-21 21:37:33','2023-09-21 21:56:03'),('5100bb8f-a051-4236-aaed-6e35248c598c',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"Quod quia eum vitae\",\"email\":\"user@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-10-04 04:45:48','2023-10-04 04:45:48'),('5266294b-a8b3-4fae-8d8e-6873bcfa26f0',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been assigned to user@admin.com\"}',NULL,'2023-09-30 03:52:51','2023-09-30 03:52:51'),('619ff42c-1cb2-442b-8338-fc107d7205af',NULL,'App\\Notifications\\TaskPriorityNotification','App\\Models\\User',3,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has changed priority to High\"}',NULL,'2023-09-21 21:37:33','2023-09-21 21:37:33'),('6431dce7-9ba9-4b24-8f70-a9ea2a5e68d7',NULL,'App\\Notifications\\TaskStatusNotification','App\\Models\\User',4,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has changed status to Archived\"}',NULL,'2023-09-30 04:07:12','2023-09-30 04:07:12'),('6e6c4f2e-58bf-4622-8745-3252933750e6',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"_Status for task number 20 assigned to admin@admin.com has changed to Completed\"}',NULL,'2023-09-21 21:26:06','2023-09-21 21:26:06'),('7690f35c-9902-40e5-a21b-f87389060142',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been assigned to user@admin.com\"}',NULL,'2023-09-30 03:52:51','2023-09-30 03:52:51'),('780684c5-702b-4fbc-bce8-eaf94b472933',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"Inventore recusandae vel ab debitis ut et voluptas.\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 2 assigned to user@admin.com has changed to Completed\"}',NULL,'2023-11-02 02:26:43','2023-11-02 02:26:43'),('79026eef-62c8-4868-b0f4-577c0a447c1f',NULL,'App\\Notifications\\TaskAssigneeNotification','App\\Models\\User',4,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been reassigned to user@admin.com\"}',NULL,'2023-09-30 03:52:51','2023-09-30 03:52:51'),('9dfded74-97d2-43a1-97d6-142f458a1c74',NULL,'App\\Notifications\\TaskStatusNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"Task number 20 has changed status to Completed\"}',NULL,'2023-09-21 21:26:05','2023-09-21 21:26:05'),('aa2174b4-dcba-42d1-8c84-f917d73fb979',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"Quod quia eum vitae\",\"email\":\"user@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-10-04 04:45:48','2023-10-04 04:45:48'),('b2a8503c-ba02-4fa2-8565-b8a731bb334b',NULL,'App\\Notifications\\TaskAssigneeNotification','App\\Models\\User',3,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been reassigned to writer@admin.com\"}',NULL,'2023-09-21 21:37:33','2023-09-21 21:37:33'),('d2528587-5f96-49ff-9280-169351018189',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Priority for task number 20 assigned to writer@admin.com has changed to High\"}',NULL,'2023-09-21 21:37:33','2023-09-21 21:37:33'),('e17d9763-5656-4372-a34d-44ffabf6a91e',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"Et doloremque velite\",\"email\":\"superadmin@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-09-30 00:51:55','2023-09-30 00:51:55'),('e4bfb212-69a5-414e-ba79-ec4307aa6039',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"Inventore recusandae vel ab debitis ut et voluptas.\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 2 assigned to user@admin.com has changed to Completed\"}',NULL,'2023-11-02 02:26:43','2023-11-02 02:26:43'),('ef91b9c6-b826-4c56-b494-46a0b15ed8d0',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"Et doloremque velite\",\"email\":\"superadmin@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-09-30 00:51:55','2023-09-30 00:51:55'),('fadc0c2b-a923-49ef-a1ff-9c4df1b248f3',NULL,'App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been assigned to writer@admin.com\"}',NULL,'2023-09-21 21:37:33','2023-09-21 21:37:33');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  KEY `permissions_created_by_foreign` (`created_by`),
  CONSTRAINT `permissions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'create users','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(2,'edit users','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(3,'delete users','web',1,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(4,'activate users','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(5,'deactivate users','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(6,'create post categories','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(7,'edit post categories','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(8,'delete post categories','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(9,'publish post categories','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(10,'unpublish post categories','web',1,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(11,'create posts','web',1,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(12,'edit posts','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(13,'delete posts','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(14,'publish posts','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(15,'unpublish posts','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(16,'create task categories','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(17,'edit task categories','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(18,'delete task categories','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(19,'create tasks','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(20,'edit tasks','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(21,'delete tasks','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(22,'create customerFeedback','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(23,'edit customerFeedback','web',1,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(24,'delete customerFeedback','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(25,'create feeds','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(26,'edit feeds','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(27,'delete feeds','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(28,'create roles','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(29,'edit roles','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(30,'delete roles','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(31,'create permissions','web',1,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(32,'edit permissions','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(33,'delete permissions','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(34,'create params','web',4,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(35,'edit params','web',3,'1','2023-11-11 12:52:25','2023-11-11 12:52:25'),(36,'delete params','web',2,'1','2023-11-11 12:52:25','2023-11-11 12:52:25');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_group` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`),
  KEY `post_categories_created_by_foreign` (`created_by`),
  KEY `post_categories_FK` (`fk_group`),
  CONSTRAINT `post_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `post_categories_FK` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,NULL,4,'Sed','sed','Reiciendis aut delectus quo deserunt ea quae. u','0',NULL,'2023-09-12 18:20:49','2023-09-25 21:35:35'),(2,NULL,3,'est','est','Autem velit veritatis ut qui aliquid voluptas hic.','0',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(3,NULL,4,'quo','quo','Quibusdam repellat velit sint enim.','0',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(4,NULL,1,'iste','iste','Qui enim sint ex excepturi nemo rerum.','0',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49');
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_group` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_post.png',
  `created_by` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1.)Draft 2.)Published 3.)Archived',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_created_by_foreign` (`created_by`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_FK` (`fk_group`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`),
  CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_FK` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,NULL,'Aut aspernatur quo odit.','aut-aspernatur-quo-odit','Quia ea sunt et enim dolores asperiores. Commodi qui quod molestias in. Unde officia sit itaque sed consequatur. Numquam impedit eos id aut et.','default_post.png',2,3,'0','1',NULL,'2022-01-12 18:20:49','2023-09-12 18:20:49'),(2,NULL,'Aut qui vel distinctio similique necessitatibus ut molestias aut.','aut-qui-vel-distinctio-similique-necessitatibus-ut-molestias-aut','Et incidunt expedita repellendus fugiat atque eum. Recusandae distinctio eligendi ipsa deserunt expedita perspiciatis consequatur. Et quae ut ut quos quisquam delectus. Dolorem eum possimus laboriosam aut fugiat. Molestiae quas odio nobis provident quibusdam velit et.','default_post.png',3,3,'0','1',NULL,'2022-04-12 18:20:49','2023-09-12 18:20:49'),(3,NULL,'Excepturi dicta tempore doloribus est fugit.','excepturi-dicta-tempore-doloribus-est-fugit','Officiis sapiente blanditiis et ipsam. Ut ut earum placeat quia. Et voluptatem provident sed iure ea vitae animi ex.','default_post.png',2,1,'0','1',NULL,'2022-04-12 18:20:49','2023-09-12 18:20:49'),(4,NULL,'Sed ea tempora qui aperiam sint recusandae.','sed-ea-tempora-qui-aperiam-sint-recusandae','Tempora expedita dolorem minima consectetur quae. Aliquid mollitia enim voluptate ut ducimus et adipisci distinctio. Et placeat in ullam ea aut quas repudiandae. Iusto aut cumque hic id.','default_post.png',4,4,'0','1',NULL,'2022-07-12 18:20:49','2023-09-12 18:20:49'),(5,NULL,'Rerum esse consectetur cum.','rerum-esse-consectetur-cum','Magnam suscipit earum eligendi ipsam. Nam porro quod molestiae et sit maxime. Ut deleniti sed ipsam. Totam provident sequi aut soluta molestias omnis.','default_post.png',1,3,'0','1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(6,NULL,'Sit sapiente ratione et consequatur omnis et autem non.','sit-sapiente-ratione-et-consequatur-omnis-et-autem-non','Assumenda ducimus omnis qui. Odit quo ea corporis. Deleniti explicabo assumenda tempora sunt dolorum saepe iste.','default_post.png',1,1,'0','1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(7,NULL,'Officiis ut quidem porro sit debitis temporibus dolorem et.','officiis-ut-quidem-porro-sit-debitis-temporibus-dolorem-et','Praesentium quis sint numquam sint et consectetur. Qui quis et est aut.','default_post.png',2,2,'0','1',NULL,'2023-08-12 18:20:49','2023-09-12 18:20:49'),(8,NULL,'Placeat harum ullam qui cum ut distinctio culpa.','placeat-harum-ullam-qui-cum-ut-distinctio-culpa','Dolorem qui necessitatibus harum enim quia officia autem. Totam quis eveniet autem aliquid. Quia aut et quia aut quia qui eius et. Facilis aliquam tenetur quis repudiandae nam.','default_post.png',1,3,'0','1',NULL,'2023-10-12 18:20:49','2023-09-12 18:20:49'),(9,NULL,'Ab est nisi quaerat dolorem ullam magni sit.','ab-est-nisi-quaerat-dolorem-ullam-magni-sit','Beatae enim facere nam assumenda delectus. Sed autem dolor et pariatur rem. Veritatis quasi nisi mollitia voluptas pariatur cumque sint.','default_post.png',1,2,'0','1',NULL,'2023-10-12 18:20:49','2023-09-12 18:20:49'),(10,NULL,'Est sunt voluptas enim culpa doloremque.','est-sunt-voluptas-enim-culpa-doloremque','Et laborum et eos natus est aut consectetur. Aliquam enim blanditiis tempore reiciendis impedit dicta voluptate. In tempora enim animi nihil quidem.','default_post.png',1,3,'0','1',NULL,'2023-10-12 18:20:49','2023-09-12 18:20:49'),(11,NULL,'Eligendi dignissimos voluptate blanditiis et et minus.','eligendi-dignissimos-voluptate-blanditiis-et-et-minus','Consequatur ducimus quo et qui maxime rerum nostrum. Perferendis qui molestiae quo debitis eligendi voluptatem quidem aliquam. Veniam veritatis id suscipit consequatur nihil omnis. Neque nam ut quo et.','default_post.png',1,4,'0','1',NULL,'2023-11-12 18:20:49','2023-09-12 18:20:49'),(12,NULL,'Tempora quia corporis perferendis at voluptate ad aut.','tempora-quia-corporis-perferendis-at-voluptate-ad-aut','Voluptatem at eum suscipit quasi qui dolor expedita. Recusandae et voluptatum quia eius sed. Quo perspiciatis amet mollitia architecto consequatur. Modi qui ad qui dolorem et commodi quo. Ut explicabo itaque modi quis repellat pariatur ut.','default_post.png',4,1,'0','1',NULL,'2022-09-12 18:20:49','2023-09-12 18:20:49'),(13,NULL,'Sunt natus ut eum iste recusandae.','sunt-natus-ut-eum-iste-recusandae','Asperiores cupiditate error earum dolor possimus molestiae. Sint ut ab quaerat hic. Quo ab debitis nisi excepturi atque. Iure saepe repudiandae optio distinctio asperiores aut occaecati. Omnis maxime officiis non qui magni omnis.','default_post.png',4,2,'0','1',NULL,'2022-09-12 18:20:49','2023-09-12 18:20:49');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(2,4),(6,4),(7,4),(11,4),(12,4),(26,4);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','web','1','2023-09-12 18:20:47','2023-09-12 18:20:47'),(2,'admin','web','1','2023-09-12 18:20:47','2023-09-12 18:20:47'),(3,'writer','web','1','2023-09-12 18:20:47','2023-09-12 18:20:47'),(4,'user','web','1','2023-09-12 18:20:47','2023-09-12 18:20:47');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_attachments`
--

DROP TABLE IF EXISTS `task_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_attachments_task_id_foreign` (`task_id`),
  CONSTRAINT `task_attachments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_attachments`
--

LOCK TABLES `task_attachments` WRITE;
/*!40000 ALTER TABLE `task_attachments` DISABLE KEYS */;
INSERT INTO `task_attachments` VALUES (15,23,'attachments/VDTwYbP892_images.png','2023-09-30 01:16:41','2023-09-30 01:16:41','images.png'),(16,20,'attachments/bIlT0JouTn_download.jfif','2023-09-30 03:52:49','2023-09-30 03:52:49','download.jfif'),(17,24,'attachments/7BygMCnFGl_thumb-1920-171916.jpg','2023-10-04 04:45:44','2023-10-04 04:45:44','thumb-1920-171916.jpg'),(18,24,'attachments/8NLP411EFC_wp2960860.jpg','2023-10-04 04:45:44','2023-10-04 04:45:44','wp2960860.jpg');
/*!40000 ALTER TABLE `task_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_categories`
--

DROP TABLE IF EXISTS `task_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_group` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_categories_slug_unique` (`slug`),
  KEY `task_categories_created_by_foreign` (`created_by`),
  KEY `task_categories_FK` (`fk_group`),
  CONSTRAINT `task_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `task_categories_FK` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_categories`
--

LOCK TABLES `task_categories` WRITE;
/*!40000 ALTER TABLE `task_categories` DISABLE KEYS */;
INSERT INTO `task_categories` VALUES (1,NULL,'Projects A','projects-a','Tasks associated with specific projects or initiatives.',1,'1',NULL,'2023-09-12 18:20:49','2023-09-22 01:47:41'),(2,NULL,'Projects B','projects-b','Tasks associated with project B and its initiatives.',1,'1',NULL,'2023-09-12 18:20:49','2023-09-22 02:26:31'),(3,NULL,'Projects C','projects-c','Tasks associated with project C and its initiatives.',1,'1',NULL,'2023-09-12 18:20:49','2023-09-22 02:26:59'),(4,NULL,'Projects D','projects-d','Tasks associated with project D and its initiatives. u',4,'1',NULL,'2023-09-12 18:20:49','2023-09-25 21:29:32'),(5,NULL,'Projects E','projects-e','Tasks associated with  project E and its initiatives.',1,'0','2023-09-22 04:14:07','2023-09-22 02:20:48','2023-09-22 04:14:07'),(6,NULL,'Finance','finance','Set What to do with what you earn',1,'0',NULL,'2023-11-03 01:20:52','2023-11-03 01:20:52'),(7,NULL,'Workout','workout','Set a routine to follow for particular month',1,'0',NULL,'2023-11-03 01:25:12','2023-11-03 01:25:12'),(8,NULL,'Health','health','Set the meals and drinks to eat for a particular month',1,'0',NULL,'2023-11-03 01:27:43','2023-11-03 01:27:43');
/*!40000 ALTER TABLE `task_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_group` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '1' COMMENT '1.)Low 2.)Medium 3.) High',
  `due_date` datetime NOT NULL DEFAULT '2023-09-12 21:20:41',
  `completion_date` datetime NOT NULL DEFAULT '2023-09-12 21:20:41',
  `assigned_to` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1.)Todo 2.)In Progress 3.) Completed 4.) Revision 5.) Archived ',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tasks_slug_unique` (`slug`),
  KEY `tasks_assigned_to_foreign` (`assigned_to`),
  KEY `tasks_created_by_foreign` (`created_by`),
  KEY `tasks_category_id_foreign` (`category_id`),
  KEY `tasks_FK` (`fk_group`),
  CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_FK` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Voluptates eligendi hic voluptas perferendis dicta qui.','voluptates-eligendi-hic-voluptas-perferendis-dicta-qui','Possimus sit nam asperiores est molestiae. Quasi autem repellat perferendis labore omnis. Ex excepturi accusantium consequatur ad dolores et minus.',2,'2023-09-12 21:20:41','2022-09-12 21:20:41',4,3,2,1,'1',NULL,'2023-09-12 18:20:49','2023-09-12 18:20:49'),(2,1,'Inventore recusandae vel ab debitis ut et voluptas.','inventore-recusandae-vel-ab-debitis-ut-et-voluptas','Repudiandae et distinctio aut iste. Ullam dolore minus exercitationem eum perferendis dolor. At qui laborum dolorem eos quaerat.',3,'2023-09-12 00:00:00','2022-09-12 00:00:00',4,1,3,1,'3',NULL,'2023-09-12 18:20:49','2023-11-02 02:26:42'),(3,NULL,'Reprehenderit molestiae expedita iure ut molestiae.','reprehenderit-molestiae-expedita-iure-ut-molestiae','Sit repellat adipisci exercitationem vel officia quis. Suscipit quisquam et at quo placeat vel reiciendis. Placeat eum corrupti et praesentium alias.',1,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,1,2,1,'1','2023-09-23 04:06:53','2023-08-12 18:20:49','2023-09-23 04:06:53'),(4,NULL,'Aut quasi commodi nulla magnam itaque ad.','aut-quasi-commodi-nulla-magnam-itaque-ad','Sunt ut quo eum repudiandae quis libero. Voluptatem accusamus eius fugiat eum. Vitae et atque qui est deleniti.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,2,1,1,'1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(5,NULL,'Vero itaque ut sed eos et dolorum.','vero-itaque-ut-sed-eos-et-dolorum','Possimus ut facere ut accusantium ratione omnis soluta. Aliquid mollitia sequi maiores qui aspernatur. Suscipit hic laborum eum quae veritatis voluptate amet. Nihil et atque nulla sed dolorum magnam.',2,'2023-09-12 21:20:41','2023-08-12 21:20:41',3,3,4,1,'1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(6,NULL,'Molestias aliquam magni facere natus.','molestias-aliquam-magni-facere-natus','Fugit excepturi iusto earum maiores consequatur esse necessitatibus. Aut excepturi eos earum dolore. Voluptas molestias officiis expedita iusto.',3,'2023-09-12 21:20:41','2023-07-12 21:20:41',1,3,4,1,'1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(7,NULL,'Aut nobis quis et sit.','aut-nobis-quis-et-sit','Quo ipsa quas molestiae suscipit. Assumenda saepe rerum atque voluptas consequatur pariatur. Ipsa et harum delectus est voluptatem assumenda.',2,'2023-09-12 21:20:41','2023-07-12 21:20:41',4,2,2,1,'1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(8,NULL,'Quia et soluta tempora dolorem.','quia-et-soluta-tempora-dolorem','Modi culpa alias asperiores iste ex. Laborum enim voluptatibus inventore neque iure qui earum expedita. Repudiandae quo impedit rerum delectus blanditiis asperiores voluptas.',2,'2023-09-12 21:20:41','2023-07-12 21:20:41',2,4,1,1,'1',NULL,'2023-07-12 18:20:49','2023-09-12 18:20:49'),(9,NULL,'Vel ratione at atque necessitatibus quam officia.','vel-ratione-at-atque-necessitatibus-quam-officia','Eos repellat quo aut. Placeat possimus nihil aspernatur omnis consequatur. Architecto amet consequatur vero nam fugit est.',3,'2023-09-12 21:20:41','2023-06-12 21:20:41',2,1,1,1,'1',NULL,'2023-06-12 18:20:49','2023-09-12 18:20:49'),(10,NULL,'Consectetur et eum occaecati non.','consectetur-et-eum-occaecati-non','Molestias ut deserunt rem dolorem maiores cum voluptatum. Quisquam nulla ut ut sed consequuntur aspernatur. Deleniti iusto perferendis dolor tenetur. Consequatur optio dolor occaecati nobis tenetur.',1,'2023-09-12 21:20:41','2023-06-12 21:20:41',1,4,3,1,'1',NULL,'2023-06-12 18:20:49','2023-09-12 18:20:49'),(11,NULL,'Et ut iusto incidunt ducimus exercitationem error.','et-ut-iusto-incidunt-ducimus-exercitationem-error','Cumque aut omnis inventore ut saepe assumenda est amet. Sed omnis iure et. Quis enim odit molestiae id repellendus expedita excepturi et.',1,'2023-09-12 21:20:41','2023-05-12 21:20:41',3,3,2,1,'1',NULL,'2022-09-12 18:20:49','2023-09-12 18:20:49'),(12,NULL,'Sit libero est eos quia nisi sequi.','sit-libero-est-eos-quia-nisi-sequi','Explicabo officiis corporis ratione ea. Ea non in et consequatur quas soluta officia quisquam. Rem sint sunt suscipit non. Et libero consequatur culpa quam.',3,'2023-09-12 21:20:41','2023-04-12 21:20:41',1,3,1,1,'1',NULL,'2022-09-12 18:20:49','2023-09-12 18:20:49'),(13,NULL,'Molestiae debitis modi odio alias molestiae earum corporis.','molestiae-debitis-modi-odio-alias-molestiae-earum-corporis','Qui occaecati quis voluptate consequatur perferendis. Rem reprehenderit deleniti aut debitis possimus qui. In vel cupiditate qui sequi nam nisi. Qui aut earum laudantium dolore.',3,'2023-09-12 21:20:41','2023-04-12 21:20:41',1,1,1,1,'1',NULL,'2022-01-12 18:20:49','2023-09-12 18:20:49'),(14,NULL,'Consequatur ad quidem temporibus hic fugit ut ducimus.','consequatur-ad-quidem-temporibus-hic-fugit-ut-ducimus','Consequatur sint corrupti ullam amet corrupti ipsa. Id minus non exercitationem. Asperiores ut ducimus facere similique. Expedita labore soluta reiciendis accusantium itaque.',2,'2023-09-12 21:20:41','2023-04-12 21:20:41',4,2,2,1,'1',NULL,'2022-10-12 18:20:49','2023-09-12 18:20:49'),(15,NULL,'Maxime nam similique ab molestias sit.','maxime-nam-similique-ab-molestias-sit','Earum atque alias eligendi. Nihil aut optio quisquam laudantium. Laborum dicta animi debitis ut voluptas perferendis qui. Quisquam quas facilis vero amet iusto illum aperiam.',2,'2023-09-12 21:20:41','2023-04-12 21:20:41',1,4,4,1,'1',NULL,'2022-05-12 18:20:49','2023-09-12 18:20:49'),(16,NULL,'Dolorem accusamus illo eum architecto velit.','dolorem-accusamus-illo-eum-architecto-velit','Quaerat rerum consequatur repellat illo corporis. Vero deserunt et explicabo. Aliquid porro eos pariatur. Consequatur et delectus in dolor placeat laborum nam officiis.',3,'2023-09-12 21:20:41','2023-04-12 21:20:41',1,2,2,1,'1',NULL,'2022-10-12 18:20:49','2023-09-12 18:20:49'),(17,NULL,'Esse deleniti et est molestiae exercitationem.','esse-deleniti-et-est-molestiae-exercitationem','Odio temporibus cumque laudantium accusamus molestiae perspiciatis. Esse et id provident et dolor molestiae. Eligendi necessitatibus rem et vitae velit officiis eveniet.',2,'2023-09-12 21:20:41','2022-04-12 21:20:41',3,2,1,1,'1',NULL,'2022-10-12 18:20:49','2023-09-12 18:20:49'),(18,NULL,'Omnis consectetur corporis quasi et corrupti temporibus dignissimos magnam.','omnis-consectetur-corporis-quasi-et-corrupti-temporibus-dignissimos-magnam','Accusamus nesciunt molestiae quaerat qui et doloremque. Velit enim veniam neque ratione ut corporis id. Quia maiores eligendi corporis et. Ducimus eum dolor molestias sed fugit exercitationem.',1,'2023-09-12 21:20:41','2022-04-12 21:20:41',3,1,4,1,'1',NULL,'2023-10-12 18:20:49','2023-09-12 18:20:49'),(19,NULL,'Explicabo dolores exercitationem officiis aliquid excepturi hic.','explicabo-dolores-exercitationem-officiis-aliquid-excepturi-hic','Magnam nisi pariatur sint non voluptatem alias. Eius et vitae corporis nulla delectus quia illum dolorem. Nam dicta a vitae rerum ea mollitia omnis. Labore voluptatem maxime sit dolorem dolore animi.',3,'2023-09-12 21:20:41','2022-04-12 21:20:41',4,1,4,1,'1',NULL,'2023-10-12 18:20:49','2023-09-12 18:20:49'),(20,NULL,'This is a test title update','this-is-a-test-title-update','<p>some description patch here 2</p>',3,'2014-02-05 00:00:00','2022-04-12 21:20:41',4,4,1,0,'5',NULL,'2023-10-12 18:20:49','2023-09-30 04:07:13'),(21,NULL,'Dolor eum omnis qui','dolor-eum-omnis-qui','<p>when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>',1,'1983-11-10 00:00:00','2023-03-12 00:00:00',4,1,2,1,'1',NULL,'2023-04-29 23:34:16','2023-09-29 23:54:30'),(22,NULL,'Et doloremque velit','et-doloremque-velit','<p>some some 2</p>',1,'1987-01-08 02:10:00','2023-03-12 00:00:00',4,1,3,1,'1','2023-09-30 03:50:23','2023-04-29 23:34:16','2023-09-30 03:50:23'),(23,NULL,'Et doloremque velite','et-doloremque-velite','<p>some some 2</p>',1,'1987-01-08 00:00:00','2023-01-12 00:00:00',1,1,1,1,'1',NULL,'2023-04-29 23:34:16','2023-09-30 00:54:26'),(24,NULL,'Quod quia eum vitae','quod-quia-eum-vitae','<p>some description</p>',1,'1994-05-03 10:49:00','2023-01-12 00:00:00',4,1,3,1,'1',NULL,'2023-10-04 04:45:42','2023-10-04 04:45:42');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_user_id_foreign` (`user_id`),
  KEY `user_group_group_id_foreign` (`group_id`),
  CONSTRAINT `user_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (20,1,1,NULL,NULL),(21,2,1,NULL,NULL);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `avator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_avator.png',
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super','Admin','',' Super Admin','superadmin@admin.com','2023-09-12 18:20:47','$2y$10$fCNSHIXPm7AH8DxIrkh01.byJWgKOrk5mnZe8iH2yLaqKa8wxDcXW',NULL,NULL,NULL,'profiles/Jb7pltkzrPtLs1WcyDuen9JNIJN4G4SYdQCWey6h.png','1',NULL,NULL,'2023-09-12 18:20:48','2023-09-22 03:06:51'),(2,'Just','Admin','','Admin','admin@admin.com','2023-09-12 18:20:48','$2y$10$Kclo9YlmmsoSowmxWOrjHeUAauk2ciBAdygopdcz8KP492fpl3MAO',NULL,NULL,NULL,'default_avator.png','1',NULL,NULL,'2023-01-12 18:20:48','2023-09-12 18:20:48'),(3,'Just','Writer','','Writer','writer@admin.com','2023-09-12 18:20:48','$2y$10$fkkWlkZmZy5hGEA5VpA1YuN/p7ZXZWDY.da2Di4xMFMbC2JruMwfe',NULL,NULL,NULL,'default_avator.png','1',NULL,NULL,'2023-12-12 18:20:48','2023-09-12 18:20:48'),(4,'Just','User','',' Just User','user@admin.com','2023-09-12 18:20:48','$2y$10$kCygsD/eICjpJ3j9Uzmuy.DGIPOdHMgznEyBB4TkhSF3bUfs54s8S',NULL,NULL,NULL,'profiles/OTfTUBF2bdfy7Xh4aSZZLDj96IBQSlW7oPh9CjoD.jpg','1','MnTacfXWHaKqJLbR0hirKf4LVwfSw8vCddM3tL6bwDe6ISbE3FC6c9bO4C0l',NULL,'2023-12-12 18:20:48','2023-09-25 21:56:52'),(5,'Test','User','',' test User','test@admin.com','2023-09-12 18:20:48','$2y$10$kCygsD/eICjpJ3j9Uzmuy.DGIPOdHMgznEyBB4TkhSF3bUfs54s8S',NULL,NULL,NULL,'profiles/OTfTUBF2bdfy7Xh4aSZZLDj96IBQSlW7oPh9CjoD.jpg','0','MnTacfXWHaKqJLbR0hirKf4LVwfSw8vCddM3tL6bwDe6ISbE3FC6c9bO4C0l',NULL,'2021-12-12 18:20:48','2023-09-25 21:56:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'taskmanagement'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 17:03:24
