CREATE TABLE `page_search_volume_2020_04_24_11_59_54` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anchor_type` int(11) NOT NULL,
  `anchor_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_search_volume` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anchor_type_anchor_id` (`anchor_type`,`anchor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='2020-04-24 11:59:54';
