-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 23, 2023 at 08:19 AM
-- Server version: 8.0.33
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elitmus`
--

-- --------------------------------------------------------

--
-- Table structure for table `game_stat`
--

CREATE TABLE `game_stat` (
  `id` int NOT NULL,
  `player_id` text NOT NULL,
  `question1` int DEFAULT NULL,
  `wrong1` int DEFAULT NULL,
  `question2` int DEFAULT NULL,
  `wrong2` int DEFAULT NULL,
  `question3` int DEFAULT NULL,
  `wrong3` int DEFAULT NULL,
  `question4` int DEFAULT NULL,
  `question5` int DEFAULT NULL,
  `wrong5` int DEFAULT NULL,
  `question7` int DEFAULT NULL,
  `wrong7` int DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  `stat` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `game_stat`
--

INSERT INTO `game_stat` (`id`, `player_id`, `question1`, `wrong1`, `question2`, `wrong2`, `question3`, `wrong3`, `question4`, `question5`, `wrong5`, `question7`, `wrong7`, `total_time`, `stat`) VALUES
(2, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(3, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(4, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(5, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(6, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(7, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(8, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(9, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(10, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(11, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(12, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(13, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(14, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(15, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(16, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(17, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(18, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(19, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(20, 'Sulabh@nepal', 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1),
(21, 'Sulabh@nepal', 18, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 1),
(22, 'Sulabh@nepal', 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(23, 'Sulabh@nepal', 9, 0, 34, 0, 48, 0, NULL, NULL, NULL, NULL, NULL, 82, 3),
(24, 'Sulabh@nepal', 11, 0, 7, 0, 35, 0, NULL, NULL, NULL, NULL, NULL, 42, 3),
(25, 'Sulabh@nepal', 99, 0, 5, 0, 104, 0, NULL, NULL, NULL, NULL, NULL, 109, 3),
(26, 'Sulabh@nepal', 16, 0, 7, 0, 33, 0, NULL, NULL, NULL, NULL, NULL, 40, 3),
(27, 'Sulabh@nepal', 13, 0, 10, 0, 23, 0, NULL, NULL, NULL, NULL, NULL, 33, 3),
(28, 'Sulabh@Nepal', 17, 0, 5, 0, 23, 0, NULL, NULL, NULL, NULL, NULL, 28, 3),
(29, 'Sulabh@nepal', 40, 0, 45, 0, 65, 0, NULL, NULL, NULL, NULL, NULL, 110, 3),
(30, 'hkj@hk', 9, 0, 6, 0, 15, 0, NULL, 69, 0, 30, 0, 103, 8),
(31, 'Sulabh@nepal', 32, 0, 9, 0, 38, 0, NULL, 40, 0, 106, 0, 148, -1),
(32, 'Sulabh@nepal', NULL, NULL, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 2),
(33, 'Sulabh@nepal', 23, 1, NULL, NULL, 23, 1, NULL, NULL, NULL, NULL, NULL, 65, -1),
(34, 'Sulabh@nepal', NULL, NULL, 16, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, -1),
(35, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, -1),
(36, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(37, 'Sulabh@nepal', 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, -1),
(38, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(39, 'Sulabh@nepal', NULL, NULL, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 2),
(40, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(41, 'Sulabh@nepal', NULL, NULL, 12, 0, 7, 0, NULL, NULL, NULL, NULL, NULL, 19, 3),
(42, 'Sulabh@nepal', 14, 0, 7, 0, 23, 0, NULL, 43, 1, 90, 0, 140, 8),
(43, 'Sulabh@nepal', 18, 0, 12, 0, 36, 0, NULL, 24, 0, 22, 0, 102, -1),
(44, 'Sulabh@nepal', 16, 0, 7, 0, 33, 0, NULL, 23, 0, 107, 0, 176, -1),
(45, 'Sulabh@nepal', 20, 1, 6, 0, 29, 1, NULL, NULL, NULL, NULL, NULL, 35, 3),
(46, 'Sulabh@nepal', 12, 0, 6, 0, 23, 0, 7, NULL, NULL, NULL, NULL, 30, 4),
(47, 'Sulabh@nepal', 8, 0, 10, 0, 13, 0, NULL, NULL, NULL, NULL, NULL, 23, 3),
(48, 'Sulabh@nepal', 13, 0, 5, 0, 19, 0, 24, NULL, NULL, NULL, NULL, 43, 4),
(49, 'nitish_pandey@kiit', 88, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, -1),
(50, 'nitish_pandey@kiit', 26, 0, 6, 0, 33, 0, 135, 21, 0, 215, 0, 239, 8),
(51, 'nitish_pandey@kiit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(52, 'nitish_pandey@kiit', 12, 0, 7, 0, 19, 0, 42, 21, 0, 96, 0, 119, 8),
(53, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(54, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(55, 'Sulabh@nepal', 8, 0, 12, 0, 18, 0, 23, 149, 0, NULL, NULL, 247, -1),
(56, 'Sulabh@nepal', 15, 0, 6, 0, 25, 0, 23, 24, 0, 79, 0, 106, 8),
(57, 'Sulabh@nepal', 10, 0, 6, 0, 16, 0, 49, NULL, NULL, NULL, NULL, 65, 4),
(58, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(59, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(60, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(61, 'Test1@user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(62, 'Test1@user', 16, 0, 6, 0, 25, 0, 33, 203, 4, NULL, NULL, 261, 5),
(63, 'Sulabh@nepal', 11, 0, 12, 0, 19, 0, 29, NULL, NULL, NULL, NULL, 48, 4),
(64, 'Sulabh@nepal', 10, 0, 8, 0, 17, 0, 68, 68, 0, 130, 0, 201, 8),
(65, 'Sulabh@nepal', 12, 0, 6, 0, 18, 0, 30, 27, 0, 80, 0, 115, -1),
(66, 'Sulabh@nepal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(67, 'Sulabh@nepal', 38, 0, 55, 0, 55, 0, 83, NULL, NULL, NULL, NULL, 138, 4),
(68, 'sachinyadav0278@gmail.com', 45, 1, 17, 0, 62, 1, 31, NULL, NULL, NULL, NULL, 93, 4),
(69, 'Sulabh@nepal', 475, 0, 46, 0, 496, 0, 68, 30, 0, NULL, NULL, 594, 5),
(70, 'hellosaphal@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(71, 'sachinyadav0278@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(72, 'hellosaphal@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(73, 'hellosaphal@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(74, 'hellosaphal@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(75, 'Sulabh@nepal', 11, 0, 29, 0, 19, 0, NULL, NULL, NULL, NULL, NULL, 48, 3),
(76, 'Sulabh@nepal', 27, 0, 10, 0, 40, 0, 61, 18, 0, 173, 1, 194, 8),
(77, 'nhgfytd@ujtuy', 16, 0, 8, 0, 29, 0, 93, 33, 0, 172, 0, 225, -1),
(78, 'nhgfytd@ujtuy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `isAdmin` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `name`, `isAdmin`) VALUES
('Apple', '$2b$10$nDdNwnRFMk1hK3DIYMERbONgEnMrjNMII9k7oaeNPZuL74RSzXoDW', 'Mango', 0),
('apple@mango', 'app', '0', 0),
('hellosaphal@gmai.com', '$2b$10$ZwMgYjd6rtrRSTv2NzV/1OoPCTWuNw18upKICg1wUYonPwNh5wJFy', 'saphal', 0),
('hkj@hk', 'app', 'Test User', 0),
('New@user', '$2b$10$vsFcsh6oM/nvjxxi9yfY/Ot3Qg2yx0/AOmhVxuiZ9ifk0d06x.twG', 'apple', 0),
('nhgfytd@ujtuy', '$2b$10$ruTVfZugmC2adHSumhEPje6Wo2afb1eM7sh8bQrm390402jx9mIRa', 'nhgfytd@ujtuy', 0),
('nitish_pandey@kiit', '$2b$10$I5w4s45ZevhDIi208RdVBuxg69PmoaMiZRTbmm6DXWxZhE..5/bwS', 'Nitish Pandey', 0),
('sachinyadav0278@gmail.com', '$2b$10$JrT/O3nlV2vg6N1SoVXWX.8gP07d8n/wEPzpAI9sjAHhrhODKnSU.', 'Sachin ', 0),
('Sulabh@nepal', '$2b$10$VOygrI4OJfj6lr0/E7V3C.x1UK.20aBBl0YDv7RjqDnSw0S3nPkQ2', 'Sulabh Nepal', 1),
('Test1@user', '$2b$10$rHVHq5SS447xZVCieGi8uulaEO/xRCVvNhA4svU07efCTryyQbUfm', 'apple', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game_stat`
--
ALTER TABLE `game_stat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`(60));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game_stat`
--
ALTER TABLE `game_stat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
