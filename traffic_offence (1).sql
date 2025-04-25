-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 04:42 PM
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
-- Database: `traffic_offence`
--

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE `challans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `police_id` int(11) NOT NULL,
  `offence_description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Unpaid',
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `challans`
--

INSERT INTO `challans` (`id`, `user_id`, `police_id`, `offence_description`, `amount`, `status`, `issue_date`) VALUES
(1, 1, 1, 'Wrong parking', 200.00, 'Paid', '2024-07-30 11:31:16'),
(2, 1, 1, 'Using mobile phone while driving', 200.00, 'Paid', '2024-07-30 15:15:55'),
(3, 1, 1, 'Signal jumping', 200.00, 'Paid', '2024-07-31 17:47:24'),
(5, 1, 1, 'No helmet', 300.00, 'Paid', '2024-08-04 07:58:53'),
(6, 1, 1, 'Wrong parking', 200.00, 'Paid', '2024-08-04 14:00:22'),
(7, 1, 1, 'No helmet', 200.00, 'Paid', '2024-08-08 11:28:45'),
(8, 1, 1, 'No helmet', 200.00, 'Paid', '2024-08-08 11:29:25'),
(9, 1, 1, 'Over-speeding', 200.00, 'Paid', '2024-08-13 08:48:54'),
(10, 5, 1, 'Wrong parking', 200.00, 'Paid', '2024-08-27 09:07:51'),
(11, 7, 1, 'Signal jumping', 200.00, 'Paid', '2024-08-27 11:11:27'),
(12, 9, 1, 'Wrong parking', 200.00, 'Paid', '2024-08-29 11:09:00'),
(13, 10, 1, 'No helmet', 200.00, 'Paid', '2024-09-21 03:57:04'),
(14, 9, 1, 'Wrong parking', 300.00, 'Paid', '2024-09-26 08:27:54'),
(15, 9, 1, 'Wrong parking', 300.00, 'Paid', '2024-09-26 08:34:39'),
(16, 9, 1, 'Wrong parking', 300.00, 'Paid', '2024-09-26 08:36:43'),
(17, 9, 1, 'Wrong parking', 300.00, 'Paid', '2024-09-26 08:55:10'),
(18, 9, 1, 'No helmet', 200.00, 'Paid', '2024-09-26 08:55:30'),
(19, 10, 1, 'Drunk driving', 500.00, 'Paid', '2024-09-28 03:01:11'),
(20, 9, 1, 'Using mobile phone while driving', 500.00, 'Paid', '2024-09-28 03:07:56'),
(21, 8, 1, 'No helmet', 200.00, 'Paid', '2024-09-28 03:10:42'),
(22, 11, 1, 'Over-speeding', 300.00, 'Paid', '2024-09-28 03:15:06'),
(23, 8, 1, 'Wrong parking', 200.00, 'Paid', '2024-09-28 13:40:56'),
(24, 9, 1, 'No helmet', 200.00, 'Paid', '2024-09-28 13:42:21'),
(25, 8, 1, 'Signal jumping', 300.00, 'Paid', '2024-10-15 17:13:29'),
(26, 9, 1, 'Signal jumping', 99999999.99, 'Paid', '2024-10-16 02:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `complaint_text` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `complaint_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offences`
--

CREATE TABLE `offences` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offences`
--

INSERT INTO `offences` (`id`, `description`) VALUES
(1, 'Over-speeding'),
(2, 'No helmet'),
(3, 'Drunk driving'),
(4, 'Signal jumping'),
(5, 'Wrong parking'),
(6, 'Using mobile phone while driving');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `challan_id` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `challan_id`, `payment_date`, `amount`) VALUES
(1, 5, '2024-08-04 13:58:25', 300.00),
(2, 1, '2024-08-08 05:59:24', 200.00),
(3, 6, '2024-08-08 06:07:28', 200.00),
(4, 7, '2024-08-08 08:00:00', 200.00),
(5, 8, '2024-08-13 05:20:45', 200.00),
(6, 9, '2024-08-13 05:22:09', 200.00),
(7, 10, '2024-08-27 05:38:29', 200.00),
(8, 11, '2024-08-27 07:42:03', 200.00),
(9, 12, '2024-09-26 04:51:42', 200.00),
(10, 14, '2024-09-26 04:58:32', 300.00),
(11, 15, '2024-09-26 05:33:20', 300.00),
(12, 16, '2024-09-26 05:33:53', 300.00),
(13, 17, '2024-09-26 05:34:41', 300.00),
(14, 18, '2024-09-26 05:38:17', 200.00),
(15, 13, '2024-09-27 23:33:38', 200.00),
(16, 20, '2024-09-27 23:38:42', 500.00),
(17, 21, '2024-09-27 23:41:19', 200.00),
(18, 22, '2024-09-27 23:45:58', 300.00),
(19, 19, '2024-09-28 03:12:05', 500.00),
(20, 24, '2024-09-28 10:39:31', 200.00),
(21, 23, '2024-10-15 13:42:32', 200.00),
(22, 25, '2024-10-15 14:18:29', 300.00),
(23, 26, '2025-03-05 11:19:30', 99999999.00);

-- --------------------------------------------------------

--
-- Table structure for table `super_admins`
--

CREATE TABLE `super_admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `super_admins`
--

INSERT INTO `super_admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'admin2', 'admin1234'),
(3, 'admin3', 'admin12345');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_police`
--

CREATE TABLE `traffic_police` (
  `id` int(11) NOT NULL,
  `police_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `traffic_police`
--

INSERT INTO `traffic_police` (`id`, `police_id`, `name`, `mobile_no`, `address`, `password`) VALUES
(1, '241001', 'Riddhesh Wagvekar', '1234567899', 'Parel, Mumbai', '$2y$10$x71hnK43l4rjCNfbArh7tO1tX.N5K3Dw14pRgeaGLC9zOeukb0R/e'),
(2, '241002', 'Shubham Dorkar', '1234567899', 'Sewri, Mumbai', '$2y$10$v/l6VCaXUFJrK8wNRasuhOJuR.R8Uo8mMLpIxfBzp565IGWlT5yFa'),
(4, '241004', 'Mufasa Khan', '7689543122', 'Thane, Mumbai', '$2y$10$hOm9W3/SAHCjV.8NZ6TFJenGLIN7v7.u2iBCG.bZILTmfHFEEpxJu'),
(5, '241005', 'Omkar Dhembre', '9892515811', 'Panvel, Mumbai', '$2y$10$lFDWLEiJgzUpNl0dtOGWJepJCR0o6UIe80hDQcOO6g.xu/VPMo1pG'),
(6, '201110', '1234', 'abcd', '1234', '$2y$10$2GAdaclKzENozx6FNy23hO/lhqxxowpqgcnh711WQ2fQxfimBrx4G');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `mobile_no`, `password`, `cpassword`, `token`) VALUES
(8, 'Om Adsul', 'cs2212221001@mdcollege.in', '9769625639', '$2y$10$T8zcaFqJoiLwzd7.n.TifuEYCiHA2eiKFHJCkBn24y.7gqQywREGO', '', ''),
(9, 'Yash Adsul', '21omadsul@gmail.com', '9876543212', '$2y$10$3e.IJqlfL81Uhc1e7woPyOtZ4O8hI29dpB.rTBB9d7Zi31HCSW6ii', '', 'f3a8befd455a79d8087832c0856c961f7a22c9ee6c026002e90b6db7652e3ecca2d6c9d1745920f4522d6af107ba051818f5'),
(10, 'Rushikesh Shingte', 'rushishingate0303@gmail.com', '7276030339', '$2y$10$pr7mMveXXtOLttTxoweUO.J90KEstWJFbZ86SjeTkNQZcUJcxYkXy', '', 'b8efe06f64fb5002708fd2667ad48d82c02a175a83dba7b413a495c9267b2e350c346c2956a8e01b61aca6f509cb727b8402'),
(11, 'Shreyas Savardekar', 'shreyassavardekar@gmail.com', '8454935114', '$2y$10$7XIl9N5OZexrsUlU.lE/reZoEh0x34Ntip8Xa9fpZ2.vYyOUPwRI2', '', '5d8a071591220ff23bb25fea7698bb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challans`
--
ALTER TABLE `challans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `police_id` (`police_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `offences`
--
ALTER TABLE `offences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challan_id` (`challan_id`);

--
-- Indexes for table `super_admins`
--
ALTER TABLE `super_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `traffic_police`
--
ALTER TABLE `traffic_police`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `police_id` (`police_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challans`
--
ALTER TABLE `challans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offences`
--
ALTER TABLE `offences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `super_admins`
--
ALTER TABLE `super_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `traffic_police`
--
ALTER TABLE `traffic_police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challans`
--
ALTER TABLE `challans`
  ADD CONSTRAINT `challans_ibfk_2` FOREIGN KEY (`police_id`) REFERENCES `traffic_police` (`id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`challan_id`) REFERENCES `challans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
