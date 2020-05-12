CREATE TABLE `uploaded_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT '',
  `modified_by` varchar(100) DEFAULT NULL,
  `file_upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
