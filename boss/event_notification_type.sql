CREATE TABLE `event_notification_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_type_name` varchar(64) NOT NULL DEFAULT '',
  `predicate` varchar(1000) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_type_name` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
