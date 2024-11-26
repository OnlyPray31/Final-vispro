-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 12:49 PM
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
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `username_admin` varchar(5) NOT NULL,
  `pass_admin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`username_admin`, `pass_admin`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_books`
--

CREATE TABLE `tbl_books` (
  `id_book` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `book_publication` varchar(255) NOT NULL,
  `book_price` decimal(10,0) NOT NULL,
  `book_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_books`
--

INSERT INTO `tbl_books` (`id_book`, `book_name`, `author_name`, `book_publication`, `book_price`, `book_quantity`) VALUES
(9, 'Computer Science', 'Tesla', '2000', 50000, 11),
(12, 'Alkitab', 'Bible Association', '2020', 100000, 6),
(13, 'Spongebob Squarepants', 'Nickelodeon', '2002', 100000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_borrowstatus`
--

CREATE TABLE `tbl_borrowstatus` (
  `id_borrow` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `reporting` text DEFAULT NULL,
  `borrow_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_borrowstatus`
--

INSERT INTO `tbl_borrowstatus` (`id_borrow`, `student_id`, `book_id`, `reporting`, `borrow_time`) VALUES
(5, 2, 9, 'Returned', '2024-11-20 19:36:26'),
(6, 3, 12, 'Returned', '2024-11-20 19:38:18'),
(7, 4, 13, 'Returned', '2024-11-20 19:41:32'),
(8, 4, 12, 'Returned', '2024-11-20 19:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `id_student` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `student_semester` varchar(50) NOT NULL,
  `student_contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`id_student`, `student_name`, `faculty`, `student_semester`, `student_contact`) VALUES
(1, 'Sayur Sawi', 'Perkebunan', '5', '081234567890'),
(2, 'Joonsho', 'Filkom', '7', '086479132585'),
(3, 'Apin', 'Filsafat', '7', '089764312585'),
(4, 'Zaki Kurniawan', 'Animasi', '5', '083515759584');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD PRIMARY KEY (`id_book`);

--
-- Indexes for table `tbl_borrowstatus`
--
ALTER TABLE `tbl_borrowstatus`
  ADD PRIMARY KEY (`id_borrow`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`id_student`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_books`
--
ALTER TABLE `tbl_books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_borrowstatus`
--
ALTER TABLE `tbl_borrowstatus`
  MODIFY `id_borrow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_borrowstatus`
--
ALTER TABLE `tbl_borrowstatus`
  ADD CONSTRAINT `tbl_borrowstatus_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_students` (`id_student`),
  ADD CONSTRAINT `tbl_borrowstatus_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `tbl_books` (`id_book`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
