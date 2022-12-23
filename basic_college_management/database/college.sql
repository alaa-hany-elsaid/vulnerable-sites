-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 08:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `id`, `username`, `password`, `email`, `phone`, `is_admin`) VALUES
('Alaa Hani', 1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@email.eml', ' (239) 816-9029 ', 1),
('Ahmed Hamedo', 2, 'ahmed', '1698c2bea6c8000723d5bb70363a8352d846917e', 'ahmed@email.eml', ' (239) 832-2321 ', 1),
('Ahmed Arafa', 3, 'arafa', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'arafa@email.eml', ' (239) 816-4312', 0);
('Ahmed Arafa', 4, 'stu1', 'b0f3617b08d7696999e8fb2ea5b02f31d7d5e4a4', 'arafa@email.eml', ' (239) 816-4312', 0);
-- --------------------------------------------------------


CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `doc_id` int(11) NOT NULL,
  `course_code` text NOT NULL,
  `course_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `doc_id`, `course_code`, `course_img`) VALUES
(1, 'computer Arch', 1, 'cs322', 'images/logo2.png'),
(2, 'complier', 2, 'cs419', '');

-- --------------------------------------------------------

--
-- Table structure for table `course_comment`
--

CREATE TABLE `course_comment` (
  `course_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_comment`
--

INSERT INTO `course_comment` (`course_id`, `stu_id`, `comment`) VALUES
(1, 3, '<script>alert(\"hello from comment\");</script>'),
(1, 2, 'this is awso course');

-- --------------------------------------------------------

--
-- Table structure for table `doctores`
--


CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `std_sup`
--

CREATE TABLE `std_sup` (
  `stu_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `stu_name` varchar(100) NOT NULL,
  `stu_mail` varchar(150) NOT NULL,
  `stu_address` text NOT NULL,
  `stu_phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `stu_name`, `stu_mail`, `stu_address`, `stu_phone`) VALUES
(1, 'mrt', 'mrt@gmail', 'no address', '010015698'),
(2, 'admin', 'o@gm.com', '<script>alert(1);</script>', '01120075620'),
(3, 'mohamed', 'mo@gd.com', '<script>alert(1);</script>', 'ramadan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `dok_id` (`doc_id`);
--
-- Indexes for table `course_comment`
--
ALTER TABLE `course_comment`
  ADD KEY `course_id` (`course_id`),
  ADD KEY `fk_student_id` (`stu_id`);

--
--
-- Indexes for table `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `std_sup`
--
ALTER TABLE `std_sup`
  ADD KEY `fk_std_id` (`stu_id`),
  ADD KEY `fk_corse_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stu_phone` (`stu_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `dok_id` FOREIGN KEY (`doc_id`) REFERENCES `doctores` (`id`);

--
-- Constraints for table `std_sup`
--
ALTER TABLE `std_sup`
  ADD CONSTRAINT `fk_corse_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `fk_std_id` FOREIGN KEY (`stu_id`) REFERENCES `students` (`id`);
COMMIT;
--
-- Constraints for table `course_comment`
--
ALTER TABLE `course_comment`
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `fk_student_id` FOREIGN KEY (`stu_id`) REFERENCES `students` (`id`);

--
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
