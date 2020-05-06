CREATE TABLE `mwtb_audit_page_count_rename` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mwtb_audit_id` int(11) DEFAULT NULL,
  `vertical` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mwtb_audit_id` (`mwtb_audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
