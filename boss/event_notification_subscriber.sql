CREATE TABLE `event_notification_subscriber` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(64) NOT NULL DEFAULT '',
  `trigger_impl` varchar(64) NOT NULL DEFAULT '',
  `params` text,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL DEFAULT '',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`subscriber_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
