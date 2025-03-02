-- dolphin_admin_backend.category definition

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `line_color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK46ccwnsi9409t36lurvtyljak` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- dolphin_admin_backend.user_ definition

CREATE TABLE `user_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- dolphin_admin_backend.customer definition

CREATE TABLE `customer` (
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKr91517q1xbl3a22xvax0mnd4j` FOREIGN KEY (`id`) REFERENCES `user_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- dolphin_admin_backend.order_ definition

CREATE TABLE `order_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `status` enum('CANCELED','COMPLETED','PENDING','SHIPPED') DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcqs50rf794der0iy0h6c0mgd` (`customer_id`),
  CONSTRAINT `FKbcqs50rf794der0iy0h6c0mgd` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28651 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- dolphin_admin_backend.product definition

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- dolphin_admin_backend.order_item definition

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price_per_unit` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjpk230vxy41y3ncj7kpuu9y2e` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKjpk230vxy41y3ncj7kpuu9y2e` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71515 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;