CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_key` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_gen_request_date` timestamp NULL DEFAULT NULL,
  `meta_gen_date` timestamp NULL DEFAULT NULL,
  `enable_mwtb` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_url` (`url`),
  KEY `page_att_name_idx` (`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
