CREATE TABLE `cron_job_arg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cron_job_id` int(11) unsigned NOT NULL,
  `cron_job_key` varchar(64) DEFAULT NULL,
  `arg_key` varchar(64) DEFAULT NULL,
  `arg_value` varchar(2000) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cron_job_id_fk` (`cron_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
