CREATE TABLE `notification_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) unsigned DEFAULT NULL,
  `anchor` varchar(100) DEFAULT NULL,
  `anchor_type` int(3) DEFAULT NULL,
  `anchor_id` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  KEY `anchor` (`anchor`),
  CONSTRAINT `notification_anchor_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
