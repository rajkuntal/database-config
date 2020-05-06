CREATE TABLE `bee_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_count` int(11) DEFAULT NULL,
  `consumed_count` int(11) DEFAULT NULL,
  `expected_count` int(11) DEFAULT NULL,
  `number_of_errors` int(11) DEFAULT NULL,
  `published_state` int(11) DEFAULT NULL,
  `consumed_state` int(11) DEFAULT NULL,
  `last_consumed_sequence_id` int(11) DEFAULT NULL,
  `published_error` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trigger_params` json DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
