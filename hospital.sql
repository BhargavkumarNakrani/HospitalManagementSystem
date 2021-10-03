-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2021 at 12:02 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(16) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `role`) VALUES
(1, 'rthummar@gmail.com', '123456', 'PATIENT'),
(2, 'k@gmail.com', '123456', 'DOCTOR'),
(4, 'b@gmail.com', '123456', 'DOCTOR'),
(5, 'p@gmail.com', '123456', 'DOCTOR'),
(6, 'j@gmail.com', '123456', 'PATIENT'),
(7, 'm@gmail.com', '123456', 'PATIENT'),
(10, 'admin@gmail.com', '123456', 'ADMIN'),
(11, 'c@gmail.com', '123456', 'DOCTOR'),
(12, 'hitesh@gmail.com', '123456', 'DOCTOR');

-- --------------------------------------------------------

--
-- Table structure for table `apoinments`
--

CREATE TABLE `apoinments` (
  `id` int(5) NOT NULL,
  `patient_id` int(5) DEFAULT NULL,
  `doctor_id` int(5) DEFAULT NULL,
  `apndate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apoinments`
--

INSERT INTO `apoinments` (`id`, `patient_id`, `doctor_id`, `apndate`) VALUES
(1, 2, 2, '2002-02-11 00:00:00'),
(2, 1, 3, '2021-09-05 00:00:00'),
(3, 1, 1, '2002-02-11 00:00:00'),
(9, 1, 2, '2100-01-02 13:02:00'),
(10, 1, 10, '2021-08-08 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(5) NOT NULL,
  `dname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint(10) NOT NULL,
  `specialization` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `dname`, `email`, `contact`, `specialization`) VALUES
(1, 'Mukeshbhai Hirapara', 'mhirapara@gmail.com', 7894561231, 'surgeon'),
(2, 'Hiteshbhai', 'hitesh@gmail.com', 7894561231, 'fizician'),
(3, 'Sureshbhai', 'suresh@gmail.com', 7894561231, 'Dentist'),
(4, 'Miteshbhai Rajani', 'm@gmail.com', 7894561231, 'Brain surgery'),
(5, 'kanubhai', 'k@gmail.com', 7894561231, 'Plastic surgery'),
(6, 'Bhargav Nakarani', 'b@gmail.com', 8569569656, 'Brain surgery'),
(8, 'Jayeshbhai Sojitra', 'j@gmail.com', 9656565623, 'Cancer treatment'),
(9, 'Jayeshbhai Sojitra', 'j@gmail.com', 9656565623, 'Cancer treatment'),
(10, 'Chiragbhai Malani', 'c@gmail.com', 8565656523, 'Plastic surgery');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact_no` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `email`, `contact_no`) VALUES
(1, 'Rahul Thummar', 'rthummar@gmail.com', '815945793'),
(2, 'Ketan Surani', 'ketansurani@gmail.com', '789456121'),
(3, 'Rahul', 'r@gmail.com', '7894561231'),
(4, 'Bhargav Nakarani', 'b@gmail.com', '7458965623');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(5) NOT NULL,
  `patient_id` int(5) NOT NULL,
  `doctor_id` int(5) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `hname` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `medicine1` varchar(25) DEFAULT NULL,
  `medicine2` varchar(25) DEFAULT NULL,
  `medicine3` varchar(25) DEFAULT NULL,
  `medicine4` varchar(25) DEFAULT NULL,
  `medicine5` varchar(25) DEFAULT NULL,
  `plocality` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `patient_id`, `doctor_id`, `disease`, `hname`, `date`, `medicine1`, `medicine2`, `medicine3`, `medicine4`, `medicine5`, `plocality`) VALUES
(1, 2, 3, 'cavities', 'Doshi Hospital', '2002-02-11 00:00:00', 'paracitamol', 'dexona', NULL, NULL, NULL, 'rajkot'),
(2, 1, 1, 'Thyroid Disorders', 'Doshi Hospital', '2002-02-11 00:00:00', 'paracitamol', 'diltiazem ER', NULL, NULL, NULL, 'rajkot'),
(3, 1, 5, 'Cancer', 'Shree Hospital', '2021-09-23 00:00:00', 'ghyhjjk', 'jhjjjjjk', 'jkkkjkjk', 'joliklkikj', 'oujokkku', 'surat'),
(4, 4, 5, 'Cancer', 'Shree Hospital', '2021-09-23 00:00:00', 'kjhj', 'hhsy', 'nsiijh', 'ijb', 'poki', 'surat'),
(10, 1, 5, 'edjcxnm ', 'njemfdcvjnm', '2021-09-24 00:00:00', 'emfdcx', 'wdsmkcx', 'wdskmx', 'kmedsx', 'kwmds', 'wkedms');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `apoinments`
--
ALTER TABLE `apoinments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_id` (`patient_id`),
  ADD KEY `fk_doctor_id` (`doctor_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `apoinments`
--
ALTER TABLE `apoinments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apoinments`
--
ALTER TABLE `apoinments`
  ADD CONSTRAINT `apoinments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `apoinments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
