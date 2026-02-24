-- Adminer 5.4.2 MySQL 8.0.45 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'admin@example.com',	'5f4dcc3b5aa765d61d8327deb882cf99',	'admin',	'2026-02-24 10:14:17',	'2026-02-24 10:14:17'),
(2,	'user01',	'user01@example.com',	'5f4dcc3b5aa765d61d8327deb882cf99',	'user',	'2026-02-24 10:14:17',	'2026-02-24 10:14:17'),
(3,	'user02',	'user02@example.com',	'5f4dcc3b5aa765d61d8327deb882cf99',	'user',	'2026-02-24 10:14:17',	'2026-02-24 10:14:17'),
(4,	'user03',	'user03@example.com',	'5f4dcc3b5aa765d61d8327deb882cf99',	'user',	'2026-02-24 10:14:17',	'2026-02-24 11:15:15'),
(5,	'user04',	'user04@example.com',	'5f4dcc3b5aa765d61d8327deb882cf99',	'user',	'2026-02-24 10:14:17',	'2026-02-24 11:15:47');
