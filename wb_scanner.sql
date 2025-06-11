-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 18, 2025 at 02:13 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wb_scanner`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_message`
--

CREATE TABLE `contact_message` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_message`
--

INSERT INTO `contact_message` (`id`, `name`, `email`, `message`, `date`) VALUES
(1, 'Bonnie Green', 'bonnie@gmail.com', 'Test message', '2025-05-18 09:32:22'),
(2, '', 'user@example.com', 'fvfv', '2025-05-18 13:20:22'),
(3, 'Test', 'te@a.c', 'dev', '2025-05-18 13:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scan_result`
--

CREATE TABLE `scan_result` (
  `id` int(11) NOT NULL,
  `url` varchar(300) NOT NULL,
  `date_scanned` datetime DEFAULT NULL,
  `vulnerability` varchar(100) NOT NULL,
  `risk` varchar(20) DEFAULT NULL,
  `vulnerable` tinyint(1) NOT NULL,
  `details` text,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scan_result`
--

INSERT INTO `scan_result` (`id`, `url`, `date_scanned`, `vulnerability`, `risk`, `vulnerable`, `details`, `user_id`) VALUES
(1, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'SQL Injection', 'High', 1, '[{\"payload\": \"\' OR \'1\'=\'1\", \"url\": \"https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a?test=\' OR \'1\'=\'1\", \"reason\": \"Content length changed significantly\"}]', 2),
(2, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Cross-Site Scripting (XSS)', 'Medium', 0, '[{\"note\": \"No XSS patterns detected.\"}]', 2),
(3, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Cross-Site Request Forgery (CSRF)', 'Medium', 0, '[{\"note\": \"No forms found on the page.\"}]', 2),
(4, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Insecure Direct Object Reference (IDOR)', 'Medium', 0, '[{\"note\": \"No URL parameters found to test for IDOR.\"}]', 2),
(5, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Remote File Inclusion (RFI)', 'High', 0, '[{\"note\": \"No parameters found to test for RFI.\"}]', 2),
(6, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Directory Traversal', 'High', 0, '[{\"note\": \"No parameters found to test for Directory Traversal.\"}]', 2),
(7, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Open Redirect', 'Medium', 0, '[{\"note\": \"No parameters found to test for Open Redirect.\"}]', 2),
(8, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:46:17', 'Missing Security Headers', 'Low', 1, '[{\"missing_header\": \"Content-Security-Policy\", \"reason\": \"Helps prevent XSS attacks\"}, {\"missing_header\": \"X-XSS-Protection\", \"reason\": \"Basic XSS protection (older browsers)\"}]', 2),
(9, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'SQL Injection', 'High', 1, '[{\"payload\": \"\' OR \'1\'=\'1\", \"url\": \"https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a?test=\' OR \'1\'=\'1\", \"reason\": \"Content length changed significantly\"}]', 2),
(10, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Cross-Site Scripting (XSS)', 'Medium', 0, '[{\"note\": \"No XSS patterns detected.\"}]', 2),
(11, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Cross-Site Request Forgery (CSRF)', 'Medium', 0, '[{\"note\": \"No forms found on the page.\"}]', 2),
(12, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Insecure Direct Object Reference (IDOR)', 'Medium', 0, '[{\"note\": \"No URL parameters found to test for IDOR.\"}]', 2),
(13, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Remote File Inclusion (RFI)', 'High', 0, '[{\"note\": \"No parameters found to test for RFI.\"}]', 2),
(14, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Directory Traversal', 'High', 0, '[{\"note\": \"No parameters found to test for Directory Traversal.\"}]', 2),
(15, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Open Redirect', 'Medium', 0, '[{\"note\": \"No parameters found to test for Open Redirect.\"}]', 2),
(16, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:49:19', 'Missing Security Headers', 'Low', 1, '[{\"missing_header\": \"Content-Security-Policy\", \"reason\": \"Helps prevent XSS attacks\"}, {\"missing_header\": \"X-XSS-Protection\", \"reason\": \"Basic XSS protection (older browsers)\"}]', 2),
(17, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'SQL Injection', 'High', 1, '[{\"payload\": \"\' OR \'1\'=\'1\", \"url\": \"https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a?test=\' OR \'1\'=\'1\", \"reason\": \"Content length changed significantly\"}]', 2),
(18, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Cross-Site Scripting (XSS)', 'Medium', 0, '[{\"note\": \"No XSS patterns detected.\"}]', 2),
(19, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Cross-Site Request Forgery (CSRF)', 'Medium', 0, '[{\"note\": \"No forms found on the page.\"}]', 2),
(20, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Insecure Direct Object Reference (IDOR)', 'Medium', 0, '[{\"note\": \"No URL parameters found to test for IDOR.\"}]', 2),
(21, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Remote File Inclusion (RFI)', 'High', 0, '[{\"note\": \"No parameters found to test for RFI.\"}]', 2),
(22, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Directory Traversal', 'High', 0, '[{\"note\": \"No parameters found to test for Directory Traversal.\"}]', 2),
(23, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Open Redirect', 'Medium', 0, '[{\"note\": \"No parameters found to test for Open Redirect.\"}]', 2),
(24, 'https://chatgpt.com/c/68291393-9cf0-8000-a387-71caa88c435a', '2025-05-18 12:51:48', 'Missing Security Headers', 'Low', 1, '[{\"missing_header\": \"Content-Security-Policy\", \"reason\": \"Helps prevent XSS attacks\"}, {\"missing_header\": \"X-XSS-Protection\", \"reason\": \"Basic XSS protection (older browsers)\"}]', 2),
(25, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'SQL Injection', 'High', 0, '[{\"error\": \"HTTPSConnectionPool(host=\'iinfinityai.com\', port=443): Read timed out. (read timeout=7)\"}]', 2),
(26, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Cross-Site Scripting (XSS)', 'Medium', 0, '[{\"note\": \"No XSS patterns detected.\"}]', 2),
(27, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Cross-Site Request Forgery (CSRF)', 'Medium', 0, '[{\"note\": \"No forms found on the page.\"}]', 2),
(28, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Insecure Direct Object Reference (IDOR)', 'Medium', 0, '[{\"note\": \"No URL parameters found to test for IDOR.\"}]', 2),
(29, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Remote File Inclusion (RFI)', 'High', 0, '[{\"note\": \"No parameters found to test for RFI.\"}]', 2),
(30, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Directory Traversal', 'High', 0, '[{\"note\": \"No parameters found to test for Directory Traversal.\"}]', 2),
(31, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Open Redirect', 'Medium', 0, '[{\"note\": \"No parameters found to test for Open Redirect.\"}]', 2),
(32, 'https://iinfinityai.com/', '2025-05-18 12:58:13', 'Missing Security Headers', 'Low', 1, '[{\"missing_header\": \"Content-Security-Policy\", \"reason\": \"Helps prevent XSS attacks\"}, {\"missing_header\": \"Strict-Transport-Security\", \"reason\": \"Enforces HTTPS connections\"}, {\"missing_header\": \"X-Frame-Options\", \"reason\": \"Protects against clickjacking\"}, {\"missing_header\": \"X-Content-Type-Options\", \"reason\": \"Prevents MIME-sniffing\"}, {\"missing_header\": \"Referrer-Policy\", \"reason\": \"Controls referrer information\"}, {\"missing_header\": \"Permissions-Policy\", \"reason\": \"Restricts use of browser features\"}, {\"missing_header\": \"X-XSS-Protection\", \"reason\": \"Basic XSS protection (older browsers)\"}]', 2),
(33, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'SQL Injection', 'High', 0, '[{\"note\": \"No SQL Injection patterns detected.\"}]', 2),
(34, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Cross-Site Scripting (XSS)', 'Medium', 0, '[{\"note\": \"No XSS patterns detected.\"}]', 2),
(35, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Cross-Site Request Forgery (CSRF)', 'Medium', 0, '[{\"note\": \"No forms found on the page.\"}]', 2),
(36, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Insecure Direct Object Reference (IDOR)', 'Medium', 0, '[{\"note\": \"No URL parameters found to test for IDOR.\"}]', 2),
(37, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Remote File Inclusion (RFI)', 'High', 0, '[{\"note\": \"No parameters found to test for RFI.\"}]', 2),
(38, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Directory Traversal', 'High', 0, '[{\"note\": \"No parameters found to test for Directory Traversal.\"}]', 2),
(39, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Open Redirect', 'Medium', 0, '[{\"note\": \"No parameters found to test for Open Redirect.\"}]', 2),
(40, 'https://iinfinityai.com/', '2025-05-18 12:58:20', 'Missing Security Headers', 'Low', 1, '[{\"missing_header\": \"Content-Security-Policy\", \"reason\": \"Helps prevent XSS attacks\"}, {\"missing_header\": \"Strict-Transport-Security\", \"reason\": \"Enforces HTTPS connections\"}, {\"missing_header\": \"X-Frame-Options\", \"reason\": \"Protects against clickjacking\"}, {\"missing_header\": \"X-Content-Type-Options\", \"reason\": \"Prevents MIME-sniffing\"}, {\"missing_header\": \"Referrer-Policy\", \"reason\": \"Controls referrer information\"}, {\"missing_header\": \"Permissions-Policy\", \"reason\": \"Restricts use of browser features\"}, {\"missing_header\": \"X-XSS-Protection\", \"reason\": \"Basic XSS protection (older browsers)\"}]', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(255) DEFAULT NULL,
  `dark_mode` tinyint(1) DEFAULT '0',
  `email_notifications` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `active`, `profile_image`, `dark_mode`, `email_notifications`) VALUES
(1, '', 'admin@example.com', 'pbkdf2:sha256:1000000$GCGd4m5vTFCDgUwr$ea04ef03807154b3e88355d50facfa525e58739609ca596673a9388ee80c65f6', 'admin', 1, NULL, 0, 1),
(2, 'user', 'user@example.com', 'pbkdf2:sha256:1000000$TZMFlKQZPZTgmGpY$8cd760d13d2760d61b27d0605c5786cd6982481b2beaf08f9793dee459af71e6', 'user', 1, NULL, 0, 1),
(3, 'newadmin', 'newadmin@example.com', 'scrypt:32768:8:1$4CQZuZCMIx8nS1dV$dfb71895df088ef6e384d2ba945aa298ba9eb56b3809432c8d0ec4467d4a25307e04aaf89b8b47e5e5a26cd9bfa280ffc932933787abdd20ac628648ccc45808', 'admin', 1, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_message`
--
ALTER TABLE `contact_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_result`
--
ALTER TABLE `scan_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ix_users_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_message`
--
ALTER TABLE `contact_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scan_result`
--
ALTER TABLE `scan_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scan_result`
--
ALTER TABLE `scan_result`
  ADD CONSTRAINT `scan_result_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
