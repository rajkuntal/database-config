CREATE TABLE `operation_file_xref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) unsigned NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `row_number` int(11) unsigned NOT NULL,
  `operation_key` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `operation_file_unq` (`operation_id`,`file_id`),
  KEY `operation_file_fid_fk` (`file_id`),
  CONSTRAINT `operation_file_fid_fk` FOREIGN KEY (`file_id`) REFERENCES `process_file` (`id`),
  CONSTRAINT `operation_file_id_fk` FOREIGN KEY (`operation_id`) REFERENCES `process_operation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
