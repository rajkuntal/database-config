CREATE TABLE `buy_page_distribution_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `distribution_counter_url_unique_key` (`page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
