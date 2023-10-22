/*
SQLyog Ultimate v10.00 Beta1
MySQL - 8.0.23 : Database - taskmanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

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

/*Data for the table `comments` */

insert  into `comments`(`id`,`post_id`,`created_by`,`comment`,`deleted_at`,`created_at`,`updated_at`) values (1,4,2,'Expedita delectus sint cum pariatur nulla fugiat.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(2,9,3,'Asperiores aliquid quo quis architecto id veniam eos.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(3,2,1,'Eaque voluptatem excepturi assumenda ullam.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(4,4,4,'Quis necessitatibus repellendus hic vitae est occaecati modi doloribus.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(5,1,1,'Nobis nemo ab nulla.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(6,7,4,'Voluptates in veritatis eum occaecati omnis.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(7,12,2,'Dolore et doloribus quidem in.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(8,12,4,'Est praesentium voluptatem numquam harum cum commodi.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(9,12,4,'Veniam ea provident tempore veniam qui enim adipisci similique.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(10,7,3,'Repellendus beatae magni fugiat quaerat voluptatem.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(11,3,4,'Omnis magni quod aut odio.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(12,2,3,'Pariatur at laborum atque vero dicta.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(13,7,2,'Et alias ratione perspiciatis qui consequatur vel eius unde.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(14,7,2,'Aut iure unde nobis inventore nemo omnis.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(15,1,2,'Molestiae magnam hic quod iure assumenda dignissimos.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(16,11,1,'Rem dignissimos recusandae dolores facere molestiae dolorem blanditiis.',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(17,3,1,'Eos deserunt nemo inventore unde.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(18,5,4,'Voluptas nihil amet nihil aut.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(19,12,4,'Et quod vitae vitae dignissimos a consequatur dignissimos veniam.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(20,3,3,'Deserunt et veritatis quisquam ratione et enim exercitationem temporibus.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(21,8,3,'Dolores molestiae vitae sit voluptas blanditiis.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(22,6,1,'Totam asperiores itaque et pariatur et.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(23,8,1,'Perspiciatis rem quo sapiente sint repellendus.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(24,9,1,'Assumenda accusamus aut et reprehenderit architecto consequatur.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(25,5,4,'Culpa quasi et excepturi et quibusdam in.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(26,8,1,'Temporibus aut rerum exercitationem fugiat atque fugiat.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(27,2,3,'Quasi accusantium est blanditiis.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(28,8,4,'Perspiciatis modi dolor rerum tempora pariatur nostrum voluptatem.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(29,7,2,'Qui excepturi aut mollitia laborum.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(30,4,2,'Quia cupiditate eos qui fuga aut.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(31,9,1,'Dolorum in hic illo esse sit aut.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(32,13,3,'Vitae amet sed dolorem reiciendis.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(33,13,2,'Rem quo et dolores voluptas.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(34,6,2,'Alias aut veniam in illum facilis.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(35,12,2,'Quo et qui vitae voluptas molestiae laudantium animi.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50'),(36,8,2,'Fuga et voluptas cumque debitis.',NULL,'2023-09-12 21:20:50','2023-09-12 21:20:50');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

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

/*Data for the table `failed_jobs` */

/*Table structure for table `guards` */

DROP TABLE IF EXISTS `guards`;

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

/*Data for the table `guards` */

insert  into `guards`(`id`,`name`,`active`,`created_by`,`created_at`,`updated_at`) values (1,'web',1,2,'2023-09-12 21:20:50','2023-09-12 21:20:50');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(5,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2019_12_14_000001_create_personal_access_tokens_table',1),(7,'2023_03_26_084305_create_permission_tables',1),(8,'2023_03_31_114218_create_post_categories_table',1),(9,'2023_03_31_114652_create_posts_table',1),(10,'2023_04_09_115055_create_guards_table',1),(11,'2023_04_13_153510_create_notifications_table',1),(12,'2023_04_21_103844_create_task_categories_table',1),(13,'2023_04_21_103856_create_tasks_table',1),(14,'2023_04_22_060907_create_comments_table',1),(15,'2023_09_27_132224_create_task_attachments_table',2);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(3,'App\\Models\\User',1),(4,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',2),(4,'App\\Models\\User',2),(3,'App\\Models\\User',3),(4,'App\\Models\\User',3),(4,'App\\Models\\User',4);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values ('1bde113e-ead3-4dec-8bcd-2446c79b6965','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"_Status for task number 20 assigned to admin@admin.com has changed to Completed\"}','2023-09-22 00:55:53','2023-09-22 00:26:06','2023-09-22 00:55:53'),('2bcdda87-85fc-482f-949e-796ad83cdaf4','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 20 assigned to user@admin.com has changed to Archived\"}',NULL,'2023-09-30 07:07:13','2023-09-30 07:07:13'),('302ebe1c-8a69-4d9a-98e1-5b36f07030ad','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Status for task number 20 assigned to user@admin.com has changed to Archived\"}',NULL,'2023-09-30 07:07:13','2023-09-30 07:07:13'),('32aad77d-1abe-4989-9334-9a5d890ddc2a','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been assigned to writer@admin.com\"}','2023-09-22 00:56:02','2023-09-22 00:37:33','2023-09-22 00:56:02'),('47759182-83e1-4d7d-a220-f139b293a361','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Priority for task number 20 assigned to writer@admin.com has changed to High\"}',NULL,'2023-09-22 00:37:33','2023-09-22 00:56:03'),('5100bb8f-a051-4236-aaed-6e35248c598c','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"Quod quia eum vitae\",\"email\":\"user@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-10-04 07:45:48','2023-10-04 07:45:48'),('5266294b-a8b3-4fae-8d8e-6873bcfa26f0','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been assigned to user@admin.com\"}',NULL,'2023-09-30 06:52:51','2023-09-30 06:52:51'),('619ff42c-1cb2-442b-8338-fc107d7205af','App\\Notifications\\TaskPriorityNotification','App\\Models\\User',3,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has changed priority to High\"}',NULL,'2023-09-22 00:37:33','2023-09-22 00:37:33'),('6431dce7-9ba9-4b24-8f70-a9ea2a5e68d7','App\\Notifications\\TaskStatusNotification','App\\Models\\User',4,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has changed status to Archived\"}',NULL,'2023-09-30 07:07:12','2023-09-30 07:07:12'),('6e6c4f2e-58bf-4622-8745-3252933750e6','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"_Status for task number 20 assigned to admin@admin.com has changed to Completed\"}',NULL,'2023-09-22 00:26:06','2023-09-22 00:26:06'),('7690f35c-9902-40e5-a21b-f87389060142','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been assigned to user@admin.com\"}',NULL,'2023-09-30 06:52:51','2023-09-30 06:52:51'),('79026eef-62c8-4868-b0f4-577c0a447c1f','App\\Notifications\\TaskAssigneeNotification','App\\Models\\User',4,'{\"name\":\"This is a test title update\",\"email\":\"user@admin.com\",\"message\":\"Task number 20 has been reassigned to user@admin.com\"}',NULL,'2023-09-30 06:52:51','2023-09-30 06:52:51'),('9dfded74-97d2-43a1-97d6-142f458a1c74','App\\Notifications\\TaskStatusNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"admin@admin.com\",\"message\":\"Task number 20 has changed status to Completed\"}',NULL,'2023-09-22 00:26:05','2023-09-22 00:26:05'),('aa2174b4-dcba-42d1-8c84-f917d73fb979','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"Quod quia eum vitae\",\"email\":\"user@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-10-04 07:45:48','2023-10-04 07:45:48'),('b2a8503c-ba02-4fa2-8565-b8a731bb334b','App\\Notifications\\TaskAssigneeNotification','App\\Models\\User',3,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been reassigned to writer@admin.com\"}',NULL,'2023-09-22 00:37:33','2023-09-22 00:37:33'),('d2528587-5f96-49ff-9280-169351018189','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Priority for task number 20 assigned to writer@admin.com has changed to High\"}',NULL,'2023-09-22 00:37:33','2023-09-22 00:37:33'),('e17d9763-5656-4372-a34d-44ffabf6a91e','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"Et doloremque velite\",\"email\":\"superadmin@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-09-30 03:51:55','2023-09-30 03:51:55'),('ef91b9c6-b826-4c56-b494-46a0b15ed8d0','App\\Notifications\\NewTaskNotification','App\\Models\\User',1,'{\"name\":\"Et doloremque velite\",\"email\":\"superadmin@admin.com\",\"message\":\"new task has been created\"}',NULL,'2023-09-30 03:51:55','2023-09-30 03:51:55'),('fadc0c2b-a923-49ef-a1ff-9c4df1b248f3','App\\Notifications\\NewTaskNotification','App\\Models\\User',2,'{\"name\":\"This is a test title update\",\"email\":\"writer@admin.com\",\"message\":\"Task number 20 has been assigned to writer@admin.com\"}',NULL,'2023-09-22 00:37:33','2023-09-22 00:37:33');

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_by`,`active`,`created_at`,`updated_at`) values (1,'create users','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(2,'edit users','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(3,'delete users','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(4,'activate users','web',1,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(5,'deactivate users','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(6,'create post categories','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(7,'edit post categories','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(8,'delete post categories','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(9,'publish post categories','web',1,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(10,'unpublish post categories','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(11,'create posts','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(12,'edit posts','web',1,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(13,'delete posts','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(14,'publish posts','web',1,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(15,'unpublish posts','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(16,'create roles','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(17,'edit roles','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(18,'delete roles','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(19,'create permissions','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(20,'edit permissions','web',3,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(21,'delete permissions','web',4,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(22,'create params','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(23,'edit params','web',1,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(24,'delete params','web',2,'1','2023-09-13 18:12:36','2023-09-13 18:12:36'),(25,'create tasks','web',1,'1','2023-09-13 18:26:21','2023-09-13 18:26:21'),(26,'edit tasks','web',1,'1','2023-09-13 18:26:51','2023-09-13 18:26:51'),(27,'delete tasks','web',1,'1','2023-09-13 18:27:10','2023-09-13 18:27:10'),(28,'create task categories','web',1,'1','2023-09-22 05:01:03','2023-09-22 05:01:03'),(29,'edit task categories','web',1,'1','2023-09-22 05:01:38','2023-09-22 05:01:38'),(30,'delete task categories','web',1,'1','2023-09-22 05:03:46','2023-09-22 05:03:46');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

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

/*Data for the table `personal_access_tokens` */

/*Table structure for table `post_categories` */

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`),
  KEY `post_categories_created_by_foreign` (`created_by`),
  CONSTRAINT `post_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_categories` */

insert  into `post_categories`(`id`,`name`,`slug`,`description`,`created_by`,`active`,`deleted_at`,`created_at`,`updated_at`) values (1,'Sed','sed','Reiciendis aut delectus quo deserunt ea quae. u',4,'0',NULL,'2023-09-12 21:20:49','2023-09-26 00:35:35'),(2,'est','est','Autem velit veritatis ut qui aliquid voluptas hic.',3,'0',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(3,'quo','quo','Quibusdam repellat velit sint enim.',4,'0',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(4,'iste','iste','Qui enim sint ex excepturi nemo rerum.',1,'0',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`),
  CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`slug`,`content`,`featured_img`,`created_by`,`category_id`,`active`,`status`,`deleted_at`,`created_at`,`updated_at`) values (1,'Aut aspernatur quo odit.','aut-aspernatur-quo-odit','Quia ea sunt et enim dolores asperiores. Commodi qui quod molestias in. Unde officia sit itaque sed consequatur. Numquam impedit eos id aut et.','default_post.png',2,3,'0','1',NULL,'2023-01-12 21:20:49','2023-09-12 21:20:49'),(2,'Aut qui vel distinctio similique necessitatibus ut molestias aut.','aut-qui-vel-distinctio-similique-necessitatibus-ut-molestias-aut','Et incidunt expedita repellendus fugiat atque eum. Recusandae distinctio eligendi ipsa deserunt expedita perspiciatis consequatur. Et quae ut ut quos quisquam delectus. Dolorem eum possimus laboriosam aut fugiat. Molestiae quas odio nobis provident quibusdam velit et.','default_post.png',3,3,'0','1',NULL,'2023-04-12 21:20:49','2023-09-12 21:20:49'),(3,'Excepturi dicta tempore doloribus est fugit.','excepturi-dicta-tempore-doloribus-est-fugit','Officiis sapiente blanditiis et ipsam. Ut ut earum placeat quia. Et voluptatem provident sed iure ea vitae animi ex.','default_post.png',2,1,'0','1',NULL,'2023-04-12 21:20:49','2023-09-12 21:20:49'),(4,'Sed ea tempora qui aperiam sint recusandae.','sed-ea-tempora-qui-aperiam-sint-recusandae','Tempora expedita dolorem minima consectetur quae. Aliquid mollitia enim voluptate ut ducimus et adipisci distinctio. Et placeat in ullam ea aut quas repudiandae. Iusto aut cumque hic id.','default_post.png',4,4,'0','1',NULL,'2023-07-12 21:20:49','2023-09-12 21:20:49'),(5,'Rerum esse consectetur cum.','rerum-esse-consectetur-cum','Magnam suscipit earum eligendi ipsam. Nam porro quod molestiae et sit maxime. Ut deleniti sed ipsam. Totam provident sequi aut soluta molestias omnis.','default_post.png',1,3,'0','1',NULL,'2023-07-12 21:20:49','2023-09-12 21:20:49'),(6,'Sit sapiente ratione et consequatur omnis et autem non.','sit-sapiente-ratione-et-consequatur-omnis-et-autem-non','Assumenda ducimus omnis qui. Odit quo ea corporis. Deleniti explicabo assumenda tempora sunt dolorum saepe iste.','default_post.png',1,1,'0','1',NULL,'2023-07-12 21:20:49','2023-09-12 21:20:49'),(7,'Officiis ut quidem porro sit debitis temporibus dolorem et.','officiis-ut-quidem-porro-sit-debitis-temporibus-dolorem-et','Praesentium quis sint numquam sint et consectetur. Qui quis et est aut.','default_post.png',2,2,'0','1',NULL,'2023-08-12 21:20:49','2023-09-12 21:20:49'),(8,'Placeat harum ullam qui cum ut distinctio culpa.','placeat-harum-ullam-qui-cum-ut-distinctio-culpa','Dolorem qui necessitatibus harum enim quia officia autem. Totam quis eveniet autem aliquid. Quia aut et quia aut quia qui eius et. Facilis aliquam tenetur quis repudiandae nam.','default_post.png',1,3,'0','1',NULL,'2023-10-12 21:20:49','2023-09-12 21:20:49'),(9,'Ab est nisi quaerat dolorem ullam magni sit.','ab-est-nisi-quaerat-dolorem-ullam-magni-sit','Beatae enim facere nam assumenda delectus. Sed autem dolor et pariatur rem. Veritatis quasi nisi mollitia voluptas pariatur cumque sint.','default_post.png',1,2,'0','1',NULL,'2023-10-12 21:20:49','2023-09-12 21:20:49'),(10,'Est sunt voluptas enim culpa doloremque.','est-sunt-voluptas-enim-culpa-doloremque','Et laborum et eos natus est aut consectetur. Aliquam enim blanditiis tempore reiciendis impedit dicta voluptate. In tempora enim animi nihil quidem.','default_post.png',1,3,'0','1',NULL,'2023-10-12 21:20:49','2023-09-12 21:20:49'),(11,'Eligendi dignissimos voluptate blanditiis et et minus.','eligendi-dignissimos-voluptate-blanditiis-et-et-minus','Consequatur ducimus quo et qui maxime rerum nostrum. Perferendis qui molestiae quo debitis eligendi voluptatem quidem aliquam. Veniam veritatis id suscipit consequatur nihil omnis. Neque nam ut quo et.','default_post.png',1,4,'0','1',NULL,'2023-11-12 21:20:49','2023-09-12 21:20:49'),(12,'Tempora quia corporis perferendis at voluptate ad aut.','tempora-quia-corporis-perferendis-at-voluptate-ad-aut','Voluptatem at eum suscipit quasi qui dolor expedita. Recusandae et voluptatum quia eius sed. Quo perspiciatis amet mollitia architecto consequatur. Modi qui ad qui dolorem et commodi quo. Ut explicabo itaque modi quis repellat pariatur ut.','default_post.png',4,1,'0','1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(13,'Sunt natus ut eum iste recusandae.','sunt-natus-ut-eum-iste-recusandae','Asperiores cupiditate error earum dolor possimus molestiae. Sint ut ab quaerat hic. Quo ab debitis nisi excepturi atque. Iure saepe repudiandae optio distinctio asperiores aut occaecati. Omnis maxime officiis non qui magni omnis.','default_post.png',4,2,'0','1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(2,4),(6,4),(7,4),(11,4),(12,4),(26,4);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

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

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`active`,`created_at`,`updated_at`) values (1,'superadmin','web','1','2023-09-12 21:20:47','2023-09-12 21:20:47'),(2,'admin','web','1','2023-09-12 21:20:47','2023-09-12 21:20:47'),(3,'writer','web','1','2023-09-12 21:20:47','2023-09-12 21:20:47'),(4,'user','web','1','2023-09-12 21:20:47','2023-09-12 21:20:47');

/*Table structure for table `task_attachments` */

DROP TABLE IF EXISTS `task_attachments`;

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

/*Data for the table `task_attachments` */

insert  into `task_attachments`(`id`,`task_id`,`file_name`,`created_at`,`updated_at`,`name`) values (15,23,'attachments/VDTwYbP892_images.png','2023-09-30 04:16:41','2023-09-30 04:16:41','images.png'),(16,20,'attachments/bIlT0JouTn_download.jfif','2023-09-30 06:52:49','2023-09-30 06:52:49','download.jfif'),(17,24,'attachments/7BygMCnFGl_thumb-1920-171916.jpg','2023-10-04 07:45:44','2023-10-04 07:45:44','thumb-1920-171916.jpg'),(18,24,'attachments/8NLP411EFC_wp2960860.jpg','2023-10-04 07:45:44','2023-10-04 07:45:44','wp2960860.jpg');

/*Table structure for table `task_categories` */

DROP TABLE IF EXISTS `task_categories`;

CREATE TABLE `task_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `task_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `task_categories` */

insert  into `task_categories`(`id`,`name`,`slug`,`description`,`created_by`,`active`,`deleted_at`,`created_at`,`updated_at`) values (1,'Projects A','projects-a','Tasks associated with specific projects or initiatives.',1,'1',NULL,'2023-09-12 21:20:49','2023-09-22 04:47:41'),(2,'Projects B','projects-b','Tasks associated with project B and its initiatives.',1,'1',NULL,'2023-09-12 21:20:49','2023-09-22 05:26:31'),(3,'Projects C','projects-c','Tasks associated with project C and its initiatives.',1,'1',NULL,'2023-09-12 21:20:49','2023-09-22 05:26:59'),(4,'Projects D','projects-d','Tasks associated with project D and its initiatives. u',4,'1',NULL,'2023-09-12 21:20:49','2023-09-26 00:29:32'),(5,'Projects E','projects-e','Tasks associated with  project E and its initiatives.',1,'0','2023-09-22 07:14:07','2023-09-22 05:20:48','2023-09-22 07:14:07');

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tasks` */

insert  into `tasks`(`id`,`title`,`slug`,`description`,`priority`,`due_date`,`completion_date`,`assigned_to`,`created_by`,`category_id`,`active`,`status`,`deleted_at`,`created_at`,`updated_at`) values (1,'Voluptates eligendi hic voluptas perferendis dicta qui.','voluptates-eligendi-hic-voluptas-perferendis-dicta-qui','Possimus sit nam asperiores est molestiae. Quasi autem repellat perferendis labore omnis. Ex excepturi accusantium consequatur ad dolores et minus.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,3,2,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(2,'Inventore recusandae vel ab debitis ut et voluptas.','inventore-recusandae-vel-ab-debitis-ut-et-voluptas','Repudiandae et distinctio aut iste. Ullam dolore minus exercitationem eum perferendis dolor. At qui laborum dolorem eos quaerat.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,3,3,1,'2',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(3,'Reprehenderit molestiae expedita iure ut molestiae.','reprehenderit-molestiae-expedita-iure-ut-molestiae','Sit repellat adipisci exercitationem vel officia quis. Suscipit quisquam et at quo placeat vel reiciendis. Placeat eum corrupti et praesentium alias.',1,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,1,2,1,'1','2023-09-23 07:06:53','2023-09-12 21:20:49','2023-09-23 07:06:53'),(4,'Aut quasi commodi nulla magnam itaque ad.','aut-quasi-commodi-nulla-magnam-itaque-ad','Sunt ut quo eum repudiandae quis libero. Voluptatem accusamus eius fugiat eum. Vitae et atque qui est deleniti.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,2,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(5,'Vero itaque ut sed eos et dolorum.','vero-itaque-ut-sed-eos-et-dolorum','Possimus ut facere ut accusantium ratione omnis soluta. Aliquid mollitia sequi maiores qui aspernatur. Suscipit hic laborum eum quae veritatis voluptate amet. Nihil et atque nulla sed dolorum magnam.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,3,4,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(6,'Molestias aliquam magni facere natus.','molestias-aliquam-magni-facere-natus','Fugit excepturi iusto earum maiores consequatur esse necessitatibus. Aut excepturi eos earum dolore. Voluptas molestias officiis expedita iusto.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,3,4,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(7,'Aut nobis quis et sit.','aut-nobis-quis-et-sit','Quo ipsa quas molestiae suscipit. Assumenda saepe rerum atque voluptas consequatur pariatur. Ipsa et harum delectus est voluptatem assumenda.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,2,2,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(8,'Quia et soluta tempora dolorem.','quia-et-soluta-tempora-dolorem','Modi culpa alias asperiores iste ex. Laborum enim voluptatibus inventore neque iure qui earum expedita. Repudiandae quo impedit rerum delectus blanditiis asperiores voluptas.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',2,4,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(9,'Vel ratione at atque necessitatibus quam officia.','vel-ratione-at-atque-necessitatibus-quam-officia','Eos repellat quo aut. Placeat possimus nihil aspernatur omnis consequatur. Architecto amet consequatur vero nam fugit est.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',2,1,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(10,'Consectetur et eum occaecati non.','consectetur-et-eum-occaecati-non','Molestias ut deserunt rem dolorem maiores cum voluptatum. Quisquam nulla ut ut sed consequuntur aspernatur. Deleniti iusto perferendis dolor tenetur. Consequatur optio dolor occaecati nobis tenetur.',1,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,4,3,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(11,'Et ut iusto incidunt ducimus exercitationem error.','et-ut-iusto-incidunt-ducimus-exercitationem-error','Cumque aut omnis inventore ut saepe assumenda est amet. Sed omnis iure et. Quis enim odit molestiae id repellendus expedita excepturi et.',1,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,3,2,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(12,'Sit libero est eos quia nisi sequi.','sit-libero-est-eos-quia-nisi-sequi','Explicabo officiis corporis ratione ea. Ea non in et consequatur quas soluta officia quisquam. Rem sint sunt suscipit non. Et libero consequatur culpa quam.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,3,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(13,'Molestiae debitis modi odio alias molestiae earum corporis.','molestiae-debitis-modi-odio-alias-molestiae-earum-corporis','Qui occaecati quis voluptate consequatur perferendis. Rem reprehenderit deleniti aut debitis possimus qui. In vel cupiditate qui sequi nam nisi. Qui aut earum laudantium dolore.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,1,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(14,'Consequatur ad quidem temporibus hic fugit ut ducimus.','consequatur-ad-quidem-temporibus-hic-fugit-ut-ducimus','Consequatur sint corrupti ullam amet corrupti ipsa. Id minus non exercitationem. Asperiores ut ducimus facere similique. Expedita labore soluta reiciendis accusantium itaque.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,2,2,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(15,'Maxime nam similique ab molestias sit.','maxime-nam-similique-ab-molestias-sit','Earum atque alias eligendi. Nihil aut optio quisquam laudantium. Laborum dicta animi debitis ut voluptas perferendis qui. Quisquam quas facilis vero amet iusto illum aperiam.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,4,4,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(16,'Dolorem accusamus illo eum architecto velit.','dolorem-accusamus-illo-eum-architecto-velit','Quaerat rerum consequatur repellat illo corporis. Vero deserunt et explicabo. Aliquid porro eos pariatur. Consequatur et delectus in dolor placeat laborum nam officiis.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',1,2,2,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(17,'Esse deleniti et est molestiae exercitationem.','esse-deleniti-et-est-molestiae-exercitationem','Odio temporibus cumque laudantium accusamus molestiae perspiciatis. Esse et id provident et dolor molestiae. Eligendi necessitatibus rem et vitae velit officiis eveniet.',2,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,2,1,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(18,'Omnis consectetur corporis quasi et corrupti temporibus dignissimos magnam.','omnis-consectetur-corporis-quasi-et-corrupti-temporibus-dignissimos-magnam','Accusamus nesciunt molestiae quaerat qui et doloremque. Velit enim veniam neque ratione ut corporis id. Quia maiores eligendi corporis et. Ducimus eum dolor molestias sed fugit exercitationem.',1,'2023-09-12 21:20:41','2023-09-12 21:20:41',3,1,4,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(19,'Explicabo dolores exercitationem officiis aliquid excepturi hic.','explicabo-dolores-exercitationem-officiis-aliquid-excepturi-hic','Magnam nisi pariatur sint non voluptatem alias. Eius et vitae corporis nulla delectus quia illum dolorem. Nam dicta a vitae rerum ea mollitia omnis. Labore voluptatem maxime sit dolorem dolore animi.',3,'2023-09-12 21:20:41','2023-09-12 21:20:41',4,1,4,1,'1',NULL,'2023-09-12 21:20:49','2023-09-12 21:20:49'),(20,'This is a test title update','this-is-a-test-title-update','<p>some description patch here 2</p>',3,'2014-02-05 00:00:00','2023-09-12 00:00:00',4,4,1,0,'5',NULL,'2023-09-16 09:04:12','2023-09-30 07:07:13'),(21,'Dolor eum omnis qui','dolor-eum-omnis-qui','<p>when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>',1,'1983-11-10 00:00:00','2023-09-12 00:00:00',4,1,2,1,'1',NULL,'2023-09-30 02:34:16','2023-09-30 02:54:30'),(22,'Et doloremque velit','et-doloremque-velit','<p>some some 2</p>',1,'1987-01-08 02:10:00','2023-09-12 21:20:41',4,1,3,1,'1','2023-09-30 06:50:23','2023-09-30 03:44:53','2023-09-30 06:50:23'),(23,'Et doloremque velite','et-doloremque-velite','<p>some some 2</p>',1,'1987-01-08 00:00:00','2023-09-12 00:00:00',1,1,1,1,'1',NULL,'2023-09-30 03:51:53','2023-09-30 03:54:26'),(24,'Quod quia eum vitae','quod-quia-eum-vitae','<p>some description</p>',1,'1994-05-03 10:49:00','2023-09-12 21:20:41',4,1,3,1,'1',NULL,'2023-10-04 07:45:42','2023-10-04 07:45:42');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`fname`,`lname`,`sname`,`name`,`email`,`email_verified_at`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`two_factor_confirmed_at`,`avator`,`active`,`remember_token`,`deleted_at`,`created_at`,`updated_at`) values (1,'Super','Admin','',' Super Admin','superadmin@admin.com','2023-09-12 21:20:47','$2y$10$fCNSHIXPm7AH8DxIrkh01.byJWgKOrk5mnZe8iH2yLaqKa8wxDcXW',NULL,NULL,NULL,'profiles/Jb7pltkzrPtLs1WcyDuen9JNIJN4G4SYdQCWey6h.png','1',NULL,NULL,'2023-09-12 21:20:48','2023-09-22 06:06:51'),(2,'Just','Admin','','Admin','admin@admin.com','2023-09-12 21:20:48','$2y$10$Kclo9YlmmsoSowmxWOrjHeUAauk2ciBAdygopdcz8KP492fpl3MAO',NULL,NULL,NULL,'default_avator.png','1',NULL,NULL,'2023-01-12 21:20:48','2023-09-12 21:20:48'),(3,'Just','Writer','','Writer','writer@admin.com','2023-09-12 21:20:48','$2y$10$fkkWlkZmZy5hGEA5VpA1YuN/p7ZXZWDY.da2Di4xMFMbC2JruMwfe',NULL,NULL,NULL,'default_avator.png','1',NULL,NULL,'2023-12-12 21:20:48','2023-09-12 21:20:48'),(4,'Just','User','',' Just User','user@admin.com','2023-09-12 21:20:48','$2y$10$kCygsD/eICjpJ3j9Uzmuy.DGIPOdHMgznEyBB4TkhSF3bUfs54s8S',NULL,NULL,NULL,'profiles/OTfTUBF2bdfy7Xh4aSZZLDj96IBQSlW7oPh9CjoD.jpg','1',NULL,NULL,'2023-12-12 21:20:48','2023-09-26 00:56:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
