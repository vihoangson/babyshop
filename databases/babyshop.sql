-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for codeigniter-ecommerce
CREATE DATABASE IF NOT EXISTS `codeigniter-ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `codeigniter-ecommerce`;


-- Dumping structure for table codeigniter-ecommerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_romanian` varchar(255) NOT NULL,
  `name_russian` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table codeigniter-ecommerce.ci_sessions: ~1 rows (approximately)
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('bbf709f273a226f5da686312268c511f1873e7db', '172.16.91.1', 1462347945, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313436323334373836383B736974655F6C616E677C733A373A227275737369616E223B);
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `product_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.filters
CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_category` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.filters: ~0 rows (approximately)
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.filters_relations
CREATE TABLE IF NOT EXISTS `filters_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.filters_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `filters_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `filters_relations` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.filter_categories
CREATE TABLE IF NOT EXISTS `filter_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.filter_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `filter_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_categories` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.general
CREATE TABLE IF NOT EXISTS `general` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.general: ~0 rows (approximately)
/*!40000 ALTER TABLE `general` DISABLE KEYS */;
/*!40000 ALTER TABLE `general` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.newsletter
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_romanian` varchar(255) NOT NULL,
  `subject_russian` varchar(255) NOT NULL,
  `content_romanian` text NOT NULL,
  `content_russian` text NOT NULL,
  `subscribers` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `received` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.newsletter: ~0 rows (approximately)
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.newsletters
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.newsletters: ~0 rows (approximately)
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.offers
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `until_date` date NOT NULL,
  `products` text NOT NULL,
  `content_romanian` text,
  `content_russian` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.offers: ~0 rows (approximately)
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_array` mediumtext NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_romanian` varchar(255) NOT NULL,
  `title_russian` mediumtext NOT NULL,
  `content_romanian` mediumtext NOT NULL,
  `content_russian` mediumtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `special_content` mediumtext NOT NULL,
  `special_price` double NOT NULL,
  `views` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Dumping structure for table codeigniter-ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('romanian','russian') NOT NULL DEFAULT 'romanian',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `subscribed` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table codeigniter-ecommerce.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
