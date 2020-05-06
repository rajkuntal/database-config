CREATE TABLE `test_double` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_pk` varchar(100) NOT NULL,
  `dealer_name` varchar(200) DEFAULT NULL,
  `dealer_id` varchar(100) DEFAULT NULL,
  `dealer_status` varchar(100) DEFAULT NULL,
  `dealer_storefront` varchar(100) DEFAULT NULL,
  `item_status` varchar(100) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_link` varchar(255) DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `l2_category` varchar(100) DEFAULT NULL,
  `l3_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
