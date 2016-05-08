-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2016 at 04:16 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `date`) VALUES
(1, 'Man', '', 0, '2016-05-08 12:59:51'),
(2, 'Shirts', 'shirts', 1, '2016-05-08 12:59:51'),
(3, 'Shirts1', 'shirts1', 1, '2016-05-08 12:59:52'),
(4, 'Woman', '', 0, '2016-05-08 12:59:52'),
(5, 'Shirts', 'shirts3', 4, '2016-05-08 12:59:52'),
(6, 'Shirts1', 'shirts4', 4, '2016-05-08 12:59:52'),
(7, 'Smartphones', '', 0, '2016-05-08 12:59:52'),
(8, 'Shirts', 'shirts5', 7, '2016-05-08 12:59:52'),
(9, 'Shirts1', 'shirts6', 7, '2016-05-08 12:59:52'),
(10, 'Tablets', '', 0, '2016-05-08 12:59:52'),
(11, 'Laptop', '', 0, '2016-05-08 12:59:52'),
(12, 'Desctop', '', 0, '2016-05-08 12:59:52'),
(13, 'Watch', '', 0, '2016-05-08 12:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bbf709f273a226f5da686312268c511f1873e7db', '172.16.91.1', 1462347945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436323334373836383b736974655f6c616e677c733a373a227275737369616e223b);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `product_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `filter_category` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filters_relations`
--

CREATE TABLE `filters_relations` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filter_categories`
--

CREATE TABLE `filter_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE `general` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `subject_romanian` varchar(255) NOT NULL,
  `subject_russian` varchar(255) NOT NULL,
  `content_romanian` text NOT NULL,
  `content_russian` text NOT NULL,
  `subscribers` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `received` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `until_date` date NOT NULL,
  `products` text NOT NULL,
  `content_romanian` text,
  `content_russian` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_array` mediumtext NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title_romanian` varchar(255) NOT NULL,
  `title_russian` mediumtext NOT NULL,
  `content_romanian` mediumtext NOT NULL,
  `content_russian` mediumtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(600) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `special_content` mediumtext NOT NULL,
  `special_price` double NOT NULL,
  `tags` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `code`, `description`, `category`, `price`, `image`, `active`, `special_content`, `special_price`, `tags`, `views`, `date`) VALUES
(1, 'Tiêu đề1aasdasd', 'tieu-de-1', 'DK001', '<p>description1</p>', 2, 123000, NULL, 0, '', 50000, 'apple', 0, '2016-05-08 12:59:45'),
(2, 'Tiêu đề2', 'tieu-de-2', 'DK002', 'description2', 3, 135000, NULL, 1, '', 50000, 'apple', 0, '2016-05-08 12:59:46'),
(3, 'Tiêu đề3', 'tieu-de-3', 'DK003', 'description3', 4, 147000, NULL, 1, '', 50000, 'iphone', 0, '2016-05-08 12:59:46'),
(4, 'Tiêu đề1', 'tieu-de-4', 'DK004', 'description4', 2, 159000, NULL, 1, '', 50000, 'white', 0, '2016-05-08 12:59:46'),
(5, 'Tiêu đề2', 'tieu-de-5', 'DK005', 'description5', 3, 171000, NULL, 1, '', 50000, 'apple', 0, '2016-05-08 12:59:46'),
(6, 'Tiêu đề3', 'tieu-de-6', 'DK006', 'description6', 4, 183000, NULL, 1, '', 50000, 'iphone', 0, '2016-05-08 12:59:47'),
(7, 'Tiêu đề1', 'tieu-de-7', 'DK007', 'description7', 2, 195000, NULL, 1, '', 50000, 'iphone', 0, '2016-05-08 12:59:47'),
(8, 'Tiêu đề2', 'tieu-de-8', 'DK008', 'description8', 3, 207000, NULL, 1, '', 50000, 'iphone', 0, '2016-05-08 12:59:47'),
(9, 'Tiêu đề3', 'tieu-de-9', 'DK009', 'description9', 4, 219000, NULL, 0, '', 50000, 'apple', 0, '2016-05-08 12:59:47'),
(10, 'Tiêu đề1', 'tieu-de-10', 'DK010', 'description10', 2, 231000, NULL, 1, '', 50000, 'apple', 0, '2016-05-08 12:59:47'),
(11, 'Tiêu đề2', 'tieu-de-11', 'DK011', 'description11', 3, 243000, NULL, 1, '', 50000, 'new', 0, '2016-05-08 12:59:47'),
(12, 'Tiêu đề3', 'tieu-de-12', 'DK012', 'description12', 4, 255000, NULL, 1, '', 50000, 'apple', 0, '2016-05-08 12:59:47'),
(13, 'Tiêu đề1', 'tieu-de-13', 'DK013', '                                <div id="currency" class="pull-right">\n                                    <a href="" class="currency-title">$ USD <i class="fa fa-angle-down"></i> </a>\n                                    <ul class="list-unstyled currency-item">\n                                        <li><a href="">€ EURO</a></li>\n                                        <li><a href="">£ POUND</a></li>\n                                    </ul>\n                                </div>\n', 5, 267000, NULL, 0, '', 50000, 'new', 0, '2016-05-08 12:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path_img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path_img`) VALUES
(1, 1, '/assets/uploads/6DE7K19C3V.jpg'),
(2, 2, '/assets/uploads/454XGY49A3.jpg'),
(3, 3, '/assets/uploads/2016-05-05__05_42_54.png'),
(4, 4, '/assets/uploads/2016-05-05__05_46_00.png'),
(5, 5, '/assets/uploads/Document.jpg'),
(6, 6, '/assets/uploads/6DE7K19C3V.jpg'),
(7, 7, '/assets/uploads/454XGY49A3.jpg'),
(8, 8, '/assets/uploads/2016-05-05__05_42_54.png'),
(9, 9, '/assets/uploads/2016-05-05__05_46_00.png'),
(10, 10, '/assets/uploads/Document.jpg'),
(11, 11, '/assets/uploads/6DE7K19C3V.jpg'),
(12, 12, '/assets/uploads/454XGY49A3.jpg'),
(13, 13, '/assets/uploads/2016-05-05__05_42_54.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `language` enum('romanian','russian') NOT NULL DEFAULT 'romanian',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `subscribed` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `language`, `name`, `email`, `password`, `telephone`, `address`, `ip`, `admin`, `subscribed`, `date`) VALUES
(3, 'romanian', '123', '', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, 1, '2016-05-04 13:35:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters_relations`
--
ALTER TABLE `filters_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filter_categories`
--
ALTER TABLE `filter_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general`
--
ALTER TABLE `general`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filters_relations`
--
ALTER TABLE `filters_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filter_categories`
--
ALTER TABLE `filter_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
