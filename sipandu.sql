/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MariaDB
 Source Server Version : 110202 (11.2.2-MariaDB-log)
 Source Host           : localhost:3306
 Source Schema         : sipandu

 Target Server Type    : MariaDB
 Target Server Version : 110202 (11.2.2-MariaDB-log)
 File Encoding         : 65001

 Date: 27/06/2024 08:42:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (1, 'App\\User', 1, 'authToke', '13bfdd152af769adc6929126ab1bc82681a0d0aa08c88e8d0a8867ed486768ce', '[\"*\"]', NULL, '2024-06-25 07:22:05', '2024-06-25 07:22:05');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (2, 'App\\User', 1, 'authToke', '10affa3f399ce7c4116ad8455353fb290b9553dd8f765a8be9a3b8ab817ed7fd', '[\"*\"]', NULL, '2024-06-25 14:25:26', '2024-06-25 14:25:26');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (3, 'App\\User', 1, 'authToke', '734e37151a9a973885e32b7dff298eb7cef0f4a8635799e7efb8667bb71321ce', '[\"*\"]', NULL, '2024-06-25 14:35:55', '2024-06-25 14:35:55');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (4, 'App\\User', 1, 'authToke', 'f5b8767ddea2de5be7833108674f7ae8be4516a2b92a2ee7a572287523523058', '[\"*\"]', NULL, '2024-06-25 14:36:26', '2024-06-25 14:36:26');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (5, 'App\\User', 1, 'authToke', '91db4af044b2b35e13a4c334c2686d3851728d7544f133fef0c23b9221c06657', '[\"*\"]', NULL, '2024-06-26 04:39:48', '2024-06-26 04:39:48');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (6, 'App\\User', 2, 'authToke', '8430cdfd154a73f487d8d1a298fb58edc780843a470b1f6d08e94f03c60eeac8', '[\"*\"]', NULL, '2024-06-26 13:27:35', '2024-06-26 13:27:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (7, 'App\\User', 4, 'authToke', '02c44f1bb41c44978c8ba8d9c176a2bb00d8f0ae27266b18a1de0d938b74239c', '[\"*\"]', NULL, '2024-06-26 14:12:50', '2024-06-26 14:12:50');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (8, 'App\\User', 3, 'authToke', '15d975942558337500e9ff230f853c76aed210c23010de8d8dc3893dcfd0bc2c', '[\"*\"]', NULL, '2024-06-26 15:20:21', '2024-06-26 15:20:21');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (9, 'App\\User', 4, 'authToke', 'cd3d72c7625eaf7ef96056e3851af480e5f06c88bb770b80e5f8735e7aa139ef', '[\"*\"]', NULL, '2024-06-26 15:41:37', '2024-06-26 15:41:37');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (10, 'App\\User', 4, 'authToke', '526f103cabe79e55aabcf8ed21e5ef4e245fe392fd00911dc7817f0f7e853603', '[\"*\"]', NULL, '2024-06-26 15:41:52', '2024-06-26 15:41:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (11, 'App\\User', 4, 'authToke', '85670b1251eb13fb865c4b7bf2ce4f98761ab11886347466e676f87ca0e21048', '[\"*\"]', NULL, '2024-06-26 15:45:17', '2024-06-26 15:45:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (12, 'App\\User', 5, 'authToke', '4fe9a92fde8030e914bd15ce4afeb3cc8dfc9f0cc347107664f4f0abcfae419b', '[\"*\"]', NULL, '2024-06-26 15:46:55', '2024-06-26 15:46:55');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (13, 'App\\User', 5, 'authToke', '91fc6001d04373acecbd3d954a813f2ce63b4a993b0c30bdd9c1b6bb5d455737', '[\"*\"]', NULL, '2024-06-26 15:51:45', '2024-06-26 15:51:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (14, 'App\\User', 5, 'authToke', '2d069cb9ac6711cc5e72061565e5bd304a7abd70a4198326124f93980027c1c1', '[\"*\"]', NULL, '2024-06-26 15:53:15', '2024-06-26 15:53:15');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (15, 'App\\User', 6, 'authToke', '6cda964cb5bf34cd3693c70acb658c73e6d572e97634a7cb980fd5220f22ceac', '[\"*\"]', NULL, '2024-06-27 01:33:46', '2024-06-27 01:33:46');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (16, 'App\\User', 6, 'authToke', 'd5a2de08c4dd47a9d99c94a8c08cb5f8be20a3fa6428e30e830802447e4dab3c', '[\"*\"]', NULL, '2024-06-27 01:35:39', '2024-06-27 01:35:39');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (17, 'App\\User', 6, 'authToke', 'df110fcf7eb59221bf3ad69b9e9896c6ecd5cb8f9776455821cf33a0333d7c49', '[\"*\"]', NULL, '2024-06-27 01:36:38', '2024-06-27 01:36:38');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (18, 'App\\User', 6, 'authToke', '31005a7f034f3476ae9c35298177ada61bd6078d36a9fdbe6af7c9567e7d447c', '[\"*\"]', NULL, '2024-06-27 01:37:20', '2024-06-27 01:37:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (19, 'App\\User', 6, 'authToke', '4d9f2612226134f15e75d8fa4138d3427eef88e7f840a8c2fab48fb2aa501a8e', '[\"*\"]', NULL, '2024-06-27 01:39:07', '2024-06-27 01:39:07');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (20, 'App\\User', 6, 'authToke', '90de1ded03c120d6394a15c8e46cc4034b280e286a152590320536d9bccf3629', '[\"*\"]', NULL, '2024-06-27 01:41:20', '2024-06-27 01:41:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES (21, 'App\\User', 6, 'authToke', '0cdbbb13adbf33c37c1c0675fbb86f1691d1236d6c0438b46cc410b700344ce3', '[\"*\"]', NULL, '2024-06-27 01:41:52', '2024-06-27 01:41:52');
COMMIT;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL,
  `otp_token` text DEFAULT NULL,
  `role` enum('super admin','pegawai','tenaga kesehatan') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
BEGIN;
INSERT INTO `tb_admin` (`id`, `email`, `password`, `profile_image`, `is_verified`, `otp_token`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'superadmin@gmail.com', '$2y$10$oMwTghBcn1qqUa0PM23yT.JxKwYeCGieHUEmczO2YzZZfmC6xgMGK', '/images/upload/Profile/default.jpg', 1, NULL, 'super admin', '2024-06-24 15:42:10', '2024-06-24 15:42:10', NULL);
INSERT INTO `tb_admin` (`id`, `email`, `password`, `profile_image`, `is_verified`, `otp_token`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 'headadmin@gmail.com', '$2y$10$M23L6mtq3CokjMe/9VrxI.hbrdw.Vmy2ZVr/5helBLdhiCatKB0wy', '/images/upload/Profile/default.jpg', 1, NULL, 'pegawai', '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin` (`id`, `email`, `password`, `profile_image`, `is_verified`, `otp_token`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 'nakes@gmail.com', '$2y$10$J0Duh75t1n50C88JoQfs2.dkSDpbFRcvkNvaj69MTrJiy1IzmnvqG', '/images/upload/Profile/default.jpg', 1, NULL, 'tenaga kesehatan', '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin` (`id`, `email`, `password`, `profile_image`, `is_verified`, `otp_token`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 'admin@gmail.com', '$2y$10$5z4BjtvvnDJzPRy2lI33yu.gjzjGJpJyc.JQeHfxtwXWFhfPIL7Vm', '/images/upload/Profile/default.jpg', 1, NULL, 'pegawai', '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin` (`id`, `email`, `password`, `profile_image`, `is_verified`, `otp_token`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 'kader@gmail.com', '$2y$10$fEzgDkDM782EFp40cwZ9.u8pJJGLLJFBgFBktlFTs.xDvP4E7aF7G', '/images/upload/Profile/default.jpg', 1, NULL, 'pegawai', '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_permission`;
CREATE TABLE `tb_admin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_admin` int(10) unsigned DEFAULT NULL,
  `id_permission` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_admin` (`id_admin`),
  KEY `id_permission` (`id_permission`),
  CONSTRAINT `tb_admin_permission_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_admin_permission_ibfk_2` FOREIGN KEY (`id_permission`) REFERENCES `tb_permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_admin_permission
-- ----------------------------
BEGIN;
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (1, 1, 1, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (2, 1, 2, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (3, 1, 3, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (4, 1, 4, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (5, 1, 5, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (6, 1, 6, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (7, 1, 7, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (8, 1, 8, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (9, 1, 9, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (10, 1, 10, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (11, 1, 11, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (12, 1, 12, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (13, 1, 13, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (14, 1, 14, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (15, 1, 15, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (16, 1, 16, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (17, 1, 17, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (18, 1, 18, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (19, 1, 19, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (20, 1, 20, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (21, 1, 21, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (22, 1, 22, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (23, 1, 23, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (24, 1, 24, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (25, 1, 25, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (26, 1, 26, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (27, 1, 27, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (28, 1, 28, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (29, 1, 29, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (30, 1, 30, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (31, 1, 31, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (32, 1, 32, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (33, 1, 33, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (34, 1, 34, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (35, 1, 35, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (36, 1, 36, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (37, 1, 37, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (38, 1, 38, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (39, 1, 39, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (40, 1, 40, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (41, 1, 41, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (42, 1, 42, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (43, 1, 43, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (44, 1, 44, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (45, 1, 45, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (46, 1, 46, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (47, 1, 47, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (48, 1, 48, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (49, 1, 49, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (50, 1, 50, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (51, 1, 51, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (52, 1, 52, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (53, 1, 53, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (54, 1, 54, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (55, 1, 55, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (56, 1, 56, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (57, 1, 57, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (58, 1, 58, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (59, 1, 59, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (60, 1, 60, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (61, 1, 61, NULL, NULL, NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (94, 13, 3, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (95, 13, 4, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (96, 13, 5, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (97, 13, 6, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (98, 13, 14, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (99, 13, 15, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (100, 13, 16, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (101, 13, 17, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (102, 13, 19, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (103, 13, 20, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (104, 13, 21, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (105, 13, 22, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (106, 13, 23, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (107, 13, 24, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (108, 13, 25, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (109, 13, 26, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (110, 13, 27, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (111, 13, 28, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (112, 13, 29, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (113, 13, 30, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (114, 13, 31, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (115, 13, 32, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (116, 13, 33, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (117, 13, 34, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (118, 13, 35, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (119, 13, 36, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (120, 13, 37, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (121, 13, 38, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (122, 13, 39, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (123, 13, 40, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (124, 13, 41, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (125, 13, 42, '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (126, 14, 3, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (127, 14, 4, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (128, 14, 5, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (129, 14, 6, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (130, 14, 16, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (131, 14, 17, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (132, 14, 20, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (133, 14, 21, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (134, 14, 22, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (135, 14, 23, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (136, 14, 24, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (137, 14, 25, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (138, 14, 26, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (139, 14, 30, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (140, 14, 31, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (141, 14, 36, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (142, 16, 3, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (143, 16, 4, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (144, 16, 5, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (145, 16, 6, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (146, 16, 16, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (147, 16, 17, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (148, 16, 20, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (149, 16, 21, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (150, 16, 22, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (151, 16, 23, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (152, 16, 24, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (153, 16, 25, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (154, 16, 26, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (155, 16, 27, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (156, 16, 28, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (157, 16, 29, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (158, 16, 30, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (159, 16, 31, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (160, 16, 32, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (161, 16, 33, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (162, 16, 34, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (163, 16, 35, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (164, 16, 36, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (165, 16, 37, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (166, 16, 38, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (167, 16, 39, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (168, 16, 40, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (169, 16, 41, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (170, 16, 42, '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (171, 18, 3, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (172, 18, 4, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (173, 18, 5, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (174, 18, 6, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (175, 18, 14, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (176, 18, 15, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (177, 18, 19, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (178, 18, 21, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (179, 18, 22, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (180, 18, 23, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (181, 18, 24, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (182, 18, 25, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (183, 18, 26, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (184, 18, 27, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (185, 18, 28, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (186, 18, 29, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (187, 18, 30, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (188, 18, 31, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (189, 18, 32, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (190, 18, 33, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (191, 18, 34, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (192, 18, 35, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (193, 18, 36, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (194, 18, 38, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
INSERT INTO `tb_admin_permission` (`id`, `id_admin`, `id_permission`, `updated_at`, `created_at`, `delete_at`) VALUES (195, 18, 39, '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_alergi
-- ----------------------------
DROP TABLE IF EXISTS `tb_alergi`;
CREATE TABLE `tb_alergi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned DEFAULT NULL,
  `nama_alergi` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_alergi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_alergi
-- ----------------------------
BEGIN;
INSERT INTO `tb_alergi` (`id`, `id_user`, `nama_alergi`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 2, 'Dingin', 'Alergi Lain', '2024-06-26 13:16:18', '2024-06-26 13:16:18', NULL);
INSERT INTO `tb_alergi` (`id`, `id_user`, `nama_alergi`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 3, 'seefood', 'Alergi Makanan', '2024-06-26 15:26:03', '2024-06-26 15:26:03', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_anak
-- ----------------------------
DROP TABLE IF EXISTS `tb_anak`;
CREATE TABLE `tb_anak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_user` int(10) unsigned DEFAULT NULL,
  `NIK` varchar(20) DEFAULT NULL,
  `nama_ayah` varchar(255) DEFAULT NULL,
  `nama_ibu` varchar(255) DEFAULT NULL,
  `nama_anak` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `anak_ke` varchar(255) DEFAULT NULL,
  `pendidikan_ibu` varchar(255) DEFAULT NULL,
  `pendidikan_ayah` varchar(255) DEFAULT NULL,
  `pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `pekerjaan_ayah` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_anak_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_anak_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_anak
-- ----------------------------
BEGIN;
INSERT INTO `tb_anak` (`id`, `id_posyandu`, `id_user`, `NIK`, `nama_ayah`, `nama_ibu`, `nama_anak`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `anak_ke`, `pendidikan_ibu`, `pendidikan_ayah`, `pekerjaan_ibu`, `pekerjaan_ayah`, `nomor_telepon`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 2, '3321110902070001', 'Ayah Satu', 'Ibu Satu', 'Anak Satu', 'Bidan', '2021-09-20', 'laki-laki', '1', NULL, NULL, NULL, NULL, '0821867527389', 'Alamat', '2024-06-25 03:13:37', '2024-06-25 03:13:37', NULL);
INSERT INTO `tb_anak` (`id`, `id_posyandu`, `id_user`, `NIK`, `nama_ayah`, `nama_ibu`, `nama_anak`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `anak_ke`, `pendidikan_ibu`, `pendidikan_ayah`, `pekerjaan_ibu`, `pekerjaan_ayah`, `nomor_telepon`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 5, '3321050312850000', 'Ayah', 'Ibu', 'Anak Dua', 'Bidan', '2023-06-16', 'laki-laki', '3', NULL, NULL, NULL, NULL, NULL, 'Alamat', '2024-06-26 15:46:40', '2024-06-26 15:53:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_desa
-- ----------------------------
DROP TABLE IF EXISTS `tb_desa`;
CREATE TABLE `tb_desa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kecamatan` int(10) unsigned NOT NULL,
  `nama_desa` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_kecamatan` (`id_kecamatan`),
  CONSTRAINT `tb_desa_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_desa
-- ----------------------------
BEGIN;
INSERT INTO `tb_desa` (`id`, `id_kecamatan`, `nama_desa`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Batursari', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_ibu_hamil
-- ----------------------------
DROP TABLE IF EXISTS `tb_ibu_hamil`;
CREATE TABLE `tb_ibu_hamil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned DEFAULT NULL,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `NIK` varchar(20) DEFAULT NULL,
  `nama_ibu_hamil` varchar(255) DEFAULT NULL,
  `nama_suami` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `kehamilan_ke` int(11) DEFAULT NULL,
  `jarak_anak_sebelumnya` varchar(255) DEFAULT NULL,
  `pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `pekerjaan_suami` varchar(255) DEFAULT NULL,
  `pendidikan_ibu` varchar(255) DEFAULT NULL,
  `pendidikan_suami` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletd_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_ibu_hamil_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_ibu_hamil_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_ibu_hamil
-- ----------------------------
BEGIN;
INSERT INTO `tb_ibu_hamil` (`id`, `id_user`, `id_posyandu`, `NIK`, `nama_ibu_hamil`, `nama_suami`, `tempat_lahir`, `tanggal_lahir`, `kehamilan_ke`, `jarak_anak_sebelumnya`, `pekerjaan_ibu`, `pekerjaan_suami`, `pendidikan_ibu`, `pendidikan_suami`, `nomor_telepon`, `alamat`, `created_at`, `updated_at`, `deletd_at`) VALUES (1, 1, 1, '3321110902070002', 'Ibu Hamil Satu', 'Nama Suami Satu', 'Bidan', '1995-09-20', 2, '2', NULL, NULL, NULL, NULL, '0823746281930', 'Alamat', '2024-06-25 03:06:29', '2024-06-25 18:06:31', NULL);
INSERT INTO `tb_ibu_hamil` (`id`, `id_user`, `id_posyandu`, `NIK`, `nama_ibu_hamil`, `nama_suami`, `tempat_lahir`, `tanggal_lahir`, `kehamilan_ke`, `jarak_anak_sebelumnya`, `pekerjaan_ibu`, `pekerjaan_suami`, `pendidikan_ibu`, `pendidikan_suami`, `nomor_telepon`, `alamat`, `created_at`, `updated_at`, `deletd_at`) VALUES (2, 4, 1, '3305040901072053', 'Ibu Hamil Dua', 'Suami', 'Bidan', '1993-06-26', NULL, NULL, NULL, NULL, NULL, NULL, '089384756273', 'Alamat', '2024-06-26 14:11:36', '2024-06-26 15:45:13', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_informasi
-- ----------------------------
DROP TABLE IF EXISTS `tb_informasi`;
CREATE TABLE `tb_informasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned DEFAULT NULL,
  `judul_informasi` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `dilihat` int(11) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `informasi` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `author_id` (`author_id`),
  CONSTRAINT `tb_informasi_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_informasi
-- ----------------------------
BEGIN;
INSERT INTO `tb_informasi` (`id`, `author_id`, `judul_informasi`, `image`, `dilihat`, `slug`, `status`, `tanggal`, `informasi`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Berita Satu', 'app/informasi/informasi-penting/1719330187-carantina-proteusjpg.jpg', 4, 'berita-satu', 'Aktif', '2024-06-25', '<p>test berita</p>', '2024-06-25 15:43:07', '2024-06-25 16:07:56', NULL);
INSERT INTO `tb_informasi` (`id`, `author_id`, `judul_informasi`, `image`, `dilihat`, `slug`, `status`, `tanggal`, `informasi`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 16, 'Berita', 'app/informasi/informasi-penting/1719408936-proteus-design-suite-atom-logopng.png', 0, 'berita', 'Aktif', '2024-06-26', '<p>Kontent Berita</p>', '2024-06-26 13:35:36', '2024-06-26 13:35:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_jenis_imunisasi
-- ----------------------------
DROP TABLE IF EXISTS `tb_jenis_imunisasi`;
CREATE TABLE `tb_jenis_imunisasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_imunisasi` varchar(50) DEFAULT NULL,
  `usia_pemberian` varchar(50) DEFAULT NULL,
  `perulangan` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `penerima` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_jenis_imunisasi
-- ----------------------------
BEGIN;
INSERT INTO `tb_jenis_imunisasi` (`id`, `nama_imunisasi`, `usia_pemberian`, `perulangan`, `deskripsi`, `status`, `penerima`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'BCG', '1 Bulan', 'Satu Kali', 'mencegah penularan tuberculosis', 'Wajib', 'Anak', '2024-06-25 03:29:03', '2024-06-25 03:29:03', NULL);
INSERT INTO `tb_jenis_imunisasi` (`id`, `nama_imunisasi`, `usia_pemberian`, `perulangan`, `deskripsi`, `status`, `penerima`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Polio 1', '1 Bulan', 'Satu Kali', 'mencegah penularan polio', 'Wajib', 'Anak', '2024-06-25 03:31:24', '2024-06-25 03:31:24', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_jenis_vitamin
-- ----------------------------
DROP TABLE IF EXISTS `tb_jenis_vitamin`;
CREATE TABLE `tb_jenis_vitamin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_vitamin` varchar(50) DEFAULT NULL,
  `usia_pemberian` varchar(50) DEFAULT NULL,
  `perulangan` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `penerima` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_jenis_vitamin
-- ----------------------------
BEGIN;
INSERT INTO `tb_jenis_vitamin` (`id`, `nama_vitamin`, `usia_pemberian`, `perulangan`, `deskripsi`, `status`, `penerima`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Vitamin A', '12 sampai 59 Bulan', 'Februari dan Agustus', 'Pemberian Vitamin A', 'Wajib', 'Ibu Hamil', '2024-06-25 03:47:42', '2024-06-25 03:47:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_kabupaten
-- ----------------------------
DROP TABLE IF EXISTS `tb_kabupaten`;
CREATE TABLE `tb_kabupaten` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kabupaten` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_kabupaten
-- ----------------------------
BEGIN;
INSERT INTO `tb_kabupaten` (`id`, `nama_kabupaten`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Demak', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `tb_kecamatan`;
CREATE TABLE `tb_kecamatan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(10) unsigned NOT NULL,
  `nama_kecamatan` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_kabupaten` (`id_kabupaten`),
  CONSTRAINT `tb_kecamatan_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_kecamatan
-- ----------------------------
BEGIN;
INSERT INTO `tb_kecamatan` (`id`, `id_kabupaten`, `nama_kecamatan`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Mranggen', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_kegiatan
-- ----------------------------
DROP TABLE IF EXISTS `tb_kegiatan`;
CREATE TABLE `tb_kegiatan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `nama_kegiatan` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `start_at` varchar(20) DEFAULT NULL,
  `end_at` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  CONSTRAINT `tb_kegiatan_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_kegiatan
-- ----------------------------
BEGIN;
INSERT INTO `tb_kegiatan` (`id`, `id_posyandu`, `nama_kegiatan`, `deskripsi`, `tempat`, `status`, `slug`, `start_at`, `end_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Kegiatan', '<p>Kegiatan</p>', 'Posyandu Seruni', 'Tampil', 'kegiatan', '2024-06-26', '2024-06-26', '2024-06-25 04:42:39', '2024-06-25 04:42:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_kk
-- ----------------------------
DROP TABLE IF EXISTS `tb_kk`;
CREATE TABLE `tb_kk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_kk` varchar(50) DEFAULT NULL,
  `file_kk` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_kk
-- ----------------------------
BEGIN;
INSERT INTO `tb_kk` (`id`, `no_kk`, `file_kk`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, '3321116502910000', 'images/upload/kk/bumil/1719284726-carantina-proteusjpg.jpg', '2024-06-25 03:05:26', '2024-06-25 03:05:26', NULL);
INSERT INTO `tb_kk` (`id`, `no_kk`, `file_kk`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, '3203070504890020', 'images/upload/kk/lansia/1719285304-carantina-proteusjpg.jpg', '2024-06-25 03:15:04', '2024-06-25 03:15:04', NULL);
INSERT INTO `tb_kk` (`id`, `no_kk`, `file_kk`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, '3305042302490002', '/images/upload/KK/1719411096-3305042302490002.jpg', '2024-06-26 14:11:36', '2024-06-26 14:11:36', NULL);
INSERT INTO `tb_kk` (`id`, `no_kk`, `file_kk`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, '3321050312850000', '/images/upload/KK/1719416800-3321050312850000.jpg', '2024-06-26 15:46:40', '2024-06-26 15:46:40', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_lansia
-- ----------------------------
DROP TABLE IF EXISTS `tb_lansia`;
CREATE TABLE `tb_lansia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `NIK` varchar(20) DEFAULT NULL,
  `nama_lansia` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `status_perkawinan` varchar(255) DEFAULT NULL,
  `pendidikan_terakhir` varchar(255) DEFAULT NULL,
  `sumber_biaya_hidup` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `jumlah_anak` int(11) DEFAULT NULL,
  `jumlah_cucu` int(11) DEFAULT NULL,
  `jumlah_cicit` int(11) DEFAULT NULL,
  `jumlah_keluarga_serumah` int(11) DEFAULT NULL,
  `nomor_telepon` varchar(13) DEFAULT NULL,
  `tempat_tinggal` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_user` (`id_user`),
  KEY `id_posyandu` (`id_posyandu`),
  CONSTRAINT `tb_lansia_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_lansia_ibfk_2` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_lansia
-- ----------------------------
BEGIN;
INSERT INTO `tb_lansia` (`id`, `id_user`, `id_posyandu`, `NIK`, `nama_lansia`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `pekerjaan`, `status_perkawinan`, `pendidikan_terakhir`, `sumber_biaya_hidup`, `status`, `jumlah_anak`, `jumlah_cucu`, `jumlah_cicit`, `jumlah_keluarga_serumah`, `nomor_telepon`, `tempat_tinggal`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 3, 1, '3321060902150009', 'Lansia Satu', 'Bidan', '1878-07-20', 'laki-laki', NULL, NULL, NULL, NULL, 'Lansia', NULL, NULL, NULL, NULL, '082186473628', NULL, 'Alamat', '2024-06-25 03:15:04', '2024-06-25 03:15:04', NULL);
INSERT INTO `tb_lansia` (`id`, `id_user`, `id_posyandu`, `NIK`, `nama_lansia`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `pekerjaan`, `status_perkawinan`, `pendidikan_terakhir`, `sumber_biaya_hidup`, `status`, `jumlah_anak`, `jumlah_cucu`, `jumlah_cicit`, `jumlah_keluarga_serumah`, `nomor_telepon`, `tempat_tinggal`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 6, 1, '3321113011050018', 'Paktua', 'Bidan', '1972-06-01', 'laki-laki', NULL, NULL, NULL, NULL, 'Lansia Beresiko', NULL, NULL, NULL, NULL, '082165897654', NULL, NULL, '2024-06-27 01:33:31', '2024-06-27 01:41:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_nakes
-- ----------------------------
DROP TABLE IF EXISTS `tb_nakes`;
CREATE TABLE `tb_nakes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_admin` int(10) unsigned DEFAULT NULL,
  `nama_nakes` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `username_telegram` varchar(50) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `file_ktp` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `tb_nakes_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_nakes
-- ----------------------------
BEGIN;
INSERT INTO `tb_nakes` (`id`, `id_admin`, `nama_nakes`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `username_telegram`, `nik`, `file_ktp`, `updated_at`, `created_at`, `deleted_at`) VALUES (4, 14, 'Nakes', 'Bidan', '1993-09-20', 'Laki-laki', 'Alamat', '082186753684', NULL, '1809283418372837', 'images/upload/ktp/1719251094-carantina-proteusjpg.jpg', '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_nakes_posyandu
-- ----------------------------
DROP TABLE IF EXISTS `tb_nakes_posyandu`;
CREATE TABLE `tb_nakes_posyandu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  CONSTRAINT `tb_nakes_posyandu_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_nakes_posyandu_ibfk_2` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_nakes_posyandu
-- ----------------------------
BEGIN;
INSERT INTO `tb_nakes_posyandu` (`id`, `id_posyandu`, `id_nakes`, `updated_at`, `created_at`, `deleted_at`) VALUES (3, 1, 4, '2024-06-24 17:44:54', '2024-06-24 17:44:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_notifikasi
-- ----------------------------
DROP TABLE IF EXISTS `tb_notifikasi`;
CREATE TABLE `tb_notifikasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned DEFAULT NULL,
  `notif_title` varchar(255) DEFAULT NULL,
  `notif_content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_notifikasi
-- ----------------------------
BEGIN;
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (1, 1, 'Ada informasi baru!', 'Berita Satu', '2024-06-25 15:43:08', '2024-06-25 15:43:08');
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (2, 2, 'Ada informasi baru!', 'Berita Satu', '2024-06-25 15:43:08', '2024-06-25 15:43:08');
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (3, 3, 'Ada informasi baru!', 'Berita Satu', '2024-06-25 15:43:08', '2024-06-25 15:43:08');
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (4, 1, 'Ada informasi baru!', 'Berita', '2024-06-26 13:35:39', '2024-06-26 13:35:39');
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (5, 2, 'Ada informasi baru!', 'Berita', '2024-06-26 13:35:39', '2024-06-26 13:35:39');
INSERT INTO `tb_notifikasi` (`id`, `id_user`, `notif_title`, `notif_content`, `created_at`, `updated_at`) VALUES (6, 3, 'Ada informasi baru!', 'Berita', '2024-06-26 13:35:39', '2024-06-26 13:35:39');
COMMIT;

-- ----------------------------
-- Table structure for tb_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `tb_pegawai`;
CREATE TABLE `tb_pegawai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_admin` int(10) unsigned DEFAULT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `jabatan` enum('pegawai','admin','head admin','kader') DEFAULT NULL,
  `username_telegram` varchar(50) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `file_ktp` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_pegawai
-- ----------------------------
BEGIN;
INSERT INTO `tb_pegawai` (`id`, `id_posyandu`, `id_admin`, `nama_pegawai`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `jabatan`, `username_telegram`, `nik`, `status`, `file_ktp`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 13, 'head admin', 'Tempat Lahir', '1993-09-20', 'Laki-laki', 'Alamat', '082186753684', 'head admin', '', '1892090023847281', 'tidak tersedia', 'images/upload/ktp/1719250764-carantina-proteusjpg.jpg', '2024-06-24 17:39:24', '2024-06-24 17:39:24', NULL);
INSERT INTO `tb_pegawai` (`id`, `id_posyandu`, `id_admin`, `nama_pegawai`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `jabatan`, `username_telegram`, `nik`, `status`, `file_ktp`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 1, 16, 'Admin', 'Di bidan', '2001-09-20', 'Laki-laki', 'Alamat', '08216752671', 'admin', NULL, '1829192836473827', 'tidak tersedia', 'images/upload/ktp/1719251730-screencapture-localhost-8080-dashboard-2024-04-18-08-12-53png.png', '2024-06-24 17:55:30', '2024-06-24 17:55:30', NULL);
INSERT INTO `tb_pegawai` (`id`, `id_posyandu`, `id_admin`, `nama_pegawai`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `jabatan`, `username_telegram`, `nik`, `status`, `file_ktp`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 1, 18, 'Kader', 'Bidan', '1999-05-20', 'Laki-laki', 'Alamat', '082186754653', 'kader', NULL, '1808287654826789', 'tidak tersedia', 'images/upload/ktp/1719283482-carantina-proteusjpg.jpg', '2024-06-25 02:44:42', '2024-06-25 02:44:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_pemberian_imunisasi
-- ----------------------------
DROP TABLE IF EXISTS `tb_pemberian_imunisasi`;
CREATE TABLE `tb_pemberian_imunisasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jenis_imunisasi` int(10) unsigned DEFAULT NULL,
  `id_user` int(10) unsigned DEFAULT NULL,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) DEFAULT NULL,
  `nama_pemeriksa` varchar(50) DEFAULT NULL,
  `usia` varchar(10) DEFAULT NULL,
  `tanggal_imunisasi` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  KEY `id_jenis_imunisasi` (`id_jenis_imunisasi`),
  CONSTRAINT `tb_pemberian_imunisasi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_imunisasi_ibfk_3` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_imunisasi_ibfk_4` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_imunisasi_ibfk_5` FOREIGN KEY (`id_jenis_imunisasi`) REFERENCES `tb_jenis_imunisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_pemberian_imunisasi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_pemberian_vitamin
-- ----------------------------
DROP TABLE IF EXISTS `tb_pemberian_vitamin`;
CREATE TABLE `tb_pemberian_vitamin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jenis_vitamin` int(10) unsigned DEFAULT NULL,
  `id_user` int(10) unsigned DEFAULT NULL,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) DEFAULT NULL,
  `nama_pemeriksa` varchar(50) DEFAULT NULL,
  `usia` varchar(10) DEFAULT NULL,
  `tanggal_pemberian` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jenis_vitamin` (`id_jenis_vitamin`),
  KEY `id_user` (`id_user`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  CONSTRAINT `tb_pemberian_vitamin_ibfk_1` FOREIGN KEY (`id_jenis_vitamin`) REFERENCES `tb_jenis_vitamin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_vitamin_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_vitamin_ibfk_3` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_pemberian_vitamin_ibfk_4` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_pemberian_vitamin
-- ----------------------------
BEGIN;
INSERT INTO `tb_pemberian_vitamin` (`id`, `id_jenis_vitamin`, `id_user`, `id_posyandu`, `id_nakes`, `nama_posyandu`, `nama_pemeriksa`, `usia`, `tanggal_pemberian`, `tanggal_kembali`, `keterangan`, `lokasi`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 3, 1, 1, 4, 'Posyandu Seruni', 'Nakes', '28', '2024-06-26', '2024-06-26', NULL, 'Posyandu', '2024-06-26 04:51:33', '2024-06-26 04:51:33', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_pengumuman
-- ----------------------------
DROP TABLE IF EXISTS `tb_pengumuman`;
CREATE TABLE `tb_pengumuman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `judul_pengumuman` varchar(255) DEFAULT NULL,
  `pengumuman` text DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  CONSTRAINT `tb_pengumuman_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_pengumuman
-- ----------------------------
BEGIN;
INSERT INTO `tb_pengumuman` (`id`, `id_posyandu`, `judul_pengumuman`, `pengumuman`, `tanggal`, `image`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Pengumuman', '<p>test pengumuman</p>', '2024-06-26', 'app/informasi/pengumuman/1719332453-carantina-proteusjpg.jpg', 'pengumuman', '2024-06-25 16:20:53', '2024-06-25 16:20:53', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_penyakit_bawaan
-- ----------------------------
DROP TABLE IF EXISTS `tb_penyakit_bawaan`;
CREATE TABLE `tb_penyakit_bawaan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned DEFAULT NULL,
  `nama_penyakit` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_penyakit_bawaan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_penyakit_bawaan
-- ----------------------------
BEGIN;
INSERT INTO `tb_penyakit_bawaan` (`id`, `id_user`, `nama_penyakit`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 3, 'Panu', '2024-06-26 15:29:43', '2024-06-26 15:29:43', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_permission` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
BEGIN;
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Lihat Super Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Lihat Tenaga Kesehatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Lihat Head Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'Lihat Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 'Lihat Kader', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 'Lihat Anggota', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 'Lihat Hak Akses', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 'Tambah Super Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 'Ubah Super Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 'Tambah Tenaga Kesehatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 'Ubah Tenaga Kesehatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 'Tambah Head Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 'Ubah Head Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 'Tambah Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 'Ubah Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 'Tambah Kader', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 'Ubah Kader', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 'Nonaktifkan Tenaga Kesehatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 'Nonaktifkan Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 'Nonaktifkan Kader', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 'Konfirmasi Anggota', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 'Nonaktifkan Anggota', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 'Tambah Anggota', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 'Ubah Anggota', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 'Lihat Imunisasi', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 'Lihat Vitamin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 'Batalkan Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 'Broadcast Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 'Hapus Dokumentasi Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 'Lihat Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 'Lihat Riwayat Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 'Tambah Dokumentasi Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 'Tambah Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 'Ubah Dokumentasi Kegaitan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 'Ubah Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 'Lihat Dokumentasi Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 'Hapus Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 'Lihat Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 'Lihat Tag Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 'Tambah Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 'Ubah Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 'Ubah Status Publikasi Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 'Ubah Imunisasi', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 'Hapus Imunisasi', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 'Tambah Pengumuman', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 'Ubah Pengumuman', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 'Hapus Pengumuman', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 'Tambah Tag Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 'Hapus Tag Berita', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 'Ubah Status Publikasi Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 'Ubah Dokumentasi Kegiatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 'Nonaktifkan Head Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 'Nonaktifkan Super Admin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 'Tambah Hak Akses', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 'Hapus Hak Akses', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 'Ubah Vitamin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 'Hapus Vitamin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 'Ganti Jabatan', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 'Tambah Imunisasi', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 'Tambah Vitamin', NULL, NULL, NULL);
INSERT INTO `tb_permission` (`id`, `nama_permission`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 'Lihat Pengumuman', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_pj_lansia
-- ----------------------------
DROP TABLE IF EXISTS `tb_pj_lansia`;
CREATE TABLE `tb_pj_lansia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lansia` int(10) unsigned DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `hubungan_keluarga` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_lansia` (`id_lansia`),
  CONSTRAINT `tb_pj_lansia_ibfk_1` FOREIGN KEY (`id_lansia`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_pj_lansia
-- ----------------------------
BEGIN;
INSERT INTO `tb_pj_lansia` (`id`, `id_lansia`, `nama`, `hubungan_keluarga`, `nomor_telepon`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Penanggung Jawab', 'Anak', '082183746574', 'Alamat', '2024-06-26 15:19:20', '2024-06-26 15:19:20', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_posyandu
-- ----------------------------
DROP TABLE IF EXISTS `tb_posyandu`;
CREATE TABLE `tb_posyandu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_desa` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) NOT NULL,
  `id_chat_group_tele` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_telepon` varchar(16) DEFAULT NULL,
  `banjar` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_desa` (`id_desa`),
  CONSTRAINT `tb_posyandu_ibfk_1` FOREIGN KEY (`id_desa`) REFERENCES `tb_desa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_posyandu
-- ----------------------------
BEGIN;
INSERT INTO `tb_posyandu` (`id`, `id_desa`, `nama_posyandu`, `id_chat_group_tele`, `alamat`, `nomor_telepon`, `banjar`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Posyandu Seruni', NULL, 'Jl. Pucang Jajar Timur No.2, Pucanggading, Batursari, Kec. Mranggen, Kabupaten Demak, Jawa Tengah 59567', '082186753684', 'Batursari', '-7.039895896471154', '110.49530153489056', NULL, '2024-06-25 15:30:58', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_rekam_kesehatan_anak
-- ----------------------------
DROP TABLE IF EXISTS `tb_rekam_kesehatan_anak`;
CREATE TABLE `tb_rekam_kesehatan_anak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_anak` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) DEFAULT NULL,
  `nama_pemeriksa` varchar(50) DEFAULT NULL,
  `nama_anak` varchar(50) DEFAULT NULL,
  `lingkar_kepala` varchar(50) DEFAULT NULL,
  `berat_badan` varchar(50) DEFAULT NULL,
  `tinggi_badan` varchar(50) DEFAULT NULL,
  `IMT` varchar(50) DEFAULT NULL,
  `status_gizi` varchar(50) DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  `pengobatan` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `usia_anak` int(11) DEFAULT NULL,
  `tempat_pemeriksaan` varchar(255) DEFAULT NULL,
  `jenis_pemeriksaan` varchar(255) DEFAULT NULL,
  `tanggal_pemeriksaan` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  KEY `id_ibu_hamil` (`id_anak`),
  CONSTRAINT `tb_rekam_kesehatan_anak_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_anak_ibfk_2` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_anak_ibfk_3` FOREIGN KEY (`id_anak`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_rekam_kesehatan_anak
-- ----------------------------
BEGIN;
INSERT INTO `tb_rekam_kesehatan_anak` (`id`, `id_posyandu`, `id_anak`, `id_nakes`, `nama_posyandu`, `nama_pemeriksa`, `nama_anak`, `lingkar_kepala`, `berat_badan`, `tinggi_badan`, `IMT`, `status_gizi`, `diagnosa`, `pengobatan`, `keterangan`, `usia_anak`, `tempat_pemeriksaan`, `jenis_pemeriksaan`, `tanggal_pemeriksaan`, `tanggal_kembali`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 1, 4, 'Posyandu Seruni', 'Nakes', 'Anak Satu', '30', '15', '100', '7500', 'Cukup Gizi', 'Bagus', NULL, NULL, 2, 'Posyandu Seruni', 'Pemeriksaan', '2024-06-26', '2024-07-26', '2024-06-26 13:17:28', '2024-06-26 13:17:28', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_rekam_kesehatan_ibu_hamil
-- ----------------------------
DROP TABLE IF EXISTS `tb_rekam_kesehatan_ibu_hamil`;
CREATE TABLE `tb_rekam_kesehatan_ibu_hamil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_ibu_hamil` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) DEFAULT NULL,
  `nama_pemeriksa` varchar(50) DEFAULT NULL,
  `nama_ibu_hamil` varchar(50) DEFAULT NULL,
  `lingkar_lengan` varchar(50) DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `tanggal_pemeriksaan` date DEFAULT NULL,
  `berat_badan` varchar(50) DEFAULT NULL,
  `usia_kandungan` varchar(50) DEFAULT NULL,
  `tekanan_darah` varchar(50) DEFAULT NULL,
  `denyut_nadi_ibu` varchar(50) DEFAULT NULL,
  `detak_jantung_bayi` varchar(50) DEFAULT NULL,
  `tinggi_rahim` varchar(50) DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  `pengobatan` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `tempat_pemeriksaan` varchar(255) DEFAULT NULL,
  `jenis_pemeriksaan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  KEY `id_ibu_hamil` (`id_ibu_hamil`),
  CONSTRAINT `tb_rekam_kesehatan_ibu_hamil_ibfk_3` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_ibu_hamil_ibfk_4` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_ibu_hamil_ibfk_5` FOREIGN KEY (`id_ibu_hamil`) REFERENCES `tb_ibu_hamil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_rekam_kesehatan_ibu_hamil
-- ----------------------------
BEGIN;
INSERT INTO `tb_rekam_kesehatan_ibu_hamil` (`id`, `id_posyandu`, `id_ibu_hamil`, `id_nakes`, `nama_posyandu`, `nama_pemeriksa`, `nama_ibu_hamil`, `lingkar_lengan`, `usia`, `tanggal_kembali`, `tanggal_pemeriksaan`, `berat_badan`, `usia_kandungan`, `tekanan_darah`, `denyut_nadi_ibu`, `detak_jantung_bayi`, `tinggi_rahim`, `diagnosa`, `pengobatan`, `keterangan`, `tempat_pemeriksaan`, `jenis_pemeriksaan`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 1, 4, 'Posyandu Seruni', 'Nakes', 'Ibu Hamil Satu', '30', NULL, '2024-07-27', '2024-06-26', '70', '12', '100', '200', '50', '5', 'kondisi ...', NULL, NULL, 'Posyandu Seruni', 'Pemeriksaan', '2024-06-25 18:09:13', '2024-06-25 18:09:13', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_rekam_kesehatan_lansia
-- ----------------------------
DROP TABLE IF EXISTS `tb_rekam_kesehatan_lansia`;
CREATE TABLE `tb_rekam_kesehatan_lansia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_posyandu` int(10) unsigned DEFAULT NULL,
  `id_lansia` int(10) unsigned DEFAULT NULL,
  `id_nakes` int(10) unsigned DEFAULT NULL,
  `nama_posyandu` varchar(50) DEFAULT NULL,
  `nama_pemeriksa` varchar(50) DEFAULT NULL,
  `nama_lansia` varchar(50) DEFAULT NULL,
  `berat_badan` varchar(50) DEFAULT NULL,
  `usia_lansia` int(11) DEFAULT NULL,
  `tinggi_lutut` varchar(50) DEFAULT NULL,
  `tinggi_badan` varchar(50) DEFAULT NULL,
  `tekanan_darah` varchar(50) DEFAULT NULL,
  `suhu_tubuh` varchar(50) DEFAULT NULL,
  `denyut_nadi` varchar(50) DEFAULT NULL,
  `IMT` varchar(50) DEFAULT NULL,
  `status_gizi` varchar(50) DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  `pengobatan` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `tempat_pemeriksaan` varchar(255) DEFAULT NULL,
  `jenis_pemeriksaan` varchar(255) DEFAULT NULL,
  `tanggal_pemeriksaan` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_posyandu` (`id_posyandu`),
  KEY `id_nakes` (`id_nakes`),
  KEY `id_ibu_hamil` (`id_lansia`),
  CONSTRAINT `tb_rekam_kesehatan_lansia_ibfk_1` FOREIGN KEY (`id_posyandu`) REFERENCES `tb_posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_lansia_ibfk_2` FOREIGN KEY (`id_nakes`) REFERENCES `tb_nakes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_rekam_kesehatan_lansia_ibfk_3` FOREIGN KEY (`id_lansia`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_rekam_kesehatan_lansia
-- ----------------------------
BEGIN;
INSERT INTO `tb_rekam_kesehatan_lansia` (`id`, `id_posyandu`, `id_lansia`, `id_nakes`, `nama_posyandu`, `nama_pemeriksa`, `nama_lansia`, `berat_badan`, `usia_lansia`, `tinggi_lutut`, `tinggi_badan`, `tekanan_darah`, `suhu_tubuh`, `denyut_nadi`, `IMT`, `status_gizi`, `diagnosa`, `pengobatan`, `keterangan`, `tempat_pemeriksaan`, `jenis_pemeriksaan`, `tanggal_pemeriksaan`, `tanggal_kembali`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 1, 1, 4, 'Posyandu Seruni', 'Nakes', 'Lansia Satu', '70', 145, '20', '165', '110', '30', '20', '42.424242424242', NULL, 'Posyandu Seruni', NULL, NULL, 'Posyandu', 'Pemeriksaan', '2024-06-26', '2024-07-26', '2024-06-26 15:25:42', '2024-06-26 15:25:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_riwayat_penyakit_lansia
-- ----------------------------
DROP TABLE IF EXISTS `tb_riwayat_penyakit_lansia`;
CREATE TABLE `tb_riwayat_penyakit_lansia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lansia` int(10) unsigned DEFAULT NULL,
  `nama_penyakit` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_lansia` (`id_lansia`),
  CONSTRAINT `tb_riwayat_penyakit_lansia_ibfk_1` FOREIGN KEY (`id_lansia`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_riwayat_penyakit_lansia
-- ----------------------------
BEGIN;
INSERT INTO `tb_riwayat_penyakit_lansia` (`id`, `id_lansia`, `nama_penyakit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'asam urat', 'Sedang Mengalami', '2024-06-26 15:26:25', '2024-06-26 15:26:25', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_riwayat_persalinan
-- ----------------------------
DROP TABLE IF EXISTS `tb_riwayat_persalinan`;
CREATE TABLE `tb_riwayat_persalinan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_anak` int(10) unsigned DEFAULT NULL,
  `id_ibu_hamil` int(10) unsigned DEFAULT NULL,
  `nama_anak` varchar(50) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `tanggal_lahir` varchar(50) DEFAULT NULL,
  `berat_lahir` varchar(20) DEFAULT NULL,
  `persalinan` varchar(255) DEFAULT NULL,
  `penolong_persalinan` varchar(255) DEFAULT NULL,
  `komplikasi` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anak` (`id_anak`),
  KEY `id_ibu_hamil` (`id_ibu_hamil`),
  CONSTRAINT `tb_riwayat_persalinan_ibfk_1` FOREIGN KEY (`id_anak`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_riwayat_persalinan_ibfk_2` FOREIGN KEY (`id_ibu_hamil`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_riwayat_persalinan
-- ----------------------------
BEGIN;
INSERT INTO `tb_riwayat_persalinan` (`id`, `id_anak`, `id_ibu_hamil`, `nama_anak`, `nama_ibu`, `tanggal_lahir`, `berat_lahir`, `persalinan`, `penolong_persalinan`, `komplikasi`, `kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 1, 'Anak Satu', 'Ibu Hamil Satu', '2021-09-20', '3000', 'Normal', 'Bidan', 'Komplikasi', NULL, '2024-06-25 18:06:31', '2024-06-25 18:06:31', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_super_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_super_admin`;
CREATE TABLE `tb_super_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kecamatan` int(10) unsigned DEFAULT NULL,
  `id_kabupaten` int(10) unsigned DEFAULT NULL,
  `id_desa` int(10) unsigned DEFAULT NULL,
  `id_admin` int(10) unsigned DEFAULT NULL,
  `nama_super_admin` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `username_telegram` varchar(50) DEFAULT NULL,
  `nik` varchar(18) DEFAULT NULL,
  `file_ktp` text DEFAULT NULL,
  `area_tugas` enum('Provinsi','Kabupaten','Kecamatan') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kabupaten` (`id_kabupaten`),
  KEY `id_kecamatan` (`id_kecamatan`),
  KEY `id_desa` (`id_desa`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `tb_super_admin_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_super_admin_ibfk_2` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_super_admin_ibfk_3` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_super_admin_ibfk_4` FOREIGN KEY (`id_desa`) REFERENCES `tb_desa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_super_admin_ibfk_5` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_super_admin
-- ----------------------------
BEGIN;
INSERT INTO `tb_super_admin` (`id`, `id_kecamatan`, `id_kabupaten`, `id_desa`, `id_admin`, `nama_super_admin`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `username_telegram`, `nik`, `file_ktp`, `area_tugas`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 1, 1, 1, 'Administrator', 'tempat lahir', '1999-06-24', 'Laki-laki', 'Alamat', '082183745689', NULL, '18928374616263718', NULL, 'Kecamatan', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_tag` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
BEGIN;
INSERT INTO `tb_tag` (`id`, `nama_tag`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'test', 'Aktif', '2024-06-25 15:31:32', '2024-06-25 15:31:32', NULL);
INSERT INTO `tb_tag` (`id`, `nama_tag`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'tag 1', 'Aktif', '2024-06-25 15:31:42', '2024-06-25 15:31:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_tag_berita
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag_berita`;
CREATE TABLE `tb_tag_berita` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_informasi` int(10) unsigned DEFAULT NULL,
  `id_tag` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tag` (`id_tag`),
  KEY `id_informasi` (`id_informasi`),
  CONSTRAINT `tb_tag_berita_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tb_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_tag_berita_ibfk_3` FOREIGN KEY (`id_informasi`) REFERENCES `tb_informasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_tag_berita
-- ----------------------------
BEGIN;
INSERT INTO `tb_tag_berita` (`id`, `id_informasi`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 1, '2024-06-25 15:40:27', '2024-06-25 15:40:27', NULL);
INSERT INTO `tb_tag_berita` (`id`, `id_informasi`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 1, '2024-06-25 15:40:27', '2024-06-25 15:40:27', NULL);
INSERT INTO `tb_tag_berita` (`id`, `id_informasi`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 1, 1, '2024-06-25 15:43:07', '2024-06-25 15:43:07', NULL);
INSERT INTO `tb_tag_berita` (`id`, `id_informasi`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 1, 1, '2024-06-25 15:43:07', '2024-06-25 15:43:07', NULL);
INSERT INTO `tb_tag_berita` (`id`, `id_informasi`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 2, 1, '2024-06-26 13:35:36', '2024-06-26 13:35:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kk` int(10) unsigned DEFAULT NULL,
  `role` enum('0','1','2') DEFAULT NULL COMMENT '0 = anak, 1 = ibu hamil, 2 = lansia',
  `id_chat_tele` varchar(255) DEFAULT NULL,
  `username_tele` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `golongan_darah` varchar(3) DEFAULT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `tanggungan` varchar(255) DEFAULT NULL,
  `no_jkn` varchar(20) DEFAULT NULL,
  `masa_berlaku` date DEFAULT NULL,
  `faskes_rujukan` varchar(255) DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `otp_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_kk` (`id_kk`),
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_kk`) REFERENCES `tb_kk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, '1', NULL, '', 'ibuhamilsatu@gmail.com', '$2y$10$L11N6a8V9W6sGROP5D9JlObropPBZA4dh9xhLA6usjA2PT1xAcRXu', '/images/upload/Profile/default.jpg', 'A', 'Islam', 'Dengan Tanggungan', '3321110902070002', '2025-09-20', 'Faskes', 1, '1', NULL, NULL, '2024-06-25 03:06:29', '2024-06-25 03:06:29', NULL);
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, '0', NULL, NULL, 'anaksatu@gmail.com', '$2y$10$2lVz2pH0tOSgvxvl/iKzsezw.ek2bTFyYZI.5ywdwoYr45gsfRy9y', '/images/upload/Profile/default.jpg', 'A', 'Islam', 'Tanpa Tanggungan', '3321110902070001', NULL, 'Faskes', 1, '1', NULL, NULL, '2024-06-25 03:13:37', '2024-06-25 03:13:37', NULL);
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 2, '2', NULL, NULL, 'lansiasatu@gmail.com', '$2y$10$uoQGSen37h/BgCJAMQxptO4OIk6YmzQZneyx06PGhYtlJ3nqYkXUy', '/images/upload/Profile/default.jpg', 'A', NULL, 'Tanpa Tanggungan', '3321060902150009', NULL, 'Faskes', 1, '1', NULL, NULL, '2024-06-25 03:15:04', '2024-06-25 03:15:04', NULL);
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 3, '1', NULL, NULL, 'ibudua@gmail.com', '$2y$10$zzhfn4aKc4naGMMDdXmUueVDXZ.CmQmgvkYBKwfnkWXKDpIldIHuu', '/images/upload/Profile/deafult.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-26 14:11:36', '2024-06-26 14:11:36', NULL);
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 4, '0', NULL, NULL, 'anakdua@gmail.com', '$2y$10$tzC7c1G06cIvyqgVXmBrz.xEN/In5HPC7Zlqekcx.UOtscjmjJpCu', '/images/upload/Profile/deafult.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-26 15:46:40', '2024-06-26 15:46:40', NULL);
INSERT INTO `tb_user` (`id`, `id_kk`, `role`, `id_chat_tele`, `username_tele`, `email`, `password`, `profile_image`, `golongan_darah`, `agama`, `tanggungan`, `no_jkn`, `masa_berlaku`, `faskes_rujukan`, `is_verified`, `status`, `keterangan`, `otp_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 4, '2', NULL, NULL, 'paktua@gmail.com', '$2y$10$46fXRoDm0Kr6ZDZe7LFZJOdgiPe9o2omw5WKLkOSoQ9SjKJWVtStG', '/images/upload/Profile/deafult.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-27 01:33:31', '2024-06-27 01:33:31', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
