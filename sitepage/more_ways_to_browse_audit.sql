CREATE TABLE `more_ways_to_browse_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `browse_page_xref_table_guid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `process_state` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sitemap_table` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_url_count` int(11) DEFAULT NULL,
  `full_publish_url_count` int(11) DEFAULT NULL,
  `delta_publish_url_count` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
