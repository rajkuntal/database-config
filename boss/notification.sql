CREATE TABLE `notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT 'name of the timer, doesn''t have to be unique',
  `description` varchar(200) DEFAULT NULL,
  `status_id` tinyint(4) unsigned DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL COMMENT 'date the timer becomed effective, if before start date, ignore',
  `end_date` datetime DEFAULT NULL COMMENT 'date when the timer expires, if now() is after end date, timer triggers should be executed',
  `cancel_reason` varchar(200) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL COMMENT 'date when the timer was turned off',
  `trigger_exec_date` datetime DEFAULT NULL COMMENT 'timer is expired, date the the timer was triggered',
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `notification_status_lk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
