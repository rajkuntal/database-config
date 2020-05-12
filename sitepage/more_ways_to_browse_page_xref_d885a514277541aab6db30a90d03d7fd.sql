CREATE TABLE `more_ways_to_browse_page_xref_d885a514277541aab6db30a90d03d7fd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mwtb_page_id` int(11) NOT NULL,
  `linked_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(11) NOT NULL,
  `anchor_text` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mwtb_xref_page_id_linked_url_unique_key` (`mwtb_page_id`,`linked_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='2020-05-08 02:17:21';
