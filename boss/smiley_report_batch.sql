CREATE TABLE `smiley_report_batch` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `url_to_check` varchar(255) DEFAULT NULL,
  `batch_id` bigint(11) DEFAULT NULL,
  `item_count` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batchId` (`batch_id`),
  CONSTRAINT `batchId` FOREIGN KEY (`batch_id`) REFERENCES `smiley_report_batch_lk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
