CREATE TABLE `abtest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
