-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 09:07 PM
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
-- Database: `conference_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `conference_participant`
--

CREATE TABLE `conference_participant` (
  `Pid` int(11) NOT NULL,
  `Pssn` varchar(10) DEFAULT NULL,
  `Pfname` varchar(50) DEFAULT NULL,
  `Plname` varchar(50) DEFAULT NULL,
  `Pbod` date DEFAULT NULL,
  `P_porject_name` varchar(100) DEFAULT NULL,
  `Psex` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conference_participant`
--

INSERT INTO `conference_participant` (`Pid`, `Pssn`, `Pfname`, `Plname`, `Pbod`, `P_porject_name`, `Psex`) VALUES
(1, '123456789', 'John', 'Doe', '1990-01-15', 'ProjectA', 'M'),
(2, '987654321', 'Jane', 'Smith', '1985-05-20', 'ProjectB', 'F'),
(3, '111223344', 'Bob', 'Johnson', '1992-11-03', 'ProjectC', 'M'),
(4, '123456789', 'علي', 'أحمد', '1988-03-25', 'ورشة تطوير الويب', 'M'),
(5, '987654321', 'فاطمة', 'خليل', '1990-07-12', 'ندوة علوم البيانات', 'F'),
(6, '111223344', 'محمد', 'عبدالله', '1985-11-18', 'مؤتمر التعلم الآلي', 'M'),
(7, '555666777', 'نور', 'الحسين', '1992-05-03', 'ندوة البلوكتشين', 'F'),
(8, '777888999', 'يوسف', 'خالد', '1995-08-20', 'ورشة تطبيقات الذكاء الاصطناعي', 'M'),
(9, '444555666', 'ريم', 'علي', '1989-12-01', 'ندوة الأمن السيبراني', 'F'),
(10, '666777888', 'أحمد', 'حسن', '1993-06-15', 'ورشة تقنيات تطوير البرمجيات', 'M'),
(11, '222333444', 'هالة', 'صلاح', '1987-04-09', 'ندوة تقنيات الواقع الافتراضي', 'F'),
(12, '888999000', 'سامر', 'أمين', '1991-09-27', 'مؤتمر الذكاء الاصطناعي', 'M'),
(13, '123123123', 'لمى', 'عبدالرحمن', '1986-02-14', 'ورشة تطوير التطبيقات الجوالة', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `conf_admin`
--

CREATE TABLE `conf_admin` (
  `Aid` int(11) NOT NULL,
  `Auname` varchar(255) NOT NULL,
  `Apassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conf_admin`
--

INSERT INTO `conf_admin` (`Aid`, `Auname`, `Apassword`) VALUES
(1, 'admin1', 'adminpass1'),
(2, 'admin2', 'adminpass2'),
(3, 'admin3', 'adminpass3'),
(4, 'admin_conf1', 'adminpass123'),
(5, 'admin_conf2', 'confadminpass456'),
(6, 'admin_conf3', 'secureadmin789'),
(7, 'admin_conf4', 'adminpass456'),
(8, 'admin_conf5', 'confadminpass789'),
(9, 'admin_conf6', 'secureadmin123'),
(10, 'admin_conf7', 'adminpass789'),
(11, 'admin_conf8', 'confadminpass123'),
(12, 'admin_conf9', 'secureadmin456'),
(13, 'admin_conf10', 'adminpass789');

-- --------------------------------------------------------

--
-- Table structure for table `participant_username`
--

CREATE TABLE `participant_username` (
  `PID` int(11) NOT NULL,
  `Pemail` varchar(255) NOT NULL,
  `Ppassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participant_username`
--

INSERT INTO `participant_username` (`PID`, `Pemail`, `Ppassword`) VALUES
(1, 'john@example.com', 'password123'),
(2, 'jane@example.com', 'securepass'),
(3, 'bob@example.com', 'pass1234'),
(4, 'ali@gmail.com', 'securepass123'),
(5, 'fatima@gmail.com', 'password456'),
(6, 'mohammed@gmail.com', 'strongpass789'),
(7, 'nour@gmail.com', 'myp@ssw0rd'),
(8, 'yousef@gmail.com', 'securepass789'),
(9, 'reem@gmail.com', 'mypassword'),
(10, 'ahmed@gmail.com', 'pass1234'),
(11, 'hala@gmail.com', 'securepass789'),
(12, 'samer@gmail.com', 'myp@ssword'),
(13, 'lama@gmail.com', 'pass123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conference_participant`
--
ALTER TABLE `conference_participant`
  ADD PRIMARY KEY (`Pid`);

--
-- Indexes for table `conf_admin`
--
ALTER TABLE `conf_admin`
  ADD PRIMARY KEY (`Aid`),
  ADD UNIQUE KEY `Auname` (`Auname`);

--
-- Indexes for table `participant_username`
--
ALTER TABLE `participant_username`
  ADD PRIMARY KEY (`PID`),
  ADD UNIQUE KEY `Pemail` (`Pemail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conference_participant`
--
ALTER TABLE `conference_participant`
  MODIFY `Pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `conf_admin`
--
ALTER TABLE `conf_admin`
  MODIFY `Aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `participant_username`
--
ALTER TABLE `participant_username`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
