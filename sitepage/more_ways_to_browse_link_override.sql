CREATE TABLE `more_ways_to_browse_link_override` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mwtb_page_id` int(11) NOT NULL,
  `linked_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(11) NOT NULL,
  `anchor_text` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mwtb_override_link_unique_key` (`mwtb_page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
