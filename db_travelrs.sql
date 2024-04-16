-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 01:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_travelrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(9) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(35) NOT NULL,
  `admin_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agency`
--

CREATE TABLE `tbl_agency` (
  `agency_id` int(9) NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `agency_contact` varchar(50) NOT NULL,
  `agency_email` varchar(50) NOT NULL,
  `agency_address` varchar(50) NOT NULL,
  `agency_photo` varchar(50) NOT NULL,
  `agency_license` varchar(50) NOT NULL,
  `agency_password` varchar(500) NOT NULL,
  `place_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_agency`
--

INSERT INTO `tbl_agency` (`agency_id`, `agency_name`, `agency_contact`, `agency_email`, `agency_address`, `agency_photo`, `agency_license`, `agency_password`, `place_id`) VALUES
(1, 'oscar', '7897680978', 'oscar@gmail.com', 'newyork', 'AgencyPhoto_2088.jpg', 'Agencylicense_1851.jpg', '2', 6),
(2, 'diely', '7678776655', 'diely@gmail.com', 'olakil', 'AgencyPhoto_1143.jpg', 'Agencylicense_1057.jpg', '2', 2),
(3, '0', '75858582872', 'o@gmail.com', 'oliyal', 'AgencyPhoto_1677.jpg', 'Agencylicense_1757.jpg', '4', 6),
(4, 'diely', '78967800', 'diely@gmail.com', 'newyork', 'AgencyPhoto_1609.jpg', 'Agencylicense_2036.jpg', '5', 6),
(5, 'hi', '6789678967', 'hi@gmail.com', 'TVA', 'AgencyPhoto_1424.jpg', 'Agencylicense_1669.jpg', '9', 6),
(6, 'bye', '67867898', 'bye@gmal.com', 'bye', 'AgencyPhoto_1054.jpg', 'Agencylicense_1921.jpg', '16', 6),
(7, 'y', '6786789', 'y@gmail.com', 'yyy', 'AgencyPhoto_1996.jpg', 'Agencylicense_1429.jpg', '123', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chat`
--

CREATE TABLE `tbl_chat` (
  `chat_id` int(9) NOT NULL,
  `chat_date` varchar(200) NOT NULL,
  `chat_content` varchar(50) NOT NULL,
  `from_agency_id` int(9) NOT NULL DEFAULT 0,
  `to_agency_id` int(9) NOT NULL DEFAULT 0,
  `from_user_id` int(9) NOT NULL DEFAULT 0,
  `to_user_id` int(9) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_chat`
--

INSERT INTO `tbl_chat` (`chat_id`, `chat_date`, `chat_content`, `from_agency_id`, `to_agency_id`, `from_user_id`, `to_user_id`) VALUES
(1, 'April 16 2024, 07:13 PM', 'hello', 0, 2, 2, 0),
(2, 'April 16 2024, 07:13 PM', 'Hai', 2, 0, 0, 2),
(3, 'April 16 2024, 07:15 PM', 'Hai', 0, 2, 2, 0),
(4, 'April 16 2024, 07:35 PM', 'ok\n', 0, 2, 2, 0),
(5, 'April 16 2024, 07:35 PM', 'hi\n', 2, 0, 0, 2),
(6, 'April 16 2024, 07:36 PM', 'hello', 0, 2, 2, 0),
(7, 'April 16 2024, 07:36 PM', 'hai', 0, 2, 2, 0),
(8, 'April 16 2024, 07:36 PM', 'hello', 2, 0, 0, 2),
(9, 'April 16 2024, 07:37 PM', 'uytfdz', 0, 2, 2, 0),
(10, 'April 16 2024, 07:37 PM', 'hgfd', 2, 0, 0, 2),
(11, 'April 16 2024, 07:37 PM', 'hgfd', 0, 2, 2, 0),
(12, 'April 16 2024, 07:37 PM', 'ugytf', 2, 0, 0, 2),
(13, 'April 16 2024, 07:38 PM', 'jhgfcx', 0, 2, 2, 0),
(14, 'April 16 2024, 07:38 PM', 'hgfx', 2, 0, 0, 2),
(15, 'April 16 2024, 07:38 PM', 'jhgf', 2, 0, 0, 2),
(16, 'April 16 2024, 07:38 PM', 'jhg', 0, 2, 2, 0),
(17, 'April 16 2024, 07:47 PM', 'hi\n', 2, 0, 0, 2),
(18, 'April 16 2024, 07:47 PM', 'hi', 0, 2, 2, 0),
(19, 'April 16 2024, 07:47 PM', 'hi', 2, 0, 0, 2),
(20, 'April 16 2024, 07:47 PM', 'hi', 0, 2, 2, 0),
(21, 'April 16 2024, 07:48 PM', 'i need refund\n', 2, 0, 0, 2),
(22, 'April 16 2024, 07:48 PM', 'ok\n', 0, 2, 2, 0),
(23, 'April 16 2024, 07:51 PM', ';\n', 2, 0, 0, 2),
(24, 'April 16 2024, 07:51 PM', '.', 0, 2, 2, 0),
(25, 'April 16 2024, 07:51 PM', '', 0, 2, 2, 0),
(26, 'April 16 2024, 07:52 PM', 'Work', 2, 0, 0, 2),
(27, 'April 16 2024, 07:52 PM', '00', 0, 2, 2, 0),
(28, 'April 16 2024, 07:55 PM', '7', 2, 0, 0, 2),
(29, 'April 16 2024, 07:55 PM', 'k', 0, 2, 2, 0),
(30, 'April 16 2024, 07:55 PM', 'j', 2, 0, 0, 2),
(31, 'April 16 2024, 07:55 PM', 'h', 2, 0, 0, 2),
(32, 'April 16 2024, 07:55 PM', 'h', 2, 0, 0, 2),
(33, 'April 16 2024, 07:56 PM', 'k', 0, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(9) NOT NULL,
  `complaint_date` varchar(50) NOT NULL,
  `complaint_details` varchar(50) NOT NULL,
  `complaint_reply` varchar(40) NOT NULL DEFAULT 'Not Yet Replyed',
  `complaint_status` varchar(40) NOT NULL DEFAULT '0',
  `user_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `country_id` int(9) NOT NULL,
  `country_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`country_id`, `country_name`) VALUES
(2, 'India');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(9) NOT NULL,
  `district_name` varchar(35) NOT NULL,
  `state_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`, `state_id`) VALUES
(6, 'Idukki', 13),
(7, 'kollam', 13),
(8, 'Ernakulam', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallary`
--

CREATE TABLE `tbl_gallary` (
  `gallary_id` int(9) NOT NULL,
  `gallary_caption` varchar(25) NOT NULL,
  `gallary_photo` varchar(29) NOT NULL,
  `package_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_gallary`
--

INSERT INTO `tbl_gallary` (`gallary_id`, `gallary_caption`, `gallary_photo`, `package_id`) VALUES
(3, 'This view never gets old.', 'GallaryPhoto_1681.jpg', 7),
(4, 'Living the Roman dream.', 'GallaryPhoto_1101.webp', 7),
(5, 'hh', 'GallaryPhoto_1516.png', 7),
(6, 'hh', 'GallaryPhoto_1530.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guide`
--

CREATE TABLE `tbl_guide` (
  `guide_id` int(9) NOT NULL,
  `guide_name` varchar(50) NOT NULL,
  `guide_contact` varchar(50) NOT NULL,
  `guide_email` varchar(50) NOT NULL,
  `guide_address` varchar(50) NOT NULL,
  `guide_photo` varchar(50) NOT NULL,
  `guide_proof` varchar(50) NOT NULL,
  `guide_password` varchar(50) NOT NULL,
  `place_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_guide`
--

INSERT INTO `tbl_guide` (`guide_id`, `guide_name`, `guide_contact`, `guide_email`, `guide_address`, `guide_photo`, `guide_proof`, `guide_password`, `place_id`) VALUES
(1, 'austin', '5867975678', 'austin@gmail.com', 'TVA', 'GuidePhoto_1452.jpg', 'GuideProof_1232.jpg', '2', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `package_id` int(9) NOT NULL,
  `package_name` varchar(50) NOT NULL,
  `package_price` varchar(25) NOT NULL,
  `package_details` varchar(35) NOT NULL,
  `package_photo` varchar(5000) DEFAULT NULL,
  `place_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`package_id`, `package_name`, `package_price`, `package_details`, `package_photo`, `place_id`) VALUES
(5, 'oscar', '000', 'jjj', 'PackagePhoto_1570.jpg', 6),
(7, 'eiffel tower', '80000', 'A WONDER PARIS TOUR', 'PackagePhoto_1160.jpeg', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packagebookingbody`
--

CREATE TABLE `tbl_packagebookingbody` (
  `booking_id` int(9) NOT NULL,
  `packagebooking_id` int(9) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_age` varchar(50) NOT NULL,
  `user_passport_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_packagebookingbody`
--

INSERT INTO `tbl_packagebookingbody` (`booking_id`, `packagebooking_id`, `user_name`, `user_age`, `user_passport_number`) VALUES
(1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packagebookinghead`
--

CREATE TABLE `tbl_packagebookinghead` (
  `guide_status` int(45) NOT NULL DEFAULT 0,
  `packagebooking_id` int(9) NOT NULL,
  `packagebooking_date` date NOT NULL,
  `packagebooking_fordate` date NOT NULL,
  `packagebooking_details` varchar(50) NOT NULL,
  `packagebooking_status` varchar(50) NOT NULL DEFAULT '0',
  `packagebooking_amount` varchar(500) NOT NULL,
  `packagebooking_count` varchar(50) NOT NULL,
  `user_id` int(9) NOT NULL,
  `package_id` int(9) NOT NULL,
  `agency_id` int(9) NOT NULL,
  `guide_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_packagebookinghead`
--

INSERT INTO `tbl_packagebookinghead` (`guide_status`, `packagebooking_id`, `packagebooking_date`, `packagebooking_fordate`, `packagebooking_details`, `packagebooking_status`, `packagebooking_amount`, `packagebooking_count`, `user_id`, `package_id`, `agency_id`, `guide_id`) VALUES
(0, 12, '2024-03-03', '2024-03-15', 'europe', '2', '22', '2', 2, 1, 2, 0),
(0, 13, '2024-03-05', '2024-03-14', 'kl', '1', '22', '2', 2, 1, 2, 0),
(0, 14, '2024-03-05', '2024-03-08', 'Rome', '1', '80000', '1', 2, 7, 2, 0),
(0, 15, '2024-02-26', '2024-03-23', 'rome', '2', '80000', '1', 2, 7, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_location`
--

CREATE TABLE `tbl_package_location` (
  `location_id` int(9) NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `location_photo` varchar(35) NOT NULL,
  `package_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_package_location`
--

INSERT INTO `tbl_package_location` (`location_id`, `location_name`, `location_photo`, `package_id`) VALUES
(5, 'Rome', 'LocationPhoto_1007.webp', 7),
(6, 'view', 'LocationPhoto_1556.jpg', 7),
(7, 'll', 'LocationPhoto_1736.jpeg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(9) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `district_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(2, 'Thodupuzha', 6),
(5, 'Thevally', 7),
(7, 'Kulathupuzha', 7),
(8, 'Eroor', 7),
(9, 'Alayamon', 7),
(10, 'munnar', 6),
(11, 'poopara', 6),
(13, 'muvattupuzha', 8),
(14, 'angamally', 8),
(15, 'Perumbavoor', 8),
(16, 'paipara', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_rating` varchar(100) NOT NULL,
  `user_review` varchar(100) NOT NULL,
  `review_datetime` varchar(100) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(9) NOT NULL,
  `state_name` varchar(25) NOT NULL,
  `country_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `state_name`, `country_id`) VALUES
(13, 'Kerala', 2),
(14, 'punjab', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ticketbookingbody`
--

CREATE TABLE `tbl_ticketbookingbody` (
  `body_id` int(11) NOT NULL,
  `user_name` int(11) NOT NULL,
  `body_age` int(11) NOT NULL,
  `body_paasport_number` int(11) NOT NULL,
  `head_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ticketbookinghead`
--

CREATE TABLE `tbl_ticketbookinghead` (
  `head_id` int(9) NOT NULL,
  `head_date` date NOT NULL,
  `head_fordate` date NOT NULL,
  `head_details` varchar(50) NOT NULL,
  `type_id` int(9) NOT NULL,
  `ticket_status` varchar(50) NOT NULL DEFAULT '0',
  `ticket_amount` varchar(50) NOT NULL DEFAULT '0',
  `from_place_id` int(9) NOT NULL,
  `to_place_id` int(9) NOT NULL,
  `agency_id` int(9) NOT NULL,
  `user_id` int(9) NOT NULL,
  `ticket_file` varchar(500) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ticketbookinghead`
--

INSERT INTO `tbl_ticketbookinghead` (`head_id`, `head_date`, `head_fordate`, `head_details`, `type_id`, `ticket_status`, `ticket_amount`, `from_place_id`, `to_place_id`, `agency_id`, `user_id`, `ticket_file`) VALUES
(4, '2024-03-04', '2024-03-04', 'hh', 3, '1', '8000', 8, 10, 2, 2, 'ticket_2063.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tickettype`
--

CREATE TABLE `tbl_tickettype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tickettype`
--

INSERT INTO `tbl_tickettype` (`type_id`, `type_name`) VALUES
(3, 'First Class');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(9) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(100) NOT NULL,
  `user_gender` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `place_id` int(9) NOT NULL,
  `user_photo` varchar(40) NOT NULL,
  `user_proof` varchar(40) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_password` varchar(49) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_contact`, `user_gender`, `user_address`, `place_id`, `user_photo`, `user_proof`, `user_email`, `user_password`) VALUES
(1, 'blesson', '5634567926', 'male', 'thottil', 3, 'UserPhoto_2050.jpg', 'UserProof_1835.jpg', 'blesson@gmail.com', 'Bles12'),
(2, 'blesson', '6784780348', 'male', 'vilayil', 2, 'UserPhoto_1824.jpg', 'UserProof_1449.png', 'blesson@gmail.com', 'bless123'),
(3, 'ashina', '9789678956', 'female', 'vinaythil', 2, 'UserPhoto_1338.jpg', 'UserProof_1689.jpg', 'ashina@gmail.com', 'ashina123'),
(4, 'zynder', '7898789898', 'female', 'TVA', 2, 'UserPhoto_1800.jpg', 'UserProof_1876.jpg', 'zynder@gmail.com', 'zynder123'),
(5, 'okkal', '7946802368', 'male', 'thayill', 2, 'UserPhoto_1193.jpg', 'UserProof_1575.jpg', 'okkal@gmail.com', 'okkal123'),
(6, 'vinaykan', '6709457858', 'male', 'thekara', 2, 'UserPhoto_1091.jpg', 'UserProof_1748.jpg', 'vinaykan@gmail.com', 'vinaykan123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_agency`
--
ALTER TABLE `tbl_agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_gallary`
--
ALTER TABLE `tbl_gallary`
  ADD PRIMARY KEY (`gallary_id`);

--
-- Indexes for table `tbl_guide`
--
ALTER TABLE `tbl_guide`
  ADD PRIMARY KEY (`guide_id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `tbl_packagebookingbody`
--
ALTER TABLE `tbl_packagebookingbody`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_packagebookinghead`
--
ALTER TABLE `tbl_packagebookinghead`
  ADD PRIMARY KEY (`packagebooking_id`);

--
-- Indexes for table `tbl_package_location`
--
ALTER TABLE `tbl_package_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_ticketbookingbody`
--
ALTER TABLE `tbl_ticketbookingbody`
  ADD PRIMARY KEY (`body_id`);

--
-- Indexes for table `tbl_ticketbookinghead`
--
ALTER TABLE `tbl_ticketbookinghead`
  ADD PRIMARY KEY (`head_id`);

--
-- Indexes for table `tbl_tickettype`
--
ALTER TABLE `tbl_tickettype`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_agency`
--
ALTER TABLE `tbl_agency`
  MODIFY `agency_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_chat`
--
ALTER TABLE `tbl_chat`
  MODIFY `chat_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `country_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_gallary`
--
ALTER TABLE `tbl_gallary`
  MODIFY `gallary_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_guide`
--
ALTER TABLE `tbl_guide`
  MODIFY `guide_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `package_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_packagebookingbody`
--
ALTER TABLE `tbl_packagebookingbody`
  MODIFY `booking_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_packagebookinghead`
--
ALTER TABLE `tbl_packagebookinghead`
  MODIFY `packagebooking_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_package_location`
--
ALTER TABLE `tbl_package_location`
  MODIFY `location_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_ticketbookingbody`
--
ALTER TABLE `tbl_ticketbookingbody`
  MODIFY `body_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ticketbookinghead`
--
ALTER TABLE `tbl_ticketbookinghead`
  MODIFY `head_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_tickettype`
--
ALTER TABLE `tbl_tickettype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
