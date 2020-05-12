CREATE TABLE `process_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(1000) DEFAULT NULL,
  `process_id` int(11) unsigned NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `internal_path` varchar(1000) DEFAULT NULL,
  `web_path` varchar(1000) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`,`file_path`(191)),
  KEY `hash_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
