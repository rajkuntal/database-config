CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(128) DEFAULT NULL,
  `last_run_date` datetime DEFAULT NULL,
  `task_status` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `message` text,
  `task_arguments` text,
  `top_level_key` varchar(128) DEFAULT NULL,
  `top_level_key_1` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskName_lastRunDate_idx` (`task_name`,`last_run_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
