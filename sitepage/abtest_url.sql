CREATE TABLE `abtest_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `test_id` int(11) unsigned NOT NULL,
  `variant` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`,`test_id`),
  KEY `abtest_fk_1` (`test_id`),
  CONSTRAINT `abtest_fk_1` FOREIGN KEY (`test_id`) REFERENCES `abtest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
