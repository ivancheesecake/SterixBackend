-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2017 at 09:47 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sterix`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_monitoring`
--

CREATE TABLE IF NOT EXISTS `area_monitoring` (
  `area_monitoring_ID` int(11) NOT NULL,
  `service_order_ID` int(10) NOT NULL,
  `client_location_area_ID` int(11) NOT NULL,
  `findings` text NOT NULL,
  `proposed_action` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area_monitoring`
--

INSERT INTO `area_monitoring` (`area_monitoring_ID`, `service_order_ID`, `client_location_area_ID`, `findings`, `proposed_action`, `timestamp`) VALUES
(11, 3, 2, '', '', '2017-08-18 03:32:46'),
(12, 3, 2, '', '', '2017-08-18 03:32:46'),
(13, 3, 2, '', '', '2017-08-18 03:32:46'),
(14, 3, 2, '', '', '2017-08-18 03:32:46'),
(15, 3, 2, '', '', '2017-08-18 03:32:46'),
(16, 3, 2, '', '', '2017-08-18 03:32:46'),
(17, 3, 2, '', '', '2017-08-18 03:32:46'),
(18, 3, 2, '', '', '2017-08-18 03:32:46'),
(19, 3, 2, '', '', '2017-08-18 03:32:46'),
(20, 3, 2, '', '', '2017-08-18 03:32:46'),
(21, 3, 2, '', '', '2017-08-18 03:32:46'),
(22, 3, 2, '', '', '2017-08-18 03:32:46'),
(23, 3, 2, '', '', '2017-08-18 03:32:46'),
(24, 3, 2, '', '', '2017-08-18 03:32:46'),
(25, 3, 2, '', '', '2017-08-18 03:32:46'),
(26, 3, 2, '', '', '2017-08-18 03:32:46'),
(27, 3, 2, '', '', '2017-08-18 03:32:46'),
(28, 3, 2, '', '', '2017-08-18 03:32:46'),
(29, 3, 2, '', '', '2017-08-18 03:32:46'),
(30, 3, 2, '', '', '2017-08-18 03:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `client_contract`
--

CREATE TABLE IF NOT EXISTS `client_contract` (
  `client_contract_ID` int(11) NOT NULL,
  `contract_description` text NOT NULL,
  `contract_file` varchar(200) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `client_ID` int(11) NOT NULL,
  `client_location_ID` int(11) DEFAULT NULL,
  `contract_status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contract`
--

INSERT INTO `client_contract` (`client_contract_ID`, `contract_description`, `contract_file`, `start_date`, `end_date`, `client_ID`, `client_location_ID`, `contract_status`) VALUES
(2, '', '[{"name":"Smith Micro_Registration_Card_8z11ehhm.pdf","usrName":"Smith Micro_Registration_Card.pdf","size":73110,"type":"application\\/pdf","searchStr":"Smith Micro_Registration_Card.pdf,!:sStrEnd"}]', '2017-01-01', '2018-01-01', 1, 1, 1),
(4, '', '', '2017-07-19', '2018-01-31', 2, 2, 0),
(5, 'asdasd', '', '2008-01-01', '2010-01-03', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_contract_involved_persons`
--

CREATE TABLE IF NOT EXISTS `client_contract_involved_persons` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `user_roles_ID` int(11) DEFAULT NULL,
  `client_contract_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contract_involved_persons`
--

INSERT INTO `client_contract_involved_persons` (`ID`, `user_ID`, `user_roles_ID`, `client_contract_ID`) VALUES
(1, 6, 3, 2),
(2, 5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `client_contract_services`
--

CREATE TABLE IF NOT EXISTS `client_contract_services` (
  `client_contract_services_ID` int(10) NOT NULL,
  `service_ID` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `client_contract_ID` int(11) NOT NULL,
  `client_location_area_ID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contract_services`
--

INSERT INTO `client_contract_services` (`client_contract_services_ID`, `service_ID`, `start_date`, `end_date`, `client_contract_ID`, `client_location_area_ID`) VALUES
(1, 1, '2017-01-01', '2018-01-01', 2, 1),
(2, 2, '2023-02-05', '2017-07-24', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `client_evaluation`
--

CREATE TABLE IF NOT EXISTS `client_evaluation` (
  `client_evaluation_ID` int(11) NOT NULL,
  `service_order_ID` int(10) NOT NULL,
  `client_evaluation_criteria_ID` int(10) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `user_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_evaluation_criteria`
--

CREATE TABLE IF NOT EXISTS `client_evaluation_criteria` (
  `client_evaluation_criteria_ID` int(11) NOT NULL,
  `client_evaluation_criteria_code` varchar(20) NOT NULL,
  `client_evaluation_criteria_name` varchar(200) NOT NULL,
  `client_evaluation_criteria_description` varchar(400) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_evaluation_criteria`
--

INSERT INTO `client_evaluation_criteria` (`client_evaluation_criteria_ID`, `client_evaluation_criteria_code`, `client_evaluation_criteria_name`, `client_evaluation_criteria_description`, `timestamp`) VALUES
(1, 'ROTCAS', 'Sterix personnel reported on time and completed the activity as scheduled.', '', '2017-07-16 03:42:12'),
(2, 'SRRASD', 'Sterix personnel submitted and reported the results of the IPM activity on the same day.', '', '2017-07-16 03:41:42'),
(3, 'CCOFSP', 'Sterix personnel complied with the Client''s operational and food safety policies.', '', '2017-07-16 03:43:41'),
(4, 'ASRCA', 'Sterix personnel accomplished the Service Report completely and accurately.', '', '2017-07-16 03:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `client_info`
--

CREATE TABLE IF NOT EXISTS `client_info` (
  `client_ID` int(10) NOT NULL,
  `client_code` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_description` varchar(200) NOT NULL,
  `permanent_address` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_info`
--

INSERT INTO `client_info` (`client_ID`, `client_code`, `client_name`, `client_description`, `permanent_address`) VALUES
(1, 'Nestle Phil', 'Nestle Philippines', 'Nestle international in the Philippines', 'cabuyao main office'),
(2, 'JB', 'Jollibee', 'Jollibee Foods Corporation', 'Makati City, Philippines'),
(4, 'Sterix', 'Sterix', 'Sterix', 'Sterix');

-- --------------------------------------------------------

--
-- Table structure for table `client_location_area_info`
--

CREATE TABLE IF NOT EXISTS `client_location_area_info` (
  `client_location_area_ID` int(10) NOT NULL,
  `client_location_area_code` varchar(50) NOT NULL,
  `client_location_area_name` varchar(50) NOT NULL,
  `client_location_area_description` varchar(200) NOT NULL,
  `client_location_ID` int(10) NOT NULL,
  `client_location_area_map` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_location_area_info`
--

INSERT INTO `client_location_area_info` (`client_location_area_ID`, `client_location_area_code`, `client_location_area_name`, `client_location_area_description`, `client_location_ID`, `client_location_area_map`) VALUES
(1, 'NC-K', '	Nestle Canlubang Kitchen', 'may lutuan', 1, '[{"name":"1ST FLOOR_ckcw0ajs.png","usrName":"1ST FLOOR.png","size":15777,"type":"image\\/png","searchStr":"1ST FLOOR.png,!:sStrEnd"}]'),
(2, 'NC-OP', 'Nestle Canlubang Outer Perimeter ', 'sa may labas lang', 1, '[{"name":"1ST FLOOR_r0wc2b42.png","usrName":"1ST FLOOR.png","size":15777,"type":"image\\/png","searchStr":"1ST FLOOR.png,!:sStrEnd"}]'),
(3, 'NC-Y', 'Nestle Canlubang Yard', 'sa may laruan ng bata', 1, '[{"name":"1ST FLOOR_ht6c9eu9.png","usrName":"1ST FLOOR.png","size":15777,"type":"image\\/png","searchStr":"1ST FLOOR.png,!:sStrEnd"}]'),
(4, 'NC-W1', 'Nestle Canlubang Warehouse 1', 'lalagyan ng Nido at Milo', 1, '[{"name":"1ST FLOOR_wmwqjakw.png","usrName":"1ST FLOOR.png","size":15777,"type":"image\\/png","searchStr":"1ST FLOOR.png,!:sStrEnd"}]'),
(5, 'JBLB Kitchen', 'Jollibee Los Baños Kitchen Area', '', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `client_location_info`
--

CREATE TABLE IF NOT EXISTS `client_location_info` (
  `client_location_ID` int(10) NOT NULL,
  `client_location_code` varchar(50) NOT NULL,
  `client_location_name` varchar(50) NOT NULL,
  `client_location_description` varchar(200) NOT NULL,
  `client_ID` int(10) NOT NULL,
  `location_address` varchar(400) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_location_info`
--

INSERT INTO `client_location_info` (`client_location_ID`, `client_location_code`, `client_location_name`, `client_location_description`, `client_ID`, `location_address`) VALUES
(1, 'NSC', 'Nesle Canlubang', 'sa canlubang liliko sa may bandang kanan ng intersection', 1, 'Barangay Ingay, Canlubang'),
(2, 'JBLB', 'Jolibee Los Banos', 'Jolibee Los Banos nasa junction', 2, 'junction, batong malake, los banos'),
(4, 'NSM', 'Nestle Muntinlupa', 'malapit sa bayanan', 1, 'Muntinlupa City');

-- --------------------------------------------------------

--
-- Table structure for table `device_activity`
--

CREATE TABLE IF NOT EXISTS `device_activity` (
  `device_activity_ID` int(10) NOT NULL,
  `device_activity_code` varchar(100) DEFAULT NULL,
  `device_activity_name` varchar(100) DEFAULT NULL,
  `device_activity_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_activity`
--

INSERT INTO `device_activity` (`device_activity_ID`, `device_activity_code`, `device_activity_name`, `device_activity_description`) VALUES
(1, 'C', 'Cleaned', NULL),
(2, 'B', 'Bait /Bulb Replaced', NULL),
(3, 'G', 'Glue Trap / Board Replaced', NULL),
(4, 'R', 'Device Replaced', NULL),
(5, 'L', 'Lure Replaced', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_condition`
--

CREATE TABLE IF NOT EXISTS `device_condition` (
  `Condition_ID` int(10) NOT NULL,
  `ConditionCode` varchar(100) DEFAULT NULL,
  `ConditionName` varchar(100) DEFAULT NULL,
  `Desciption` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_condition`
--

INSERT INTO `device_condition` (`Condition_ID`, `ConditionCode`, `ConditionName`, `Desciption`) VALUES
(1, 'D', 'Damaged', NULL),
(2, 'N', 'Needs Repair', NULL),
(3, 'L', 'Label Needs Replacement', NULL),
(4, 'C', 'Checklist Needs Replacement', NULL),
(5, 'X', 'Missing', NULL),
(6, 'G', 'Good Working Condition', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_deployment`
--

CREATE TABLE IF NOT EXISTS `device_deployment` (
  `device_deployment_ID` int(10) NOT NULL,
  `device_code` varchar(50) NOT NULL,
  `client_location_area_ID` int(10) NOT NULL,
  `date_deployed` date NOT NULL,
  `time_deployed` time NOT NULL,
  `client_ID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_deployment`
--

INSERT INTO `device_deployment` (`device_deployment_ID`, `device_code`, `client_location_area_ID`, `date_deployed`, `time_deployed`, `client_ID`) VALUES
(9, 'CTB001', 2, '2017-07-22', '00:00:00', 0),
(10, 'CTB002', 2, '2017-07-22', '00:00:00', 0),
(11, 'CTB003', 2, '2017-07-22', '00:00:00', 0),
(12, 'CTM001', 2, '2017-07-22', '00:00:00', 0),
(13, 'CTM002', 2, '2017-07-22', '00:00:00', 0),
(14, 'CTM003', 2, '2017-07-22', '00:00:00', 0),
(16, 'ILT1', 2, '2017-07-22', '00:00:00', 0),
(17, 'ILT2', 2, '2017-07-22', '00:00:00', 0),
(18, 'ILT3', 2, '2017-07-22', '00:00:00', 0),
(19, 'RBST2', 2, '2017-07-22', '00:00:00', 0),
(20, 'RBST3', 2, '2017-07-22', '00:00:00', 0),
(21, 'RBST1', 2, '2017-07-22', '00:00:00', 0),
(22, 'RBSP1', 2, '2017-07-22', '00:00:00', 0),
(23, 'RBSP3', 2, '2017-07-22', '00:00:00', 0),
(24, 'RBSP2', 2, '2017-07-22', '00:00:00', 0),
(25, 'PTHT1', 2, '2017-07-22', '00:00:00', 0),
(26, 'PTHT2', 2, '2017-07-22', '00:00:00', 0),
(27, 'PTHT3', 2, '2017-07-22', '00:00:00', 0),
(28, 'PTS2', 2, '2017-07-22', '00:00:00', 0),
(29, 'PTS3', 2, '2017-07-22', '00:00:00', 0),
(30, 'PTS1', 2, '2017-07-22', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `device_identificaiton`
--

CREATE TABLE IF NOT EXISTS `device_identificaiton` (
  `device_ID` int(11) NOT NULL,
  `device_type_ID` int(11) NOT NULL,
  `device_code` varchar(50) NOT NULL,
  `client_location_area_ID` int(11) NOT NULL,
  `date_deployed` date NOT NULL,
  `time_deployed` time NOT NULL,
  `user_ID` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_identificaiton`
--

INSERT INTO `device_identificaiton` (`device_ID`, `device_type_ID`, `device_code`, `client_location_area_ID`, `date_deployed`, `time_deployed`, `user_ID`, `timestamp`) VALUES
(1, 1, 'CTB001', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(2, 1, 'CTB002', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(3, 1, 'CTB003', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(4, 1, 'CTB004', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(5, 1, 'CTB005', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(6, 1, 'CTB006', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(7, 1, 'CTB007', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(8, 1, 'CTB008', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(9, 1, 'CTB009', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(10, 1, 'CTB010', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(11, 1, 'CTB011', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(12, 1, 'CTB012', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(13, 1, 'CTB013', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(14, 1, 'CTB014', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(15, 1, 'CTB015', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(16, 1, 'CTB016', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(17, 1, 'CTB017', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(18, 1, 'CTB018', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(19, 1, 'CTB019', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(20, 1, 'CTB020', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(21, 2, 'CTM001', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(22, 2, 'CTM002', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(23, 2, 'CTM003', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(24, 2, 'CTM004', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(25, 2, 'CTM005', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(26, 2, 'CTM006', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(27, 2, 'CTM007', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(28, 2, 'CTM008', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(29, 2, 'CTM009', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(30, 2, 'CTM010', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(31, 2, 'CTM011', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(32, 2, 'CTM012', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(33, 2, 'CTM013', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(34, 2, 'CTM014', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(35, 2, 'CTM015', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(36, 2, 'CTM016', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(37, 2, 'CTM017', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(38, 2, 'CTM018', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(39, 2, 'CTM019', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(40, 2, 'CTM020', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(41, 3, 'ILT1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(42, 3, 'ILT2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(43, 3, 'ILT3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(44, 3, 'ILT4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(45, 3, 'ILT5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(46, 3, 'ILT6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(47, 3, 'ILT7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(48, 3, 'ILT8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(49, 3, 'ILT9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(50, 3, 'ILT10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(51, 3, 'ILT11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(52, 3, 'ILT12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(53, 3, 'ILT13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(54, 3, 'ILT14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(55, 3, 'ILT15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(56, 3, 'ILT16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(57, 3, 'ILT17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(58, 3, 'ILT18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(59, 3, 'ILT19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(60, 3, 'ILT20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(61, 3, 'ILT21', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(62, 3, 'ILT22', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(63, 3, 'ILT23', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(64, 3, 'ILT24', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(65, 3, 'ILT25', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(66, 3, 'ILT26', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(67, 3, 'ILT27', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(68, 3, 'ILT28', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(69, 3, 'ILT29', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(70, 3, 'ILT30', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(71, 3, 'ILT31', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(72, 3, 'ILT32', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(73, 3, 'ILT33', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(74, 3, 'ILT34', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(75, 3, 'ILT35', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(76, 3, 'ILT36', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(77, 3, 'ILT37', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(78, 3, 'ILT38', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(79, 3, 'ILT39', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(80, 3, 'ILT40', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(81, 3, 'ILT41', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(82, 3, 'ILT42', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(83, 3, 'ILT43', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(84, 3, 'ILT44', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(85, 3, 'ILT45', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(86, 3, 'ILT46', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(87, 3, 'ILT47', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(88, 3, 'ILT48', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(89, 3, 'ILT49', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(90, 3, 'ILT50', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(91, 3, 'ILT51', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(92, 3, 'ILT52', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(93, 3, 'ILT53', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(94, 3, 'ILT54', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(95, 3, 'ILT55', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(96, 3, 'ILT56', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(97, 3, 'ILT57', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(98, 3, 'ILT58', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(99, 3, 'ILT59', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(100, 3, 'ILT60', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(101, 4, 'RBST1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(102, 4, 'RBST2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(103, 4, 'RBST3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(104, 4, 'RBST4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(105, 4, 'RBST5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(106, 4, 'RBST6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(107, 4, 'RBST7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(108, 4, 'RBST8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(109, 4, 'RBST9', 1, '2017-01-01', '13:01:00', 0, '2017-08-17 21:42:50'),
(110, 4, 'RBST10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(111, 4, 'RBST11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(112, 4, 'RBST12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(113, 4, 'RBST13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(114, 4, 'RBST14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(115, 4, 'RBST15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(116, 4, 'RBST16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(117, 4, 'RBST17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(118, 4, 'RBST18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(119, 4, 'RBST19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(120, 4, 'RBST201', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(121, 5, 'RBSP1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(122, 5, 'RBSP2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(123, 5, 'RBSP3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(124, 5, 'RBSP4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(125, 5, 'RBSP5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(126, 5, 'RBSP6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(127, 5, 'RBSP7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(128, 5, 'RBSP8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(129, 5, 'RBSP9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(130, 5, 'RBSP10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(131, 5, 'RBSP11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(132, 5, 'RBSP12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(133, 5, 'RBSP13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(134, 5, 'RBSP14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(135, 5, 'RBSP15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(136, 5, 'RBSP16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(137, 5, 'RBSP17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(138, 5, 'RBSP18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(139, 5, 'RBSP19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(140, 5, 'RBSP20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(141, 6, 'PTHT1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(142, 6, 'PTHT2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(143, 6, 'PTHT3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(144, 6, 'PTHT4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(145, 6, 'PTHT5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(146, 6, 'PTHT6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(147, 6, 'PTHT7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(148, 6, 'PTHT8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(149, 6, 'PTHT9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(150, 6, 'PTHT10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(151, 6, 'PTHT11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(152, 6, 'PTHT12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(153, 6, 'PTHT13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(154, 6, 'PTHT14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(155, 6, 'PTHT15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(156, 6, 'PTHT16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(157, 6, 'PTHT17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(158, 6, 'PTHT18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(159, 6, 'PTHT19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(160, 6, 'PTHT20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(161, 7, 'PTS1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(162, 7, 'PTS2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(163, 7, 'PTS3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(164, 7, 'PTS4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(165, 7, 'PTS5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(166, 7, 'PTS6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(167, 7, 'PTS7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(168, 7, 'PTS8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(169, 7, 'PTS9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(170, 7, 'PTS10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(171, 7, 'PTS11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(172, 7, 'PTS12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(173, 7, 'PTS13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(174, 7, 'PTS14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(175, 7, 'PTS15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(176, 7, 'PTS16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(177, 7, 'PTS17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(178, 7, 'PTS18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(179, 7, 'PTS19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(180, 7, 'PTS20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(181, 8, 'PTPP1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(182, 8, 'PTPP2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(183, 8, 'PTPP3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(184, 8, 'PTPP4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(185, 8, 'PTPP5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(186, 8, 'PTPP6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(187, 8, 'PTPP7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(188, 8, 'PTPP8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(189, 8, 'PTPP9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(190, 8, 'PTPP10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(191, 8, 'PTPP11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(192, 8, 'PTPP12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(193, 8, 'PTPP13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(194, 8, 'PTPP14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(195, 8, 'PTPP15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(196, 8, 'PTPP16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(197, 8, 'PTPP17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(198, 8, 'PTPP18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(199, 8, 'PTPP19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(200, 8, 'PTPP20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(201, 9, 'PTFT1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(202, 9, 'PTFT2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(203, 9, 'PTFT3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(204, 9, 'PTFT4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(205, 9, 'PTFT5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(206, 9, 'PTFT6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(207, 9, 'PTFT7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(208, 9, 'PTFT8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(209, 9, 'PTFT9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(210, 9, 'PTFT10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(211, 9, 'PTFT11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(212, 9, 'PTFT12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(213, 9, 'PTFT13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(214, 9, 'PTFT14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(215, 9, 'PTFT15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(216, 9, 'PTFT16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(217, 9, 'PTFT17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(218, 9, 'PTFT18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(219, 9, 'PTFT19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(220, 9, 'PTFT20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(221, 10, 'CAT1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(222, 10, 'CAT2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(223, 10, 'CAT3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(224, 10, 'CAT4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(225, 10, 'CAT5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(226, 10, 'CAT6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(227, 10, 'CAT7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(228, 10, 'CAT8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(229, 10, 'CAT9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(230, 10, 'CAT10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(231, 10, 'CAT11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(232, 10, 'CAT12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(233, 10, 'CAT13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(234, 10, 'CAT14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(235, 10, 'CAT15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(236, 10, 'CAT16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(237, 10, 'CAT17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(238, 10, 'CAT18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(239, 10, 'CAT19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(240, 10, 'CAT20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(241, 11, 'MosT1', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(242, 11, 'MosT2', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(243, 11, 'MosT3', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(244, 11, 'MosT4', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(245, 11, 'MosT5', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(246, 11, 'MosT6', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(247, 11, 'MosT7', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(248, 11, 'MosT8', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(249, 11, 'MosT9', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(250, 11, 'MosT10', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(251, 11, 'MosT11', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(252, 11, 'MosT12', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(253, 11, 'MosT13', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(254, 11, 'MosT14', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(255, 11, 'MosT15', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(256, 11, 'MosT16', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(257, 11, 'MosT17', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(258, 11, 'MosT18', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(259, 11, 'MosT19', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(260, 11, 'MosT20', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(267, 13, '53w512', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35'),
(268, 13, 'dasd12231', 0, '0000-00-00', '00:00:00', 0, '2017-08-12 23:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `device_monitoring`
--

CREATE TABLE IF NOT EXISTS `device_monitoring` (
  `device_monitoring_ID` int(11) NOT NULL,
  `service_order_ID` int(10) NOT NULL,
  `device_code` varchar(50) NOT NULL,
  `client_location_area_ID` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `device_condition_ID` int(10) NOT NULL,
  `activity_ID` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_monitoring`
--

INSERT INTO `device_monitoring` (`device_monitoring_ID`, `service_order_ID`, `device_code`, `client_location_area_ID`, `timestamp`, `device_condition_ID`, `activity_ID`) VALUES
(11, 3, 'PTHT2', 2, '2017-08-18 00:27:45', 6, 1),
(12, 3, 'RBSP1', 2, '2017-08-18 00:27:45', 6, 1),
(13, 3, 'RBST3', 2, '2017-08-18 00:27:45', 2, 1),
(14, 3, 'RBSP3', 2, '2017-08-18 00:27:45', 6, 1),
(15, 3, 'RBST2', 2, '2017-08-18 00:27:45', 2, 1),
(16, 3, 'RBST1', 2, '2017-08-18 00:27:45', 2, 1),
(17, 3, 'ILT3', 2, '2017-08-18 00:27:45', 2, 2),
(18, 3, 'ILT2', 2, '2017-08-18 00:27:45', 2, 2),
(19, 3, 'ILT1', 2, '2017-08-18 00:27:45', 2, 2),
(20, 3, 'CTM003', 2, '2017-08-18 00:27:45', 1, 4),
(21, 3, 'CTM002', 2, '2017-08-18 00:27:45', 1, 4),
(22, 3, 'CTM001', 2, '2017-08-18 00:27:45', 1, 4),
(23, 3, 'CTB003', 2, '2017-08-18 00:27:45', 6, 1),
(24, 3, 'CTB002', 2, '2017-08-18 00:27:45', 6, 1),
(25, 3, 'CTB001', 2, '2017-08-18 00:27:45', 6, 1),
(26, 3, 'PTS1', 2, '2017-08-18 00:27:45', 6, 1),
(27, 3, 'PTS3', 2, '2017-08-18 00:27:45', 6, 1),
(28, 3, 'PTS2', 2, '2017-08-18 00:27:45', 6, 1),
(29, 3, 'PTHT1', 2, '2017-08-18 00:27:45', 6, 1),
(30, 3, 'PTHT3', 2, '2017-08-18 00:27:45', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `device_monitoring_pest_found`
--

CREATE TABLE IF NOT EXISTS `device_monitoring_pest_found` (
  `device_monitoring_pest_found_ID` int(11) NOT NULL,
  `device_monitoring_ID` int(10) NOT NULL,
  `pest_ID` int(10) NOT NULL,
  `pest_name` varchar(50) NOT NULL,
  `number` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_monitoring_pest_found`
--

INSERT INTO `device_monitoring_pest_found` (`device_monitoring_pest_found_ID`, `device_monitoring_ID`, `pest_ID`, `pest_name`, `number`) VALUES
(1, 1, 1, 'CAT', 20),
(2, 2, 2, 'RAT', 33),
(3, 4, 3, 'NAD', 25),
(4, 5, 2, 'RAT', 45),
(5, 7, 1, 'CAT', 15),
(6, 1, 4, 'LEE', 10),
(7, 2, 5, 'NAD', 4),
(24, 11, 6, '', 1),
(25, 11, 7, '', 1),
(26, 11, 8, '', 2),
(29, 17, 7, '', 1),
(30, 17, 6, '', 2),
(31, 17, 8, '', 6),
(32, 17, 9, '', 1),
(33, 18, 4, '', 1),
(34, 18, 5, '', 2),
(35, 18, 6, '', 3),
(36, 19, 3, '', 1),
(37, 19, 7, '', 1),
(38, 19, 9, '', 1),
(39, 20, 11, '', 1),
(40, 21, 12, '', 1),
(41, 22, 10, '', 1),
(42, 23, 11, '', 1),
(43, 24, 11, '', 1),
(44, 25, 12, '', 1),
(45, 26, 6, '', 1),
(46, 26, 5, '', 1),
(47, 26, 6, '', 1),
(48, 28, 7, '', 1),
(49, 27, 4, '', 1),
(50, 29, 8, '', 1),
(51, 30, 9, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `device_monitoring_photos`
--

CREATE TABLE IF NOT EXISTS `device_monitoring_photos` (
  `device_monitoring_photo_ID` int(11) NOT NULL,
  `device_monitoring_ID` int(10) NOT NULL,
  `filename_link` varchar(400) NOT NULL,
  `remarks` varchar(400) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_monitoring_photos`
--

INSERT INTO `device_monitoring_photos` (`device_monitoring_photo_ID`, `device_monitoring_ID`, `filename_link`, `remarks`) VALUES
(1, 1, 'server/rat.jpg', 'big rat');

-- --------------------------------------------------------

--
-- Table structure for table `device_target_pest`
--

CREATE TABLE IF NOT EXISTS `device_target_pest` (
  `device_target_pest_ID` int(10) NOT NULL,
  `device_type_ID` int(10) NOT NULL,
  `pest_ID` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_target_pest`
--

INSERT INTO `device_target_pest` (`device_target_pest_ID`, `device_type_ID`, `pest_ID`) VALUES
(1, 1, 11),
(2, 1, 12),
(3, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `device_type`
--

CREATE TABLE IF NOT EXISTS `device_type` (
  `device_type_ID` int(11) NOT NULL,
  `device_type_code` varchar(50) NOT NULL,
  `device_type_name` varchar(50) NOT NULL,
  `device_type_description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_type`
--

INSERT INTO `device_type` (`device_type_ID`, `device_type_code`, `device_type_name`, `device_type_description`) VALUES
(1, 'CgTB', 'Cage Trap (Big)', ''),
(2, 'CgTM', 'Cage Trap (Mini)', ''),
(3, 'ILT', 'Insect Light Trap', ''),
(4, 'RBST', 'Rodent Bait Station (Tamper Proof)', 'activity monitoring'),
(5, 'RBSP', 'Rodent Bait Station (PVC)', 'activity monitoring'),
(6, 'PTH', 'Pheromone Trap (Hanging Type)', ''),
(7, 'PTS', 'Pheromone Trap (Serrico)', ''),
(8, 'PTP', 'Pheromone Trap (Pantry Patrol)', ''),
(9, 'PTF', 'Pheromone Trap (Floor Type)', ''),
(10, 'CT', 'Cat Trap', ''),
(11, 'MT', 'Mosquito Trap', ''),
(12, 'GT', 'Glue Trap', 'shet anlagket!'),
(13, '', 'Bird Scare', 'activity monitoring');

-- --------------------------------------------------------

--
-- Table structure for table `dummy4`
--

CREATE TABLE IF NOT EXISTS `dummy4` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dummy5`
--

CREATE TABLE IF NOT EXISTS `dummy5` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dummy6`
--

CREATE TABLE IF NOT EXISTS `dummy6` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dummy7`
--

CREATE TABLE IF NOT EXISTS `dummy7` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dummy8`
--

CREATE TABLE IF NOT EXISTS `dummy8` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dummy222`
--

CREATE TABLE IF NOT EXISTS `dummy222` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pest_area_threshold`
--

CREATE TABLE IF NOT EXISTS `pest_area_threshold` (
  `ID` int(11) NOT NULL,
  `client_location_area_ID` int(11) DEFAULT NULL,
  `pest_ID` int(11) DEFAULT NULL,
  `inspection_threshold` int(11) DEFAULT NULL,
  `monthly_threshold` int(11) NOT NULL,
  `effectivity` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pest_area_threshold`
--

INSERT INTO `pest_area_threshold` (`ID`, `client_location_area_ID`, `pest_ID`, `inspection_threshold`, `monthly_threshold`, `effectivity`) VALUES
(1, 1, 0, 3, 0, '2017-08-08'),
(2, 1, 17, 3, 0, '2017-07-04'),
(3, 1, 1, 5, 0, '0000-00-00'),
(4, 1, 2, 3, 0, '0000-00-00'),
(5, 1, 0, 1, 0, '0000-00-00'),
(6, 1, 5, 0, 0, '0000-00-00'),
(7, 1, 6, 2, 0, '0000-00-00'),
(8, 1, 7, 4, 0, '0000-00-00'),
(9, 1, 8, 2, 0, '0000-00-00'),
(10, 1, 9, 1, 0, '0000-00-00'),
(11, 1, 1, 2, 0, '0000-00-00'),
(12, 1, 3, 1, 0, '0000-00-00'),
(13, 1, 10, 1, 0, '0000-00-00'),
(14, 2, 0, 1, 0, '0000-00-00'),
(15, 2, 1, 2, 0, '0000-00-00'),
(16, 2, 2, 4, 0, '0000-00-00'),
(17, 2, 3, 5, 0, '0000-00-00'),
(18, 2, 4, 7, 0, '0000-00-00'),
(19, 2, 5, 0, 0, '0000-00-00'),
(20, 2, 6, 0, 0, '0000-00-00'),
(21, 2, 17, 5, 0, '0000-00-00'),
(22, 2, 16, 3, 0, '0000-00-00'),
(23, 2, 15, 3, 0, '0000-00-00'),
(24, 2, 14, 4, 0, '0000-00-00'),
(25, 2, 13, 4, 0, '0000-00-00'),
(26, 2, 12, 4, 0, '0000-00-00'),
(27, 2, 11, 5, 0, '0000-00-00'),
(28, 2, 10, 6, 0, '0000-00-00'),
(29, 2, 9, 7, 0, '0000-00-00'),
(31, 2, 7, 10, 0, '0000-00-00'),
(32, 2, 8, 10, 0, '0000-00-00'),
(33, 2, 18, 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `pest_found`
--

CREATE TABLE IF NOT EXISTS `pest_found` (
  `pest_found_ID` int(11) NOT NULL,
  `service_order_ID` int(11) NOT NULL,
  `device_monitoring_ID` int(10) NOT NULL,
  `service_order_area_ID` int(11) NOT NULL,
  `pest_ID` int(10) NOT NULL,
  `number` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pest_found`
--

INSERT INTO `pest_found` (`pest_found_ID`, `service_order_ID`, `device_monitoring_ID`, `service_order_area_ID`, `pest_ID`, `number`) VALUES
(1, 0, 1, 0, 1, 20),
(2, 0, 2, 0, 2, 33),
(3, 0, 4, 0, 3, 25),
(4, 0, 5, 0, 2, 45),
(5, 0, 7, 0, 1, 15),
(6, 0, 1, 0, 4, 10),
(7, 0, 2, 0, 5, 4),
(24, 0, 11, 0, 6, 1),
(25, 0, 11, 0, 7, 1),
(26, 0, 11, 0, 8, 2),
(29, 0, 17, 0, 7, 1),
(30, 0, 17, 0, 6, 2),
(31, 0, 17, 0, 8, 6),
(32, 0, 17, 0, 9, 1),
(33, 0, 18, 0, 4, 1),
(34, 0, 18, 0, 5, 2),
(35, 0, 18, 0, 6, 3),
(36, 0, 19, 0, 3, 1),
(37, 0, 19, 0, 7, 1),
(38, 0, 19, 0, 9, 1),
(39, 0, 20, 0, 11, 1),
(40, 0, 21, 0, 12, 1),
(41, 0, 22, 0, 10, 1),
(42, 0, 23, 0, 11, 1),
(43, 0, 24, 0, 11, 1),
(44, 0, 25, 0, 12, 1),
(45, 0, 26, 0, 6, 1),
(46, 0, 26, 0, 5, 1),
(47, 0, 26, 0, 6, 1),
(48, 0, 28, 0, 7, 1),
(49, 0, 27, 0, 4, 1),
(50, 0, 29, 0, 8, 1),
(51, 0, 30, 0, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pest_info`
--

CREATE TABLE IF NOT EXISTS `pest_info` (
  `pest_ID` int(10) NOT NULL,
  `pest_code` varchar(50) NOT NULL,
  `pest_name` varchar(50) NOT NULL,
  `pest_description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pest_info`
--

INSERT INTO `pest_info` (`pest_ID`, `pest_code`, `pest_name`, `pest_description`) VALUES
(0, 'AR', 'American Roach', 'Yung pag lumipad titili ka'),
(1, 'GR', 'German Roach', 'yung ang tigas magsalita'),
(2, 'Ant', 'Ant', 'langam to besh'),
(3, 'Mos', 'Mosquito', 'yung nabulong bago mangagat. pero di sila talaga nangangagat kse wala silang bibig, '),
(4, 'HF', 'House Fly', 'fly na home buddy'),
(5, 'BF', 'Blow Fly', 'fly na mahilig mag blow'),
(6, 'DF', 'Drain Fly', 'fly na hagardo verzosa. drain na drain na sha.'),
(7, 'PF', 'Phorid Fly', ''),
(8, 'FF', 'Fruit Fly', 'fly na yayamanin, prutas lang kinakain'),
(9, 'FM', 'Field Moth', ''),
(10, 'HM', 'House Mouse', ''),
(11, 'RR', 'Roof Rat', ''),
(12, 'NR', 'Norway Rat', ''),
(13, 'CB', 'Cigarette Beetle', ''),
(14, 'RFB', 'Red Flour Beetle', ''),
(15, 'Liz', 'Lizard', ''),
(16, 'Sp', 'Spider', ''),
(17, 'Bi', 'Bird', ''),
(18, 'Oth', 'Others', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_order`
--

CREATE TABLE IF NOT EXISTS `service_order` (
  `service_order_ID` int(10) NOT NULL,
  `service_type_ID` int(10) NOT NULL,
  `location_ID` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `user_ID` int(10) NOT NULL COMMENT 'user id ng technician na aasignan ng service order ',
  `service_order_status_type_ID` int(11) NOT NULL,
  `remarks` varchar(400) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order`
--

INSERT INTO `service_order` (`service_order_ID`, `service_type_ID`, `location_ID`, `start_date`, `start_time`, `end_date`, `end_time`, `user_ID`, `service_order_status_type_ID`, `remarks`) VALUES
(3, 1, 1, '2017-07-26', '00:00:00', '2017-07-26', '00:00:00', 5, 6, ''),
(4, 2, 1, '2017-07-23', '08:00:00', '2017-07-23', '23:45:00', 5, 5, ''),
(5, 1, 1, '2017-07-25', '08:00:00', '2017-07-25', '17:00:00', 5, 5, ''),
(6, 1, 1, '2017-07-24', '06:00:00', '2017-07-24', '15:00:00', 6, 0, ''),
(7, 1, 1, '2017-08-01', '02:00:00', '2017-08-03', '02:00:00', 12, 1, ''),
(8, 1, 2, '2017-09-01', '02:00:00', '2017-09-26', '02:00:00', 12, 1, ''),
(9, 1, 1, '2017-08-09', '04:00:00', '2017-08-31', '02:00:00', 12, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `service_order_area`
--

CREATE TABLE IF NOT EXISTS `service_order_area` (
  `service_order_area_ID` int(11) NOT NULL,
  `service_order_ID` int(11) NOT NULL,
  `client_location_area_ID` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_area`
--

INSERT INTO `service_order_area` (`service_order_area_ID`, `service_order_ID`, `client_location_area_ID`, `status`) VALUES
(1, 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_order_status`
--

CREATE TABLE IF NOT EXISTS `service_order_status` (
  `service_order_status_ID` int(10) NOT NULL,
  `service_order_ID` int(10) NOT NULL,
  `service_order_status_type_ID` int(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reason` varchar(200) DEFAULT NULL,
  `proposed_start_date` date DEFAULT NULL,
  `proposed_start_time` time DEFAULT NULL,
  `proposed_end_date` date DEFAULT NULL,
  `proposed_end_time` time DEFAULT NULL,
  `client authorized` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_status`
--

INSERT INTO `service_order_status` (`service_order_status_ID`, `service_order_ID`, `service_order_status_type_ID`, `timestamp`, `reason`, `proposed_start_date`, `proposed_start_time`, `proposed_end_date`, `proposed_end_time`, `client authorized`) VALUES
(4, 3, 2, '2017-07-22 08:53:39', 'ayoko lang', '2017-01-01', NULL, NULL, NULL, NULL),
(5, 3, 2, '2017-07-22 08:57:09', 'asdasdasdsad', '2017-01-02', NULL, NULL, NULL, NULL),
(6, 3, 2, '2017-07-22 08:58:55', '212', '0011-12-01', NULL, NULL, NULL, NULL),
(7, 3, 2, '2017-07-22 09:00:24', 'sadas', '0000-00-00', NULL, NULL, NULL, NULL),
(8, 3, 2, '2017-07-22 09:00:30', 'dsadasd', '0000-00-00', NULL, NULL, NULL, NULL),
(9, 0, 2, '2017-07-22 12:02:52', 'cancel', '0000-00-00', NULL, NULL, NULL, NULL),
(10, 0, 2, '2017-07-22 12:06:03', '', '0000-00-00', NULL, NULL, NULL, NULL),
(11, 3, 6, '2017-07-22 12:11:22', 'asdsad', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_order_status_type`
--

CREATE TABLE IF NOT EXISTS `service_order_status_type` (
  `service_order_status_type_ID` int(10) NOT NULL,
  `service_order_status_type_code` varchar(50) NOT NULL,
  `service_order_status_type_name` varchar(50) NOT NULL,
  `service_order_status_description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_status_type`
--

INSERT INTO `service_order_status_type` (`service_order_status_type_ID`, `service_order_status_type_code`, `service_order_status_type_name`, `service_order_status_description`) VALUES
(1, 'A', 'Accepted/In Progress', ''),
(2, 'R', 'Reschedule Requested', ''),
(3, 'C', 'Cancelled', ''),
(4, 'F', 'Finished', ''),
(5, 'P', 'Pending', 'not yet accepted'),
(6, 'CR', 'Cancellation Requested', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_order_task`
--

CREATE TABLE IF NOT EXISTS `service_order_task` (
  `ID` int(11) NOT NULL,
  `service_order_ID` varchar(50) DEFAULT NULL,
  `task` varchar(400) DEFAULT NULL,
  `target_start_time` time DEFAULT NULL,
  `target_end_time` time DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `actual_start_time` time DEFAULT NULL,
  `actual_end_time` time DEFAULT NULL,
  `finished` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_task`
--

INSERT INTO `service_order_task` (`ID`, `service_order_ID`, `task`, `target_start_time`, `target_end_time`, `status`, `actual_start_time`, `actual_end_time`, `finished`) VALUES
(1, '3', 'Log in guard house', '05:45:00', '06:00:00', '4', NULL, NULL, 0),
(2, '3', 'Preparation of needed materials', '06:00:00', '06:30:00', '4', NULL, NULL, 0),
(3, '3', 'Inspection of exterior areas', '06:30:00', '18:48:00', '4', NULL, NULL, 0),
(4, '3', 'Inspection of back area going to canteen', '06:48:00', '06:54:00', '4', NULL, NULL, 0),
(5, '3', 'Inspection and Monitoring At canteen Area and front area of the warehouse', '06:54:00', '07:08:00', '4', NULL, NULL, 0),
(6, '3', 'Cleaning, Inspection, and Updating of (replenishment of bait if needed) of Cage Traps # 1-18\nInspection and Montioring of  Loading Area, guard houase, Comfort  Rooms, Maintenance area, Battery Charging Area and BO Area', '07:08:00', '07:25:00', '4', NULL, NULL, 0),
(7, '3', 'Prepare Materials needed for Inspection of Glue traps (Rugs, Glue traps, White Board marker, etc)\n', '07:25:00', '07:30:00', '1', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE IF NOT EXISTS `service_type` (
  `service_type_ID` int(10) NOT NULL,
  `service_type_code` varchar(50) NOT NULL,
  `service_type_name` varchar(50) NOT NULL,
  `service_type_description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_ID`, `service_type_code`, `service_type_name`, `service_type_description`) VALUES
(1, 'M', 'Monitoring', 'Monitoring Services'),
(2, 'T', 'Treatment', 'Treatment services'),
(3, 'S', 'sales', 'xdfxdd');

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE IF NOT EXISTS `user_access` (
  `user_access_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `user_roles_ID` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`user_access_ID`, `user_ID`, `user_roles_ID`, `start_date`, `end_date`) VALUES
(1, 5, 1, '0000-00-00', '0000-00-00'),
(2, 6, 3, '2017-07-22', '2018-07-22'),
(4, 10, 1, '0000-00-00', '0000-00-00'),
(6, 12, 3, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_info`
--

CREATE TABLE IF NOT EXISTS `user_contact_info` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `contact_info_type_ID` int(11) DEFAULT NULL,
  `contact_details` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE IF NOT EXISTS `user_credentials` (
  `user_credentials_ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `user_ID` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`user_credentials_ID`, `username`, `password`, `salt`, `user_ID`) VALUES
(1, 'lee', 'lee', '', 1),
(2, 'nad', 'nad', '', 2),
(3, 'test', 'BnahFR4vzyOHvQaNs4dZi0BQOCkwYWU1ZTZiNjY2', '0ae5e6b666', 0),
(4, 'asda', 'TA+FKnH4bmSO7czR5WXLybSu24hiOWMxNTcxYjM3', 'b9c1571b37', 0),
(5, 'sad', '4gXBkgZ3o0nlastOUh/D/suoQwk0NjVlZTZkM2Fl', '465ee6d3ae', 0),
(6, '123', 'ypBHHObIhLFx23Qdij6sNp2+vZQ4ZjIzM2E0Nzdk', '8f233a477d', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `user_ID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(6) NOT NULL,
  `org_ID` int(11) NOT NULL,
  `user_pic` varchar(400) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `salt` varchar(80) NOT NULL,
  `email_add` varchar(200) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `permanent_add` varchar(400) DEFAULT NULL,
  `landline_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_ID`, `name`, `birthday`, `sex`, `org_ID`, `user_pic`, `username`, `password`, `salt`, `email_add`, `mobile_no`, `permanent_add`, `landline_no`) VALUES
(5, 'nad', '0000-00-00', 'M', 1, NULL, 'nad', 'bUjuMAI8Z7XffOd/GPUKcHbZShk5Mjc3NjAwZjBl', '9277600f0e', 'csnadabrera@gmail.com', '09159885955', '', '5361535'),
(6, 'May', '2017-01-01', 'F', 4, '[{"name":"may_8l5og6zs.jpg","usrName":"may.jpg","size":99696,"type":"image\\/jpeg","searchStr":"may.jpg,!:sStrEnd"}]', 'may', 'RXdaDBeoBNrXUqeb60d0hjTLV7A5Mjc3NjAwZjBl', '1asdf35567', 'may@gmail.com', '095748569854', '', '8425689'),
(10, 'admin fullname', '0000-00-00', 'M', 0, NULL, 'admin', 'LGckHlMbddxAlNslRvtL5CfnLvkwNDc0NzViZDVi', '047475bd5b', '1@1.com', '123', '', '123'),
(12, 'ivan', '2017-01-01', 'M', 0, NULL, 'ivan', 'N4b4HHuiQbRosotRHjG/keR5nBI0YmM4NmExNWUz', '4bc86a15e3', 'ivan@ivan.ivan', '12456', '121', 'aw12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_roles_ID` int(10) NOT NULL,
  `user_roles_code` varchar(50) NOT NULL,
  `user_roles_name` varchar(50) NOT NULL,
  `user_roles_description` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_roles_ID`, `user_roles_code`, `user_roles_name`, `user_roles_description`) VALUES
(1, 'SA', 'Sterix Administrator', 'Sterix Administrator '),
(2, 'CA', 'Client Company Administrator', 'Client Company Administrator'),
(3, 'ST', 'Sterix Technician', 'Sterix Technician');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_monitoring`
--
ALTER TABLE `area_monitoring`
  ADD PRIMARY KEY (`area_monitoring_ID`);

--
-- Indexes for table `client_contract`
--
ALTER TABLE `client_contract`
  ADD PRIMARY KEY (`client_contract_ID`);

--
-- Indexes for table `client_contract_involved_persons`
--
ALTER TABLE `client_contract_involved_persons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `client_contract_services`
--
ALTER TABLE `client_contract_services`
  ADD PRIMARY KEY (`client_contract_services_ID`);

--
-- Indexes for table `client_evaluation`
--
ALTER TABLE `client_evaluation`
  ADD PRIMARY KEY (`client_evaluation_ID`);

--
-- Indexes for table `client_evaluation_criteria`
--
ALTER TABLE `client_evaluation_criteria`
  ADD PRIMARY KEY (`client_evaluation_criteria_ID`);

--
-- Indexes for table `client_info`
--
ALTER TABLE `client_info`
  ADD PRIMARY KEY (`client_ID`);

--
-- Indexes for table `client_location_area_info`
--
ALTER TABLE `client_location_area_info`
  ADD PRIMARY KEY (`client_location_area_ID`),
  ADD KEY `client_location_ID` (`client_location_ID`);

--
-- Indexes for table `client_location_info`
--
ALTER TABLE `client_location_info`
  ADD PRIMARY KEY (`client_location_ID`),
  ADD KEY `client_ID` (`client_ID`);

--
-- Indexes for table `device_activity`
--
ALTER TABLE `device_activity`
  ADD PRIMARY KEY (`device_activity_ID`);

--
-- Indexes for table `device_condition`
--
ALTER TABLE `device_condition`
  ADD PRIMARY KEY (`Condition_ID`);

--
-- Indexes for table `device_deployment`
--
ALTER TABLE `device_deployment`
  ADD PRIMARY KEY (`device_deployment_ID`),
  ADD KEY `device_code` (`device_code`);

--
-- Indexes for table `device_identificaiton`
--
ALTER TABLE `device_identificaiton`
  ADD PRIMARY KEY (`device_ID`),
  ADD UNIQUE KEY `device_code` (`device_code`),
  ADD KEY `device_type_ID` (`device_type_ID`);

--
-- Indexes for table `device_monitoring`
--
ALTER TABLE `device_monitoring`
  ADD PRIMARY KEY (`device_monitoring_ID`);

--
-- Indexes for table `device_monitoring_pest_found`
--
ALTER TABLE `device_monitoring_pest_found`
  ADD PRIMARY KEY (`device_monitoring_pest_found_ID`);

--
-- Indexes for table `device_monitoring_photos`
--
ALTER TABLE `device_monitoring_photos`
  ADD PRIMARY KEY (`device_monitoring_photo_ID`);

--
-- Indexes for table `device_target_pest`
--
ALTER TABLE `device_target_pest`
  ADD PRIMARY KEY (`device_target_pest_ID`),
  ADD KEY `pest_ID` (`pest_ID`);

--
-- Indexes for table `device_type`
--
ALTER TABLE `device_type`
  ADD PRIMARY KEY (`device_type_ID`);

--
-- Indexes for table `dummy4`
--
ALTER TABLE `dummy4`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dummy5`
--
ALTER TABLE `dummy5`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dummy6`
--
ALTER TABLE `dummy6`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dummy7`
--
ALTER TABLE `dummy7`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dummy8`
--
ALTER TABLE `dummy8`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dummy222`
--
ALTER TABLE `dummy222`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pest_area_threshold`
--
ALTER TABLE `pest_area_threshold`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pest_found`
--
ALTER TABLE `pest_found`
  ADD PRIMARY KEY (`pest_found_ID`);

--
-- Indexes for table `pest_info`
--
ALTER TABLE `pest_info`
  ADD PRIMARY KEY (`pest_ID`);

--
-- Indexes for table `service_order`
--
ALTER TABLE `service_order`
  ADD PRIMARY KEY (`service_order_ID`);

--
-- Indexes for table `service_order_area`
--
ALTER TABLE `service_order_area`
  ADD PRIMARY KEY (`service_order_area_ID`);

--
-- Indexes for table `service_order_status`
--
ALTER TABLE `service_order_status`
  ADD PRIMARY KEY (`service_order_status_ID`);

--
-- Indexes for table `service_order_status_type`
--
ALTER TABLE `service_order_status_type`
  ADD PRIMARY KEY (`service_order_status_type_ID`);

--
-- Indexes for table `service_order_task`
--
ALTER TABLE `service_order_task`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_ID`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`user_access_ID`);

--
-- Indexes for table `user_contact_info`
--
ALTER TABLE `user_contact_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`user_credentials_ID`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_roles_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_monitoring`
--
ALTER TABLE `area_monitoring`
  MODIFY `area_monitoring_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `client_contract`
--
ALTER TABLE `client_contract`
  MODIFY `client_contract_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_contract_involved_persons`
--
ALTER TABLE `client_contract_involved_persons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client_contract_services`
--
ALTER TABLE `client_contract_services`
  MODIFY `client_contract_services_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client_evaluation`
--
ALTER TABLE `client_evaluation`
  MODIFY `client_evaluation_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_evaluation_criteria`
--
ALTER TABLE `client_evaluation_criteria`
  MODIFY `client_evaluation_criteria_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `client_info`
--
ALTER TABLE `client_info`
  MODIFY `client_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `client_location_area_info`
--
ALTER TABLE `client_location_area_info`
  MODIFY `client_location_area_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_location_info`
--
ALTER TABLE `client_location_info`
  MODIFY `client_location_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `device_deployment`
--
ALTER TABLE `device_deployment`
  MODIFY `device_deployment_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `device_identificaiton`
--
ALTER TABLE `device_identificaiton`
  MODIFY `device_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=269;
--
-- AUTO_INCREMENT for table `device_monitoring`
--
ALTER TABLE `device_monitoring`
  MODIFY `device_monitoring_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `device_monitoring_pest_found`
--
ALTER TABLE `device_monitoring_pest_found`
  MODIFY `device_monitoring_pest_found_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `device_monitoring_photos`
--
ALTER TABLE `device_monitoring_photos`
  MODIFY `device_monitoring_photo_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `device_target_pest`
--
ALTER TABLE `device_target_pest`
  MODIFY `device_target_pest_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `device_type`
--
ALTER TABLE `device_type`
  MODIFY `device_type_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dummy4`
--
ALTER TABLE `dummy4`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dummy5`
--
ALTER TABLE `dummy5`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dummy6`
--
ALTER TABLE `dummy6`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dummy7`
--
ALTER TABLE `dummy7`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dummy8`
--
ALTER TABLE `dummy8`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dummy222`
--
ALTER TABLE `dummy222`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pest_area_threshold`
--
ALTER TABLE `pest_area_threshold`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `pest_found`
--
ALTER TABLE `pest_found`
  MODIFY `pest_found_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `pest_info`
--
ALTER TABLE `pest_info`
  MODIFY `pest_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `service_order`
--
ALTER TABLE `service_order`
  MODIFY `service_order_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `service_order_area`
--
ALTER TABLE `service_order_area`
  MODIFY `service_order_area_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `service_order_status`
--
ALTER TABLE `service_order_status`
  MODIFY `service_order_status_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `service_order_status_type`
--
ALTER TABLE `service_order_status_type`
  MODIFY `service_order_status_type_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `service_order_task`
--
ALTER TABLE `service_order_task`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_type_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `user_access_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_contact_info`
--
ALTER TABLE `user_contact_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_credentials`
--
ALTER TABLE `user_credentials`
  MODIFY `user_credentials_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_roles_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_location_area_info`
--
ALTER TABLE `client_location_area_info`
  ADD CONSTRAINT `client_location_area_info_ibfk_1` FOREIGN KEY (`client_location_ID`) REFERENCES `client_location_info` (`client_location_ID`);

--
-- Constraints for table `client_location_info`
--
ALTER TABLE `client_location_info`
  ADD CONSTRAINT `client_location_info_ibfk_1` FOREIGN KEY (`client_ID`) REFERENCES `client_info` (`client_ID`),
  ADD CONSTRAINT `client_location_info_ibfk_2` FOREIGN KEY (`client_ID`) REFERENCES `client_info` (`client_ID`);

--
-- Constraints for table `device_deployment`
--
ALTER TABLE `device_deployment`
  ADD CONSTRAINT `device_deployment_ibfk_1` FOREIGN KEY (`device_code`) REFERENCES `device_identificaiton` (`device_code`);

--
-- Constraints for table `device_identificaiton`
--
ALTER TABLE `device_identificaiton`
  ADD CONSTRAINT `device_identificaiton_ibfk_1` FOREIGN KEY (`device_type_ID`) REFERENCES `device_type` (`device_type_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
