CREATE TABLE `process_operation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `process_id` int(11) unsigned NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `operation_type` int(11) DEFAULT NULL,
  `operation_status` int(11) DEFAULT NULL,
  `error_message` text,
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
