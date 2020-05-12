CREATE TABLE `mwtb_link_count_report_2020_03_29_02_00_39` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `links_count` int(11) NOT NULL,
  `no_of_mwtb_links` int(11) NOT NULL,
  `count_of_mwtb_target_pages` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='2020-03-29 02:00:39';
