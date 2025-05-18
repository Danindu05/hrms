-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 18, 2025 at 02:57 PM
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
-- Database: `hrmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Leave') DEFAULT 'Absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`) VALUES
(1, 1, '2025-04-01', 'Present'),
(2, 1, '2025-04-02', 'Present'),
(3, 1, '2025-04-03', 'Present'),
(4, 1, '2025-04-04', 'Present'),
(5, 1, '2025-04-05', 'Present'),
(6, 1, '2025-04-08', 'Present'),
(7, 1, '2025-04-09', 'Present'),
(8, 1, '2025-04-10', 'Present'),
(9, 1, '2025-04-11', 'Present'),
(10, 1, '2025-04-12', 'Present'),
(11, 1, '2025-04-15', 'Present'),
(12, 1, '2025-04-16', 'Present'),
(13, 1, '2025-04-17', 'Present'),
(14, 1, '2025-04-18', 'Present'),
(15, 1, '2025-04-19', 'Present'),
(16, 1, '2025-04-22', 'Present'),
(17, 1, '2025-04-23', 'Present'),
(18, 1, '2025-04-24', 'Present'),
(19, 1, '2025-04-25', 'Present'),
(20, 1, '2025-04-26', 'Present'),
(21, 1, '2025-04-29', 'Present'),
(22, 1, '2025-04-30', 'Present'),
(23, 2, '2025-04-01', 'Present'),
(24, 2, '2025-04-02', 'Present'),
(25, 2, '2025-04-03', 'Present'),
(26, 2, '2025-04-04', 'Present'),
(27, 2, '2025-04-05', 'Present'),
(28, 2, '2025-04-08', 'Leave'),
(29, 2, '2025-04-09', 'Present'),
(30, 2, '2025-04-10', 'Present'),
(31, 2, '2025-04-11', 'Present'),
(32, 2, '2025-04-12', 'Present'),
(33, 2, '2025-04-15', 'Present'),
(34, 2, '2025-04-16', 'Present'),
(35, 2, '2025-04-17', 'Present'),
(36, 2, '2025-04-18', 'Present'),
(37, 2, '2025-04-19', 'Present'),
(38, 2, '2025-04-22', 'Present'),
(39, 2, '2025-04-23', 'Present'),
(40, 2, '2025-04-24', 'Present'),
(41, 2, '2025-04-25', 'Present'),
(42, 2, '2025-04-26', 'Present'),
(43, 2, '2025-04-29', 'Present'),
(44, 2, '2025-04-30', 'Present'),
(45, 3, '2025-04-01', 'Present'),
(46, 3, '2025-04-02', 'Present'),
(47, 3, '2025-04-03', 'Present'),
(48, 3, '2025-04-04', 'Present'),
(49, 3, '2025-04-05', 'Present'),
(50, 3, '2025-04-08', 'Present'),
(51, 3, '2025-04-09', 'Present'),
(52, 3, '2025-04-10', 'Present'),
(53, 3, '2025-04-11', 'Present'),
(54, 3, '2025-04-12', 'Present'),
(55, 3, '2025-04-15', 'Present'),
(56, 3, '2025-04-16', 'Present'),
(57, 3, '2025-04-17', 'Present'),
(58, 3, '2025-04-18', 'Present'),
(59, 3, '2025-04-19', 'Present'),
(60, 3, '2025-04-22', 'Present'),
(61, 3, '2025-04-23', 'Present'),
(62, 3, '2025-04-24', 'Present'),
(63, 3, '2025-04-25', 'Present'),
(64, 3, '2025-04-26', 'Present'),
(65, 3, '2025-04-29', 'Present'),
(66, 3, '2025-04-30', 'Present'),
(67, 4, '2025-04-01', 'Present'),
(68, 4, '2025-04-02', 'Present'),
(69, 4, '2025-04-03', 'Present'),
(70, 4, '2025-04-04', 'Present'),
(71, 4, '2025-04-05', 'Present'),
(72, 4, '2025-04-08', 'Present'),
(73, 4, '2025-04-09', 'Present'),
(74, 4, '2025-04-10', 'Present'),
(75, 4, '2025-04-11', 'Present'),
(76, 4, '2025-04-12', 'Present'),
(77, 4, '2025-04-15', 'Present'),
(78, 4, '2025-04-16', 'Present'),
(79, 4, '2025-04-17', 'Present'),
(80, 4, '2025-04-18', 'Present'),
(81, 4, '2025-04-19', 'Present'),
(82, 4, '2025-04-22', 'Present'),
(83, 4, '2025-04-23', 'Present'),
(84, 4, '2025-04-24', 'Present'),
(85, 4, '2025-04-25', 'Present'),
(86, 4, '2025-04-26', 'Present'),
(87, 4, '2025-04-29', 'Present'),
(88, 4, '2025-04-30', 'Present'),
(89, 5, '2025-04-01', 'Present'),
(90, 5, '2025-04-02', 'Present'),
(91, 5, '2025-04-03', 'Present'),
(92, 5, '2025-04-04', 'Present'),
(93, 5, '2025-04-05', 'Present'),
(94, 5, '2025-04-08', 'Present'),
(95, 5, '2025-04-09', 'Present'),
(96, 5, '2025-04-10', 'Present'),
(97, 5, '2025-04-11', 'Present'),
(98, 5, '2025-04-12', 'Present'),
(99, 5, '2025-04-15', 'Present'),
(100, 5, '2025-04-16', 'Present'),
(101, 5, '2025-04-17', 'Present'),
(102, 5, '2025-04-18', 'Present'),
(103, 5, '2025-04-19', 'Present'),
(104, 5, '2025-04-22', 'Present'),
(105, 5, '2025-04-23', 'Present'),
(106, 5, '2025-04-24', 'Present'),
(107, 5, '2025-04-25', 'Present'),
(108, 5, '2025-04-26', 'Present'),
(109, 5, '2025-04-29', 'Present'),
(110, 5, '2025-04-30', 'Present'),
(111, 6, '2025-04-01', 'Present'),
(112, 6, '2025-04-02', 'Present'),
(113, 6, '2025-04-03', 'Present'),
(114, 6, '2025-04-04', 'Present'),
(115, 6, '2025-04-05', 'Present'),
(116, 6, '2025-04-08', 'Present'),
(117, 6, '2025-04-09', 'Present'),
(118, 6, '2025-04-10', 'Present'),
(119, 6, '2025-04-11', 'Present'),
(120, 6, '2025-04-12', 'Present'),
(121, 6, '2025-04-15', 'Present'),
(122, 6, '2025-04-16', 'Present'),
(123, 6, '2025-04-17', 'Present'),
(124, 6, '2025-04-18', 'Present'),
(125, 6, '2025-04-19', 'Present'),
(126, 6, '2025-04-22', 'Present'),
(127, 6, '2025-04-23', 'Present'),
(128, 6, '2025-04-24', 'Present'),
(129, 6, '2025-04-25', 'Present'),
(130, 6, '2025-04-26', 'Present'),
(131, 6, '2025-04-29', 'Present'),
(132, 6, '2025-04-30', 'Present'),
(133, 7, '2025-04-01', 'Present'),
(134, 7, '2025-04-02', 'Present'),
(135, 7, '2025-04-03', 'Present'),
(136, 7, '2025-04-04', 'Present'),
(137, 7, '2025-04-05', 'Present'),
(138, 7, '2025-04-08', 'Present'),
(139, 7, '2025-04-09', 'Present'),
(140, 7, '2025-04-10', 'Present'),
(141, 7, '2025-04-11', 'Present'),
(142, 7, '2025-04-12', 'Present'),
(143, 7, '2025-04-15', 'Present'),
(144, 7, '2025-04-16', 'Present'),
(145, 7, '2025-04-17', 'Present'),
(146, 7, '2025-04-18', 'Present'),
(147, 7, '2025-04-19', 'Present'),
(148, 7, '2025-04-22', 'Present'),
(149, 7, '2025-04-23', 'Present'),
(150, 7, '2025-04-24', 'Present'),
(151, 7, '2025-04-25', 'Present'),
(152, 7, '2025-04-26', 'Present'),
(153, 7, '2025-04-29', 'Present'),
(154, 7, '2025-04-30', 'Present'),
(155, 8, '2025-04-01', 'Present'),
(156, 8, '2025-04-02', 'Present'),
(157, 8, '2025-04-03', 'Present'),
(158, 8, '2025-04-04', 'Present'),
(159, 8, '2025-04-05', 'Present'),
(160, 8, '2025-04-08', 'Present'),
(161, 8, '2025-04-09', 'Present'),
(162, 8, '2025-04-10', 'Present'),
(163, 8, '2025-04-11', 'Present'),
(164, 8, '2025-04-12', 'Present'),
(165, 8, '2025-04-15', 'Present'),
(166, 8, '2025-04-16', 'Present'),
(167, 8, '2025-04-17', 'Present'),
(168, 8, '2025-04-18', 'Present'),
(169, 8, '2025-04-19', 'Present'),
(170, 8, '2025-04-22', 'Present'),
(171, 8, '2025-04-23', 'Present'),
(172, 8, '2025-04-24', 'Present'),
(173, 8, '2025-04-25', 'Present'),
(174, 8, '2025-04-26', 'Present'),
(175, 8, '2025-04-29', 'Present'),
(176, 8, '2025-04-30', 'Present'),
(177, 9, '2025-04-01', 'Present'),
(178, 9, '2025-04-02', 'Present'),
(179, 9, '2025-04-03', 'Present'),
(180, 9, '2025-04-04', 'Present'),
(181, 9, '2025-04-05', 'Present'),
(182, 9, '2025-04-08', 'Present'),
(183, 9, '2025-04-09', 'Present'),
(184, 9, '2025-04-10', 'Present'),
(185, 9, '2025-04-11', 'Present'),
(186, 9, '2025-04-12', 'Present'),
(187, 9, '2025-04-15', 'Present'),
(188, 9, '2025-04-16', 'Present'),
(189, 9, '2025-04-17', 'Present'),
(190, 9, '2025-04-18', 'Present'),
(191, 9, '2025-04-19', 'Present'),
(192, 9, '2025-04-22', 'Absent'),
(193, 9, '2025-04-23', 'Present'),
(194, 9, '2025-04-24', 'Present'),
(195, 9, '2025-04-25', 'Present'),
(196, 9, '2025-04-26', 'Present'),
(197, 9, '2025-04-29', 'Present'),
(198, 9, '2025-04-30', 'Present'),
(199, 10, '2025-04-01', 'Present'),
(200, 10, '2025-04-02', 'Present'),
(201, 10, '2025-04-03', 'Present'),
(202, 10, '2025-04-04', 'Present'),
(203, 10, '2025-04-05', 'Present'),
(204, 10, '2025-04-08', 'Present'),
(205, 10, '2025-04-09', 'Present'),
(206, 10, '2025-04-10', 'Present'),
(207, 10, '2025-04-11', 'Present'),
(208, 10, '2025-04-12', 'Present'),
(209, 10, '2025-04-15', 'Present'),
(210, 10, '2025-04-16', 'Present'),
(211, 10, '2025-04-17', 'Present'),
(212, 10, '2025-04-18', 'Present'),
(213, 10, '2025-04-19', 'Present'),
(214, 10, '2025-04-22', 'Present'),
(215, 10, '2025-04-23', 'Present'),
(216, 10, '2025-04-24', 'Present'),
(217, 10, '2025-04-25', 'Present'),
(218, 10, '2025-04-26', 'Present'),
(219, 10, '2025-04-29', 'Present'),
(220, 10, '2025-04-30', 'Present'),
(221, 11, '2025-04-01', 'Leave'),
(222, 11, '2025-04-02', 'Present'),
(223, 11, '2025-04-03', 'Present'),
(224, 11, '2025-04-04', 'Present'),
(225, 11, '2025-04-05', 'Present'),
(226, 11, '2025-04-08', 'Present'),
(227, 11, '2025-04-09', 'Present'),
(228, 11, '2025-04-10', 'Present'),
(229, 11, '2025-04-11', 'Present'),
(230, 11, '2025-04-12', 'Present'),
(231, 11, '2025-04-15', 'Present'),
(232, 11, '2025-04-16', 'Present'),
(233, 11, '2025-04-17', 'Present'),
(234, 11, '2025-04-18', 'Present'),
(235, 11, '2025-04-19', 'Present'),
(236, 11, '2025-04-22', 'Present'),
(237, 11, '2025-04-23', 'Present'),
(238, 11, '2025-04-24', 'Present'),
(239, 11, '2025-04-25', 'Present'),
(240, 11, '2025-04-26', 'Present'),
(241, 11, '2025-04-29', 'Present'),
(242, 11, '2025-04-30', 'Present'),
(243, 12, '2025-04-01', 'Present'),
(244, 12, '2025-04-02', 'Present'),
(245, 12, '2025-04-03', 'Present'),
(246, 12, '2025-04-04', 'Present'),
(247, 12, '2025-04-05', 'Present'),
(248, 12, '2025-04-08', 'Present'),
(249, 12, '2025-04-09', 'Present'),
(250, 12, '2025-04-10', 'Present'),
(251, 12, '2025-04-11', 'Present'),
(252, 12, '2025-04-12', 'Present'),
(253, 12, '2025-04-15', 'Present'),
(254, 12, '2025-04-16', 'Present'),
(255, 12, '2025-04-17', 'Present'),
(256, 12, '2025-04-18', 'Present'),
(257, 12, '2025-04-19', 'Present'),
(258, 12, '2025-04-22', 'Present'),
(259, 12, '2025-04-23', 'Present'),
(260, 12, '2025-04-24', 'Present'),
(261, 12, '2025-04-25', 'Present'),
(262, 12, '2025-04-26', 'Present'),
(263, 12, '2025-04-29', 'Present'),
(264, 12, '2025-04-30', 'Present'),
(265, 13, '2025-04-01', 'Present'),
(266, 13, '2025-04-02', 'Present'),
(267, 13, '2025-04-03', 'Present'),
(268, 13, '2025-04-04', 'Present'),
(269, 13, '2025-04-05', 'Present'),
(270, 13, '2025-04-08', 'Present'),
(271, 13, '2025-04-09', 'Present'),
(272, 13, '2025-04-10', 'Present'),
(273, 13, '2025-04-11', 'Present'),
(274, 13, '2025-04-12', 'Present'),
(275, 13, '2025-04-15', 'Present'),
(276, 13, '2025-04-16', 'Present'),
(277, 13, '2025-04-17', 'Present'),
(278, 13, '2025-04-18', 'Present'),
(279, 13, '2025-04-19', 'Present'),
(280, 13, '2025-04-22', 'Present'),
(281, 13, '2025-04-23', 'Present'),
(282, 13, '2025-04-24', 'Present'),
(283, 13, '2025-04-25', 'Present'),
(284, 13, '2025-04-26', 'Present'),
(285, 13, '2025-04-29', 'Present'),
(286, 13, '2025-04-30', 'Present'),
(287, 14, '2025-04-01', 'Present'),
(288, 14, '2025-04-02', 'Present'),
(289, 14, '2025-04-03', 'Present'),
(290, 14, '2025-04-04', 'Present'),
(291, 14, '2025-04-05', 'Present'),
(292, 14, '2025-04-08', 'Present'),
(293, 14, '2025-04-09', 'Present'),
(294, 14, '2025-04-10', 'Present'),
(295, 14, '2025-04-11', 'Present'),
(296, 14, '2025-04-12', 'Present'),
(297, 14, '2025-04-15', 'Present'),
(298, 14, '2025-04-16', 'Present'),
(299, 14, '2025-04-17', 'Present'),
(300, 14, '2025-04-18', 'Present'),
(301, 14, '2025-04-19', 'Present'),
(302, 14, '2025-04-22', 'Present'),
(303, 14, '2025-04-23', 'Present'),
(304, 14, '2025-04-24', 'Present'),
(305, 14, '2025-04-25', 'Present'),
(306, 14, '2025-04-26', 'Present'),
(307, 14, '2025-04-29', 'Present'),
(308, 14, '2025-04-30', 'Present'),
(309, 15, '2025-04-01', 'Present'),
(310, 15, '2025-04-02', 'Present'),
(311, 15, '2025-04-03', 'Present'),
(312, 15, '2025-04-04', 'Present'),
(313, 15, '2025-04-05', 'Present'),
(314, 15, '2025-04-08', 'Present'),
(315, 15, '2025-04-09', 'Present'),
(316, 15, '2025-04-10', 'Present'),
(317, 15, '2025-04-11', 'Present'),
(318, 15, '2025-04-12', 'Present'),
(319, 15, '2025-04-15', 'Present'),
(320, 15, '2025-04-16', 'Present'),
(321, 15, '2025-04-17', 'Present'),
(322, 15, '2025-04-18', 'Leave'),
(323, 15, '2025-04-19', 'Leave'),
(324, 15, '2025-04-22', 'Present'),
(325, 15, '2025-04-23', 'Present'),
(326, 15, '2025-04-24', 'Present'),
(327, 15, '2025-04-25', 'Present'),
(328, 15, '2025-04-26', 'Present'),
(329, 15, '2025-04-29', 'Present'),
(330, 15, '2025-04-30', 'Present'),
(331, 16, '2025-04-01', 'Present'),
(332, 16, '2025-04-02', 'Present'),
(333, 16, '2025-04-03', 'Present'),
(334, 16, '2025-04-04', 'Present'),
(335, 16, '2025-04-05', 'Present'),
(336, 16, '2025-04-08', 'Absent'),
(337, 16, '2025-04-09', 'Present'),
(338, 16, '2025-04-10', 'Present'),
(339, 16, '2025-04-11', 'Present'),
(340, 16, '2025-04-12', 'Present'),
(341, 16, '2025-04-15', 'Present'),
(342, 16, '2025-04-16', 'Present'),
(343, 16, '2025-04-17', 'Present'),
(344, 16, '2025-04-18', 'Present'),
(345, 16, '2025-04-19', 'Present'),
(346, 16, '2025-04-22', 'Present'),
(347, 16, '2025-04-23', 'Present'),
(348, 16, '2025-04-24', 'Present'),
(349, 16, '2025-04-25', 'Present'),
(350, 16, '2025-04-26', 'Present'),
(351, 16, '2025-04-29', 'Present'),
(352, 16, '2025-04-30', 'Present'),
(353, 17, '2025-04-01', 'Present'),
(354, 17, '2025-04-02', 'Present'),
(355, 17, '2025-04-03', 'Present'),
(356, 17, '2025-04-04', 'Present'),
(357, 17, '2025-04-05', 'Present'),
(358, 17, '2025-04-08', 'Present'),
(359, 17, '2025-04-09', 'Present'),
(360, 17, '2025-04-10', 'Present'),
(361, 17, '2025-04-11', 'Present'),
(362, 17, '2025-04-12', 'Present'),
(363, 17, '2025-04-15', 'Present'),
(364, 17, '2025-04-16', 'Present'),
(365, 17, '2025-04-17', 'Present'),
(366, 17, '2025-04-18', 'Present'),
(367, 17, '2025-04-19', 'Present'),
(368, 17, '2025-04-22', 'Present'),
(369, 17, '2025-04-23', 'Present'),
(370, 17, '2025-04-24', 'Present'),
(371, 17, '2025-04-25', 'Present'),
(372, 17, '2025-04-26', 'Present'),
(373, 17, '2025-04-29', 'Present'),
(374, 17, '2025-04-30', 'Present'),
(375, 18, '2025-04-01', 'Present'),
(376, 18, '2025-04-02', 'Present'),
(377, 18, '2025-04-03', 'Present'),
(378, 18, '2025-04-04', 'Present'),
(379, 18, '2025-04-05', 'Present'),
(380, 18, '2025-04-08', 'Present'),
(381, 18, '2025-04-09', 'Present'),
(382, 18, '2025-04-10', 'Present'),
(383, 18, '2025-04-11', 'Present'),
(384, 18, '2025-04-12', 'Present'),
(385, 18, '2025-04-15', 'Present'),
(386, 18, '2025-04-16', 'Present'),
(387, 18, '2025-04-17', 'Present'),
(388, 18, '2025-04-18', 'Present'),
(389, 18, '2025-04-19', 'Present'),
(390, 18, '2025-04-22', 'Present'),
(391, 18, '2025-04-23', 'Present'),
(392, 18, '2025-04-24', 'Present'),
(393, 18, '2025-04-25', 'Present'),
(394, 18, '2025-04-26', 'Present'),
(395, 18, '2025-04-29', 'Present'),
(396, 18, '2025-04-30', 'Present'),
(397, 19, '2025-04-01', 'Present'),
(398, 19, '2025-04-02', 'Present'),
(399, 19, '2025-04-03', 'Present'),
(400, 19, '2025-04-04', 'Present'),
(401, 19, '2025-04-05', 'Present'),
(402, 19, '2025-04-08', 'Present'),
(403, 19, '2025-04-09', 'Present'),
(404, 19, '2025-04-10', 'Present'),
(405, 19, '2025-04-11', 'Present'),
(406, 19, '2025-04-12', 'Present'),
(407, 19, '2025-04-15', 'Present'),
(408, 19, '2025-04-16', 'Present'),
(409, 19, '2025-04-17', 'Present'),
(410, 19, '2025-04-18', 'Present'),
(411, 19, '2025-04-19', 'Present'),
(412, 19, '2025-04-22', 'Present'),
(413, 19, '2025-04-23', 'Present'),
(414, 19, '2025-04-24', 'Present'),
(415, 19, '2025-04-25', 'Present'),
(416, 19, '2025-04-26', 'Present'),
(417, 19, '2025-04-29', 'Present'),
(418, 19, '2025-04-30', 'Present'),
(419, 20, '2025-04-01', 'Present'),
(420, 20, '2025-04-02', 'Present'),
(421, 20, '2025-04-03', 'Present'),
(422, 20, '2025-04-04', 'Present'),
(423, 20, '2025-04-05', 'Present'),
(424, 20, '2025-04-08', 'Present'),
(425, 20, '2025-04-09', 'Present'),
(426, 20, '2025-04-10', 'Present'),
(427, 20, '2025-04-11', 'Present'),
(428, 20, '2025-04-12', 'Present'),
(429, 20, '2025-04-15', 'Present'),
(430, 20, '2025-04-16', 'Present'),
(431, 20, '2025-04-17', 'Present'),
(432, 20, '2025-04-18', 'Present'),
(433, 20, '2025-04-19', 'Present'),
(434, 20, '2025-04-22', 'Present'),
(435, 20, '2025-04-23', 'Present'),
(436, 20, '2025-04-24', 'Present'),
(437, 20, '2025-04-25', 'Present'),
(438, 20, '2025-04-26', 'Present'),
(439, 20, '2025-04-29', 'Present'),
(440, 20, '2025-04-30', 'Present'),
(441, 21, '2025-04-01', 'Present'),
(442, 21, '2025-04-02', 'Present'),
(443, 21, '2025-04-03', 'Present'),
(444, 21, '2025-04-04', 'Present'),
(445, 21, '2025-04-05', 'Present'),
(446, 21, '2025-04-08', 'Present'),
(447, 21, '2025-04-09', 'Present'),
(448, 21, '2025-04-10', 'Present'),
(449, 21, '2025-04-11', 'Present'),
(450, 21, '2025-04-12', 'Present'),
(451, 21, '2025-04-15', 'Present'),
(452, 21, '2025-04-16', 'Present'),
(453, 21, '2025-04-17', 'Present'),
(454, 21, '2025-04-18', 'Present'),
(455, 21, '2025-04-19', 'Present'),
(456, 21, '2025-04-22', 'Present'),
(457, 21, '2025-04-23', 'Present'),
(458, 21, '2025-04-24', 'Present'),
(459, 21, '2025-04-25', 'Present'),
(460, 21, '2025-04-26', 'Present'),
(461, 21, '2025-04-29', 'Present'),
(462, 21, '2025-04-30', 'Present'),
(463, 22, '2025-04-01', 'Present'),
(464, 22, '2025-04-02', 'Present'),
(465, 22, '2025-04-03', 'Present'),
(466, 22, '2025-04-04', 'Present'),
(467, 22, '2025-04-05', 'Present'),
(468, 22, '2025-04-08', 'Present'),
(469, 22, '2025-04-09', 'Present'),
(470, 22, '2025-04-10', 'Present'),
(471, 22, '2025-04-11', 'Present'),
(472, 22, '2025-04-12', 'Present'),
(473, 22, '2025-04-15', 'Present'),
(474, 22, '2025-04-16', 'Present'),
(475, 22, '2025-04-17', 'Present'),
(476, 22, '2025-04-18', 'Present'),
(477, 22, '2025-04-19', 'Present'),
(478, 22, '2025-04-22', 'Present'),
(479, 22, '2025-04-23', 'Present'),
(480, 22, '2025-04-24', 'Present'),
(481, 22, '2025-04-25', 'Present'),
(482, 22, '2025-04-26', 'Present'),
(483, 22, '2025-04-29', 'Present'),
(484, 22, '2025-04-30', 'Present'),
(485, 23, '2025-04-01', 'Present'),
(486, 23, '2025-04-02', 'Present'),
(487, 23, '2025-04-03', 'Present'),
(488, 23, '2025-04-04', 'Present'),
(489, 23, '2025-04-05', 'Present'),
(490, 23, '2025-04-08', 'Present'),
(491, 23, '2025-04-09', 'Present'),
(492, 23, '2025-04-10', 'Present'),
(493, 23, '2025-04-11', 'Present'),
(494, 23, '2025-04-12', 'Present'),
(495, 23, '2025-04-15', 'Present'),
(496, 23, '2025-04-16', 'Present'),
(497, 23, '2025-04-17', 'Present'),
(498, 23, '2025-04-18', 'Present'),
(499, 23, '2025-04-19', 'Present'),
(500, 23, '2025-04-22', 'Present'),
(501, 23, '2025-04-23', 'Present'),
(502, 23, '2025-04-24', 'Present'),
(503, 23, '2025-04-25', 'Present'),
(504, 23, '2025-04-26', 'Present'),
(505, 23, '2025-04-29', 'Present'),
(506, 23, '2025-04-30', 'Present'),
(507, 24, '2025-04-01', 'Present'),
(508, 24, '2025-04-02', 'Present'),
(509, 24, '2025-04-03', 'Present'),
(510, 24, '2025-04-04', 'Present'),
(511, 24, '2025-04-05', 'Present'),
(512, 24, '2025-04-08', 'Present'),
(513, 24, '2025-04-09', 'Present'),
(514, 24, '2025-04-10', 'Present'),
(515, 24, '2025-04-11', 'Present'),
(516, 24, '2025-04-12', 'Leave'),
(517, 24, '2025-04-15', 'Present'),
(518, 24, '2025-04-16', 'Present'),
(519, 24, '2025-04-17', 'Present'),
(520, 24, '2025-04-18', 'Present'),
(521, 24, '2025-04-19', 'Present'),
(522, 24, '2025-04-22', 'Present'),
(523, 24, '2025-04-23', 'Present'),
(524, 24, '2025-04-24', 'Present'),
(525, 24, '2025-04-25', 'Present'),
(526, 24, '2025-04-26', 'Present'),
(527, 24, '2025-04-29', 'Present'),
(528, 24, '2025-04-30', 'Present'),
(529, 25, '2025-04-01', 'Present'),
(530, 25, '2025-04-02', 'Present'),
(531, 25, '2025-04-03', 'Present'),
(532, 25, '2025-04-04', 'Present'),
(533, 25, '2025-04-05', 'Present'),
(534, 25, '2025-04-08', 'Present'),
(535, 25, '2025-04-09', 'Present'),
(536, 25, '2025-04-10', 'Present'),
(537, 25, '2025-04-11', 'Present'),
(538, 25, '2025-04-12', 'Present'),
(539, 25, '2025-04-15', 'Present'),
(540, 25, '2025-04-16', 'Present'),
(541, 25, '2025-04-17', 'Present'),
(542, 25, '2025-04-18', 'Present'),
(543, 25, '2025-04-19', 'Present'),
(544, 25, '2025-04-22', 'Present'),
(545, 25, '2025-04-23', 'Present'),
(546, 25, '2025-04-24', 'Present'),
(547, 25, '2025-04-25', 'Present'),
(548, 25, '2025-04-26', 'Present'),
(549, 25, '2025-04-29', 'Present'),
(550, 25, '2025-04-30', 'Present'),
(551, 26, '2025-04-01', 'Present'),
(552, 26, '2025-04-02', 'Present'),
(553, 26, '2025-04-03', 'Present'),
(554, 26, '2025-04-04', 'Present'),
(555, 26, '2025-04-05', 'Present'),
(556, 26, '2025-04-08', 'Present'),
(557, 26, '2025-04-09', 'Present'),
(558, 26, '2025-04-10', 'Present'),
(559, 26, '2025-04-11', 'Present'),
(560, 26, '2025-04-12', 'Present'),
(561, 26, '2025-04-15', 'Present'),
(562, 26, '2025-04-16', 'Present'),
(563, 26, '2025-04-17', 'Present'),
(564, 26, '2025-04-18', 'Present'),
(565, 26, '2025-04-19', 'Present'),
(566, 26, '2025-04-22', 'Present'),
(567, 26, '2025-04-23', 'Present'),
(568, 26, '2025-04-24', 'Present'),
(569, 26, '2025-04-25', 'Present'),
(570, 26, '2025-04-26', 'Present'),
(571, 26, '2025-04-29', 'Present'),
(572, 26, '2025-04-30', 'Present'),
(573, 27, '2025-04-01', 'Present'),
(574, 27, '2025-04-02', 'Present'),
(575, 27, '2025-04-03', 'Present'),
(576, 27, '2025-04-04', 'Present'),
(577, 27, '2025-04-05', 'Present'),
(578, 27, '2025-04-08', 'Present'),
(579, 27, '2025-04-09', 'Present'),
(580, 27, '2025-04-10', 'Present'),
(581, 27, '2025-04-11', 'Present'),
(582, 27, '2025-04-12', 'Present'),
(583, 27, '2025-04-15', 'Present'),
(584, 27, '2025-04-16', 'Present'),
(585, 27, '2025-04-17', 'Present'),
(586, 27, '2025-04-18', 'Present'),
(587, 27, '2025-04-19', 'Present'),
(588, 27, '2025-04-22', 'Present'),
(589, 27, '2025-04-23', 'Present'),
(590, 27, '2025-04-24', 'Present'),
(591, 27, '2025-04-25', 'Present'),
(592, 27, '2025-04-26', 'Present'),
(593, 27, '2025-04-29', 'Present'),
(594, 27, '2025-04-30', 'Present'),
(595, 28, '2025-04-01', 'Present'),
(596, 28, '2025-04-02', 'Present'),
(597, 28, '2025-04-03', 'Present'),
(598, 28, '2025-04-04', 'Present'),
(599, 28, '2025-04-05', 'Present'),
(600, 28, '2025-04-08', 'Leave'),
(601, 28, '2025-04-09', 'Present'),
(602, 28, '2025-04-10', 'Present'),
(603, 28, '2025-04-11', 'Present'),
(604, 28, '2025-04-12', 'Present'),
(605, 28, '2025-04-15', 'Present'),
(606, 28, '2025-04-16', 'Present'),
(607, 28, '2025-04-17', 'Present'),
(608, 28, '2025-04-18', 'Present'),
(609, 28, '2025-04-19', 'Present'),
(610, 28, '2025-04-22', 'Present'),
(611, 28, '2025-04-23', 'Present'),
(612, 28, '2025-04-24', 'Present'),
(613, 28, '2025-04-25', 'Present'),
(614, 28, '2025-04-26', 'Present'),
(615, 28, '2025-04-29', 'Present'),
(616, 28, '2025-04-30', 'Present'),
(617, 29, '2025-04-01', 'Present'),
(618, 29, '2025-04-02', 'Present'),
(619, 29, '2025-04-03', 'Present'),
(620, 29, '2025-04-04', 'Present'),
(621, 29, '2025-04-05', 'Present'),
(622, 29, '2025-04-08', 'Present'),
(623, 29, '2025-04-09', 'Present'),
(624, 29, '2025-04-10', 'Present'),
(625, 29, '2025-04-11', 'Present'),
(626, 29, '2025-04-12', 'Present'),
(627, 29, '2025-04-15', 'Present'),
(628, 29, '2025-04-16', 'Present'),
(629, 29, '2025-04-17', 'Present'),
(630, 29, '2025-04-18', 'Present'),
(631, 29, '2025-04-19', 'Present'),
(632, 29, '2025-04-22', 'Present'),
(633, 29, '2025-04-23', 'Present'),
(634, 29, '2025-04-24', 'Present'),
(635, 29, '2025-04-25', 'Present'),
(636, 29, '2025-04-26', 'Present'),
(637, 29, '2025-04-29', 'Present'),
(638, 29, '2025-04-30', 'Present'),
(639, 30, '2025-04-01', 'Present'),
(640, 30, '2025-04-02', 'Present'),
(641, 30, '2025-04-03', 'Present'),
(642, 30, '2025-04-04', 'Present'),
(643, 30, '2025-04-05', 'Present'),
(644, 30, '2025-04-08', 'Leave'),
(645, 30, '2025-04-09', 'Present'),
(646, 30, '2025-04-10', 'Present'),
(647, 30, '2025-04-11', 'Present'),
(648, 30, '2025-04-12', 'Present'),
(649, 30, '2025-04-15', 'Present'),
(650, 30, '2025-04-16', 'Present'),
(651, 30, '2025-04-17', 'Present'),
(652, 30, '2025-04-18', 'Present'),
(653, 30, '2025-04-19', 'Present'),
(654, 30, '2025-04-22', 'Present'),
(655, 30, '2025-04-23', 'Present'),
(656, 30, '2025-04-24', 'Present'),
(657, 30, '2025-04-25', 'Present'),
(658, 30, '2025-04-26', 'Present'),
(659, 30, '2025-04-29', 'Present'),
(660, 30, '2025-04-30', 'Present'),
(661, 1, '2025-04-22', 'Present'),
(662, 2, '2025-04-22', 'Absent');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `job_role` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `home_contact_number` varchar(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'boy.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `job_role`, `department`, `address`, `contact_number`, `nic`, `home_contact_number`, `img`) VALUES
(1, 'Dananjaya De Silva', 'Customer Support Officer', 'Marketing', 'Colombo', '0711236385', '791301369V', '0112843411', 'boy.png'),
(2, 'Nuwan De Silva', 'Operations Manager', 'IT', 'Galle', '0771042294', '785442607V', '0112254022', 'boy.png'),
(3, 'Kalani Ratnayake', 'Accountant', 'Operations', 'Kandy', '0711933911', '199407243611', '0119286298', 'girl.png'),
(4, 'Dananjaya Senanayake', 'Marketing Executive', 'Operations', 'Negombo', '0783759292', '198911257024', '0118478540', 'boy.png'),
(5, 'Kalani Wickramasinghe', 'Accountant', 'Finance', 'Anuradhapura', '0774145002', '876900030V', '0115223703', 'girl.png'),
(6, 'Ishara Rajapaksha', 'Software Engineer', 'Marketing', 'Galle', '0779047711', '198606183975', '0119122960', 'boy.png'),
(7, 'Sahan Fernando', 'Marketing Executive', 'IT', 'Kandy', '0781411662', '998314659V', '0118861230', 'boy.png'),
(8, 'Chamari Rajapaksha', 'HR Manager', 'Finance', 'Galle', '0783063853', '747585086V', '0116884866', 'girl.png'),
(9, 'Kasun Jayasinghe', 'Operations Manager', 'Marketing', 'Galle', '0719173360', '932793917V', '0119315618', 'boy.png'),
(10, 'Dinithi Fernando', 'Accountant', 'Sales', 'Batticaloa', '0779995288', '952630169V', '0113587986', 'girl.png'),
(11, 'Harsha Silva', 'Operations Manager', 'Finance', 'Jaffna', '0765294127', '906209794V', '0119745857', 'boy.png'),
(12, 'Harsha Bandara', 'Customer Support Officer', 'IT', 'Kandy', '0754486013', '980629436V', '0116488374', 'boy.png'),
(13, 'Ashen Jayasinghe', 'Software Engineer', 'Marketing', 'Matara', '0787775241', '198309165586', '0118313638', 'boy.png'),
(14, 'Ishara Wickramasinghe', 'Operations Manager', 'HR', 'Badulla', '0757391561', '912246532V', '0117524075', 'boy.png'),
(15, 'Kalani Weerasinghe', 'Marketing Executive', 'Finance', 'Kurunegala', '0773500965', '758733805V', '0114970564', 'girl.png'),
(16, 'Chathura Weerasinghe', 'Software Engineer', 'Finance', 'Galle', '0769737158', '200008146208', '0117987062', 'boy.png'),
(17, 'Kasun Senanayake', 'Sales Executive', 'Finance', 'Batticaloa', '0766487296', '200009274931', '0113322163', 'boy.png'),
(18, 'Isuru Ekanayake', 'Marketing Executive', 'Operations', 'Colombo', '0715085272', '913700241V', '0115085267', 'boy.png'),
(19, 'Piumi Wickramasinghe', 'Customer Support Officer', 'HR', 'Batticaloa', '0718470364', '198304233095', '0114871269', 'girl.png'),
(20, 'Manjula Rajapaksha', 'Marketing Executive', 'Marketing', 'Matara', '0762443399', '200204147841', '0113573466', 'boy.png'),
(21, 'Nuwan Ratnayake', 'Software Engineer', 'HR', 'Badulla', '0758666014', '198204185700', '0115287358', 'boy.png'),
(22, 'Chamari Jayasinghe', 'Software Engineer', 'IT', 'Negombo', '0711571118', '200001037218', '0119787599', 'girl.png'),
(23, 'Nuwan Fernando', 'HR Manager', 'Operations', 'Colombo', '0714020689', '198701253671', '0114341711', 'boy.png'),
(24, 'Dilantha De Silva', 'Operations Manager', 'Marketing', 'Kandy', '0788992537', '947591968V', '0119849370', 'boy.png'),
(25, 'Sachini Dissanayake', 'Customer Support Officer', 'IT', 'Jaffna', '0768904380', '198711057807', '0119520725', 'girl.png'),
(26, 'Kalani Abeysekara', 'Software Engineer', 'HR', 'Anuradhapura', '0777549701', '766436469V', '0113027404', 'girl.png'),
(27, 'Harsha Senanayake', 'Marketing Executive', 'Finance', 'Galle', '0751740718', '818062928V', '0118991365', 'boy.png'),
(28, 'Kasun Karunaratne', 'Accountant', 'Operations', 'Badulla', '0773453220', '199208019473', '0113703224', 'boy.png'),
(29, 'Kasun Wijesinghe', 'Accountant', 'Sales', 'Matara', '0718587833', '198507103300', '0119421410', 'boy.png'),
(30, 'Tharushi Pathirana', 'HR Manager', 'Operations', 'Colombo', '0779145705', '200308094478', '0117872823', 'girl.png'),
(35, 'Danindu', 'Operations Manager', 'IT', 'Kottawa', '0712345678', '20050000001', '0112843411', 'boy.png');

-- --------------------------------------------------------

--
-- Table structure for table `leave_request`
--

CREATE TABLE `leave_request` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_request`
--

INSERT INTO `leave_request` (`id`, `employee_id`, `start_date`, `end_date`, `reason`, `status`) VALUES
(1, 21, '2025-04-20', '2025-04-22', 'Vacation', 'Pending'),
(2, 3, '2025-04-05', '2025-04-06', 'Emergency', 'Pending'),
(3, 2, '2025-04-07', '2025-04-08', 'Personal', 'Pending'),
(4, 23, '2025-04-01', '2025-04-04', 'Vacation', 'Pending'),
(5, 10, '2025-04-19', '2025-04-21', 'Vacation', 'Pending'),
(6, 14, '2025-04-18', '2025-04-21', 'Medical', 'Pending'),
(7, 27, '2025-04-01', '2025-04-02', 'Personal', 'Pending'),
(8, 19, '2025-04-16', '2025-04-18', 'Medical', 'Pending'),
(9, 28, '2025-04-06', '2025-04-08', 'Emergency', 'Pending'),
(10, 15, '2025-04-18', '2025-04-20', 'Personal', 'Pending'),
(11, 11, '2025-04-02', '2025-04-03', 'Medical', 'Pending'),
(12, 6, '2025-04-09', '2025-04-10', 'Emergency', 'Pending'),
(13, 24, '2025-04-12', '2025-04-13', 'Medical', 'Pending'),
(14, 4, '2025-04-01', '2025-04-02', 'Medical', 'Pending'),
(15, 30, '2025-04-07', '2025-04-08', 'Vacation', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `bonuses` decimal(10,2) DEFAULT 0.00,
  `deductions` decimal(10,2) DEFAULT 0.00,
  `total_pay` decimal(10,2) DEFAULT NULL,
  `pay_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `employee_id`, `salary`, `bonuses`, `deductions`, `total_pay`, `pay_date`) VALUES
