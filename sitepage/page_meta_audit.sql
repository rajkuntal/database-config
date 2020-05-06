CREATE TABLE `page_meta_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `property_value` varchar(1000) DEFAULT NULL,
  `rule_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `rule_id` (`rule_id`),
  KEY `idx_propType_and_propValue` (`property_type`(10),`property_value`(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
