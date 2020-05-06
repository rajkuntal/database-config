CREATE TABLE `notification_command` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) unsigned NOT NULL,
  `executor` varchar(100) NOT NULL DEFAULT '',
  `parameter` text,
  `error_message` varchar(100) DEFAULT NULL,
  `error_stack_trace` varchar(8000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parameter_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `notification_command_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
