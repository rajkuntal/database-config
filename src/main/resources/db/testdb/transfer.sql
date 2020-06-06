CREATE TABLE `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_user_id` varchar(50) NOT NULL,
  `target_user_id` varchar(50) NOT NULL,
  `item_pk` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `item_pk` (`item_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
