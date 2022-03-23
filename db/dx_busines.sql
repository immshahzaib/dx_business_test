-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 08:47 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dx_busines`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_right` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `title`, `is_right`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hyperlinks and Text Markup Language', 'no', NULL, NULL, '2022-03-23 02:33:42', '2022-03-23 02:33:42'),
(2, 1, 'Hyper Text Markup Language', 'yes', NULL, NULL, '2022-03-23 02:33:59', '2022-03-23 02:33:59'),
(3, 1, 'Home Tool Markup Language', 'no', NULL, NULL, '2022-03-23 02:34:13', '2022-03-23 02:34:13'),
(4, 2, 'The World Wide Web Consortium', 'yes', NULL, NULL, '2022-03-23 02:34:35', '2022-03-23 02:34:35'),
(5, 2, 'Microsoft', 'no', NULL, NULL, '2022-03-23 02:34:47', '2022-03-23 02:34:47'),
(6, 2, 'Google', 'no', NULL, NULL, '2022-03-23 02:34:52', '2022-03-23 02:34:52'),
(7, 2, 'Mozilla', 'no', NULL, NULL, '2022-03-23 02:35:05', '2022-03-23 02:35:05'),
(8, 3, '<h1>', 'yes', NULL, NULL, '2022-03-23 02:35:50', '2022-03-23 02:35:50'),
(9, 3, '<heading>', 'no', NULL, NULL, '2022-03-23 02:36:00', '2022-03-23 02:36:00'),
(10, 3, '<head>', 'no', NULL, NULL, '2022-03-23 02:36:07', '2022-03-23 02:36:07'),
(11, 3, '<h6>', 'no', NULL, NULL, '2022-03-23 02:36:15', '2022-03-23 02:36:15'),
(12, 4, '<lb>', 'no', NULL, NULL, '2022-03-23 02:36:39', '2022-03-23 02:36:39'),
(13, 4, '<break>', 'no', NULL, NULL, '2022-03-23 02:36:46', '2022-03-23 02:36:46'),
(14, 4, '<br>', 'yes', NULL, NULL, '2022-03-23 02:36:57', '2022-03-23 02:36:57'),
(15, 5, '<body bg=\"yellow\">', 'no', NULL, NULL, '2022-03-23 02:37:21', '2022-03-23 02:37:21'),
(16, 5, '<background>yellow</background>', 'no', NULL, NULL, '2022-03-23 02:37:34', '2022-03-23 02:37:34'),
(17, 5, '<body style=\"background-color:yellow;\">', 'yes', NULL, NULL, '2022-03-23 02:38:02', '2022-03-23 02:38:02'),
(18, 6, '<strong>', 'no', NULL, NULL, '2022-03-23 02:39:10', '2022-03-23 02:39:10'),
(19, 6, '<i>', 'no', NULL, NULL, '2022-03-23 02:39:25', '2022-03-23 02:39:25'),
(20, 6, '<important>', 'no', NULL, NULL, '2022-03-23 02:39:40', '2022-03-23 02:39:40'),
(21, 6, '<b>', 'yes', NULL, NULL, '2022-03-23 02:39:47', '2022-03-23 02:39:47'),
(22, 7, '<italic>', 'no', NULL, NULL, '2022-03-23 02:41:59', '2022-03-23 02:41:59'),
(23, 7, '<em>', 'no', NULL, NULL, '2022-03-23 02:42:08', '2022-03-23 02:42:08'),
(24, 7, '<i>', 'yes', NULL, NULL, '2022-03-23 02:42:14', '2022-03-23 02:42:14'),
(25, 8, '<a>http://www.w3schools.com</a>', 'no', NULL, NULL, '2022-03-23 02:43:20', '2022-03-23 02:43:20'),
(26, 8, '<a href=\"http://www.w3schools.com\">W3Schools</a>', 'yes', NULL, NULL, '2022-03-23 02:43:35', '2022-03-23 02:43:35'),
(27, 8, '<a url=\"http://www.w3schools.com\">W3Schools.com</a>', 'no', NULL, NULL, '2022-03-23 02:43:53', '2022-03-23 02:43:53'),
(28, 8, '<a name=\"http://www.w3schools.com\">W3Schools.com</a>', 'no', NULL, NULL, '2022-03-23 02:44:07', '2022-03-23 02:44:07'),
(29, 9, '/', 'yes', NULL, NULL, '2022-03-23 02:44:27', '2022-03-23 02:44:27'),
(30, 9, '*', 'no', NULL, NULL, '2022-03-23 02:44:32', '2022-03-23 02:44:32'),
(31, 9, '<', 'no', NULL, NULL, '2022-03-23 02:44:40', '2022-03-23 02:44:40'),
(32, 9, '^', 'no', NULL, NULL, '2022-03-23 02:44:45', '2022-03-23 02:44:45'),
(33, 10, '<a href=\"url\" target=\"new\">', 'no', NULL, NULL, '2022-03-23 02:45:15', '2022-03-23 02:45:15'),
(34, 10, '<a href=\"url\" target=\"_blank\">', 'yes', NULL, NULL, '2022-03-23 02:45:31', '2022-03-23 02:45:31'),
(35, 10, '<a href=\"url\" new>', 'no', NULL, NULL, '2022-03-23 02:45:45', '2022-03-23 02:45:45'),
(36, 11, '<table><tr><td>', 'yes', NULL, NULL, '2022-03-23 02:46:11', '2022-03-23 02:46:11'),
(37, 11, '<thead><body><tr>', 'no', NULL, NULL, '2022-03-23 02:46:23', '2022-03-23 02:46:23'),
(38, 11, '<table><head><tfoot>', 'no', NULL, NULL, '2022-03-23 02:46:37', '2022-03-23 02:46:37'),
(39, 11, '<table><tr><tt>', 'no', NULL, NULL, '2022-03-23 02:46:51', '2022-03-23 02:46:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_22_165249_create_questions_table', 1),
(6, '2022_03_22_165423_create_answers_table', 1),
(7, '2022_03_22_165500_create_results_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'What does HTML stand for?', NULL, NULL, '2022-03-23 02:08:15', '2022-03-23 02:08:15'),
(2, 'Who is making the Web standards?', NULL, NULL, '2022-03-23 02:09:55', '2022-03-23 02:09:55'),
(3, 'Choose the correct HTML element for the largest heading:', NULL, NULL, '2022-03-23 02:11:44', '2022-03-23 02:11:44'),
(4, 'What is the correct HTML element for inserting a line break?', NULL, NULL, '2022-03-23 02:12:50', '2022-03-23 02:12:50'),
(5, 'What is the correct HTML for adding a background color?', NULL, NULL, '2022-03-23 02:13:52', '2022-03-23 02:13:52'),
(6, 'Choose the correct HTML element to define important text', NULL, NULL, '2022-03-23 02:15:31', '2022-03-23 02:15:31'),
(7, 'Choose the correct HTML element to define emphasized text', NULL, NULL, '2022-03-23 02:17:49', '2022-03-23 02:17:49'),
(8, 'What is the correct HTML for creating a hyperlink?', NULL, NULL, '2022-03-23 02:18:39', '2022-03-23 02:18:39'),
(9, 'Which character is used to indicate an end tag?', NULL, NULL, '2022-03-23 02:20:37', '2022-03-23 02:20:37'),
(10, 'How can you open a link in a new tab/browser window?', NULL, NULL, '2022-03-23 02:21:32', '2022-03-23 02:21:32'),
(11, 'Which of these elements are all <table> elements?', NULL, NULL, '2022-03-23 02:22:49', '2022-03-23 02:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
