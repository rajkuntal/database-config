CREATE TABLE `event_notification_subscriber_xref` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_notification_type_id` int(11) unsigned NOT NULL,
  `event_notification_subscriber_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_notification_type_id_idx` (`event_notification_type_id`),
  KEY `event_notification_subscriber_id_idx` (`event_notification_subscriber_id`),
  CONSTRAINT `event_notification_type_fk` FOREIGN KEY (`event_notification_type_id`) REFERENCES `event_notification_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber_id_fk` FOREIGN KEY (`event_notification_subscriber_id`) REFERENCES `event_notification_subscriber` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
