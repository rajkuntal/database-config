CREATE TABLE `process` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `process_type` int(11) DEFAULT NULL,
  `process_status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT '',
  `modified_by` varchar(100) DEFAULT NULL,
  `error_message` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `process_type` (`process_type`),
  CONSTRAINT `type_fk` FOREIGN KEY (`process_type`) REFERENCES `process_type_lk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
