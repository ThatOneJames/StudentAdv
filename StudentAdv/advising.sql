-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 07:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advising`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `employeeid` int(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`firstname`, `middlename`, `lastname`, `employeeid`, `password`) VALUES
('JOHN RUSSEL', 'CREDITO', 'SEGADOR', 1, 'hi'),
('James Francis', 'jay', 'De Ocampo', 2021105770, '1234'),
('1', '22', '1', 1, '1'),
('1', '1', '1', 1, '1'),
('3', '3', '3', 3, '3');

-- --------------------------------------------------------

--
-- Table structure for table `adviser`
--

CREATE TABLE `adviser` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `program` varchar(10) NOT NULL,
  `studentno` int(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adviser`
--

INSERT INTO `adviser` (`id`, `firstname`, `middlename`, `lastname`, `program`, `studentno`, `password`) VALUES
(1, 'JOHN RUSSEL', 'CREDITO', 'SEGADOR', 'IT', 1, 'hi'),
(3, 'James Francis', 'Bravo', 'De Ocampo', 'IT', 2021105769, '1234'),
(4, '1', '1', '1', '1', 1, '1'),
(6, '2', '2', '2', '2', 2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `date_posted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `image_path`, `date_posted`) VALUES
(8, 'Faculty Evaluation', 'our voice matters! Help us improve our faculty’s teaching quality by participating in the 𝑸𝒖𝒂𝒓𝒕𝒆𝒓𝒍𝒚 𝑭𝒂𝒄𝒖𝒍𝒕𝒚 𝑬𝒗𝒂𝒍𝒖𝒂𝒕𝒊𝒐𝒏 𝒃𝒚 𝑺𝒕𝒖𝒅𝒆𝒏𝒕𝒔. Your feedback is important to us. 📣', 'sample2.jpg', '2023-10-28 10:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `spec` text NOT NULL,
  `pref_day` varchar(20) NOT NULL,
  `pref_time` time NOT NULL,
  `pref_mentor` varchar(50) NOT NULL,
  `accepted` tinyint(1) DEFAULT 0,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`id`, `name`, `email`, `phone`, `spec`, `pref_day`, `pref_time`, `pref_mentor`, `accepted`, `status`) VALUES
(9, 'James Francis De Ocampo', 'place@gmail.com', '09952358643', 'IT', 'wed', '10:30:00', 'John Russel', 0, 'Accepted'),
(15, '2', '2', '2', '2', 'thu', '05:30:00', '', 0, 'Accepted'),
(16, '3', '3', '3', '3', 'thu', '17:30:00', '3', 0, 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adviser`
--
ALTER TABLE `adviser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adviser`
--
ALTER TABLE `adviser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
