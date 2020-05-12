CREATE TABLE `page_search_volume_2020_05_01_01_00_41` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anchor_type` int(11) NOT NULL,
  `anchor_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_search_volume` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anchor_type_anchor_id` (`anchor_type`,`anchor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='2020-05-01 01:00:41';