(1, 1, 53898.00, 18359.00, 3357.00, 68900.00, '2025-03-30'),
(2, 2, 63516.00, 6253.00, 1166.00, 68603.00, '2025-03-30'),
(3, 3, 108821.00, 7114.00, 2235.00, 113700.00, '2025-03-30'),
(4, 4, 95822.00, 19585.00, 2763.00, 112644.00, '2025-03-30'),
(5, 5, 75054.00, 12033.00, 4002.00, 83085.00, '2025-03-30'),
(6, 6, 108600.00, 17637.00, 958.00, 125279.00, '2025-03-30'),
(7, 7, 68919.00, 9420.00, 4909.00, 73430.00, '2025-03-30'),
(8, 8, 63716.00, 15231.00, 1576.00, 77371.00, '2025-03-30'),
(9, 9, 111067.00, 16157.00, 3082.00, 124142.00, '2025-03-30'),
(10, 10, 57110.00, 10846.00, 1769.00, 66187.00, '2025-03-30'),
(11, 11, 144947.00, 5514.00, 1592.00, 148869.00, '2025-03-30'),
(12, 12, 114149.00, 19296.00, 1488.00, 131957.00, '2025-03-30'),
(13, 13, 106719.00, 19118.00, 2977.00, 122860.00, '2025-03-30'),
(14, 14, 141558.00, 8858.00, 1220.00, 149196.00, '2025-03-30'),
(15, 15, 82170.00, 13343.00, 1594.00, 93919.00, '2025-03-30'),
(16, 16, 102174.00, 18377.00, 2483.00, 118068.00, '2025-03-30'),
(17, 17, 128999.00, 12083.00, 4156.00, 136926.00, '2025-03-30'),
(18, 18, 140844.00, 17831.00, 2903.00, 155772.00, '2025-03-30'),
(19, 19, 75796.00, 16366.00, 2629.00, 89533.00, '2025-03-30'),
(20, 20, 74690.00, 9093.00, 3221.00, 80562.00, '2025-03-30'),
(21, 21, 96144.00, 4509.00, 4639.00, 96014.00, '2025-03-30'),
(22, 22, 55936.00, 13823.00, 2698.00, 67061.00, '2025-03-30'),
(23, 23, 104488.00, 16997.00, 44.00, 121441.00, '2025-03-30'),
(24, 24, 63166.00, 16139.00, 4892.00, 74413.00, '2025-03-30'),
(25, 25, 142020.00, 13553.00, 877.00, 154696.00, '2025-03-30'),
(26, 26, 119150.00, 19108.00, 3285.00, 134973.00, '2025-03-30'),
(27, 27, 124970.00, 16567.00, 2033.00, 139504.00, '2025-03-30'),
(28, 28, 149833.00, 13713.00, 1196.00, 162350.00, '2025-03-30'),
(29, 29, 54756.00, 9053.00, 1091.00, 62718.00, '2025-03-30'),
(30, 30, 74256.00, 8081.00, 844.00, 81493.00, '2025-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `ttracker`
--

CREATE TABLE `ttracker` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendance_days` int(11) NOT NULL DEFAULT 0,
  `leave_days` int(11) NOT NULL DEFAULT 0,
  `late_days` int(11) NOT NULL DEFAULT 0,
  `tasks_assigned` int(11) NOT NULL DEFAULT 0,
  `tasks_completed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ttracker`
--

INSERT INTO `ttracker` (`id`, `employee_id`, `attendance_days`, `leave_days`, `late_days`, `tasks_assigned`, `tasks_completed`) VALUES
(1, 1, 20, 2, 1, 15, 12),
(2, 2, 22, 0, 0, 13, 10),
(3, 3, 19, 3, 2, 13, 9),
(4, 4, 21, 1, 0, 14, 14),
(5, 5, 18, 4, 2, 16, 14),
(6, 6, 21, 1, 1, 13, 8),
(7, 7, 20, 2, 1, 11, 9),
(8, 8, 21, 1, 0, 13, 10),
(9, 9, 19, 3, 1, 12, 7),
(10, 10, 22, 0, 0, 11, 3),
(11, 11, 20, 2, 2, 13, 11),
(12, 12, 21, 1, 1, 19, 12),
(13, 13, 17, 5, 3, 15, 8),
(14, 14, 22, 0, 0, 20, 12),
(15, 15, 20, 2, 1, 16, 9),
(16, 16, 18, 4, 2, 12, 12),
(17, 17, 22, 0, 0, 13, 7),
(18, 18, 21, 1, 1, 12, 10),
(19, 19, 20, 2, 2, 20, 15),
(20, 20, 22, 0, 0, 11, 8),
(21, 21, 19, 3, 2, 12, 10),
(22, 22, 21, 1, 1, 14, 12),
(23, 23, 22, 0, 0, 17, 11),
(24, 24, 20, 2, 1, 20, 16),
(25, 25, 19, 3, 2, 15, 14),
(26, 26, 22, 0, 0, 14, 13),
(27, 27, 21, 1, 0, 12, 7),
(28, 28, 20, 2, 1, 12, 4),
(29, 29, 22, 0, 0, 14, 11),
(30, 30, 18, 4, 3, 12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `ttracker`
--
ALTER TABLE `ttracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=663;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `leave_request`
--
ALTER TABLE `leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ttracker`
--
ALTER TABLE `ttracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ttracker`
--
ALTER TABLE `ttracker`
  ADD CONSTRAINT `ttracker_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
