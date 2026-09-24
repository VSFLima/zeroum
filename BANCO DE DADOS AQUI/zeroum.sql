-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27/01/2026 às 05:36
-- Versão do servidor: 11.8.3-MariaDB-log
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u859854438_Zeroum`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_withdraws`
--

CREATE TABLE `account_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `pix_type` varchar(255) NOT NULL,
  `pix_key` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `account_withdraws`
--

INSERT INTO `account_withdraws` (`id`, `name`, `pix_type`, `pix_key`, `document`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Joao', 'document', '11261678940', '11261678940', '2026-01-26 23:11:01', '2026-01-26 23:11:01', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `commission_type` varchar(191) DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT 0,
  `deposited_amount` decimal(10,2) DEFAULT 0.00,
  `losses` bigint(20) DEFAULT 0,
  `losses_amount` decimal(10,2) DEFAULT 0.00,
  `commission_paid` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receita` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aprove_save_settings`
--

CREATE TABLE `aprove_save_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approval_password_save` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_requested_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aprove_save_settings`
--

INSERT INTO `aprove_save_settings` (`id`, `approval_password_save`, `created_at`, `updated_at`, `last_requested_at`) VALUES
(1, '$2a$12$5s1xHIIGafcw6cMah..ls.FGiRMjCXGLQXT39P8UTcS.JD2Jna5OW', '2024-08-15 00:27:52', '2024-11-03 11:25:37', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `aprove_withdrawals`
--

CREATE TABLE `aprove_withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approval_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_requested_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aprove_withdrawals`
--

INSERT INTO `aprove_withdrawals` (`id`, `approval_password`, `created_at`, `updated_at`, `last_requested_at`) VALUES
(1, '$2a$12$ZASEGZuTt.d3KhqN6mx9pe0hMkBaIwpi/cVaD5j.EBokkpPreC1ti', '2024-08-14 21:27:52', '2024-11-03 11:25:22', '2024-10-08 15:54:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'home',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_image` varchar(191) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`, `mobile_image`) VALUES
(32, NULL, '01KFYZ3EE4PGWGR7KFCDMHFY0R.webp', 'carousel', NULL, '2025-03-27 22:50:41', '2026-01-27 02:33:56', ''),
(33, NULL, '01KFYZ42JB7DSHGW2B4YGWNH9C.webp', 'carousel', NULL, '2026-01-27 02:34:16', '2026-01-27 02:34:16', ''),
(34, NULL, '01KFYZ4M3W4XG261E4N7F0Q6N7.webp', 'carousel', NULL, '2026-01-27 02:34:34', '2026-01-27 02:34:34', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `baus`
--

CREATE TABLE `baus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bau_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `caminho` varchar(255) DEFAULT NULL,
  `dataS` timestamp NULL DEFAULT NULL,
  `aberto_em` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `value_mostrar` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `baus`
--

INSERT INTO `baus` (`id`, `user_id`, `bau_id`, `status`, `caminho`, `dataS`, `aberto_em`, `updated_at`, `created_at`, `value_mostrar`, `slug`) VALUES
(73, 17484654, 1, 3, '/assets/images/bauaberto.png', NULL, '2024-12-02 13:52:06', '2024-12-02 13:52:06', '2024-12-02 13:50:19', 'R$ 5', ''),
(74, 17484654, 2, 3, '/assets/images/bauaberto.png', NULL, '2024-12-02 15:20:09', '2024-12-02 15:20:09', '2024-12-02 15:20:05', 'R$ 5', ''),
(75, 17484658, 1, 3, '/assets/images/bauaberto.png', NULL, '2024-12-16 01:08:48', '2024-12-16 01:08:48', '2024-12-10 12:58:19', 'R$ 10', ''),
(76, 16, 1, 2, '/assets/images/bauliberado.png', NULL, NULL, '2025-06-03 20:37:56', '2025-06-03 20:37:56', NULL, ''),
(77, 16, 2, 2, '/assets/images/bauliberado.png', NULL, NULL, '2025-06-06 05:53:41', '2025-06-06 05:53:41', NULL, ''),
(78, 16, 3, 2, '/assets/images/bauliberado.png', NULL, NULL, '2025-06-13 18:53:19', '2025-06-13 18:53:19', NULL, ''),
(79, 16, 4, 2, '/assets/images/bauliberado.png', NULL, NULL, '2025-06-16 22:19:18', '2025-06-16 22:19:18', NULL, ''),
(80, 16, 5, 2, '/assets/images/bauliberado.png', NULL, NULL, '2025-06-20 10:54:39', '2025-06-20 10:54:39', NULL, ''),
(81, 11, 1, 3, '/assets/images/bauaberto.png', NULL, '2025-09-03 21:38:23', '2025-09-03 21:38:23', '2025-09-03 21:37:46', 'R$ 10', ''),
(82, 11, 2, 3, '/assets/images/bauaberto.png', NULL, '2025-09-05 20:02:44', '2025-09-05 20:02:44', '2025-09-05 20:02:29', 'R$ 10', ''),
(83, 11, 3, 3, '/assets/images/bauaberto.png', NULL, '2025-09-05 20:02:46', '2025-09-05 20:02:46', '2025-09-05 20:02:29', 'R$ 10', ''),
(84, 11, 4, 3, '/assets/images/bauaberto.png', NULL, '2025-09-06 01:05:12', '2025-09-06 01:05:12', '2025-09-06 01:05:07', 'R$ 10', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bs_pay_payments`
--

CREATE TABLE `bs_pay_payments` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdrawal_id` int(11) DEFAULT NULL,
  `pix_key` varchar(255) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `observation` text DEFAULT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bs_pay_payments`
--

INSERT INTO `bs_pay_payments` (`id`, `payment_id`, `user_id`, `withdrawal_id`, `pix_key`, `pix_type`, `amount`, `observation`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 17:37:09', '2024-10-08 17:37:09'),
(2, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 17:37:09', '2024-10-08 17:37:09'),
(3, 0, 1, 65, '06901053126', 'document', 5.00, 'bspay', 'pending', '2024-10-08 17:40:38', '2024-10-08 17:40:38'),
(4, 0, 1, 65, '06901053126', 'document', 5.00, 'bspay', 'pending', '2024-10-08 17:46:11', '2024-10-08 17:46:11'),
(5, 0, 1, 65, '06901053126', 'document', 5.00, 'bspay', 'pending', '2024-10-08 17:46:12', '2024-10-08 17:46:12'),
(6, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 17:46:42', '2024-10-08 17:46:42'),
(7, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 17:46:42', '2024-10-08 17:46:42'),
(8, 0, 1, 65, '06901053126', 'document', 5.00, 'bspay', 'pending', '2024-10-08 17:55:47', '2024-10-08 17:55:47'),
(9, 0, 1, 65, '06901053126', 'document', 5.00, 'bspay', 'pending', '2024-10-08 17:55:48', '2024-10-08 17:55:48'),
(10, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 18:06:03', '2024-10-08 18:06:03'),
(11, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 18:06:03', '2024-10-08 18:06:03'),
(12, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 18:07:02', '2024-10-08 18:07:02'),
(13, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-08 18:07:03', '2024-10-08 18:07:03'),
(14, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:12:42', '2024-10-08 19:12:42'),
(15, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:12:43', '2024-10-08 19:12:43'),
(16, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:15:17', '2024-10-08 19:15:17'),
(17, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:15:32', '2024-10-08 19:15:32'),
(18, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:15:32', '2024-10-08 19:15:32'),
(19, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:26:47', '2024-10-08 19:26:47'),
(20, 0, 1, 66, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-08 19:26:48', '2024-10-08 19:26:48'),
(21, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-09 05:01:39', '2024-10-09 05:01:39'),
(22, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-09 05:01:40', '2024-10-09 05:01:40'),
(23, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-09 06:03:42', '2024-10-09 06:03:42'),
(24, 0, 1, 64, '06901053126', 'document', 8.00, 'bspay', 'pending', '2024-10-09 06:03:42', '2024-10-09 06:03:42'),
(25, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-09 06:04:11', '2024-10-09 06:04:11'),
(26, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-09 06:04:12', '2024-10-09 06:04:12'),
(27, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-09 06:13:25', '2024-10-09 06:13:25'),
(28, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-09 06:13:26', '2024-10-09 06:13:26'),
(29, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:28:20', '2024-10-10 02:28:20'),
(30, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:28:20', '2024-10-10 02:28:20'),
(31, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:29:21', '2024-10-10 02:29:21'),
(32, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:29:21', '2024-10-10 02:29:21'),
(33, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:33:57', '2024-10-10 02:33:57'),
(34, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:33:58', '2024-10-10 02:33:58'),
(35, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:46:58', '2024-10-10 02:46:58'),
(36, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:46:59', '2024-10-10 02:46:59'),
(37, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:47:08', '2024-10-10 02:47:08'),
(38, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:47:09', '2024-10-10 02:47:09'),
(39, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:47:20', '2024-10-10 02:47:20'),
(40, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:47:21', '2024-10-10 02:47:21'),
(41, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:54:24', '2024-10-10 02:54:24'),
(42, 0, 1, 67, 'demetrio01jp@gmail.com', 'email', 1.00, 'bspay', 'pending', '2024-10-10 02:54:25', '2024-10-10 02:54:25'),
(43, 0, 17484632, 68, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-10 03:01:52', '2024-10-10 03:01:52'),
(44, 0, 17484632, 68, '06901053126', 'document', 1.00, 'bspay', 'pending', '2024-10-10 03:01:53', '2024-10-10 03:01:53'),
(45, 0, 17484632, 73, '06901053126', 'document', 2.00, 'suitpay', 'pending', '2024-10-10 04:50:56', '2024-10-10 04:50:56'),
(46, 0, 17484632, 73, '06901053126', 'document', 2.00, 'suitpay', 'pending', '2024-10-10 04:50:56', '2024-10-10 04:50:56'),
(47, 0, 17484632, 73, '06901053126', 'document', 2.00, 'suitpay', 'pending', '2024-10-10 04:54:46', '2024-10-10 04:54:46'),
(48, 0, 17484632, 73, '06901053126', 'document', 2.00, 'suitpay', 'pending', '2024-10-10 04:54:47', '2024-10-10 04:54:47'),
(49, 0, 17484632, 77, '06901053126', 'document', 1.00, 'suitpay', 'pending', '2024-10-11 02:46:28', '2024-10-11 02:46:28'),
(50, 0, 17484632, 78, '06901053126', 'document', 1.00, 'suitpay', 'pending', '2024-10-11 02:46:43', '2024-10-11 02:46:43'),
(51, 0, 17484632, 77, '06901053126', 'document', 1.00, 'suitpay', 'pending', '2024-10-11 02:46:56', '2024-10-11 02:46:56'),
(52, 0, 17484632, 80, '06901053126', 'document', 1.00, 'suitpay', 'pending', '2024-10-11 03:59:23', '2024-10-11 03:59:23'),
(53, 0, 17484658, 102, '85986083455', 'phoneNumber', 10.00, 'suitpay', 'pending', '2024-12-04 16:52:29', '2024-12-04 16:52:29'),
(54, 0, 17484658, 102, '85986083455', 'phoneNumber', 10.00, 'suitpay', 'pending', '2024-12-04 18:30:40', '2024-12-04 18:30:40'),
(55, 0, 17484658, 103, '85986083455', 'phoneNumber', 9.00, 'suitpay', 'pending', '2024-12-04 18:37:03', '2024-12-04 18:37:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_select` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`, `image_select`) VALUES
(30, 'Pescaria', 'Pescaria', '01JAPMXP24D838HX9TM6PVE3YK.png', 'pescaria', '2024-06-18 19:30:26', '2024-10-21 01:21:18', '01JAPMXP25ERRQ5JQRYQS03GJ2.png'),
(29, 'Pragmatic', 'PP', '01JAPMWSXYP1F3R0YADXKQYD1A.png', 'pragmatic', '2024-06-18 19:29:56', '2024-10-21 01:20:49', '01JAPMWSXZKAJM0S1QND14C1PC.png'),
(27, 'Popular', 'Popular', '01JAPMRKYAX217GFFEF0NNJE0X.png', 'popular', '2024-06-18 19:28:56', '2024-10-21 01:18:32', '01JAPMRKYBKAX3FSW6V8MW8SW9.png'),
(28, 'PG-Slot', 'PG-Slot', '01JDWXMJMDGTG2VJ8JJS6QSK7B.png', 'pg-slot', '2024-06-18 19:28:57', '2024-11-29 21:36:09', '01JDWXMJMFYA9D3YC3XPXS6YPR.png'),
(35, 'Esportes', 'Esportes', '01JAZW2GYWHFKWBAZDAT4BRK90.png', 'esportes', '2024-10-21 02:21:04', '2024-10-24 15:19:27', '01JAPRB3VCNA0TTVSFB84H4VC1.png'),
(36, 'Cartas', 'Cartas', '01JAZVS1QJX5WAM19VKK38D44E.png', 'cartas', '2024-10-21 02:23:00', '2024-10-24 15:14:16', '01JAPREMTSE8MWCRNXTPQRBXQG.avif');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `category_game`
--

INSERT INTO `category_game` (`category_id`, `game_id`) VALUES
(27, 12741),
(28, 36),
(28, 4),
(28, 13),
(28, 15),
(28, 38),
(28, 3),
(28, 28),
(28, 5),
(28, 53),
(28, 52),
(28, 45),
(28, 2),
(28, 7),
(28, 57),
(28, 9),
(28, 23),
(28, 8),
(28, 25),
(28, 6),
(34, 1180),
(29, 987),
(34, 1087),
(29, 1582),
(29, 1373),
(29, 1760),
(29, 1564),
(29, 1516),
(29, 1596),
(33, 403),
(33, 402),
(34, 1083),
(29, 1555),
(29, 1549),
(33, 399),
(33, 397),
(33, 1192),
(33, 1194),
(29, 1841),
(28, 1841),
(28, 1760),
(28, 1596),
(28, 1582),
(28, 1564),
(28, 1549),
(28, 1555),
(28, 41),
(27, 45842),
(34, 1135),
(33, 412),
(34, 1134),
(27, 1108),
(28, 1108),
(34, 1116),
(34, 1114),
(27, 45837),
(28, 45837),
(27, 45838),
(28, 45838),
(27, 45839),
(28, 45839),
(27, 45840),
(28, 45840),
(33, 416),
(33, 415),
(27, 45841),
(28, 45841),
(33, 408),
(33, 407),
(33, 411),
(28, 45843),
(27, 45843),
(33, 425),
(33, 419),
(28, 45842),
(28, 45844),
(27, 45844),
(27, 45845),
(28, 45845),
(35, 45845),
(27, 45846),
(28, 45846),
(27, 45861),
(28, 45861),
(27, 45860),
(28, 45860),
(27, 45859),
(28, 45859),
(27, 45858),
(28, 45858),
(27, 45857),
(28, 45857),
(27, 45856),
(28, 45856),
(27, 45855),
(28, 45855),
(27, 45854),
(28, 45854),
(27, 45853),
(28, 45853),
(27, 45852),
(28, 45852),
(27, 45851),
(28, 45851),
(27, 45850),
(28, 45850),
(27, 12741),
(28, 37),
(28, 4),
(28, 14),
(28, 16),
(28, 40),
(28, 3),
(28, 35),
(28, 5),
(28, 19),
(28, 21),
(28, 44),
(28, 2),
(28, 7),
(28, 55),
(28, 9),
(28, 24),
(28, 8),
(28, 26),
(28, 6),
(34, 1175),
(34, 1174),
(29, 987),
(34, 1086),
(29, 1582),
(29, 1373),
(29, 1760),
(29, 1564),
(29, 1516),
(29, 1596),
(33, 401),
(33, 400),
(34, 1080),
(29, 1555),
(29, 1549),
(33, 1190),
(33, 1191),
(33, 1193),
(33, 1195),
(29, 1841),
(28, 1841),
(28, 1760),
(28, 1596),
(28, 1582),
(28, 1564),
(28, 1549),
(28, 1555),
(28, 49),
(27, 45842),
(34, 1131),
(33, 410),
(33, 427),
(34, 1126),
(27, 1108),
(28, 1108),
(34, 1112),
(34, 1111),
(34, 1125),
(27, 45837),
(28, 45837),
(27, 45838),
(28, 45838),
(27, 45839),
(28, 45839),
(27, 45840),
(28, 45840),
(33, 414),
(33, 413),
(27, 45841),
(28, 45841),
(33, 406),
(33, 404),
(33, 409),
(28, 45843),
(27, 45843),
(33, 426),
(33, 418),
(33, 417),
(28, 45842),
(28, 45844),
(27, 45844),
(27, 45845),
(28, 45845),
(35, 45845),
(27, 45846),
(28, 45846),
(27, 45861),
(28, 45861),
(27, 45860),
(28, 45860),
(27, 45859),
(28, 45859),
(27, 45858),
(28, 45858),
(27, 45857),
(28, 45857),
(27, 45856),
(28, 45856),
(27, 45855),
(28, 45855),
(27, 45854),
(28, 45854),
(27, 45853),
(28, 45853),
(27, 45852),
(28, 45852),
(27, 45851),
(28, 45851),
(27, 45850),
(28, 45850),
(27, 45862),
(28, 45862),
(27, 1),
(27, 458487),
(28, 458487),
(27, 458497),
(28, 458497),
(27, 458507),
(28, 458507),
(28, 458517),
(27, 458517),
(33, 12547),
(33, 12544),
(33, 12542),
(33, 12540),
(33, 12537),
(33, 12536),
(33, 12533),
(33, 12532),
(33, 12530),
(33, 12528),
(33, 12526),
(33, 12524),
(33, 12523),
(33, 12522),
(33, 12520),
(33, 12518),
(33, 12516),
(33, 12515),
(33, 12502),
(33, 12501),
(33, 12500),
(33, 12499),
(33, 12510),
(33, 12509),
(33, 12508),
(33, 12507),
(33, 12494),
(33, 12493),
(33, 12492),
(33, 12565),
(33, 12562),
(33, 12563),
(33, 12564),
(33, 8891),
(33, 8892),
(33, 12566),
(33, 1189),
(33, 1188),
(28, 42),
(28, 17),
(28, 18),
(28, 12),
(28, 11),
(28, 58),
(28, 59),
(29, 65),
(29, 76),
(29, 135),
(29, 143),
(29, 148),
(29, 152),
(29, 170),
(29, 171),
(29, 177),
(29, 179),
(29, 185),
(29, 198),
(29, 200),
(29, 202),
(29, 204),
(29, 208),
(29, 209),
(29, 220),
(29, 222),
(29, 223),
(29, 226),
(29, 240),
(29, 256),
(29, 264),
(29, 267),
(29, 274),
(29, 299),
(29, 300),
(29, 304),
(29, 306),
(29, 317),
(29, 329),
(29, 336),
(29, 350),
(29, 362),
(29, 363),
(29, 367),
(29, 369),
(29, 371),
(29, 375),
(29, 378),
(29, 381),
(29, 396),
(34, 764),
(34, 763),
(34, 766),
(34, 765),
(34, 799),
(33, 811),
(34, 809),
(34, 781),
(34, 778),
(34, 1090),
(34, 1091),
(34, 1094),
(34, 1096),
(30, 240),
(30, 267),
(30, 299),
(30, 304),
(30, 329),
(30, 363),
(30, 369),
(30, 378),
(30, 152),
(27, 1193),
(27, 1195),
(27, 397),
(27, 1192),
(27, 1194),
(27, 1190);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 18:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 18:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 18:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 18:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 18:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 18:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 18:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 18:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 18:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 18:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 18:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 18:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 18:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 18:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 18:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 18:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 18:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 18:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 18:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 18:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 18:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 18:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 18:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 18:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 18:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 18:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 18:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 18:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 18:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 18:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 18:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 18:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 18:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 18:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 18:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 18:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 18:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 18:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 18:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 18:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 18:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 18:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 18:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 18:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 18:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 18:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 18:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 18:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 18:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 18:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 18:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 18:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 18:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 18:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 18:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 18:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 18:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 18:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 18:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 18:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 18:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 18:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 18:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 18:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 18:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 18:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 18:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 18:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 18:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 18:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 18:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 18:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 18:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 18:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 18:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 18:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 18:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 18:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 18:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 18:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 18:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 18:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 18:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 18:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 18:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 18:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 18:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 18:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 18:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 18:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 18:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 18:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 18:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 18:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 18:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 18:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 18:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 18:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 18:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 18:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 18:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 18:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 18:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 18:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 18:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 18:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 18:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 18:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 18:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 18:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 18:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 18:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 18:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `font_family_default` varchar(191) DEFAULT NULL,
  `primary_color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `title_color` varchar(20) NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `background_color_cassino` varchar(20) NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) DEFAULT '#24262B',
  `carousel_banners` varchar(20) DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) DEFAULT '#1E2024',
  `sidebar_color` varchar(20) DEFAULT NULL,
  `sidebar_color_dark` varchar(20) DEFAULT NULL,
  `navtop_color` varchar(20) DEFAULT NULL,
  `navtop_color_dark` varchar(20) DEFAULT NULL,
  `side_menu` varchar(20) DEFAULT NULL,
  `side_menu_dark` varchar(20) DEFAULT NULL,
  `footer_color` varchar(20) DEFAULT NULL,
  `footer_color_dark` varchar(20) DEFAULT NULL,
  `border_radius` varchar(20) NOT NULL DEFAULT '.25rem',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `whastapp` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `search_border_color` varchar(20) NOT NULL,
  `Border_bottons_and_selected` varchar(20) NOT NULL,
  `background_bottom_navigation` varchar(20) DEFAULT NULL,
  `background_bottom_navigation_dark` varchar(20) DEFAULT NULL,
  `borders_and_dividers_colors` varchar(20) DEFAULT NULL,
  `search_back` varchar(20) DEFAULT NULL,
  `color_bt_1` varchar(20) DEFAULT NULL,
  `color_bt_2` varchar(20) DEFAULT NULL,
  `color_bt_3` varchar(20) DEFAULT NULL,
  `color_bt_4` varchar(20) DEFAULT NULL,
  `bt_1_link` varchar(191) DEFAULT NULL,
  `bt_2_link` varchar(191) DEFAULT NULL,
  `bt_3_link` varchar(191) DEFAULT NULL,
  `bt_4_link` varchar(191) DEFAULT NULL,
  `bt_5_link` varchar(191) DEFAULT NULL,
  `value_color_jackpot` varchar(20) DEFAULT NULL,
  `value_wallet_navtop` varchar(20) DEFAULT NULL,
  `bonus_color_dep` varchar(20) DEFAULT NULL,
  `colors_deposit_value` varchar(20) DEFAULT NULL,
  `color_players` varchar(20) DEFAULT NULL,
  `modal_termos_register` longtext DEFAULT NULL,
  `modal_termos_cpf` longtext DEFAULT NULL,
  `placeholder_background` varchar(20) DEFAULT NULL,
  `card_transaction` varchar(20) DEFAULT NULL,
  `back_sub_color` varchar(20) DEFAULT NULL,
  `item_sub_color` varchar(20) DEFAULT NULL,
  `text_sub_color` varchar(20) DEFAULT NULL,
  `title_sub_color` varchar(20) DEFAULT NULL,
  `botao_deposito_background_nav` varchar(20) DEFAULT NULL,
  `botao_deposito_text_nav` varchar(20) DEFAULT NULL,
  `botao_login_background_nav` varchar(20) DEFAULT NULL,
  `botao_login_text_nav` varchar(20) DEFAULT NULL,
  `botao_registro_background_nav` varchar(20) DEFAULT NULL,
  `botao_registro_text_nav` varchar(20) DEFAULT NULL,
  `botao_login_background_modal` varchar(20) DEFAULT NULL,
  `botao_login_text_modal` varchar(20) DEFAULT NULL,
  `botao_registro_background_modal` varchar(20) DEFAULT NULL,
  `botao_registro_text_modal` varchar(20) DEFAULT NULL,
  `botao_registro_border_nav` varchar(20) DEFAULT NULL,
  `botao_login_border_nav` varchar(20) DEFAULT NULL,
  `botao_deposito_border_nav` varchar(20) DEFAULT NULL,
  `invert_percentage` decimal(5,2) DEFAULT 50.00,
  `sepia_percentage` decimal(5,2) DEFAULT 5.00,
  `saturate_percentage` decimal(5,2) DEFAULT 500.00,
  `hue_rotate_deg` decimal(5,2) DEFAULT 190.00,
  `brightness_percentage` decimal(5,2) DEFAULT 100.00,
  `contrast_percentage` decimal(5,2) DEFAULT 100.00,
  `botao_deposito_text_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_background_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_border_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_text_saq` varchar(255) DEFAULT NULL,
  `botao_deposito_background_saq` varchar(255) DEFAULT NULL,
  `botao_deposito_border_saq` varchar(255) DEFAULT NULL,
  `text_opacity` decimal(3,2) DEFAULT 1.00 COMMENT 'Opacidade do texto (0 a 1)',
  `background_color_category` varchar(20) DEFAULT NULL,
  `background_color_jackpot` varchar(20) DEFAULT NULL,
  `text_color_footer` varchar(20) DEFAULT NULL,
  `opacity_categories` varchar(20) DEFAULT NULL,
  `opacity_bottom_nav` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color_cassino`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `footer_color`, `footer_color_dark`, `border_radius`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`, `search_border_color`, `Border_bottons_and_selected`, `background_bottom_navigation`, `background_bottom_navigation_dark`, `borders_and_dividers_colors`, `search_back`, `color_bt_1`, `color_bt_2`, `color_bt_3`, `color_bt_4`, `bt_1_link`, `bt_2_link`, `bt_3_link`, `bt_4_link`, `bt_5_link`, `value_color_jackpot`, `value_wallet_navtop`, `bonus_color_dep`, `colors_deposit_value`, `color_players`, `modal_termos_register`, `modal_termos_cpf`, `placeholder_background`, `card_transaction`, `back_sub_color`, `item_sub_color`, `text_sub_color`, `title_sub_color`, `botao_deposito_background_nav`, `botao_deposito_text_nav`, `botao_login_background_nav`, `botao_login_text_nav`, `botao_registro_background_nav`, `botao_registro_text_nav`, `botao_login_background_modal`, `botao_login_text_modal`, `botao_registro_background_modal`, `botao_registro_text_modal`, `botao_registro_border_nav`, `botao_login_border_nav`, `botao_deposito_border_nav`, `invert_percentage`, `sepia_percentage`, `saturate_percentage`, `hue_rotate_deg`, `brightness_percentage`, `contrast_percentage`, `botao_deposito_text_dep`, `botao_deposito_background_dep`, `botao_deposito_border_dep`, `botao_deposito_text_saq`, `botao_deposito_background_saq`, `botao_deposito_border_saq`, `text_opacity`, `background_color_category`, `background_color_jackpot`, `text_color_footer`, `opacity_categories`, `opacity_bottom_nav`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#f7f7f7', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#000000', '#000000', '#000000', '#', '#', '#000000', '#1a1818', '#000000', '#000000', '#1e1e1f', '#000000', '#000000', '#1e1e1f', '1.3125rem', '2024-01-01 17:36:03', '2025-03-02 00:09:56', 'https://intagram.com', 'https://facebook.com', 'https://telegram.org', 'https://x.com', 'https://whatsapp.com', 'https://youtube.com', '#6D7A91', '#116b61', '#000000', '#000000', '#6D7A91', '#161D29', '#3E95FE', '#F45C4E', '#ca50f3', '#fbaf01', '/profile/linkconvite', '/profile/promocoes', '/profile/messages', '/profile/promocoes?tab=vip', 'https://telegram.org', '#000000', '#ffffff', '#23632b', '#ffffff', '#ffffff', '<p>1. Introduction<br><br>1.1. Ao usar, visitar e/ou acessar qualquer parte do DZD777 e/ou qualquer subdomínio, site ou aplicativo móvel que possuímos ou operamos (o “Website”) e/ou registrar uma conta no Website, você concorda em estar vinculado a estes Termos e Condições, nossa Política de Privacidade, nossa Política de Cookies e quaisquer outras regras aplicáveis aos nossos produtos de apostas ou jogos disponíveis no Website (juntos, os \"Termos\"), e é considerado como tendo aceitado e entendido todos os Termos.<br><br>1.2. Você deve ler os Termos com atenção. Se não concordar com eles e/ou não puder aceitá-los, não use, visite ou acesse o Website.<br><br>1.3. Estes Termos podem ser alterados por nós de tempos em tempos por qualquer motivo (incluindo conformidade com a legislação aplicável ou requisitos dos reguladores). A versão atual dos Termos estará disponível no Website. Se você continuar a usar o Website após essas alterações entrarem em vigor, você será considerado como tendo aceitado tais alterações aos Termos.<br><br>1.4. O DEMOCASSINO é operado pela CLUBE777 N.V., uma empresa registrada sob as leis de Curaçau sob o número de registro 137692.<br><br>1.5. A referência a “você”, “seu”, “cliente”, “usuário” ou “jogador” significa qualquer pessoa que use o Website ou quaisquer serviços disponíveis nele e/ou qualquer cliente registrado do Website.<br><br>1.6. A referência a “jogos” significa Cassino, Cassino ao Vivo, Apostas Esportivas, cartas e outros jogos que possam, de tempos em tempos, tornar-se disponíveis no Website. A CLUBE777 N.V. reserva-se o direito de adicionar e remover Jogos do Website a seu critério.<br><br>2. Sua Conta<br><br>2.1. Requisitos legais<br><br>2.1.1. A referência à “Conta” significa uma conta registrada por você no Website após aceitar e concordar com estes Termos. Ao registrar uma Conta, você declara que tem mais de 18 anos de idade ou a maioridade legal mínima mais alta conforme estipulado na jurisdição de sua residência sob as leis aplicáveis a você. É sua responsabilidade saber se os serviços disponíveis no Website são legais no país de sua residência. Pessoas com menos de 18 anos não estão autorizadas a usar o Website e/ou quaisquer serviços disponíveis nele.<br><br>2.1.2. Você não está autorizado a registrar no Website e usar nossos serviços se for residente de Aruba, Austrália, Bonaire, Curaçau, França, Irã, Iraque, Países Baixos, Saba, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Reino Unido. Reservamo-nos o direito de recusar clientes de quaisquer outros países além das jurisdições acima mencionadas a nosso critério.<br><br>2.2. Registro de Conta<br><br>2.2.1. Para fazer apostas, jogar jogos e depositar dinheiro, você precisa registrar a Conta no Website.<br><br>2.2.2. Para registrar a Conta, você deve fornecer informações completas e atualizadas, incluindo um número de telefone móvel, endereço de e-mail, nome de usuário, senha e outras informações obrigatórias solicitadas no formulário de registro.<br><br>2.2.3. Ao registrar a Conta no Website, você concorda em especificar seu nome legal. Podemos tomar medidas para verificar a precisão das informações que você fornece. Você não está autorizado a alterar esses dados, mas há casos em que você pode solicitar individualmente a alteração de dados entrando em contato com o suporte ao cliente do Website, como em caso de erro honesto, etc.<br><br>2.2.4. Se você escolher, ou se for fornecido com um nome de usuário, senha ou qualquer outra informação como parte de nossos procedimentos de segurança, você deve tratar essas informações como confidenciais e não deve divulgá-las a terceiros. Não somos responsáveis por qualquer abuso ou uso indevido de sua Conta por terceiros devido à sua divulgação, seja intencional ou acidental, ativa ou passiva, dos detalhes de login a terceiros. Nunca solicitaremos que você revele sua senha e nunca iniciaremos contato com você para pedir os memorizadores associados à sua senha.<br><br>2.2.5. Funcionários, ex-funcionários de prestadores de serviços e/ou pessoas afiliadas não estão autorizados a registrar contas no Website e não podem explorar os serviços e promoções disponíveis nele. As mesmas regras se aplicam aos membros da família dos acima mencionados. A violação desta regra resultará no fechamento permanente da conta e as contas referidas serão consideradas fraudulentas. Qualquer ganho derivado de tais atividades será considerado como perdido pelo titular da conta e apenas o valor depositado será devolvido ao titular da conta.<br><br>2.2.6. Você não pode transferir, vender ou penhorar Sua Conta para outra pessoa. Esta proibição inclui a transferência de quaisquer ativos de valor de qualquer tipo, incluindo, mas não se limitando a, propriedade de contas, ganhos, depósitos, apostas, direitos e/ou reivindicações relacionadas a esses ativos, legais, comerciais ou de qualquer outra forma. A proibição de tais transferências também inclui, mas não se limita a, ônus, penhor, cessão, usufruto, comercialização, corretagem, hipoteca e/ou doação em cooperação com um fiduciário ou qualquer outro terceiro, empresa, pessoa natural ou jurídica, fundação e/ou associação de qualquer forma.<br><br>2.3. Problemas com a Conta<br><br>2.3.1. Se você esquecer sua senha ou achar que alguém conhece detalhes de seus dados pessoais, além de suspeitar que outro usuário está se beneficiando injustamente por meio de trapaça ou conluio, você deve relatar a suspeita para nós.<br><br>2.3.2. Reservamo-nos o direito de declarar qualquer aposta ou transação nula total ou parcialmente se, a nosso critério, considerarmos óbvio que qualquer uma das seguintes circunstâncias tenha ocorrido:<br><br>o titular da Conta ou pessoas associadas ao titular da Conta podem influenciar direta ou indiretamente o resultado de um evento;<br><br>o titular da Conta e/ou pessoas associadas ao titular da Conta estão direta ou indiretamente evitando as regras do Website;<br><br>o resultado de um evento ou a aposta foi direta ou indiretamente afetado por atividade criminosa;<br><br>as odds de um evento foram significativamente alteradas devido a um anúncio público relacionado ao evento;<br><br>apostas foram feitas que não teriam sido aceitas de outra forma, mas foram aceitas durante períodos em que o Website foi afetado por problemas técnicos;<br><br>devido a um erro, como um engano, erro de impressão, erro técnico, erro humano, força maior ou outro, apostas foram oferecidas, feitas e/ou aceitas devido a esse erro.<br><br>2.3.3. Quando fecharmos ou suspendermos uma Conta por qualquer motivo, reservamo-nos o direito de fechar quaisquer futuras Contas que possam ser registradas pela mesma pessoa, dispositivo, endereço ou que possam usar as mesmas carteiras de pagamento ou cartões de crédito e anular/cancelar todas as apostas e transações dessas Contas.<br><br>2.3.4. Oferecemos autenticação de dois fatores (2FA) como proteção adicional contra o uso não autorizado de sua Conta. Você é responsável por manter suas informações de login confidenciais e garantir que não possam ser acessadas por outra pessoa.<br><br>2.4. Ao registrar a Conta no Website, você se compromete, declara e garante que:<br><br>2.4.1. Você tem mais de 18 anos ou a maioridade legal mínima estipulada nas leis da jurisdição aplicável a você e, sob as leis aplicáveis a você, é permitido participar dos Jogos oferecidos no Website.<br><br>2.4.2. Você usará este Website e sua Conta única e exclusivamente para a participação genuína nos Jogos e não para quaisquer operações financeiras ou outras; sua participação nos Jogos será estritamente em sua capacidade pessoal não profissional, apenas para fins recreativos e de entretenimento.<br><br>2.4.3. Você participa dos Jogos em seu próprio nome e não em nome de outra pessoa;<br><br>2.4.4. Você não é residente em Curaçau, França, Irã, Iraque, Países Baixos, Coreia do Norte, Singapura, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Ucrânia, Reino Unido.<br><br>2.4.5. Todas as informações que você fornecer à SLOTCLUBE777 N.V. são verdadeiras, completas e corretas, e que você deverá nos notificar imediatamente sobre qualquer alteração dessas informações.<br><br>2.4.6. Você é o único responsável por relatar e contabilizar quaisquer impostos aplicáveis a você de acordo com as leis relevantes para quaisquer ganhos que você receba da SLOTCLUBE777 N.V.<br><br>2.4.7. Todo o dinheiro que você deposita em sua Conta não está contaminado com qualquer ilegalidade e, em particular, não origina de qualquer atividade ou fonte ilegal.<br><br>2.4.8. Você entende que, ao participar dos Jogos, você assume o risco de perder o dinheiro depositado em sua Conta.<br><br>2.4.9. Você não deve se envolver em qualquer atividade fraudulenta, colusiva, manipulação ou outra atividade ilegal em relação à sua participação ou à participação de terceiros em qualquer um dos Jogos e não deve usar métodos ou técnicas assistidas por software ou dispositivos de hardware para sua participação em qualquer um dos Jogos. A SLOTCLUBE777 N.V. reserva-se o direito de invalidar ou fechar sua Conta ou invalidar sua participação em um Jogo em caso de tal comportamento.<br><br>2.4.10. Em relação a depósitos e retiradas de fundos, você fornecerá um método de pagamento válido e autorizado em seu nome e que não usará qualquer método de pagamento que não seja de sua própria propriedade. A SLOTCLUBE777 N.V. reserva-se o direito de verificar o método de pagamento e/ou o endereço de e-mail fornecido e de exigir documentos para tal verificação. Além disso, a SLOTCLUBE777 N.V. pode solicitar que você forneça uma identificação válida para verificar sua identidade, se necessário, de acordo com as leis aplicáveis à prevenção de crimes financeiros, lavagem de dinheiro e financiamento do terrorismo.<br><br>3. Depósitos e Retiradas<br><br>3.1. Depósitos<br><br>3.1.1. Quando você faz um depósito em sua Conta, você está confirmando que você é o proprietário dos fundos depositados e que os fundos não são de qualquer fonte ilegal.<br><br>3.1.2. O montante mínimo e máximo que pode ser depositado em sua Conta depende da moeda e do método de depósito utilizado. A SLOTCLUBE777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.<br><br>3.1.3. Ao fazer um depósito, você deve garantir que o método de pagamento usado está em seu nome. Qualquer depósito feito através de um método de pagamento que não esteja em seu nome pode ser recusado e retornado.<br><br>3.1.4. Todos os depósitos são processados de acordo com nossos procedimentos e podem levar algum tempo para serem creditados na sua Conta.<br><br>3.2. Retiradas<br><br>3.2.1. Para retirar fundos de sua Conta, você deve solicitar uma retirada através da área de gerenciamento de conta no Website.<br><br>3.2.2. O montante mínimo e máximo que pode ser retirado depende da moeda e do método de retirada utilizado. A CLUBE777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.<br><br>3.2.3. Todas as retiradas estão sujeitas a verificação de identidade e podem estar sujeitas a verificações adicionais de segurança. A CLUBE777&nbsp; N.V. pode solicitar documentos adicionais para verificar sua identidade e a origem dos fundos.<br><br>3.2.4. A CLUBE777 N.V. reserva-se o direito de cobrar uma taxa de processamento para retiradas, dependendo do método de retirada e dos valores envolvidos. As taxas aplicáveis serão informadas a você antes de concluir a transação de retirada.<br><br>3.2.5. O tempo necessário para processar uma retirada pode variar dependendo do método de retirada escolhido. Em geral, tentaremos processar todas as retiradas o mais rápido possível.<br><br>4. Uso Responsável<br><br>4.1. Jogar deve ser uma forma de entretenimento e não uma maneira de ganhar dinheiro. Você deve se certificar de que você está jogando de maneira responsável e não gastando mais do que você pode perder.<br><br>4.2. Se você acha que pode ter um problema com o jogo, há ferramentas e recursos disponíveis para ajudar. Recomendamos que você utilize as opções de autoexclusão e limites de depósito disponíveis no Website.<br><br>4.3. Se você deseja se autoexcluir, entre em contato com nosso suporte ao cliente para obter assistência na configuração da autoexclusão.<br><br>5. Encerramento e Suspensão de Conta<br><br>5.1. A CLUBE777 N.V. reserva-se o direito de suspender ou encerrar sua Conta a qualquer momento, a seu exclusivo critério, e sem aviso prévio, se acreditarmos que você violou estes Termos ou se tivermos qualquer outra razão para acreditar que você pode ter se envolvido em atividade fraudulenta, ilegal ou não autorizada.<br><br>5.2. Se sua Conta for encerrada ou suspensa, qualquer saldo remanescente em sua Conta pode ser devolvido a você, menos quaisquer taxas ou encargos aplicáveis, e qualquer saldo remanescente poderá ser perdido a critério da CLUBE777 N.V.<br><br>6.15. O valor máximo diário de ganhos para um Cliente não pode exceder 100.000 Euros ou o equivalente na moeda da sua Conta. O “dia” significa o período entre 00:00 GMT e 23:59 GMT.<br><br>7. Fechamento da Conta<br><br>7.1. Você pode fechar sua Conta a qualquer momento e solicitar a retirada do saldo da Conta, sujeito à dedução das taxas de retirada relevantes. Para fechar sua Conta, você deve primeiro cancelar quaisquer apostas em aberto, se aplicável, e entrar em contato com o suporte ao cliente do Website. O fechamento efetivo da Conta corresponderá à rescisão da SLOTCLUBE777 N.V.. Se o motivo do fechamento da Conta estiver relacionado a preocupações sobre possível adição ao jogo, você deve informar a SLOTCLUBE777 N.V..<br><br>7.2. O método de reembolso será a nosso critério absoluto.<br><br>7.3. A CLUBE777 N.V. reserva-se o direito de fechar sua Conta e reembolsar o saldo “Disponível para retirada”, sujeito à dedução das taxas de retirada relevantes, a critério absoluto da SLOTCLUBE777 N.V. e sem qualquer obrigação de fornecer um motivo ou aviso prévio.<br><br>7.4. A CLUBE777 N.V. reserva-se o direito de cancelar e remover qualquer valor de bônus concedido a você se não for utilizado dentro de 1 mês a partir da data em que foi concedido.<br><br>7.5. A CLUBE777 N.V. reserva-se o direito de recusar uma reivindicação de retirada em caso de fraude, momento em que uma Conta será suspensa e o pagamento não será processado.<br><br>7.6. A CLUBE777 N.V. revisará todas as Contas de jogadores e as classificará a seu critério. Uma vez que um jogador seja classificado como “caçador de bônus” ou “abusador de bônus”, todos os ganhos e bônus serão anulados e a Conta será suspensa e o pagamento não será processado.<br><br>8. Informações Pessoais<br><br>8.1. Cumpriremos as leis de proteção de dados aplicáveis em relação às informações pessoais que você nos fornecer. Suas informações pessoais são processadas de acordo com nossa Política de Privacidade, cuja cópia está disponível clicando aqui.<br><br>9. Jogos Interrompidos e Abortados<br><br>9.1. Atividade Criminosa: Caso seja notada qualquer irregularidade (incluindo suspeita de tentativa de lavagem de dinheiro ou fraude), a CLUBE777 N.V. reserva-se o direito de fechar Contas e/ou relatar atividades criminosas ou suspeitas às autoridades regulatórias ou de aplicação da lei relevantes. Todos os saldos das Contas dos infratores serão bloqueados, retiradas serão anuladas e depósitos e ganhos serão perdidos.<br><br>9.2. Colusão e trapaça: A CLUBE777 N.V. tem o direito de desativar Contas de usuários e confiscar os saldos das Contas (incluindo depósitos e ganhos) se detectar tentativa de obter vantagem por meio da troca de informações sobre suas cartas ou estabelecer um acordo colusivo com outros usuários para obter uma vantagem injusta. Essas vantagens podem consistir em despejo de fichas e transferências, discussão de uma mão durante o jogo, uso múltiplo de uma única Conta, jogo suave. A CLUBE777 N.V. realiza uma rigorosa análise do jogo por meios manuais e automatizados e investiga todas as reclamações relacionadas de usuários. Além disso, a CLUBE777 N.V. realiza análises proativas e aleatórias de jogadas e Contas.<br><br>9.3. Atividade Fraudulenta: Quando a CLUBE777 N.V. detectar atividade fraudulenta, ilegal, desonesta ou imprópria (incluindo o uso de VPN, proxy ou serviço semelhante que mascara ou manipula a identificação de sua localização real, ou fazer apostas, apostas ou jogo de poker por meio de um terceiro ou em nome de um terceiro) no Website, temos o direito de bloquear a Conta do usuário e confiscar todos os saldos da Conta sem notificação prévia. Nesses casos, a SLOTCLUBE777 N.V. reserva-se o direito de relatar a atividade fraudulenta às autoridades regulatórias e de aplicação da lei, incluindo, mas não se limitando a, bancos, empresas de cartões de crédito e/ou qualquer pessoa ou entidade que tenha o direito legal a tais informações, e/ou tomar medidas legais contra o usuário.<br><br>10. Chat ao Vivo<br><br>10.1. Como parte do uso do Website, a CLUBE777 N.V. pode fornecer a você uma funcionalidade de chat, que é moderada por nós e sujeita a controles. Reservamo-nos o direito de revisar o chat e manter um registro de todas as declarações feitas nessa funcionalidade. Seu uso da funcionalidade de chat deve ser para fins recreativos e de socialização, e está sujeito às seguintes regras.<br><br>10.2. Você não deve fazer declarações sexualmente explícitas ou extremamente ofensivas, incluindo expressões de preconceito, racismo, ódio ou profanidade.<br><br>10.3. Você não deve fazer declarações abusivas, difamatórias ou que assediam ou insultam o Website ou a CLUBE777 N.V..<br><br>10.4. Você não deve fazer declarações que anunciem, promovam ou se relacionem com outras entidades online.<br><br>10.5. Você não deve fazer declarações sobre a CLUBE777 N.V., o Website ou quaisquer outros sites da Internet conectados à CLUBE777 N.V. que sejam falsas e/ou maliciosas e/ou prejudiciais à CLUBE777 N.V..<br><br>10.6. Você não deve fazer colusão através dos chats ou chats separados. Qualquer chat suspeito será relatado à autoridade regulatória ou de aplicação da lei relevante.<br><br>10.7. No caso de você violar qualquer uma das disposições acima relacionadas à funcionalidade de chat, a CLUBE777 N.V. terá o direito de remover o chat room ou encerrar imediatamente sua Conta. Após tal rescisão, a CLUBE777 N.V. reembolsará quaisquer fundos que possam estar em sua Conta, além de qualquer valor que possa ser devido a nós naquele momento (se houver).<br><br>11. Jogos Interrompidos e Abortados<br><br>11.1. A CLUBE777 N.V. não é responsável por qualquer inatividade, interrupções do servidor, atraso ou qualquer perturbação técnica ou política ao jogo. Reembolsos podem ser concedidos apenas a critério da CLUBE777 N.V..<br><br>11.2. A SLOTCLUBE777 N.V. não aceita qualquer responsabilidade por danos ou perdas que sejam considerados ou alegados como resultantes de ou em conexão com o Website ou seu conteúdo, incluindo, sem limitação, atrasos ou interrupções na operação ou transmissão, perda ou corrupção de dados, falha na comunicação ou linhas, uso indevido do Website ou seu conteúdo por qualquer pessoa ou erros ou omissões no conteúdo.<br><br>11.3. No caso de um mau funcionamento do sistema do cassino, todas as apostas são nulas.<br><br>11.4. No caso de um Jogo ser iniciado mas abortado devido a uma falha no sistema, a SLOTCLUBE777 N.V. reembolsará o valor apostado no Jogo, creditando-o em sua Conta ou, se a Conta não existir mais, pagando-o de uma forma aprovada; e se você tiver um crédito acumulado no momento em que o Jogo foi abortado, creditará em sua Conta o valor monetário do crédito ou, se a Conta não existir mais, pagará a você de uma forma aprovada.<br><br>12. Deveres<br><br>12.1. A CLUBE777 N.V. reserva-se o direito de ceder ou transferir legalmente seus direitos e obrigações sob os Termos. Você não deve ceder ou transferir seus direitos e obrigações sob estes Termos.<br><br>13. Reclamações<br><br>13.1. Se você tiver uma reclamação, pode enviar um e-mail para o suporte ao cliente do Website em CLUBE777@gmail.com.<br><br>13.2. A CLUBE777 N.V. usará seus melhores esforços para resolver a questão relatada prontamente.<br><br>13.3. Se você tiver uma dúvida sobre qualquer transação, pode entrar em contato com a CLUBE777 N.V. em CLUBE777 @gmail.com com detalhes da dúvida. Revisaremos qualquer transação questionada ou disputada. Nosso julgamento é final.<br><br>14. Acordo e Admissibilidade<br><br>14.1. Estes Termos, a Política de Privacidade, a Política de Cookies e qualquer documento a eles expressamente mencionado e quaisquer diretrizes ou regras postadas no Website constituem o acordo e entendimento completo entre você e a CLUBE777 N.V. com respeito a este Website e, salvo em caso de fraude, substituem todas as comunicações e propostas anteriores ou contemporâneas, sejam eletrônicas, orais ou escritas, entre você e a CLUBE777 N.V. com respeito a este Website.<br><br>14.2. Uma versão impressa destes Termos e de qualquer aviso dado em forma eletrônica será admissível em procedimentos judiciais ou administrativos baseados ou relacionados a estes Termos com o mesmo efeito e sujeita às mesmas condições que outros documentos e registros comerciais gerados e mantidos originalmente em forma impressa.<br><br>14.3. Você deve fornecer um endereço válido de e-mail e outras informações de contato ao criar uma Conta. Você deve manter essas informações atualizadas.<br><br>15. Alterações e Atualizações<br><br>15.1. A CLUBE777 N.V. reserva-se o direito de alterar ou atualizar estes Termos a qualquer momento e sem aviso prévio. As alterações entram em vigor no momento da publicação no Website.<br><br>15.2. Você é responsável por revisar regularmente os Termos para estar ciente de quaisquer alterações. Seu uso contínuo do Website após a publicação das alterações será considerado uma aceitação dessas alterações.<br><br>16. Limitação de Responsabilidade<br><br>16.1. A CLUBE777 N.V. não será responsável por quaisquer danos indiretos, consequenciais ou especiais, ou por quaisquer perdas de lucros, dados ou oportunidades de negócios, mesmo que tenhamos sido avisados da possibilidade de tais danos.<br><br>16.2. Nenhuma disposição destes Termos exclui ou limita nossa responsabilidade por morte ou lesão pessoal resultante de negligência ou qualquer outra responsabilidade que não possa ser excluída ou limitada por lei.<br><br>17. Disposições Específicas de Apostas<br><br>17.1. As apostas são aceitas e os resultados são calculados de acordo com as regras especificadas para cada mercado específico. A CLUBE777 N.V. reserva-se o direito de modificar essas regras e de cancelar apostas em mercados onde as regras especificadas não possam ser aplicadas corretamente.<br><br>17.2. Se um evento for cancelado, adiado ou suspendido, a CLUBE777 N.V. reserva-se o direito de determinar a política de reembolso apropriada, que pode variar dependendo do tipo de evento e das circunstâncias.<br><br>17.3. A CLUBE777&nbsp; N.V. pode definir regras específicas para cada mercado de apostas, e todas as apostas serão processadas de acordo com essas regras. É sua responsabilidade ler e entender as regras antes de fazer uma aposta.<br><br>17.4. Se houver uma disputa sobre o resultado de um evento, a CLUBE777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes ou organizações relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.<br><br>17.5. A CLUBE777 N.V. reserva-se o direito de encerrar ou suspender mercados e apostas em caso de erros técnicos, problemas com os resultados ou outras circunstâncias imprevistas.<br><br>17.6. A CLUBE777 N.V. pode, a seu critério, limitar o montante de apostas e ganhos por evento ou mercado para garantir a integridade e a justiça das apostas.<br><br>17.7. Se houver uma modificação nas regras de um evento ou mercado, a CLUBE777 N.V. pode atualizar as regras e notificar os clientes sobre tais alterações.<br><br>17.8. A decisão de um mercado é feita assim que for determinada. A CLUBE777 N.V. reserva-se o direito de definir os resultados dos jogos caso um mercado não seja determinado anteriormente na partida. Esta regra aplica-se à duração normal da partida e se não houver condições especificadas na descrição do mercado no Website.<br><br>17.9. Se houver uma disputa sobre o resultado de um evento, a CLUBE777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes, organizações esportivas ou ligas relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.<br><br>17.10. Se um evento for cancelado, adiado ou suspendido, todas as apostas poderão ser anuladas ou mantidas, dependendo das regras específicas do evento e das decisões tomadas pela CLUBE777 N.V. De maneira geral, apostas em eventos cancelados serão reembolsadas.<br><br>17.11. A CLUBE777 N.V. pode, a seu critério, ajustar os mercados de apostas e reembolsar ou manter apostas conforme as regras e circunstâncias do evento.</p>', 'olaaa', '#1b1b1c', '#000000', '#2FA33F', '#0D131C', '#ffffff', '#ffffff', '#ffffff', '#000000', '#ffffff', '#000000', '#000000', '#ffffff', '#ffffff', '#000000', '#ffffff', '#000000', '#ffffff', '#ffffff', '#', 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, '#000000', '#ffffff', '#000000', '#ffffff', '#000000', '#2fa34d', 0.50, '#19191a', '#000000', '0.5', '0.5', '0.5');
INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color_cassino`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `footer_color`, `footer_color_dark`, `border_radius`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`, `search_border_color`, `Border_bottons_and_selected`, `background_bottom_navigation`, `background_bottom_navigation_dark`, `borders_and_dividers_colors`, `search_back`, `color_bt_1`, `color_bt_2`, `color_bt_3`, `color_bt_4`, `bt_1_link`, `bt_2_link`, `bt_3_link`, `bt_4_link`, `bt_5_link`, `value_color_jackpot`, `value_wallet_navtop`, `bonus_color_dep`, `colors_deposit_value`, `color_players`, `modal_termos_register`, `modal_termos_cpf`, `placeholder_background`, `card_transaction`, `back_sub_color`, `item_sub_color`, `text_sub_color`, `title_sub_color`, `botao_deposito_background_nav`, `botao_deposito_text_nav`, `botao_login_background_nav`, `botao_login_text_nav`, `botao_registro_background_nav`, `botao_registro_text_nav`, `botao_login_background_modal`, `botao_login_text_modal`, `botao_registro_background_modal`, `botao_registro_text_modal`, `botao_registro_border_nav`, `botao_login_border_nav`, `botao_deposito_border_nav`, `invert_percentage`, `sepia_percentage`, `saturate_percentage`, `hue_rotate_deg`, `brightness_percentage`, `contrast_percentage`, `botao_deposito_text_dep`, `botao_deposito_background_dep`, `botao_deposito_border_dep`, `botao_deposito_text_saq`, `botao_deposito_background_saq`, `botao_deposito_border_saq`, `text_opacity`, `background_color_category`, `background_color_jackpot`, `text_color_footer`, `opacity_categories`, `opacity_bottom_nav`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#f7f7f7', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#000000', '#000000', '#000000', '#', '#', '#000000', '#1a1818', '#000000', '#000000', '#1e1e1f', '#000000', '#000000', '#1e1e1f', '1.3125rem', '2024-01-01 17:36:03', '2025-03-02 00:09:56', 'https://intagram.com', 'https://facebook.com', 'https://telegram.org', 'https://x.com', 'https://whatsapp.com', 'https://youtube.com', '#6D7A91', '#116b61', '#000000', '#000000', '#6D7A91', '#161D29', '#3E95FE', '#F45C4E', '#ca50f3', '#fbaf01', '/profile/linkconvite', '/profile/promocoes', '/profile/messages', '/profile/promocoes?tab=vip', 'https://telegram.org', '#000000', '#ffffff', '#23632b', '#ffffff', '#ffffff', '<p>1. Introduction<br><br>1.1. Ao usar, visitar e/ou acessar qualquer parte do DZD777 e/ou qualquer subdomínio, site ou aplicativo móvel que possuímos ou operamos (o “Website”) e/ou registrar uma conta no Website, você concorda em estar vinculado a estes Termos e Condições, nossa Política de Privacidade, nossa Política de Cookies e quaisquer outras regras aplicáveis aos nossos produtos de apostas ou jogos disponíveis no Website (juntos, os \"Termos\"), e é considerado como tendo aceitado e entendido todos os Termos.<br><br>1.2. Você deve ler os Termos com atenção. Se não concordar com eles e/ou não puder aceitá-los, não use, visite ou acesse o Website.<br><br>1.3. Estes Termos podem ser alterados por nós de tempos em tempos por qualquer motivo (incluindo conformidade com a legislação aplicável ou requisitos dos reguladores). A versão atual dos Termos estará disponível no Website. Se você continuar a usar o Website após essas alterações entrarem em vigor, você será considerado como tendo aceitado tais alterações aos Termos.<br><br>1.4. O DEMOCASSINO é operado pela CLUBE777 N.V., uma empresa registrada sob as leis de Curaçau sob o número de registro 137692.<br><br>1.5. A referência a “você”, “seu”, “cliente”, “usuário” ou “jogador” significa qualquer pessoa que use o Website ou quaisquer serviços disponíveis nele e/ou qualquer cliente registrado do Website.<br><br>1.6. A referência a “jogos” significa Cassino, Cassino ao Vivo, Apostas Esportivas, cartas e outros jogos que possam, de tempos em tempos, tornar-se disponíveis no Website. A CLUBE777 N.V. reserva-se o direito de adicionar e remover Jogos do Website a seu critério.<br><br>2. Sua Conta<br><br>2.1. Requisitos legais<br><br>2.1.1. A referência à “Conta” significa uma conta registrada por você no Website após aceitar e concordar com estes Termos. Ao registrar uma Conta, você declara que tem mais de 18 anos de idade ou a maioridade legal mínima mais alta conforme estipulado na jurisdição de sua residência sob as leis aplicáveis a você. É sua responsabilidade saber se os serviços disponíveis no Website são legais no país de sua residência. Pessoas com menos de 18 anos não estão autorizadas a usar o Website e/ou quaisquer serviços disponíveis nele.<br><br>2.1.2. Você não está autorizado a registrar no Website e usar nossos serviços se for residente de Aruba, Austrália, Bonaire, Curaçau, França, Irã, Iraque, Países Baixos, Saba, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Reino Unido. Reservamo-nos o direito de recusar clientes de quaisquer outros países além das jurisdições acima mencionadas a nosso critério.<br><br>2.2. Registro de Conta<br><br>2.2.1. Para fazer apostas, jogar jogos e depositar dinheiro, você precisa registrar a Conta no Website.<br><br>2.2.2. Para registrar a Conta, você deve fornecer informações completas e atualizadas, incluindo um número de telefone móvel, endereço de e-mail, nome de usuário, senha e outras informações obrigatórias solicitadas no formulário de registro.<br><br>2.2.3. Ao registrar a Conta no Website, você concorda em especificar seu nome legal. Podemos tomar medidas para verificar a precisão das informações que você fornece. Você não está autorizado a alterar esses dados, mas há casos em que você pode solicitar individualmente a alteração de dados entrando em contato com o suporte ao cliente do Website, como em caso de erro honesto, etc.<br><br>2.2.4. Se você escolher, ou se for fornecido com um nome de usuário, senha ou qualquer outra informação como parte de nossos procedimentos de segurança, você deve tratar essas informações como confidenciais e não deve divulgá-las a terceiros. Não somos responsáveis por qualquer abuso ou uso indevido de sua Conta por terceiros devido à sua divulgação, seja intencional ou acidental, ativa ou passiva, dos detalhes de login a terceiros. Nunca solicitaremos que você revele sua senha e nunca iniciaremos contato com você para pedir os memorizadores associados à sua senha.<br><br>2.2.5. Funcionários, ex-funcionários de prestadores de serviços e/ou pessoas afiliadas não estão autorizados a registrar contas no Website e não podem explorar os serviços e promoções disponíveis nele. As mesmas regras se aplicam aos membros da família dos acima mencionados. A violação desta regra resultará no fechamento permanente da conta e as contas referidas serão consideradas fraudulentas. Qualquer ganho derivado de tais atividades será considerado como perdido pelo titular da conta e apenas o valor depositado será devolvido ao titular da conta.<br><br>2.2.6. Você não pode transferir, vender ou penhorar Sua Conta para outra pessoa. Esta proibição inclui a transferência de quaisquer ativos de valor de qualquer tipo, incluindo, mas não se limitando a, propriedade de contas, ganhos, depósitos, apostas, direitos e/ou reivindicações relacionadas a esses ativos, legais, comerciais ou de qualquer outra forma. A proibição de tais transferências também inclui, mas não se limita a, ônus, penhor, cessão, usufruto, comercialização, corretagem, hipoteca e/ou doação em cooperação com um fiduciário ou qualquer outro terceiro, empresa, pessoa natural ou jurídica, fundação e/ou associação de qualquer forma.<br><br>2.3. Problemas com a Conta<br><br>2.3.1. Se você esquecer sua senha ou achar que alguém conhece detalhes de seus dados pessoais, além de suspeitar que outro usuário está se beneficiando injustamente por meio de trapaça ou conluio, você deve relatar a suspeita para nós.<br><br>2.3.2. Reservamo-nos o direito de declarar qualquer aposta ou transação nula total ou parcialmente se, a nosso critério, considerarmos óbvio que qualquer uma das seguintes circunstâncias tenha ocorrido:<br><br>o titular da Conta ou pessoas associadas ao titular da Conta podem influenciar direta ou indiretamente o resultado de um evento;<br><br>o titular da Conta e/ou pessoas associadas ao titular da Conta estão direta ou indiretamente evitando as regras do Website;<br><br>o resultado de um evento ou a aposta foi direta ou indiretamente afetado por atividade criminosa;<br><br>as odds de um evento foram significativamente alteradas devido a um anúncio público relacionado ao evento;<br><br>apostas foram feitas que não teriam sido aceitas de outra forma, mas foram aceitas durante períodos em que o Website foi afetado por problemas técnicos;<br><br>devido a um erro, como um engano, erro de impressão, erro técnico, erro humano, força maior ou outro, apostas foram oferecidas, feitas e/ou aceitas devido a esse erro.<br><br>2.3.3. Quando fecharmos ou suspendermos uma Conta por qualquer motivo, reservamo-nos o direito de fechar quaisquer futuras Contas que possam ser registradas pela mesma pessoa, dispositivo, endereço ou que possam usar as mesmas carteiras de pagamento ou cartões de crédito e anular/cancelar todas as apostas e transações dessas Contas.<br><br>2.3.4. Oferecemos autenticação de dois fatores (2FA) como proteção adicional contra o uso não autorizado de sua Conta. Você é responsável por manter suas informações de login confidenciais e garantir que não possam ser acessadas por outra pessoa.<br><br>2.4. Ao registrar a Conta no Website, você se compromete, declara e garante que:<br><br>2.4.1. Você tem mais de 18 anos ou a maioridade legal mínima estipulada nas leis da jurisdição aplicável a você e, sob as leis aplicáveis a você, é permitido participar dos Jogos oferecidos no Website.<br><br>2.4.2. Você usará este Website e sua Conta única e exclusivamente para a participação genuína nos Jogos e não para quaisquer operações financeiras ou outras; sua participação nos Jogos será estritamente em sua capacidade pessoal não profissional, apenas para fins recreativos e de entretenimento.<br><br>2.4.3. Você participa dos Jogos em seu próprio nome e não em nome de outra pessoa;<br><br>2.4.4. Você não é residente em Curaçau, França, Irã, Iraque, Países Baixos, Coreia do Norte, Singapura, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Ucrânia, Reino Unido.<br><br>2.4.5. Todas as informações que você fornecer à SLOTCLUBE777 N.V. são verdadeiras, completas e corretas, e que você deverá nos notificar imediatamente sobre qualquer alteração dessas informações.<br><br>2.4.6. Você é o único responsável por relatar e contabilizar quaisquer impostos aplicáveis a você de acordo com as leis relevantes para quaisquer ganhos que você receba da SLOTCLUBE777 N.V.<br><br>2.4.7. Todo o dinheiro que você deposita em sua Conta não está contaminado com qualquer ilegalidade e, em particular, não origina de qualquer atividade ou fonte ilegal.<br><br>2.4.8. Você entende que, ao participar dos Jogos, você assume o risco de perder o dinheiro depositado em sua Conta.<br><br>2.4.9. Você não deve se envolver em qualquer atividade fraudulenta, colusiva, manipulação ou outra atividade ilegal em relação à sua participação ou à participação de terceiros em qualquer um dos Jogos e não deve usar métodos ou técnicas assistidas por software ou dispositivos de hardware para sua participação em qualquer um dos Jogos. A SLOTCLUBE777 N.V. reserva-se o direito de invalidar ou fechar sua Conta ou invalidar sua participação em um Jogo em caso de tal comportamento.<br><br>2.4.10. Em relação a depósitos e retiradas de fundos, você fornecerá um método de pagamento válido e autorizado em seu nome e que não usará qualquer método de pagamento que não seja de sua própria propriedade. A SLOTCLUBE777 N.V. reserva-se o direito de verificar o método de pagamento e/ou o endereço de e-mail fornecido e de exigir documentos para tal verificação. Além disso, a SLOTCLUBE777 N.V. pode solicitar que você forneça uma identificação válida para verificar sua identidade, se necessário, de acordo com as leis aplicáveis à prevenção de crimes financeiros, lavagem de dinheiro e financiamento do terrorismo.<br><br>3. Depósitos e Retiradas<br><br>3.1. Depósitos<br><br>3.1.1. Quando você faz um depósito em sua Conta, você está confirmando que você é o proprietário dos fundos depositados e que os fundos não são de qualquer fonte ilegal.<br><br>3.1.2. O montante mínimo e máximo que pode ser depositado em sua Conta depende da moeda e do método de depósito utilizado. A SLOTCLUBE777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.<br><br>3.1.3. Ao fazer um depósito, você deve garantir que o método de pagamento usado está em seu nome. Qualquer depósito feito através de um método de pagamento que não esteja em seu nome pode ser recusado e retornado.<br><br>3.1.4. Todos os depósitos são processados de acordo com nossos procedimentos e podem levar algum tempo para serem creditados na sua Conta.<br><br>3.2. Retiradas<br><br>3.2.1. Para retirar fundos de sua Conta, você deve solicitar uma retirada através da área de gerenciamento de conta no Website.<br><br>3.2.2. O montante mínimo e máximo que pode ser retirado depende da moeda e do método de retirada utilizado. A CLUBE777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.<br><br>3.2.3. Todas as retiradas estão sujeitas a verificação de identidade e podem estar sujeitas a verificações adicionais de segurança. A CLUBE777&nbsp; N.V. pode solicitar documentos adicionais para verificar sua identidade e a origem dos fundos.<br><br>3.2.4. A CLUBE777 N.V. reserva-se o direito de cobrar uma taxa de processamento para retiradas, dependendo do método de retirada e dos valores envolvidos. As taxas aplicáveis serão informadas a você antes de concluir a transação de retirada.<br><br>3.2.5. O tempo necessário para processar uma retirada pode variar dependendo do método de retirada escolhido. Em geral, tentaremos processar todas as retiradas o mais rápido possível.<br><br>4. Uso Responsável<br><br>4.1. Jogar deve ser uma forma de entretenimento e não uma maneira de ganhar dinheiro. Você deve se certificar de que você está jogando de maneira responsável e não gastando mais do que você pode perder.<br><br>4.2. Se você acha que pode ter um problema com o jogo, há ferramentas e recursos disponíveis para ajudar. Recomendamos que você utilize as opções de autoexclusão e limites de depósito disponíveis no Website.<br><br>4.3. Se você deseja se autoexcluir, entre em contato com nosso suporte ao cliente para obter assistência na configuração da autoexclusão.<br><br>5. Encerramento e Suspensão de Conta<br><br>5.1. A CLUBE777 N.V. reserva-se o direito de suspender ou encerrar sua Conta a qualquer momento, a seu exclusivo critério, e sem aviso prévio, se acreditarmos que você violou estes Termos ou se tivermos qualquer outra razão para acreditar que você pode ter se envolvido em atividade fraudulenta, ilegal ou não autorizada.<br><br>5.2. Se sua Conta for encerrada ou suspensa, qualquer saldo remanescente em sua Conta pode ser devolvido a você, menos quaisquer taxas ou encargos aplicáveis, e qualquer saldo remanescente poderá ser perdido a critério da CLUBE777 N.V.<br><br>6.15. O valor máximo diário de ganhos para um Cliente não pode exceder 100.000 Euros ou o equivalente na moeda da sua Conta. O “dia” significa o período entre 00:00 GMT e 23:59 GMT.<br><br>7. Fechamento da Conta<br><br>7.1. Você pode fechar sua Conta a qualquer momento e solicitar a retirada do saldo da Conta, sujeito à dedução das taxas de retirada relevantes. Para fechar sua Conta, você deve primeiro cancelar quaisquer apostas em aberto, se aplicável, e entrar em contato com o suporte ao cliente do Website. O fechamento efetivo da Conta corresponderá à rescisão da SLOTCLUBE777 N.V.. Se o motivo do fechamento da Conta estiver relacionado a preocupações sobre possível adição ao jogo, você deve informar a SLOTCLUBE777 N.V..<br><br>7.2. O método de reembolso será a nosso critério absoluto.<br><br>7.3. A CLUBE777 N.V. reserva-se o direito de fechar sua Conta e reembolsar o saldo “Disponível para retirada”, sujeito à dedução das taxas de retirada relevantes, a critério absoluto da SLOTCLUBE777 N.V. e sem qualquer obrigação de fornecer um motivo ou aviso prévio.<br><br>7.4. A CLUBE777 N.V. reserva-se o direito de cancelar e remover qualquer valor de bônus concedido a você se não for utilizado dentro de 1 mês a partir da data em que foi concedido.<br><br>7.5. A CLUBE777 N.V. reserva-se o direito de recusar uma reivindicação de retirada em caso de fraude, momento em que uma Conta será suspensa e o pagamento não será processado.<br><br>7.6. A CLUBE777 N.V. revisará todas as Contas de jogadores e as classificará a seu critério. Uma vez que um jogador seja classificado como “caçador de bônus” ou “abusador de bônus”, todos os ganhos e bônus serão anulados e a Conta será suspensa e o pagamento não será processado.<br><br>8. Informações Pessoais<br><br>8.1. Cumpriremos as leis de proteção de dados aplicáveis em relação às informações pessoais que você nos fornecer. Suas informações pessoais são processadas de acordo com nossa Política de Privacidade, cuja cópia está disponível clicando aqui.<br><br>9. Jogos Interrompidos e Abortados<br><br>9.1. Atividade Criminosa: Caso seja notada qualquer irregularidade (incluindo suspeita de tentativa de lavagem de dinheiro ou fraude), a CLUBE777 N.V. reserva-se o direito de fechar Contas e/ou relatar atividades criminosas ou suspeitas às autoridades regulatórias ou de aplicação da lei relevantes. Todos os saldos das Contas dos infratores serão bloqueados, retiradas serão anuladas e depósitos e ganhos serão perdidos.<br><br>9.2. Colusão e trapaça: A CLUBE777 N.V. tem o direito de desativar Contas de usuários e confiscar os saldos das Contas (incluindo depósitos e ganhos) se detectar tentativa de obter vantagem por meio da troca de informações sobre suas cartas ou estabelecer um acordo colusivo com outros usuários para obter uma vantagem injusta. Essas vantagens podem consistir em despejo de fichas e transferências, discussão de uma mão durante o jogo, uso múltiplo de uma única Conta, jogo suave. A CLUBE777 N.V. realiza uma rigorosa análise do jogo por meios manuais e automatizados e investiga todas as reclamações relacionadas de usuários. Além disso, a CLUBE777 N.V. realiza análises proativas e aleatórias de jogadas e Contas.<br><br>9.3. Atividade Fraudulenta: Quando a CLUBE777 N.V. detectar atividade fraudulenta, ilegal, desonesta ou imprópria (incluindo o uso de VPN, proxy ou serviço semelhante que mascara ou manipula a identificação de sua localização real, ou fazer apostas, apostas ou jogo de poker por meio de um terceiro ou em nome de um terceiro) no Website, temos o direito de bloquear a Conta do usuário e confiscar todos os saldos da Conta sem notificação prévia. Nesses casos, a SLOTCLUBE777 N.V. reserva-se o direito de relatar a atividade fraudulenta às autoridades regulatórias e de aplicação da lei, incluindo, mas não se limitando a, bancos, empresas de cartões de crédito e/ou qualquer pessoa ou entidade que tenha o direito legal a tais informações, e/ou tomar medidas legais contra o usuário.<br><br>10. Chat ao Vivo<br><br>10.1. Como parte do uso do Website, a CLUBE777 N.V. pode fornecer a você uma funcionalidade de chat, que é moderada por nós e sujeita a controles. Reservamo-nos o direito de revisar o chat e manter um registro de todas as declarações feitas nessa funcionalidade. Seu uso da funcionalidade de chat deve ser para fins recreativos e de socialização, e está sujeito às seguintes regras.<br><br>10.2. Você não deve fazer declarações sexualmente explícitas ou extremamente ofensivas, incluindo expressões de preconceito, racismo, ódio ou profanidade.<br><br>10.3. Você não deve fazer declarações abusivas, difamatórias ou que assediam ou insultam o Website ou a CLUBE777 N.V..<br><br>10.4. Você não deve fazer declarações que anunciem, promovam ou se relacionem com outras entidades online.<br><br>10.5. Você não deve fazer declarações sobre a CLUBE777 N.V., o Website ou quaisquer outros sites da Internet conectados à CLUBE777 N.V. que sejam falsas e/ou maliciosas e/ou prejudiciais à CLUBE777 N.V..<br><br>10.6. Você não deve fazer colusão através dos chats ou chats separados. Qualquer chat suspeito será relatado à autoridade regulatória ou de aplicação da lei relevante.<br><br>10.7. No caso de você violar qualquer uma das disposições acima relacionadas à funcionalidade de chat, a CLUBE777 N.V. terá o direito de remover o chat room ou encerrar imediatamente sua Conta. Após tal rescisão, a CLUBE777 N.V. reembolsará quaisquer fundos que possam estar em sua Conta, além de qualquer valor que possa ser devido a nós naquele momento (se houver).<br><br>11. Jogos Interrompidos e Abortados<br><br>11.1. A CLUBE777 N.V. não é responsável por qualquer inatividade, interrupções do servidor, atraso ou qualquer perturbação técnica ou política ao jogo. Reembolsos podem ser concedidos apenas a critério da CLUBE777 N.V..<br><br>11.2. A SLOTCLUBE777 N.V. não aceita qualquer responsabilidade por danos ou perdas que sejam considerados ou alegados como resultantes de ou em conexão com o Website ou seu conteúdo, incluindo, sem limitação, atrasos ou interrupções na operação ou transmissão, perda ou corrupção de dados, falha na comunicação ou linhas, uso indevido do Website ou seu conteúdo por qualquer pessoa ou erros ou omissões no conteúdo.<br><br>11.3. No caso de um mau funcionamento do sistema do cassino, todas as apostas são nulas.<br><br>11.4. No caso de um Jogo ser iniciado mas abortado devido a uma falha no sistema, a SLOTCLUBE777 N.V. reembolsará o valor apostado no Jogo, creditando-o em sua Conta ou, se a Conta não existir mais, pagando-o de uma forma aprovada; e se você tiver um crédito acumulado no momento em que o Jogo foi abortado, creditará em sua Conta o valor monetário do crédito ou, se a Conta não existir mais, pagará a você de uma forma aprovada.<br><br>12. Deveres<br><br>12.1. A CLUBE777 N.V. reserva-se o direito de ceder ou transferir legalmente seus direitos e obrigações sob os Termos. Você não deve ceder ou transferir seus direitos e obrigações sob estes Termos.<br><br>13. Reclamações<br><br>13.1. Se você tiver uma reclamação, pode enviar um e-mail para o suporte ao cliente do Website em CLUBE777@gmail.com.<br><br>13.2. A CLUBE777 N.V. usará seus melhores esforços para resolver a questão relatada prontamente.<br><br>13.3. Se você tiver uma dúvida sobre qualquer transação, pode entrar em contato com a CLUBE777 N.V. em CLUBE777 @gmail.com com detalhes da dúvida. Revisaremos qualquer transação questionada ou disputada. Nosso julgamento é final.<br><br>14. Acordo e Admissibilidade<br><br>14.1. Estes Termos, a Política de Privacidade, a Política de Cookies e qualquer documento a eles expressamente mencionado e quaisquer diretrizes ou regras postadas no Website constituem o acordo e entendimento completo entre você e a CLUBE777 N.V. com respeito a este Website e, salvo em caso de fraude, substituem todas as comunicações e propostas anteriores ou contemporâneas, sejam eletrônicas, orais ou escritas, entre você e a CLUBE777 N.V. com respeito a este Website.<br><br>14.2. Uma versão impressa destes Termos e de qualquer aviso dado em forma eletrônica será admissível em procedimentos judiciais ou administrativos baseados ou relacionados a estes Termos com o mesmo efeito e sujeita às mesmas condições que outros documentos e registros comerciais gerados e mantidos originalmente em forma impressa.<br><br>14.3. Você deve fornecer um endereço válido de e-mail e outras informações de contato ao criar uma Conta. Você deve manter essas informações atualizadas.<br><br>15. Alterações e Atualizações<br><br>15.1. A CLUBE777 N.V. reserva-se o direito de alterar ou atualizar estes Termos a qualquer momento e sem aviso prévio. As alterações entram em vigor no momento da publicação no Website.<br><br>15.2. Você é responsável por revisar regularmente os Termos para estar ciente de quaisquer alterações. Seu uso contínuo do Website após a publicação das alterações será considerado uma aceitação dessas alterações.<br><br>16. Limitação de Responsabilidade<br><br>16.1. A CLUBE777 N.V. não será responsável por quaisquer danos indiretos, consequenciais ou especiais, ou por quaisquer perdas de lucros, dados ou oportunidades de negócios, mesmo que tenhamos sido avisados da possibilidade de tais danos.<br><br>16.2. Nenhuma disposição destes Termos exclui ou limita nossa responsabilidade por morte ou lesão pessoal resultante de negligência ou qualquer outra responsabilidade que não possa ser excluída ou limitada por lei.<br><br>17. Disposições Específicas de Apostas<br><br>17.1. As apostas são aceitas e os resultados são calculados de acordo com as regras especificadas para cada mercado específico. A CLUBE777 N.V. reserva-se o direito de modificar essas regras e de cancelar apostas em mercados onde as regras especificadas não possam ser aplicadas corretamente.<br><br>17.2. Se um evento for cancelado, adiado ou suspendido, a CLUBE777 N.V. reserva-se o direito de determinar a política de reembolso apropriada, que pode variar dependendo do tipo de evento e das circunstâncias.<br><br>17.3. A CLUBE777&nbsp; N.V. pode definir regras específicas para cada mercado de apostas, e todas as apostas serão processadas de acordo com essas regras. É sua responsabilidade ler e entender as regras antes de fazer uma aposta.<br><br>17.4. Se houver uma disputa sobre o resultado de um evento, a CLUBE777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes ou organizações relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.<br><br>17.5. A CLUBE777 N.V. reserva-se o direito de encerrar ou suspender mercados e apostas em caso de erros técnicos, problemas com os resultados ou outras circunstâncias imprevistas.<br><br>17.6. A CLUBE777 N.V. pode, a seu critério, limitar o montante de apostas e ganhos por evento ou mercado para garantir a integridade e a justiça das apostas.<br><br>17.7. Se houver uma modificação nas regras de um evento ou mercado, a CLUBE777 N.V. pode atualizar as regras e notificar os clientes sobre tais alterações.<br><br>17.8. A decisão de um mercado é feita assim que for determinada. A CLUBE777 N.V. reserva-se o direito de definir os resultados dos jogos caso um mercado não seja determinado anteriormente na partida. Esta regra aplica-se à duração normal da partida e se não houver condições especificadas na descrição do mercado no Website.<br><br>17.9. Se houver uma disputa sobre o resultado de um evento, a CLUBE777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes, organizações esportivas ou ligas relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.<br><br>17.10. Se um evento for cancelado, adiado ou suspendido, todas as apostas poderão ser anuladas ou mantidas, dependendo das regras específicas do evento e das decisões tomadas pela CLUBE777 N.V. De maneira geral, apostas em eventos cancelados serão reembolsadas.<br><br>17.11. A CLUBE777 N.V. pode, a seu critério, ajustar os mercados de apostas e reembolsar ou manter apostas conforme as regras e circunstâncias do evento.</p>', 'olaaa', '#1b1b1c', '#000000', '#2FA33F', '#0D131C', '#ffffff', '#ffffff', '#ffffff', '#000000', '#ffffff', '#000000', '#000000', '#ffffff', '#ffffff', '#000000', '#ffffff', '#000000', '#ffffff', '#ffffff', '#', 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, '#000000', '#ffffff', '#000000', '#ffffff', '#000000', '#2fa34d', 0.50, '#19191a', '#000000', '0.5', '0.5', '0.5');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `digito_pay_payments`
--

CREATE TABLE `digito_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `withdrawal_id` int(10) UNSIGNED NOT NULL,
  `pix_key` varchar(191) NOT NULL,
  `pix_type` varchar(191) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos_plataforma`
--

CREATE TABLE `eventos_plataforma` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `caminho` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos_plataforma`
--

INSERT INTO `eventos_plataforma` (`id`, `image`, `descricao`, `created_at`, `updated_at`, `caminho`) VALUES
(1, '01JNACYD074ST065DX68H6MXMT.jpg', NULL, '2024-08-12 03:46:32', '2025-03-02 00:05:05', NULL),
(2, '01JNAD0MJV7R5RNR264K95GV3B.jpg', NULL, '2024-08-12 05:11:01', '2025-03-02 00:04:53', NULL),
(3, '01JNAD27GJYSSCP02NJFXFT0A1.jpg', NULL, '2024-08-12 05:11:25', '2025-03-02 00:05:54', NULL),
(4, '01JNAD2X5YKYJH4VQ70V16QGDY.jpg', NULL, '2025-03-02 00:06:07', '2025-03-02 00:06:07', NULL),
(5, '01JNAD3CVBBYBNXTSD8N5F8P61.jpg', NULL, '2025-03-02 00:06:23', '2025-03-02 00:06:23', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `game_server_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'inativo',
  `game_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_influencer_mode` tinyint(1) NOT NULL DEFAULT 0,
  `technology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'html5',
  `has_lobby` tinyint(4) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(4) NOT NULL DEFAULT 0,
  `has_freespins` tinyint(4) NOT NULL DEFAULT 0,
  `has_tables` tinyint(4) NOT NULL DEFAULT 0,
  `only_demo` tinyint(4) DEFAULT 0,
  `rtp` bigint(20) NOT NULL DEFAULT 0,
  `distribution` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'play_fiver',
  `views` bigint(20) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) DEFAULT 0,
  `show_home` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(43, 1, 'inativo', 'rooster-rbl', 'Rooster Rumble', 'rooster-rbl', 'slot', NULL, 'PlayFiver/Pgsoft/rooster-rbl.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2025-02-26 14:55:28'),
(42, 1, 'inativo', 'garuda-gems', 'Garuda Gems', 'garuda-gems', 'slot', NULL, 'PlayFiver/Pgsoft/garuda-gems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:16:53'),
(41, 1, 'inativo', 'dest-sun-moon', 'Destiny of Sun & Moon', 'dest-sun-moon', 'slot', NULL, 'PlayFiver/Pgsoft/dest-sun-moon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:28:53'),
(40, 1, 'inativo', 'spirit-wonder', 'Spirited Wonders', 'spirit-wonder', 'slot', NULL, 'PlayFiver/Pgsoft/spirit-wonder.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-04-01 21:27:06'),
(39, 1, 'inativo', 'sprmkt-spree', 'Supermarket Spree', 'sprmkt-spree', 'slot', NULL, 'PlayFiver/Pgsoft/sprmkt-spree.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2025-02-26 14:55:28'),
(38, 1, 'inativo', 'emoji-riches', 'Emoji Riches', 'emoji-riches', 'slot', NULL, 'PlayFiver/Pgsoft/emoji-riches.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:31:19'),
(37, 1, 'inativo', 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', 'crypt-fortune', 'slot', NULL, 'PlayFiver/Pgsoft/crypt-fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 14, 0, 1, '2024-05-27 15:25:59', '2025-06-20 01:19:39'),
(36, 1, 'inativo', 'buffalo-win', 'Buffalo Win', 'buffalo-win', 'slot', NULL, 'PlayFiver/Pgsoft/buffalo-win.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:31:45'),
(35, 1, 'inativo', 'lgd-monkey-kg', 'Legendary Monkey King', 'lgd-monkey-kg', 'slot', NULL, 'PlayFiver/Pgsoft/lgd-monkey-kg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:35:28'),
(34, 1, 'inativo', 'heist-stakes', 'Heist Stakes', 'heist-stakes', 'slot', NULL, 'PlayFiver/Pgsoft/heist-stakes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-29 03:48:43'),
(33, 1, 'inativo', 'candy-bonanza', 'Candy Bonanza', 'candy-bonanza', 'slot', NULL, 'PlayFiver/Pgsoft/candy-bonanza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-10-02 14:43:26'),
(32, 1, 'inativo', 'jack-frosts', 'Jack Frost\'s Winter', 'jack-frosts', 'slot', NULL, 'PlayFiver/Pgsoft/jack-frosts.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:31:44'),
(31, 1, 'inativo', 'majestic-ts', 'Majestic Treasures', 'majestic-ts', 'slot', NULL, 'PlayFiver/Pgsoft/majestic-ts.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:39:34'),
(30, 1, 'inativo', 'bali-vacation', 'Bali Vacation', 'bali-vacation', 'slot', NULL, 'PlayFiver/Pgsoft/bali-vacation.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 08:50:47'),
(29, 1, 'inativo', 'gdn-ice-fire', 'Guardians of Ice and Fire', 'gdn-ice-fire', 'slot', NULL, 'PlayFiver/Pgsoft/gdn-ice-fire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:33:48'),
(28, 1, 'inativo', 'jewels-prosper', 'Jewels of Prosperity', 'jewels-prosper', 'slot', NULL, 'PlayFiver/Pgsoft/jewels-prosper.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 13, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:26:15'),
(27, 1, 'inativo', 'treasures-aztec', 'Treasures of Aztec', 'treasures-aztec', 'slot', NULL, 'PlayFiver/Pgsoft/treasures-aztec.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 13:37:16'),
(26, 1, 'inativo', 'galactic-gems', 'Galactic Gems', 'galactic-gems', 'slot', NULL, 'PlayFiver/Pgsoft/galactic-gems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:32:31'),
(25, 1, 'inativo', 'wild-fireworks', 'Wild Fireworks', 'wild-fireworks', 'slot', NULL, 'PlayFiver/Pgsoft/wild-fireworks.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:32:43'),
(24, 1, 'inativo', 'phoenix-rises', 'Phoenix Rises', 'phoenix-rises', 'slot', NULL, 'PlayFiver/Pgsoft/phoenix-rises.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-06-05 13:08:05'),
(23, 1, 'inativo', 'ganesha-fortune', 'Ganesha Fortune', 'ganesha-fortune', 'slot', NULL, 'PlayFiver/Pgsoft/ganesha-fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-09-05 14:10:44'),
(22, 1, 'inativo', 'mahjong-ways2', 'Mahjong Ways 2', 'mahjong-ways2', 'slot', NULL, 'PlayFiver/Pgsoft/mahjong-ways2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:17:46'),
(21, 1, 'inativo', 'candy-burst', 'Candy Burst', 'candy-burst', 'slot', NULL, 'PlayFiver/Pgsoft/candy-burst.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:33:27'),
(20, 1, 'inativo', 'mahjong-ways', 'Mahjong Ways', 'mahjong-ways', 'slot', NULL, 'PlayFiver/Pgsoft/mahjong-ways.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:30:30'),
(19, 1, 'inativo', 'gem-saviour-conquest', 'Gem Saviour Conquest', 'gem-saviour-conquest', 'slot', NULL, 'PlayFiver/Pgsoft/gem-saviour-conquest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:33:38'),
(18, 1, 'inativo', 'vampires-charm', 'Vampire\'s Charm', 'vampires-charm', 'slot', NULL, 'PlayFiver/Pgsoft/vampires-charm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-11-29 22:18:38'),
(17, 1, 'inativo', 'dragon-hatch', 'Dragon Hatch', 'dragon-hatch', 'slot', NULL, 'PlayFiver/Pgsoft/dragon-hatch.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-06-05 15:04:46'),
(16, 1, 'inativo', 'captains-bounty', 'Captain\'s Bounty', 'captains-bounty', 'slot', NULL, 'PlayFiver/Pgsoft/captains-bounty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:20:32'),
(15, 1, 'inativo', 'the-great-icescape', 'The Great Icescape', 'the-great-icescape', 'slot', NULL, 'PlayFiver/Pgsoft/the-great-icescape.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-05-27 15:25:59', '2025-09-02 09:41:56'),
(14, 1, 'inativo', 'double-fortune', 'Double Fortune', 'double-fortune', 'slot', NULL, 'PlayFiver/Pgsoft/double-fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:35:03'),
(13, 1, 'inativo', 'piggy-gold', 'Piggy Gold', 'piggy-gold', 'slot', NULL, 'PlayFiver/Pgsoft/piggy-gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:21:22'),
(12, 1, 'inativo', '63', 'Dragon Tiger Luck', '63', 'slot', NULL, 'PlayFiver/Pgsoft/63.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2025-04-12 12:24:49'),
(11, 1, 'inativo', '104', 'Wild Bandito', '104', 'slot', NULL, 'PlayFiver/Pgsoft/104.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 27, 0, 1, '2024-05-27 15:25:59', '2025-09-05 21:15:26'),
(10, 1, 'inativo', '60', 'Leprechaun Riches', '60', 'slot', NULL, 'PlayFiver/Pgsoft/60.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-11-29 22:22:24'),
(9, 1, 'inativo', '42', 'Ganesha Gold', '42', 'slot', NULL, 'PlayFiver/Pgsoft/42.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:22:11'),
(8, 1, 'inativo', '1738001', 'Chicky Run', '1738001', 'slot', NULL, 'PlayFiver/Pgsoft/1738001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4305, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:30:05'),
(7, 1, 'inativo', '1695365', 'Fortune Dragon', '1695365', 'slot', NULL, 'PlayFiver/Pgsoft/1695365.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4763, 0, 1, '2024-05-27 15:25:59', '2025-09-06 01:03:14'),
(6, 1, 'inativo', '40', 'Jungle Delight', '40', 'slot', NULL, 'PlayFiver/Pgsoft/40.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 15, 0, 1, '2024-05-27 15:25:59', '2025-09-07 00:08:40'),
(5, 1, 'inativo', '69', 'Bikini Paradise', '69', 'slot', NULL, 'PlayFiver/Pgsoft/69.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-06-13 08:52:47'),
(4, 1, 'inativo', '1543462', 'Fortune Rabbit', '1543462', 'slot', NULL, 'PlayFiver/Pgsoft/1543462.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4587, 0, 1, '2024-05-27 15:25:59', '2025-09-06 15:27:42'),
(3, 1, 'inativo', '68', 'Fortune Mouse', '68', 'slot', NULL, 'PlayFiver/Pgsoft/68.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4415, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:31:50'),
(2, 1, 'inativo', '98', 'Fortune Ox', '98', 'slot', NULL, 'PlayFiver/Pgsoft/98.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4865, 0, 1, '2024-05-27 15:25:59', '2025-09-06 15:26:16'),
(1, 1, 'inativo', '126', 'Fortune Tiger', '126', 'slot', NULL, 'PlayFiver/Pgsoft/126.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5279, 0, 1, '2024-05-27 15:25:59', '2025-09-07 09:05:41'),
(44, 1, 'inativo', 'battleground', 'Battleground Royale', 'battleground', 'slot', NULL, 'PlayFiver/Pgsoft/battleground.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:30:08'),
(45, 1, 'inativo', 'btrfly-blossom', 'Butterfly Blossom', 'btrfly-blossom', 'slot', NULL, 'PlayFiver/Pgsoft/btrfly-blossom.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:30:21'),
(46, 1, 'inativo', 'prosper-ftree', 'Prosperity Fortune Tree', 'prosper-ftree', 'slot', NULL, 'PlayFiver/Pgsoft/prosper-ftree.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 08:51:01'),
(47, 1, 'inativo', 'asgardian-rs', 'Asgardian Rising', 'asgardian-rs', 'slot', NULL, 'PlayFiver/Pgsoft/asgardian-rs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-29 03:48:43'),
(48, 1, 'inativo', 'alchemy-gold', 'Alchemy Gold', 'alchemy-gold', 'slot', NULL, 'PlayFiver/Pgsoft/alchemy-gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 00:55:46'),
(49, 1, 'inativo', 'diner-delights', 'Diner Delights', 'diner-delights', 'slot', NULL, 'PlayFiver/Pgsoft/diner-delights.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:30:34'),
(50, 1, 'inativo', 'midas-fortune', 'Midas Fortune', 'midas-fortune', 'slot', NULL, 'PlayFiver/Pgsoft/midas-fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 14:02:05'),
(51, 1, 'inativo', 'bakery-bonanza', 'Bakery Bonanza', 'bakery-bonanza', 'slot', NULL, 'PlayFiver/Pgsoft/bakery-bonanza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:58:16'),
(52, 1, 'inativo', 'songkran-spl', 'Songkran Splash', 'songkran-spl', 'slot', NULL, 'PlayFiver/Pgsoft/songkran-spl.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2025-09-05 13:58:22'),
(53, 1, 'inativo', 'dragon-hatch2', 'Dragon Hatch2', 'dragon-hatch2', 'slot', NULL, 'PlayFiver/Pgsoft/dragon-hatch2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-09-01 13:09:42'),
(54, 1, 'inativo', 'cruise-royale', 'Cruise Royale', 'cruise-royale', 'slot', NULL, 'PlayFiver/Pgsoft/cruise-royale.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-29 03:48:43'),
(55, 1, 'inativo', '1508783', 'Wild Ape', '1508783', 'slot', NULL, 'PlayFiver/Pgsoft/wild-ape-3258.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4314, 0, 1, '2024-05-27 15:25:59', '2025-09-05 20:20:47'),
(56, 1, 'inativo', 'spr-golf-drive', 'Super Golf Drive', 'spr-golf-drive', 'slot', NULL, 'PlayFiver/Pgsoft/spr-golf-drive.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 03:01:10'),
(57, 1, 'inativo', 'anubis-wrath', 'Anubis Wrath', 'anubis-wrath', 'slot', NULL, 'PlayFiver/Pgsoft/anubis-wrath.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-03-31 12:50:56'),
(58, 1, 'inativo', '1635221', 'Zombie Outbreak', '1635221', 'slot', NULL, 'PlayFiver/Pgsoft/zombie-outbrk.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4305, 0, 1, '2024-05-27 15:25:59', '2025-09-05 23:28:32'),
(59, 1, 'inativo', '1682240', 'Cash Mania', '1682240', 'slot', NULL, 'PlayFiver/Pgsoft/1682240.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4478, 0, 1, '2024-05-27 15:25:59', '2025-09-05 20:20:03'),
(60, 2, 'inativo', 'vswaysbook', 'Book of Golden Sands', 'vswaysbook', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysbook.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 06:33:21'),
(61, 2, 'inativo', 'vs20mparty', 'Wild Hop and Drop', 'vs20mparty', 'slot', NULL, 'PlayFiver/Pragmatic/vs20mparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 12:03:50'),
(62, 2, 'inativo', 'vs10snakeeyes', 'Snakes e Ladders - Snake Eyes', 'vs10snakeeyes', 'slot', NULL, 'PlayFiver/Pragmatic/vs10snakeeyes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 20:29:52'),
(63, 2, 'inativo', 'vs5strh', 'Striking Hot 5', 'vs5strh', 'slot', NULL, 'PlayFiver/Pragmatic/vs5strh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(64, 2, 'inativo', 'vswayslofhero', 'Legend of Heroes', 'vswayslofhero', 'slot', NULL, 'PlayFiver/Pragmatic/vswayslofhero.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(65, 2, 'inativo', 'vs20muertos', 'Muertos Multiplier Megaways', 'vs20muertos', 'slot', NULL, 'PlayFiver/Pragmatic/vs20muertos.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2025-09-01 13:29:21'),
(66, 2, 'inativo', 'vs10crownfire', 'Crown of Fire', 'vs10crownfire', 'slot', NULL, 'PlayFiver/Pragmatic/vs10crownfire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:05:48'),
(67, 2, 'inativo', 'vswaysstrwild', 'Candy Stars', 'vswaysstrwild', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysstrwild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 14:23:26'),
(68, 2, 'inativo', 'vs20trswild2', 'Black Bull', 'vs20trswild2', 'slot', NULL, 'PlayFiver/Pragmatic/vs20trswild2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 19:27:33'),
(69, 2, 'inativo', 'vswaysfltdrg', 'Floating Dragon Hold e Spin Megaways', 'vswaysfltdrg', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysfltdrg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:29:24'),
(70, 2, 'inativo', 'vs10mmm', 'Magic Money Maze', 'vs10mmm', 'slot', NULL, 'PlayFiver/Pragmatic/vs10mmm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:31:16'),
(71, 2, 'inativo', 'vs20underground', 'Down the Rails', 'vs20underground', 'slot', NULL, 'PlayFiver/Pragmatic/vs20underground.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:09:10'),
(72, 2, 'inativo', 'vs20wolfie', 'Greedy Wolf', 'vs20wolfie', 'slot', NULL, 'PlayFiver/Pragmatic/vs20wolfie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:58:05'),
(73, 2, 'inativo', 'vs5firehot', 'Fire Hot 5', 'vs5firehot', 'slot', NULL, 'PlayFiver/Pragmatic/vs5firehot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 04:01:49'),
(74, 2, 'inativo', 'vs40firehot', 'Fire Hot 40', 'vs40firehot', 'slot', NULL, 'PlayFiver/Pragmatic/vs40firehot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 20:35:44'),
(75, 2, 'inativo', 'vs20fh', 'Fire Hot 20', 'vs20fh', 'slot', NULL, 'PlayFiver/Pragmatic/vs20fh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:06:57'),
(76, 2, 'inativo', 'vs100firehot', 'Fire Hot 100', 'vs100firehot', 'slot', NULL, 'PlayFiver/Pragmatic/vs100firehot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:40:10'),
(77, 2, 'inativo', 'vs10txbigbass', 'Big Bass Splash', 'vs10txbigbass', 'fish', NULL, 'PlayFiver/Pragmatic/vs10txbigbass.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:27:27'),
(78, 2, 'inativo', 'vs20octobeer', 'Octobeer Fortunes', 'vs20octobeer', 'slot', NULL, 'PlayFiver/Pragmatic/vs20octobeer.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 14:37:15'),
(79, 2, 'inativo', 'vs40hotburnx', 'Hot To Burn Extreme', 'vs40hotburnx', 'slot', NULL, 'PlayFiver/Pragmatic/vs40hotburnx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:01:30'),
(80, 2, 'inativo', 'vs243ckemp', 'Cheeky Emperor', 'vs243ckemp', 'slot', NULL, 'PlayFiver/Pragmatic/vs243ckemp.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-04 01:29:49'),
(81, 2, 'inativo', 'vswaysjkrdrop', 'Tropical Tiki', 'vswaysjkrdrop', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysjkrdrop.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:34:20'),
(82, 2, 'inativo', 'vs5sh', 'Shining Hot 5', 'vs5sh', 'slot', NULL, 'PlayFiver/Pragmatic/vs5sh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(83, 2, 'inativo', 'vs40sh', 'Shining Hot 40', 'vs40sh', 'slot', NULL, 'PlayFiver/Pragmatic/vs40sh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 09:26:23'),
(84, 2, 'inativo', 'vs20sh', 'Shining Hot 20', 'vs20sh', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:59:29'),
(85, 2, 'inativo', 'vs10coffee', 'Coffee Wild', 'vs10coffee', 'slot', NULL, 'PlayFiver/Pragmatic/vs10coffee.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(86, 2, 'inativo', 'vs100sh', 'Shining Hot 100', 'vs100sh', 'slot', NULL, 'PlayFiver/Pragmatic/vs100sh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:01:14'),
(87, 2, 'inativo', 'vs10egrich', 'Queen of Gods', 'vs10egrich', 'slot', NULL, 'PlayFiver/Pragmatic/vs10egrich.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(88, 2, 'inativo', 'vs243koipond', 'Koi Pond', 'vs243koipond', 'slot', NULL, 'PlayFiver/Pragmatic/vs243koipond.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 01:37:05'),
(89, 2, 'inativo', 'vs40samurai3', 'Rise of Samurai 3', 'vs40samurai3', 'slot', NULL, 'PlayFiver/Pragmatic/vs40samurai3.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:03:40'),
(90, 2, 'inativo', 'vs40cosmiccash', 'Cosmic Cash', 'vs40cosmiccash', 'slot', NULL, 'PlayFiver/Pragmatic/vs40cosmiccash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 16:07:07'),
(91, 2, 'inativo', 'vs25bomb', 'Bomb Bonanza', 'vs25bomb', 'slot', NULL, 'PlayFiver/Pragmatic/vs25bomb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-12 03:29:50'),
(92, 2, 'inativo', 'vs1024mahjpanda', 'Mahjong Panda', 'vs1024mahjpanda', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024mahjpanda.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:43:50'),
(93, 2, 'inativo', 'vs10spiritadv', 'Spirit of Adventure', 'vs10spiritadv', 'slot', NULL, 'PlayFiver/Pragmatic/vs10spiritadv.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 06:04:48'),
(94, 2, 'inativo', 'vs10firestrike2', 'Fire Strike 2', 'vs10firestrike2', 'slot', NULL, 'PlayFiver/Pragmatic/vs10firestrike2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(95, 2, 'inativo', 'vs40cleoeye', 'Eye of Cleopatra', 'vs40cleoeye', 'slot', NULL, 'PlayFiver/Pragmatic/vs40cleoeye.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 10:46:08'),
(96, 2, 'inativo', 'vs20gobnudge', 'Goblin Heist Powernudge', 'vs20gobnudge', 'slot', NULL, 'PlayFiver/Pragmatic/vs20gobnudge.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(97, 2, 'inativo', 'vs20stickysymbol', 'The Great Stick-up', 'vs20stickysymbol', 'slot', NULL, 'PlayFiver/Pragmatic/vs20stickysymbol.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 12:28:45'),
(98, 2, 'inativo', 'vswayszombcarn', 'Zombie Carnival', 'vswayszombcarn', 'slot', NULL, 'PlayFiver/Pragmatic/vswayszombcarn.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(99, 2, 'inativo', 'vs50northgard', 'North Guardians', 'vs50northgard', 'slot', NULL, 'PlayFiver/Pragmatic/vs50northgard.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:02:37'),
(100, 2, 'inativo', 'vs20sugarrush', 'Sugar Rush', 'vs20sugarrush', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sugarrush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2025-06-03 21:25:36'),
(101, 2, 'inativo', 'vs20cleocatra', 'Cleocatra', 'vs20cleocatra', 'slot', NULL, 'PlayFiver/Pragmatic/vs20cleocatra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 10:33:20'),
(102, 2, 'inativo', 'vs5littlegem', 'Little Gem Hold and Spin', 'vs5littlegem', 'slot', NULL, 'PlayFiver/Pragmatic/vs5littlegem.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(103, 2, 'inativo', 'vs20drtgold', 'Drill That Gold', 'vs20drtgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs20drtgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(104, 2, 'inativo', 'vs20mustanggld2', 'Clover Gold', 'vs20mustanggld2', 'slot', NULL, 'PlayFiver/Pragmatic/vs20mustanggld2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-28 08:54:36'),
(105, 2, 'inativo', 'vs10chkchase', 'Chicken Chase', 'vs10chkchase', 'slot', NULL, 'PlayFiver/Pragmatic/vs10chkchase.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 11:23:36'),
(106, 2, 'inativo', 'vswayswildwest', 'Wild West Gold Megaways', 'vswayswildwest', 'slot', NULL, 'PlayFiver/Pragmatic/vswayswildwest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 06:24:37'),
(107, 2, 'inativo', 'vs10bookazteck', 'Book of Aztec King', 'vs10bookazteck', 'slot', NULL, 'PlayFiver/Pragmatic/vs10bookazteck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:28:23'),
(108, 2, 'inativo', 'vs50mightra', 'Might of Ra', 'vs50mightra', 'slot', NULL, 'PlayFiver/Pragmatic/vs50mightra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-15 02:25:01'),
(109, 2, 'inativo', 'vs25bullfiesta', 'Bull Fiesta', 'vs25bullfiesta', 'slot', NULL, 'PlayFiver/Pragmatic/vs25bullfiesta.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:58:34'),
(110, 2, 'inativo', 'vs20rainbowg', 'Rainbow Gold', 'vs20rainbowg', 'slot', NULL, 'PlayFiver/Pragmatic/vs20rainbowg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:56:19'),
(111, 2, 'inativo', 'vs10tictac', 'Tic Tac Take', 'vs10tictac', 'slot', NULL, 'PlayFiver/Pragmatic/vs10tictac.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(112, 2, 'inativo', 'vs243discolady', 'Disco Lady', 'vs243discolady', 'slot', NULL, 'PlayFiver/Pragmatic/vs243discolady.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:07:30'),
(113, 2, 'inativo', 'vs243queenie', 'Queenie', 'vs243queenie', 'slot', NULL, 'PlayFiver/Pragmatic/vs243queenie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:09:00'),
(114, 2, 'inativo', 'vs20farmfest', 'Barn Festival', 'vs20farmfest', 'slot', NULL, 'PlayFiver/Pragmatic/vs20farmfest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(115, 2, 'inativo', 'vs20bchprty', 'Wild Beach Party', 'vs20bchprty', 'slot', NULL, 'PlayFiver/Pragmatic/vs20bchprty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:24:06'),
(116, 2, 'inativo', 'vs20ultim5', 'The Ultimate 5', 'vs20ultim5', 'slot', NULL, 'PlayFiver/Pragmatic/vs20ultim5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 02:54:49'),
(117, 2, 'inativo', 'vs25copsrobbers', 'Cash Patrol', 'vs25copsrobbers', 'slot', NULL, 'PlayFiver/Pragmatic/vs25copsrobbers.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:03:16'),
(118, 2, 'inativo', 'vs20colcashzone', 'Colossal Cash Zone', 'vs20colcashzone', 'slot', NULL, 'PlayFiver/Pragmatic/vs20colcashzone.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:37:22'),
(119, 2, 'inativo', 'vs20rockvegas', 'Rock Vegas Mega Hold e Spin', 'vs20rockvegas', 'slot', NULL, 'PlayFiver/Pragmatic/vs20rockvegas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:33:20'),
(120, 2, 'inativo', 'vs20superx', 'Super X(tm)', 'vs20superx', 'slot', NULL, 'PlayFiver/Pragmatic/vs20superx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:18:19'),
(121, 2, 'inativo', 'vswayscryscav', 'Crystal Caverns Megaways(tm)', 'vswayscryscav', 'slot', NULL, 'PlayFiver/Pragmatic/vswayscryscav.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(122, 2, 'inativo', 'vs20smugcove', 'Smugglers Cove(tm)', 'vs20smugcove', 'slot', NULL, 'PlayFiver/Pragmatic/vs20smugcove.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 23:31:23'),
(123, 2, 'inativo', 'vs4096magician', 'Magician s Secrets(tm)', 'vs4096magician', 'slot', NULL, 'PlayFiver/Pragmatic/vs4096magician.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 20:25:34'),
(124, 2, 'inativo', 'vs40wanderw', 'Wild Depths(tm)', 'vs40wanderw', 'slot', NULL, 'PlayFiver/Pragmatic/vs40wanderw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(125, 2, 'inativo', 'vswaysxjuicy', 'Extra Juicy Megaways(tm)', 'vswaysxjuicy', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysxjuicy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:39:30'),
(126, 2, 'inativo', 'vs25goldparty', 'Gold Party(r)', 'vs25goldparty', 'slot', NULL, 'PlayFiver/Pragmatic/vs25goldparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:57:10'),
(127, 2, 'inativo', 'vs10runes', 'Gates of Valhalla(tm)', 'vs10runes', 'slot', NULL, 'PlayFiver/Pragmatic/vs10runes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(128, 2, 'inativo', 'vs20amuleteg', 'Fortune of Giza(tm)', 'vs20amuleteg', 'slot', NULL, 'PlayFiver/Pragmatic/vs20amuleteg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(129, 2, 'inativo', 'vs25tigeryear', 'New Year Tiger Treasures (tm)', 'vs25tigeryear', 'slot', NULL, 'PlayFiver/Pragmatic/vs25tigeryear.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:51:31'),
(130, 2, 'inativo', 'vs243empcaishen', 'Emperor Caishen', 'vs243empcaishen', 'slot', NULL, 'PlayFiver/Pragmatic/vs243empcaishen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 01:23:54'),
(131, 2, 'inativo', 'vs20pbonanza', 'Pyramid Bonanza', 'vs20pbonanza', 'slot', NULL, 'PlayFiver/Pragmatic/vs20pbonanza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(132, 2, 'inativo', 'vs20trsbox', 'Treasure Wild', 'vs20trsbox', 'slot', NULL, 'PlayFiver/Pragmatic/vs20trsbox.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 11:45:20'),
(133, 2, 'inativo', 'vs243chargebull', 'Raging Bull', 'vs243chargebull', 'slot', NULL, 'PlayFiver/Pragmatic/vs243chargebull.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 05:16:10'),
(134, 2, 'inativo', 'vswaysbankbonz', 'Cash Bonanza', 'vswaysbankbonz', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysbankbonz.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 06:19:41'),
(135, 2, 'inativo', 'vs576hokkwolf', 'Hokkaido Wolf', 'vs576hokkwolf', 'slot', NULL, 'PlayFiver/Pragmatic/vs576hokkwolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:40:38'),
(136, 2, 'inativo', 'vs20phoenixf', 'Phoenix Forge', 'vs20phoenixf', 'slot', NULL, 'PlayFiver/Pragmatic/vs20phoenixf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 00:05:22'),
(137, 2, 'inativo', 'vswaysaztecking', 'Aztec King Megaways', 'vswaysaztecking', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysaztecking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 11:14:55'),
(138, 2, 'inativo', 'vs10luckcharm', 'Lucky Grace And Charm', 'vs10luckcharm', 'slot', NULL, 'PlayFiver/Pragmatic/vs10luckcharm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:04:36'),
(139, 2, 'inativo', 'vswayselements', 'Elemental Gems Megaways', 'vswayselements', 'slot', NULL, 'PlayFiver/Pragmatic/vswayselements.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(140, 2, 'inativo', 'vswayschilheat', 'Chilli Heat Megaways', 'vswayschilheat', 'slot', NULL, 'PlayFiver/Pragmatic/vswayschilheat.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(141, 2, 'inativo', 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', 'vs20magicpot', 'slot', NULL, 'PlayFiver/Pragmatic/vs20magicpot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:37:25'),
(142, 2, 'inativo', 'vs10amm', 'The Amazing Money Machine', 'vs10amm', 'slot', NULL, 'PlayFiver/Pragmatic/vs10amm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(143, 2, 'inativo', 'vs117649starz', 'Starz Megaways', 'vs117649starz', 'slot', NULL, 'PlayFiver/Pragmatic/vs117649starz.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:40:58'),
(144, 2, 'inativo', 'vs10wildtut', 'Mysterious Egypt', 'vs10wildtut', 'slot', NULL, 'PlayFiver/Pragmatic/vs10wildtut.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 21:48:16'),
(145, 2, 'inativo', 'vs10eyestorm', 'Eye of the Storm', 'vs10eyestorm', 'slot', NULL, 'PlayFiver/Pragmatic/vs10eyestorm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(146, 2, 'inativo', 'vs25gldox', 'Golden Ox', 'vs25gldox', 'slot', NULL, 'PlayFiver/Pragmatic/vs25gldox.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:05:32'),
(147, 2, 'inativo', 'vs40voodoo', 'Voodoo Magic', 'vs40voodoo', 'slot', NULL, 'PlayFiver/Pragmatic/vs40voodoo.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 21:10:28'),
(148, 2, 'inativo', 'vs20bonzgold', 'Bonanza Gold', 'vs20bonzgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs20bonzgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:41:15'),
(149, 2, 'inativo', 'vs10mayangods', 'John Hunter and the Mayan Gods', 'vs10mayangods', 'slot', NULL, 'PlayFiver/Pragmatic/vs10mayangods.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 14:39:18'),
(150, 2, 'inativo', 'vs1024dtiger', 'The Dragon Tiger', 'vs1024dtiger', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024dtiger.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 03:34:15'),
(151, 2, 'inativo', 'vs20xmascarol', 'Christmas Carol Megaways', 'vs20xmascarol', 'slot', NULL, 'PlayFiver/Pragmatic/vs20xmascarol.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 14:23:18'),
(152, 2, 'inativo', 'vs10goldfish', 'Fishin Reels', 'vs10goldfish', 'fish', NULL, 'PlayFiver/Pragmatic/vs10goldfish.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2025-03-02 15:46:37'),
(153, 2, 'inativo', 'vs25bkofkngdm', 'Book of Kingdoms', 'vs25bkofkngdm', 'slot', NULL, 'PlayFiver/Pragmatic/vs25bkofkngdm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 16:12:31'),
(154, 2, 'inativo', 'vs20goldfever', 'Gems Bonanza', 'vs20goldfever', 'slot', NULL, 'PlayFiver/Pragmatic/vs20goldfever.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:10:31'),
(155, 2, 'inativo', 'vs25walker', 'Wild Walker', 'vs25walker', 'slot', NULL, 'PlayFiver/Pragmatic/vs25walker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 03:16:09'),
(156, 2, 'inativo', 'vs25samurai', 'Rise of Samurai', 'vs25samurai', 'slot', NULL, 'PlayFiver/Pragmatic/vs25samurai.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 16:29:47'),
(157, 2, 'inativo', 'vswayshive', 'Star Bounty', 'vswayshive', 'slot', NULL, 'PlayFiver/Pragmatic/vswayshive.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 05:24:38'),
(158, 2, 'inativo', 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'vswayswerewolf', 'slot', NULL, 'PlayFiver/Pragmatic/vswayswerewolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:06:21'),
(159, 2, 'inativo', 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'vs9aztecgemsdx', 'slot', NULL, 'PlayFiver/Pragmatic/vs9aztecgemsdx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(160, 2, 'inativo', 'vs20gorilla', 'Jungle Gorilla', 'vs20gorilla', 'slot', NULL, 'PlayFiver/Pragmatic/vs20gorilla.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(161, 2, 'inativo', 'vs40streetracer', 'Street Racer', 'vs40streetracer', 'slot', NULL, 'PlayFiver/Pragmatic/vs40streetracer.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 01:46:35'),
(162, 2, 'inativo', 'vs1fufufu', 'Fu Fu Fu', 'vs1fufufu', 'slot', NULL, 'PlayFiver/Pragmatic/vs1fufufu.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 23:51:25'),
(163, 2, 'inativo', 'vs1600drago', 'Drago - Jewels of Fortune', 'vs1600drago', 'slot', NULL, 'PlayFiver/Pragmatic/vs1600drago.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:35:59'),
(164, 2, 'inativo', 'vs1money', 'Money Money Money', 'vs1money', 'slot', NULL, 'PlayFiver/Pragmatic/vs1money.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:50:55'),
(166, 2, 'inativo', 'vs40beowulf', 'Beowulf', 'vs40beowulf', 'slot', NULL, 'PlayFiver/Pragmatic/vs40beowulf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 12:59:43'),
(167, 2, 'inativo', 'vs4096jurassic', 'Jurassic Giants', 'vs4096jurassic', 'slot', NULL, 'PlayFiver/Pragmatic/vs4096jurassic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:49:21'),
(168, 2, 'inativo', 'vs3train', 'Gold Train', 'vs3train', 'slot', NULL, 'PlayFiver/Pragmatic/vs3train.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 12:24:09'),
(169, 2, 'inativo', 'vs9hotroll', 'Hot Chilli', 'vs9hotroll', 'slot', NULL, 'PlayFiver/Pragmatic/vs9hotroll.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:01:15'),
(170, 2, 'inativo', 'vs25queenofgold', 'Queen of Gold', 'vs25queenofgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs25queenofgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:42:19'),
(171, 2, 'inativo', 'vs5spjoker', 'Super Joker', 'vs5spjoker', 'slot', NULL, 'PlayFiver/Pragmatic/vs5spjoker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2025-06-11 21:58:48'),
(172, 2, 'inativo', 'vs20egypttrs', 'Egyptian Fortunes', 'vs20egypttrs', 'slot', NULL, 'PlayFiver/Pragmatic/vs20egypttrs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 15:39:51'),
(173, 2, 'inativo', 'vs18mashang', 'Treasure Horse', 'vs18mashang', 'slot', NULL, 'PlayFiver/Pragmatic/vs18mashang.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 12:54:18'),
(174, 2, 'inativo', 'vs50chinesecharms', 'Lucky Dragons', 'vs50chinesecharms', 'slot', NULL, 'PlayFiver/Pragmatic/vs50chinesecharms.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 16:10:30'),
(175, 2, 'inativo', 'vs7monkeys', '7 Monkeys', 'vs7monkeys', 'slot', NULL, 'PlayFiver/Pragmatic/vs7monkeys.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 15:58:10'),
(176, 2, 'inativo', 'vs25sea', 'Great Reef', 'vs25sea', 'slot', NULL, 'PlayFiver/Pragmatic/vs25sea.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:59:57'),
(177, 2, 'inativo', 'vs20leprechaun', 'Leprechaun Song', 'vs20leprechaun', 'slot', NULL, 'PlayFiver/Pragmatic/vs20leprechaun.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:42:56'),
(178, 2, 'inativo', 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'vs25dwarves_new', 'slot', NULL, 'PlayFiver/Pragmatic/vs25dwarves_new.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:58:02'),
(179, 2, 'inativo', 'vs5hotburn', 'Hot to burn', 'vs5hotburn', 'slot', NULL, 'PlayFiver/Pragmatic/vs5hotburn.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:43:09'),
(180, 2, 'inativo', 'vs9chen', 'Master Chen s Fortune', 'vs9chen', 'slot', NULL, 'PlayFiver/Pragmatic/vs9chen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 12:13:53'),
(181, 2, 'inativo', 'vs1tigers', 'Triple Tigers', 'vs1tigers', 'slot', NULL, 'PlayFiver/Pragmatic/vs1tigers.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 14:31:44'),
(182, 2, 'inativo', 'vs20godiva', 'Lady Godiva', 'vs20godiva', 'slot', NULL, 'PlayFiver/Pragmatic/vs20godiva.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 15:53:55'),
(183, 2, 'inativo', 'vs9madmonkey', 'Monkey Madness', 'vs9madmonkey', 'slot', NULL, 'PlayFiver/Pragmatic/vs9madmonkey.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(184, 2, 'inativo', 'vs50kingkong', 'Mighty Kong', 'vs50kingkong', 'slot', NULL, 'PlayFiver/Pragmatic/vs50kingkong.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 08:01:42'),
(185, 2, 'inativo', 'vs40frrainbow', 'Fruit Rainbow', 'vs40frrainbow', 'slot', NULL, 'PlayFiver/Pragmatic/vs40frrainbow.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:43:20'),
(186, 2, 'inativo', 'vs25newyear', 'Lucky New Year', 'vs25newyear', 'slot', NULL, 'PlayFiver/Pragmatic/vs25newyear.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-12 10:30:04'),
(187, 2, 'inativo', 'vs40madwheel', 'The Wild Machine', 'vs40madwheel', 'slot', NULL, 'PlayFiver/Pragmatic/vs40madwheel.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-15 09:40:19'),
(188, 2, 'inativo', 'vs5trdragons', 'Triple Dragons', 'vs5trdragons', 'slot', NULL, 'PlayFiver/Pragmatic/vs5trdragons.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:29:28'),
(189, 2, 'inativo', 'vs7776aztec', 'Aztec Bonanza', 'vs7776aztec', 'slot', NULL, 'PlayFiver/Pragmatic/vs7776aztec.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(190, 2, 'inativo', 'vs50hercules', 'Hercules Son of Zeus', 'vs50hercules', 'slot', NULL, 'PlayFiver/Pragmatic/vs50hercules.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 18:02:31'),
(191, 2, 'inativo', 'vs25journey', 'Journey to the West', 'vs25journey', 'slot', NULL, 'PlayFiver/Pragmatic/vs25journey.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 22:04:05'),
(192, 2, 'inativo', 'vs20chicken', 'The Great Chicken Escape', 'vs20chicken', 'slot', NULL, 'PlayFiver/Pragmatic/vs20chicken.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:52:01'),
(193, 2, 'inativo', 'vs1fortunetree', 'Tree of Riches', 'vs1fortunetree', 'slot', NULL, 'PlayFiver/Pragmatic/vs1fortunetree.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(194, 2, 'inativo', 'vs20wildpix', 'Wild Pixies', 'vs20wildpix', 'slot', NULL, 'PlayFiver/Pragmatic/vs20wildpix.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:04:02'),
(195, 2, 'inativo', 'vs15fairytale', 'Fairytale Fortune', 'vs15fairytale', 'slot', NULL, 'PlayFiver/Pragmatic/vs15fairytale.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:37:20'),
(196, 2, 'inativo', 'vs20santa', 'Santa', 'vs20santa', 'slot', NULL, 'PlayFiver/Pragmatic/vs20santa.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 12:14:04'),
(197, 2, 'inativo', 'vs10vampwolf', 'Vampires vs Wolves', 'vs10vampwolf', 'slot', NULL, 'PlayFiver/Pragmatic/vs10vampwolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(198, 2, 'inativo', 'vs50aladdin', '3 Genie Wishes', 'vs50aladdin', 'slot', NULL, 'PlayFiver/Pragmatic/vs50aladdin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-09-05 23:30:36'),
(199, 2, 'inativo', 'vs25safari', 'Hot Safari', 'vs25safari', 'slot', NULL, 'PlayFiver/Pragmatic/vs25safari.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(200, 2, 'inativo', 'vs20honey', 'Honey Honey Honey', 'vs20honey', 'slot', NULL, 'PlayFiver/Pragmatic/vs20honey.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2025-06-11 22:00:47'),
(201, 2, 'inativo', 'vs20hercpeg', 'Hercules and Pegasus', 'vs20hercpeg', 'slot', NULL, 'PlayFiver/Pragmatic/vs20hercpeg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 16:59:20'),
(202, 2, 'inativo', 'vs7fire88', 'Fire 88', 'vs7fire88', 'slot', NULL, 'PlayFiver/Pragmatic/vs7fire88.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:44:19'),
(203, 2, 'inativo', 'vs5aztecgems', 'Aztec Gems', 'vs5aztecgems', 'slot', NULL, 'PlayFiver/Pragmatic/vs5aztecgems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:09:17'),
(204, 2, 'inativo', 'vs1dragon8', '888 Dragons', 'vs1dragon8', 'slot', NULL, 'PlayFiver/Pragmatic/vs1dragon8.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:44:33'),
(205, 2, 'inativo', 'vs25dragonkingdom', 'Dragon Kingdom', 'vs25dragonkingdom', 'slot', NULL, 'PlayFiver/Pragmatic/vs25dragonkingdom.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:52:18'),
(206, 2, 'inativo', 'vs25goldrush', 'Gold Rush', 'vs25goldrush', 'slot', NULL, 'PlayFiver/Pragmatic/vs25goldrush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:33:09'),
(207, 2, 'inativo', 'vs25goldpig', 'Golden Pig', 'vs25goldpig', 'slot', NULL, 'PlayFiver/Pragmatic/vs25goldpig.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 10:30:10'),
(208, 2, 'inativo', 'vs25gladiator', 'Wild Gladiator', 'vs25gladiator', 'slot', NULL, 'PlayFiver/Pragmatic/vs25gladiator.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:44:49'),
(209, 2, 'inativo', 'vs5joker', 'Joker s Jewels', 'vs5joker', 'slot', NULL, 'PlayFiver/Pragmatic/vs5joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-06-03 22:38:12'),
(210, 2, 'inativo', 'vs243caishien', 'Caishen s Cash', 'vs243caishien', 'slot', NULL, 'PlayFiver/Pragmatic/vs243caishien.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:26:59'),
(211, 2, 'inativo', 'vs7pigs', '7 Piggies', 'vs7pigs', 'slot', NULL, 'PlayFiver/Pragmatic/vs7pigs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 23:52:17'),
(212, 2, 'inativo', 'vs20leprexmas', 'Leprechaun Carol', 'vs20leprexmas', 'slot', NULL, 'PlayFiver/Pragmatic/vs20leprexmas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(213, 2, 'inativo', 'vs8magicjourn', 'Magic Journey', 'vs8magicjourn', 'slot', NULL, 'PlayFiver/Pragmatic/vs8magicjourn.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:10:17'),
(214, 2, 'inativo', 'vs243fortseren', 'Greek Gods', 'vs243fortseren', 'slot', NULL, 'PlayFiver/Pragmatic/vs243fortseren.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 16:28:47'),
(215, 2, 'inativo', 'vs25chilli', 'Chilli Heat', 'vs25chilli', 'slot', NULL, 'PlayFiver/Pragmatic/vs25chilli.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-08-13 17:23:26'),
(216, 2, 'inativo', 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', 'vs20aladdinsorc', 'slot', NULL, 'PlayFiver/Pragmatic/vs20aladdinsorc.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:25:31'),
(217, 2, 'inativo', 'vs243fortune', 'Caishen s Gold', 'vs243fortune', 'slot', NULL, 'PlayFiver/Pragmatic/vs243fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:15:14'),
(218, 2, 'inativo', 'vs10firestrike', 'Fire Strike', 'vs10firestrike', 'slot', NULL, 'PlayFiver/Pragmatic/vs10firestrike.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:00:28'),
(219, 2, 'inativo', 'vs20kraken', 'Release the Kraken', 'vs20kraken', 'slot', NULL, 'PlayFiver/Pragmatic/vs20kraken.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 21:37:14'),
(220, 2, 'inativo', 'vs1masterjoker', 'Master Joker', 'vs1masterjoker', 'slot', NULL, 'PlayFiver/Pragmatic/vs1masterjoker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2025-08-28 14:02:37'),
(221, 2, 'inativo', 'vs5super7', 'Super 7s', 'vs5super7', 'slot', NULL, 'PlayFiver/Pragmatic/vs5super7.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 13:23:24');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(222, 2, 'inativo', 'vs20wildboost', 'Wild Booster', 'vs20wildboost', 'slot', NULL, 'PlayFiver/Pragmatic/vs20wildboost.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:45:39'),
(223, 2, 'inativo', 'vswayshammthor', 'Power of Thor Megaways', 'vswayshammthor', 'slot', NULL, 'PlayFiver/Pragmatic/vswayshammthor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:45:54'),
(224, 2, 'inativo', 'vs243lions', '5 Lions', 'vs243lions', 'slot', NULL, 'PlayFiver/Pragmatic/vs243lions.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 14:18:29'),
(225, 2, 'inativo', 'vs243mwarrior', 'Monkey Warrior', 'vs243mwarrior', 'slot', NULL, 'PlayFiver/Pragmatic/vs243mwarrior.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 22:41:27'),
(226, 2, 'inativo', 'vs20doghouse', 'The Dog House', 'vs20doghouse', 'slot', NULL, 'PlayFiver/Pragmatic/vs20doghouse.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-05-27 15:25:59', '2025-06-10 13:44:25'),
(227, 2, 'inativo', 'vs40pirate', 'Pirate Gold', 'vs40pirate', 'slot', NULL, 'PlayFiver/Pragmatic/vs40pirate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:14:04'),
(228, 2, 'inativo', 'vs20rhino', 'Great Rhino', 'vs20rhino', 'slot', NULL, 'PlayFiver/Pragmatic/vs20rhino.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(229, 2, 'inativo', 'vs25pandagold', 'Panda Fortune', 'vs25pandagold', 'slot', NULL, 'PlayFiver/Pragmatic/vs25pandagold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 11:40:59'),
(230, 2, 'inativo', 'vs4096bufking', 'Buffalo King', 'vs4096bufking', 'slot', NULL, 'PlayFiver/Pragmatic/vs4096bufking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-04 11:12:14'),
(231, 2, 'inativo', 'vs25pyramid', 'Pyramid King', 'vs25pyramid', 'slot', NULL, 'PlayFiver/Pragmatic/vs25pyramid.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:32:25'),
(232, 2, 'inativo', 'vs5ultrab', 'Ultra Burn', 'vs5ultrab', 'slot', NULL, 'PlayFiver/Pragmatic/vs5ultrab.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 23:25:29'),
(233, 2, 'inativo', 'vs5ultra', 'Ultra Hold and Spin', 'vs5ultra', 'slot', NULL, 'PlayFiver/Pragmatic/vs5ultra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:09:26'),
(234, 2, 'inativo', 'vs25jokerking', 'Joker King', 'vs25jokerking', 'slot', NULL, 'PlayFiver/Pragmatic/vs25jokerking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:10:43'),
(235, 2, 'inativo', 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'slot', NULL, 'PlayFiver/Pragmatic/vs10returndead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 21:31:40'),
(236, 2, 'inativo', 'vs10madame', 'Madame Destiny', 'vs10madame', 'slot', NULL, 'PlayFiver/Pragmatic/vs10madame.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:43:03'),
(237, 2, 'inativo', 'vs15diamond', 'Diamond Strike', 'vs15diamond', 'slot', NULL, 'PlayFiver/Pragmatic/vs15diamond.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(238, 2, 'inativo', 'vs25aztecking', 'Aztec King', 'vs25aztecking', 'slot', NULL, 'PlayFiver/Pragmatic/vs25aztecking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 19:14:58'),
(239, 2, 'inativo', 'vs25wildspells', 'Wild Spells', 'vs25wildspells', 'slot', NULL, 'PlayFiver/Pragmatic/vs25wildspells.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(240, 2, 'inativo', 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'fish', NULL, 'PlayFiver/Pragmatic/vs10bbbonanza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2315, 0, 1, '2024-05-27 15:25:59', '2025-09-05 15:33:58'),
(241, 2, 'inativo', 'vs10cowgold', 'Cowboys Gold', 'vs10cowgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs10cowgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:26:06'),
(242, 2, 'inativo', 'vs25tigerwar', 'The Tiger Warrior', 'vs25tigerwar', 'slot', NULL, 'PlayFiver/Pragmatic/vs25tigerwar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:36:32'),
(243, 2, 'inativo', 'vs25mustang', 'Mustang Gold', 'vs25mustang', 'slot', NULL, 'PlayFiver/Pragmatic/vs25mustang.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:23:06'),
(244, 2, 'inativo', 'vs25hotfiesta', 'Hotfiesta', 'vs25hotfiesta', 'slot', NULL, 'PlayFiver/Pragmatic/vs25hotfiesta.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 05:24:37'),
(245, 2, 'inativo', 'vs243dancingpar', 'Dance Party', 'vs243dancingpar', 'slot', NULL, 'PlayFiver/Pragmatic/vs243dancingpar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(246, 2, 'inativo', 'vs576treasures', 'Wild Wild Riches', 'vs576treasures', 'slot', NULL, 'PlayFiver/Pragmatic/vs576treasures.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(247, 2, 'inativo', 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'slot', NULL, 'PlayFiver/Pragmatic/vs20hburnhs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 21:50:41'),
(248, 2, 'inativo', 'vs20emptybank', 'Empty the Bank', 'vs20emptybank', 'slot', NULL, 'PlayFiver/Pragmatic/vs20emptybank.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 06:05:50'),
(249, 2, 'inativo', 'vs20midas', 'The Hand of Midas', 'vs20midas', 'slot', NULL, 'PlayFiver/Pragmatic/vs20midas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:01:44'),
(250, 2, 'inativo', 'vs20olympgate', 'Gates of Olympus', 'vs20olympgate', 'slot', NULL, 'PlayFiver/Pragmatic/vs20olympgate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 00:14:50'),
(251, 2, 'inativo', 'vswayslight', 'Lucky Lightning', 'vswayslight', 'slot', NULL, 'PlayFiver/Pragmatic/vswayslight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(252, 2, 'inativo', 'vs20vegasmagic', 'Vegas Magic', 'vs20vegasmagic', 'slot', NULL, 'PlayFiver/Pragmatic/vs20vegasmagic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 01:29:54'),
(253, 2, 'inativo', 'vs20fruitparty', 'Fruit Party', 'vs20fruitparty', 'slot', NULL, 'PlayFiver/Pragmatic/vs20fruitparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:40:58'),
(254, 2, 'inativo', 'vs20fparty2', 'Fruit Party 2', 'vs20fparty2', 'slot', NULL, 'PlayFiver/Pragmatic/vs20fparty2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:09:40'),
(255, 2, 'inativo', 'vswaysdogs', 'The Dog House Megaways', 'vswaysdogs', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysdogs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(256, 2, 'inativo', 'vs50juicyfr', 'Juicy Fruits', 'vs50juicyfr', 'slot', NULL, 'PlayFiver/Pragmatic/vs50juicyfr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:46:53'),
(257, 2, 'inativo', 'vs25pandatemple', 'Panda Fortune 2', 'vs25pandatemple', 'slot', NULL, 'PlayFiver/Pragmatic/vs25pandatemple.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:02:13'),
(258, 2, 'inativo', 'vswaysbufking', 'Buffalo King Megaways', 'vswaysbufking', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysbufking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:25:33'),
(259, 2, 'inativo', 'vs40wildwest', 'Wild West Gold', 'vs40wildwest', 'slot', NULL, 'PlayFiver/Pragmatic/vs40wildwest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:17:31'),
(260, 2, 'inativo', 'vs20chickdrop', 'Chicken Drop', 'vs20chickdrop', 'slot', NULL, 'PlayFiver/Pragmatic/vs20chickdrop.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:17:26'),
(261, 2, 'inativo', 'vs40spartaking', 'Spartan King', 'vs40spartaking', 'slot', NULL, 'PlayFiver/Pragmatic/vs40spartaking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:12:17'),
(262, 2, 'inativo', 'vswaysrhino', 'Great Rhino Megaways', 'vswaysrhino', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysrhino.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:07:16'),
(263, 2, 'inativo', 'vs20sbxmas', 'Sweet Bonanza Xmas', 'vs20sbxmas', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sbxmas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 11:58:01'),
(264, 2, 'inativo', 'vs10fruity2', 'Extra Juicy', 'vs10fruity2', 'slot', NULL, 'PlayFiver/Pragmatic/vs10fruity2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:47:19'),
(265, 2, 'inativo', 'vs10egypt', 'Ancient Egypt', 'vs10egypt', 'slot', NULL, 'PlayFiver/Pragmatic/vs10egypt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:25:36'),
(266, 2, 'inativo', 'vs5drhs', 'Dragon Hot Hold and Spin', 'vs5drhs', 'slot', NULL, 'PlayFiver/Pragmatic/vs5drhs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:10:51'),
(267, 2, 'inativo', 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'fish', NULL, 'PlayFiver/Pragmatic/vs12bbb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-06-04 15:42:07'),
(268, 2, 'inativo', 'vs20tweethouse', 'The Tweety House', 'vs20tweethouse', 'slot', NULL, 'PlayFiver/Pragmatic/vs20tweethouse.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 07:29:43'),
(269, 2, 'inativo', 'vswayslions', '5 Lions Megaways', 'vswayslions', 'slot', NULL, 'PlayFiver/Pragmatic/vswayslions.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(270, 2, 'inativo', 'vswayssamurai', 'Rise of Samurai Megaways', 'vswayssamurai', 'slot', NULL, 'PlayFiver/Pragmatic/vswayssamurai.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 20:10:35'),
(271, 2, 'inativo', 'vs50pixie', 'Pixie Wings', 'vs50pixie', 'slot', NULL, 'PlayFiver/Pragmatic/vs50pixie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:17:08'),
(272, 2, 'inativo', 'vs10floatdrg', 'Floating Dragon', 'vs10floatdrg', 'slot', NULL, 'PlayFiver/Pragmatic/vs10floatdrg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:10:18'),
(273, 2, 'inativo', 'vs20fruitsw', 'Sweet Bonanza', 'vs20fruitsw', 'slot', NULL, 'PlayFiver/Pragmatic/vs20fruitsw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:05:24'),
(274, 2, 'inativo', 'vs20rhinoluxe', 'Great Rhino Deluxe', 'vs20rhinoluxe', 'slot', NULL, 'PlayFiver/Pragmatic/vs20rhinoluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:47:57'),
(275, 2, 'inativo', 'vswaysmadame', 'Madame Destiny Megaways', 'vswaysmadame', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysmadame.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:14:46'),
(276, 2, 'inativo', 'vs1024temuj', 'Temujin Treasures', 'vs1024temuj', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024temuj.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(277, 2, 'inativo', 'vs40pirgold', 'Pirate Gold Deluxe', 'vs40pirgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs40pirgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-11 12:24:56'),
(278, 2, 'inativo', 'vs25mmouse', 'Money Mouse', 'vs25mmouse', 'slot', NULL, 'PlayFiver/Pragmatic/vs25mmouse.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:14:31'),
(279, 2, 'inativo', 'vs10threestar', 'Three Star Fortune', 'vs10threestar', 'slot', NULL, 'PlayFiver/Pragmatic/vs10threestar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 01:27:18'),
(280, 2, 'inativo', 'vs1ball', 'Lucky Dragon Ball', 'vs1ball', 'slot', NULL, 'PlayFiver/Pragmatic/vs1ball.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 17:07:03'),
(281, 2, 'inativo', 'vs243lionsgold', '5 Lions', 'vs243lionsgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs243lionsgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(282, 2, 'inativo', 'vs10egyptcls', 'Ancient Egypt Classic', 'vs10egyptcls', 'slot', NULL, 'PlayFiver/Pragmatic/vs10egyptcls.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 04:48:46'),
(283, 2, 'inativo', 'vs25davinci', 'Da Vinci Treasure', 'vs25davinci', 'slot', NULL, 'PlayFiver/Pragmatic/vs25davinci.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:34:49'),
(284, 2, 'inativo', 'vs7776secrets', 'Aztec Treasure', 'vs7776secrets', 'slot', NULL, 'PlayFiver/Pragmatic/vs7776secrets.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:20:44'),
(285, 2, 'inativo', 'vs25wolfgold', 'Wolf Gold', 'vs25wolfgold', 'slot', NULL, 'PlayFiver/Pragmatic/vs25wolfgold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:14:18'),
(286, 2, 'inativo', 'vs50safariking', 'Safari King', 'vs50safariking', 'slot', NULL, 'PlayFiver/Pragmatic/vs50safariking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:31:20'),
(287, 2, 'inativo', 'vs25peking', 'Peking Luck', 'vs25peking', 'slot', NULL, 'PlayFiver/Pragmatic/vs25peking.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:21:28'),
(288, 2, 'inativo', 'vs25asgard', 'Asgard', 'vs25asgard', 'slot', NULL, 'PlayFiver/Pragmatic/vs25asgard.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-02 04:18:03'),
(289, 2, 'inativo', 'vs25vegas', 'Vegas Nights', 'vs25vegas', 'slot', NULL, 'PlayFiver/Pragmatic/vs25vegas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:07:30'),
(290, 2, 'inativo', 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'vs25scarabqueen', 'slot', NULL, 'PlayFiver/Pragmatic/vs25scarabqueen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-31 19:32:30'),
(291, 2, 'inativo', 'vs20starlight', 'Starlight Princess', 'vs20starlight', 'slot', NULL, 'PlayFiver/Pragmatic/vs20starlight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 22:38:37'),
(292, 2, 'inativo', 'vs10bookoftut', 'John Hunter and the Book of Tut', 'vs10bookoftut', 'slot', NULL, 'PlayFiver/Pragmatic/vs10bookoftut.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 03:02:13'),
(293, 2, 'inativo', 'vs9piggybank', 'Piggy Bank Bills', 'vs9piggybank', 'slot', NULL, 'PlayFiver/Pragmatic/vs9piggybank.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:32:29'),
(294, 2, 'inativo', 'vs5drmystery', 'Dragon Kingdom Mystery', 'vs5drmystery', 'slot', NULL, 'PlayFiver/Pragmatic/vs5drmystery.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:45:37'),
(295, 2, 'inativo', 'vs20eightdragons', 'Eight Dragons', 'vs20eightdragons', 'slot', NULL, 'PlayFiver/Pragmatic/vs20eightdragons.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(296, 2, 'inativo', 'vs1024lionsd', '5 Lions Dance', 'vs1024lionsd', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024lionsd.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 00:44:07'),
(297, 2, 'inativo', 'vs25rio', 'Heart of Rio', 'vs25rio', 'slot', NULL, 'PlayFiver/Pragmatic/vs25rio.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 20:50:46'),
(298, 2, 'inativo', 'vs10nudgeit', 'Rise of Giza PowerNudge', 'vs10nudgeit', 'slot', NULL, 'PlayFiver/Pragmatic/vs10nudgeit.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 18:59:56'),
(299, 2, 'inativo', 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'fish', NULL, 'PlayFiver/Pragmatic/vs10bxmasbnza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2025-06-04 15:46:41'),
(300, 2, 'inativo', 'vs20santawonder', 'Santa s Wonderland', 'vs20santawonder', 'slot', NULL, 'PlayFiver/Pragmatic/vs20santawonder.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:52:05'),
(301, 2, 'inativo', 'vs10bblpop', 'Bubble Pop', 'vs10bblpop', 'slot', NULL, 'PlayFiver/Pragmatic/vs10bblpop.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(302, 2, 'inativo', 'vs25btygold', 'Bounty Gold', 'vs25btygold', 'slot', NULL, 'PlayFiver/Pragmatic/vs25btygold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-12 09:29:50'),
(303, 2, 'inativo', 'vs88hockattack', 'Hockey Attack(tm)', 'vs88hockattack', 'slot', NULL, 'PlayFiver/Pragmatic/vs88hockattack.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(304, 2, 'inativo', 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'fish', NULL, 'PlayFiver/Pragmatic/vswaysbbb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-03-02 17:22:14'),
(305, 2, 'inativo', 'vs10bookfallen', 'Book of the Fallen', 'vs10bookfallen', 'slot', NULL, 'PlayFiver/Pragmatic/vs10bookfallen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:06:19'),
(306, 2, 'inativo', 'vs40bigjuan', 'Big Juan', 'vs40bigjuan', 'slot', NULL, 'PlayFiver/Pragmatic/vs40bigjuan.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:52:40'),
(307, 2, 'inativo', 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', 'vs20bermuda', 'slot', NULL, 'PlayFiver/Pragmatic/vs20bermuda.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 21:39:43'),
(308, 2, 'inativo', 'vs10starpirate', 'Star Pirates Code', 'vs10starpirate', 'slot', NULL, 'PlayFiver/Pragmatic/vs10starpirate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 15:27:12'),
(309, 2, 'inativo', 'vswayswest', 'Mystic Chief', 'vswayswest', 'slot', NULL, 'PlayFiver/Pragmatic/vswayswest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:37:49'),
(310, 2, 'inativo', 'vs20daydead', 'Day of Dead', 'vs20daydead', 'slot', NULL, 'PlayFiver/Pragmatic/vs20daydead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 22:51:28'),
(311, 2, 'inativo', 'vs20candvil', 'Candy Village', 'vs20candvil', 'slot', NULL, 'PlayFiver/Pragmatic/vs20candvil.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:14:23'),
(312, 2, 'inativo', 'vswayswwhex', 'Wild Wild Bananas', 'vswayswwhex', 'slot', NULL, 'PlayFiver/Pragmatic/vswayswwhex.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:08:17'),
(313, 2, 'inativo', 'vs25spgldways', 'Secret City Gold', 'vs25spgldways', 'slot', NULL, 'PlayFiver/Pragmatic/vs25spgldways.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 12:37:05'),
(314, 2, 'inativo', 'vswaysincwnd', 'Gold Oasis', 'vswaysincwnd', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysincwnd.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:11:01'),
(315, 2, 'inativo', 'vswaysftropics', 'Frozen Tropics', 'vswaysftropics', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysftropics.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(316, 2, 'inativo', 'vs20superlanche', 'Monster Superlanche', 'vs20superlanche', 'slot', NULL, 'PlayFiver/Pragmatic/vs20superlanche.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 16:32:44'),
(317, 2, 'inativo', 'vs10fisheye', 'Fish Eye', 'vs10fisheye', 'fish', NULL, 'PlayFiver/Pragmatic/vs10fisheye.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:52:54'),
(318, 2, 'inativo', 'vs20mochimon', 'Mochimon', 'vs20mochimon', 'slot', NULL, 'PlayFiver/Pragmatic/vs20mochimon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 00:04:17'),
(319, 2, 'inativo', 'vs20gatotfury', 'Gatot Kaca s Fury', 'vs20gatotfury', 'slot', NULL, 'PlayFiver/Pragmatic/vs20gatotfury.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:26:19'),
(320, 2, 'inativo', 'vs25archer', 'Fire Archer', 'vs25archer', 'slot', NULL, 'PlayFiver/Pragmatic/vs25archer.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 16:06:47'),
(321, 2, 'inativo', 'vs12tropicana', 'Club Tropicana', 'vs12tropicana', 'slot', NULL, 'PlayFiver/Pragmatic/vs12tropicana.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 03:29:15'),
(322, 2, 'inativo', 'vs10powerlines', 'Peak Power', 'vs10powerlines', 'slot', NULL, 'PlayFiver/Pragmatic/vs10powerlines.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:56:46'),
(323, 2, 'inativo', 'vswaysmorient', 'Mystery of the Orient', 'vswaysmorient', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysmorient.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:32:26'),
(324, 2, 'inativo', 'vs20goldclust', 'Rabbit Garden', 'vs20goldclust', 'slot', NULL, 'PlayFiver/Pragmatic/vs20goldclust.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 13:48:45'),
(325, 2, 'inativo', 'vs20sknights', 'The Knight King', 'vs20sknights', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sknights.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:08:50'),
(326, 2, 'inativo', 'vs20framazon', 'Fruits of the Amazon', 'vs20framazon', 'slot', NULL, 'PlayFiver/Pragmatic/vs20framazon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 22:36:29'),
(327, 2, 'inativo', 'vswaysredqueen', 'The Red Queen', 'vswaysredqueen', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysredqueen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 14:23:45'),
(328, 2, 'inativo', 'vs1024moonsh', 'Moonshot', 'vs1024moonsh', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024moonsh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:59:15'),
(329, 2, 'inativo', 'vs10bbhas', 'Big Bass - Hold e Spinner', 'vs10bbhas', 'fish', NULL, 'PlayFiver/Pragmatic/vs10bbhas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2025-03-02 15:53:56'),
(330, 2, 'inativo', 'vs20hotzone', 'African Elephant', 'vs20hotzone', 'slot', NULL, 'PlayFiver/Pragmatic/vs20hotzone.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:05:30'),
(331, 2, 'inativo', 'vswaysmonkey', '3 Dancing Monkeys', 'vswaysmonkey', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysmonkey.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:12:27'),
(332, 2, 'inativo', 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'vswaysrsm', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysrsm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 15:47:18'),
(333, 2, 'inativo', 'vs10gizagods', 'Gods of Giza', 'vs10gizagods', 'slot', NULL, 'PlayFiver/Pragmatic/vs10gizagods.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:36:36'),
(334, 2, 'inativo', 'vswaysultrcoin', 'Cowboy Coins', 'vswaysultrcoin', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysultrcoin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(335, 2, 'inativo', 'vs10kingofdth', 'Kingdom of the Dead', 'vs10kingofdth', 'slot', NULL, 'PlayFiver/Pragmatic/vs10kingofdth.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 06:29:41'),
(336, 2, 'inativo', 'vs20mvwild', 'Jasmine Dreams', 'vs20mvwild', 'slot', NULL, 'PlayFiver/Pragmatic/vs20mvwild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:53:33'),
(337, 2, 'inativo', 'vs25holiday', 'Holiday Ride', 'vs25holiday', 'slot', NULL, 'PlayFiver/Pragmatic/vs25holiday.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 13:58:32'),
(338, 2, 'inativo', 'vs20stickywild', 'Wild Bison Charge', 'vs20stickywild', 'slot', NULL, 'PlayFiver/Pragmatic/vs20stickywild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:56:29'),
(339, 2, 'inativo', 'vs20excalibur', 'Excalibur Unleashed', 'vs20excalibur', 'slot', NULL, 'PlayFiver/Pragmatic/vs20excalibur.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:58:03'),
(340, 2, 'inativo', 'vs25spotz', 'Knight Hot Spotz', 'vs25spotz', 'slot', NULL, 'PlayFiver/Pragmatic/vs25spotz.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 22:54:41'),
(341, 2, 'inativo', 'vs20clustwild', 'Sticky Bees', 'vs20clustwild', 'slot', NULL, 'PlayFiver/Pragmatic/vs20clustwild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:32:16'),
(342, 2, 'inativo', 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'vs10fdrasbf', 'slot', NULL, 'PlayFiver/Pragmatic/vs10fdrasbf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 08:29:45'),
(343, 2, 'inativo', 'vs4096robber', 'Robber Strike', 'vs4096robber', 'slot', NULL, 'PlayFiver/Pragmatic/vs4096robber.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 11:22:02'),
(344, 2, 'inativo', 'vs20lampinf', 'Lamp Of Infinity', 'vs20lampinf', 'slot', NULL, 'PlayFiver/Pragmatic/vs20lampinf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 02:05:35'),
(345, 2, 'inativo', 'vswaysfrbugs', 'Frogs e Bugs', 'vswaysfrbugs', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysfrbugs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 14:29:47'),
(346, 2, 'inativo', 'vs9outlaw', 'Pirates Pub', 'vs9outlaw', 'slot', NULL, 'PlayFiver/Pragmatic/vs9outlaw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:04:34'),
(347, 2, 'inativo', 'vs20jewelparty', 'Jewel Rush', 'vs20jewelparty', 'slot', NULL, 'PlayFiver/Pragmatic/vs20jewelparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:35:40'),
(348, 2, 'inativo', 'vs20beefed', 'Fat Panda', 'vs20beefed', 'slot', NULL, 'PlayFiver/Pragmatic/vs20beefed.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(349, 2, 'inativo', 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'vs20hstgldngt', 'slot', NULL, 'PlayFiver/Pragmatic/vs20hstgldngt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 21:58:09'),
(350, 2, 'inativo', 'vs25jokrace', 'Joker Race', 'vs25jokrace', 'slot', NULL, 'PlayFiver/Pragmatic/vs25jokrace.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:53:46'),
(351, 2, 'inativo', 'vs243nudge4gold', 'Hellvis Wild', 'vs243nudge4gold', 'slot', NULL, 'PlayFiver/Pragmatic/vs243nudge4gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 21:00:32'),
(352, 2, 'inativo', 'vs50jucier', 'Sky Bounty', 'vs50jucier', 'slot', NULL, 'PlayFiver/Pragmatic/vs50jucier.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:41:07'),
(353, 2, 'inativo', 'vs20cashmachine', 'Cash Box', 'vs20cashmachine', 'slot', NULL, 'PlayFiver/Pragmatic/vs20cashmachine.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:15:06'),
(354, 2, 'inativo', 'vs20splmystery', 'Spellbinding Mystery', 'vs20splmystery', 'slot', NULL, 'PlayFiver/Pragmatic/vs20splmystery.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(355, 2, 'inativo', 'vs20doghousemh', 'The Dog House Multihold', 'vs20doghousemh', 'slot', NULL, 'PlayFiver/Pragmatic/vs20doghousemh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:58:08'),
(356, 2, 'inativo', 'vs20wildparty', '3 Buzzing Wilds', 'vs20wildparty', 'slot', NULL, 'PlayFiver/Pragmatic/vs20wildparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:13:33'),
(357, 2, 'inativo', 'vs20lobcrab', 'Lobster Bob s Crazy Crab Shack', 'vs20lobcrab', 'slot', NULL, 'PlayFiver/Pragmatic/vs20lobcrab.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:51:28'),
(358, 2, 'inativo', 'vs20supermania', 'Supermania', 'vs20supermania', 'slot', NULL, 'PlayFiver/Pragmatic/vs20supermania.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 02:25:20'),
(359, 2, 'inativo', 'vs10trail', 'Mustang Trail', 'vs10trail', 'slot', NULL, 'PlayFiver/Pragmatic/vs10trail.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-05 21:43:44'),
(360, 2, 'inativo', 'vs20lvlup', 'Pub Kings', 'vs20lvlup', 'slot', NULL, 'PlayFiver/Pragmatic/vs20lvlup.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:25:40'),
(361, 2, 'inativo', 'vs20saiman', 'Saiyan Mania', 'vs20saiman', 'slot', NULL, 'PlayFiver/Pragmatic/vs20saiman.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(362, 2, 'inativo', 'vs20earthquake', 'Cyclops Smash', 'vs20earthquake', 'slot', NULL, 'PlayFiver/Pragmatic/vs20earthquake.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:54:16'),
(363, 2, 'inativo', 'vswaysbbhas', 'Big Bass Hold e Spinner Megaways', 'vswaysbbhas', 'fish', NULL, 'PlayFiver/Pragmatic/vswaysbbhas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-09-03 23:45:14'),
(364, 2, 'inativo', 'vs20forge', 'Forge of Olympus', 'vs20forge', 'slot', NULL, 'PlayFiver/Pragmatic/vs20forge.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:39:37'),
(365, 2, 'inativo', 'vs20procount', 'Wisdom of Athena', 'vs20procount', 'slot', NULL, 'PlayFiver/Pragmatic/vs20procount.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 16:57:00'),
(366, 2, 'inativo', 'vs1024mahjwins', 'Mahjong Wins', 'vs1024mahjwins', 'slot', NULL, 'PlayFiver/Pragmatic/vs1024mahjwins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 15:37:08'),
(367, 2, 'inativo', 'vs20maskgame', 'Cash Chips', 'vs20maskgame', 'slot', NULL, 'PlayFiver/Pragmatic/vs20maskgame.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:54:43'),
(368, 2, 'inativo', 'vswaysraghex', 'Tundra s Fortune', 'vswaysraghex', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysraghex.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:07:10'),
(369, 2, 'inativo', 'vs10bhallbnza', 'Big Bass Halloween', 'vs10bhallbnza', 'fish', NULL, 'PlayFiver/Pragmatic/vs10bhallbnza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-09-04 11:37:10'),
(370, 2, 'inativo', 'vs40rainbowr', 'Rainbow Reels', 'vs40rainbowr', 'slot', NULL, 'PlayFiver/Pragmatic/vs40rainbowr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 08:24:57'),
(371, 2, 'inativo', 'vs20gravity', 'Gravity Bonanza', 'vs20gravity', 'slot', NULL, 'PlayFiver/Pragmatic/vs20gravity.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:55:09'),
(372, 2, 'inativo', 'vs40infwild', 'Infective Wild', 'vs40infwild', 'slot', NULL, 'PlayFiver/Pragmatic/vs40infwild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:22:18'),
(373, 2, 'inativo', 'vs20swordofares', 'Sword of Ares', 'vs20swordofares', 'slot', NULL, 'PlayFiver/Pragmatic/vs20swordofares.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-05 10:23:25'),
(374, 2, 'inativo', 'vswaysfrywld', 'Spin e Score Megaways', 'vswaysfrywld', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysfrywld.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:17:36'),
(375, 2, 'inativo', 'vswaysconcoll', 'Sweet PowerNudge(tm)', 'vswaysconcoll', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysconcoll.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:55:23'),
(376, 2, 'inativo', 'vs20lcount', 'Gems of Serengeti(tm)', 'vs20lcount', 'slot', NULL, 'PlayFiver/Pragmatic/vs20lcount.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 08:30:37'),
(377, 2, 'inativo', 'vs20sparta', 'Shield of Sparta', 'vs20sparta', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sparta.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:09:20'),
(378, 2, 'inativo', 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'vs10bbkir', 'fish', NULL, 'PlayFiver/Pragmatic/vs10bbkir.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2025-06-03 20:12:22'),
(379, 2, 'inativo', 'vswayspizza', 'Pizza Pizza Pizza', 'vswayspizza', 'slot', NULL, 'PlayFiver/Pragmatic/vswayspizza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-04 01:12:10'),
(380, 2, 'inativo', 'vs20dugems', 'Hot Pepper(tm)', 'vs20dugems', 'slot', NULL, 'PlayFiver/Pragmatic/vs20dugems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 23:35:34'),
(381, 2, 'inativo', 'vs20clspwrndg', 'Sweet PowerNudge', 'vs20clspwrndg', 'slot', NULL, 'PlayFiver/Pragmatic/vs20clspwrndg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:55:51'),
(382, 2, 'inativo', 'vswaysfuryodin', 'Fury of Odin Megaways(tm)', 'vswaysfuryodin', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysfuryodin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(383, 2, 'inativo', 'vs20sugarcoins', 'Viking Forge', 'vs20sugarcoins', 'slot', NULL, 'PlayFiver/Pragmatic/vs20sugarcoins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-12 04:29:50'),
(384, 2, 'inativo', 'vs20olympgrace', 'Grace of Ebisu', 'vs20olympgrace', 'slot', NULL, 'PlayFiver/Pragmatic/vs20olympgrace.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:04:13'),
(385, 2, 'inativo', 'vs20starlightx', 'Starlight Princess 1000', 'vs20starlightx', 'slot', NULL, 'PlayFiver/Pragmatic/vs20starlightx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:50:30'),
(386, 2, 'inativo', 'vswaysmoneyman', 'The Money Men Megaways', 'vswaysmoneyman', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysmoneyman.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(387, 2, 'inativo', 'vs40demonpots', 'Demon Pots', 'vs40demonpots', 'slot', NULL, 'PlayFiver/Pragmatic/vs40demonpots.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:56:12'),
(388, 2, 'inativo', 'vswaystut', 'John Hunter and the Book of Tut Megaways', 'vswaystut', 'slot', NULL, 'PlayFiver/Pragmatic/vswaystut.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:17:42'),
(389, 2, 'inativo', 'vs10gdchalleng', '8 Golden Dragon Challenge', 'vs10gdchalleng', 'slot', NULL, 'PlayFiver/Pragmatic/vs10gdchalleng.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:14:08'),
(390, 2, 'inativo', 'vs50dmdcascade', 'Diamond Cascade', 'vs50dmdcascade', 'slot', NULL, 'PlayFiver/Pragmatic/vs50dmdcascade.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(391, 2, 'inativo', 'vs20piggybank', 'Piggy Bankers', 'vs20piggybank', 'slot', NULL, 'PlayFiver/Pragmatic/vs20piggybank.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-08-14 11:18:16'),
(392, 2, 'inativo', 'vs20bnnzdice', 'Sweet Bonanza Dice', 'vs20bnnzdice', 'slot', NULL, 'PlayFiver/Pragmatic/vs20bnnzdice.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 10:28:46'),
(393, 2, 'inativo', 'vs5gemstone', 'Gemstone', 'vs5gemstone', 'slot', NULL, 'PlayFiver/Pragmatic/vs5gemstone.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:06:44'),
(394, 2, 'inativo', 'vs20yisunshin', 'Yi Sun Shin', 'vs20yisunshin', 'slot', NULL, 'PlayFiver/Pragmatic/vs20yisunshin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:26:10'),
(395, 2, 'inativo', 'vs20candyblitz', 'Candy Blitz', 'vs20candyblitz', 'slot', NULL, 'PlayFiver/Pragmatic/vs20candyblitz.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:31:20'),
(396, 2, 'inativo', 'vswaysstrlght', 'Fortunes of Aztec', 'vswaysstrlght', 'slot', NULL, 'PlayFiver/Pragmatic/vswaysstrlght.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2024-05-27 15:25:59', '2025-06-07 02:04:28'),
(397, 3, 'inativo', 'aviator', 'Aviator', 'aviator', 'block', NULL, 'PlayFiver/Spribe/Aviator.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4340, 0, 1, '2024-03-29 01:55:33', '2026-01-27 02:22:50'),
(399, 4, 'inativo', '12547', 'Atlantis', '12547	', 'block', NULL, 'PlayFiver/Galaxsys/Atlantis.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:16:34'),
(400, 4, 'inativo', '12544', 'Bingo Star', '12544', 'slot', NULL, 'PlayFiver/Galaxsys/Bingo-Star.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2024-03-29 01:55:33', '2025-03-02 15:52:30'),
(401, 4, 'inativo', '12542', 'Maestro', '12542', 'block', NULL, 'PlayFiver/Galaxsys/Maestro.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:17:00'),
(402, 4, 'inativo', '12540', 'Turbo Mines', '12540', 'block', NULL, 'PlayFiver/Galaxsys/Turbo-Mines.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 38, 0, 1, '2024-03-29 01:55:33', '2025-03-02 15:16:57'),
(403, 4, 'inativo', '12537', 'Totem', '12537', 'block', NULL, 'PlayFiver/Galaxsys/Totem.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:17:22'),
(404, 4, 'inativo', '12536', 'Magic Dice', '12536', 'block', NULL, 'PlayFiver/Galaxsys/Magic-Dice.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:17:33'),
(405, 4, 'inativo', '12533', 'Scratch Map', '12533', 'block', NULL, 'PlayFiver/Galaxsys/Scratch-Map.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-05-07 01:07:52'),
(406, 4, 'inativo', '12532', 'Coin Flip', '12532', 'block', NULL, 'PlayFiver/Galaxsys/Coin-Flip.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2025-03-02 15:54:05'),
(407, 4, 'inativo', '12530', 'Roulette X', '12530', 'block', NULL, 'PlayFiver/Galaxsys/Roulette-X.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2025-03-02 15:58:02'),
(408, 4, 'inativo', '12528', 'Plinkoman', '12528', 'block', NULL, 'PlayFiver/Galaxsys/Plinkoman.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:18:08'),
(409, 4, 'inativo', '12526', 'Ninja Crash', '12526', 'block', NULL, 'PlayFiver/Galaxsys/Ninja-Crash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 11, 0, 1, '2024-03-29 01:55:33', '2024-12-03 23:15:14'),
(410, 4, 'inativo', '12524', 'Mr.Thimble', '12524', 'block', NULL, 'PlayFiver/Galaxsys/Mr.Thimble.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:18:40'),
(411, 4, 'inativo', '12523', 'Jungle Wheel', '12523', 'block', NULL, 'PlayFiver/Galaxsys/Jungle-Wheel.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:18:50'),
(412, 4, 'inativo', '12522', 'Jungle Wheel', '12522', 'block', NULL, 'PlayFiver/Galaxsys/Jungle-Wheel.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:19:01'),
(413, 4, 'inativo', '12520', 'GoldenRA', '12520', 'block', NULL, 'PlayFiver/Galaxsys/GoldenRA.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:19:11'),
(414, 4, 'inativo', '12518', 'F Mines', '12518', 'block', NULL, 'PlayFiver/Galaxsys/F-Mines.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:19:22'),
(415, 4, 'inativo', '12516', 'Crasher', '12516', 'block', NULL, 'PlayFiver/Galaxsys/Crasher.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:19:32'),
(416, 4, 'inativo', '12515', 'Cash Show', '12515', 'block', NULL, 'PlayFiver/Galaxsys/Cash-Show.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:19:42'),
(417, 4, 'inativo', '12502', 'SicBo', '12502', 'block', NULL, 'PlayFiver/Galaxsys/SicBo.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-03-29 01:55:33', '2025-03-02 15:16:41'),
(418, 4, 'inativo', '12501', 'Rocketon', '12501', 'block', NULL, 'PlayFiver/Galaxsys/Rocketon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:20:07'),
(419, 4, 'inativo', '12500', 'Penalty', '12500', 'block', NULL, 'PlayFiver/Galaxsys/Penalty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:20:19'),
(420, 4, 'inativo', '12499', 'Keno Express', '12499', 'block', NULL, 'PlayFiver/Galaxsys/Keno-Express.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 0, '2024-03-29 01:55:33', '2024-10-06 06:10:23'),
(421, 4, 'inativo', '12510', 'Keno 8 (2 Minute)', '12510', 'block', NULL, 'PlayFiver/Galaxsys/Keno-8-(2-Minute).png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-10-06 06:10:25'),
(422, 4, 'inativo', '12509', 'Keno 8 (1 Minute)', '12509', 'block', NULL, 'PlayFiver/Galaxsys/Keno-8-(1-Minute).png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-09-28 07:42:46'),
(423, 4, 'inativo', '12508', 'Keno 10 (2 Minute)', '12508', 'block', NULL, 'PlayFiver/Galaxsys/Keno-10-(2-Minute).png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-26 20:16:19'),
(424, 4, 'inativo', '12507', 'Keno 10 (1 Minute)', '12507', 'block', NULL, 'PlayFiver/Galaxsys/Keno-10-(1-Minute).png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 01:19:11'),
(425, 4, 'inativo', '11675', 'Hilo', '11675', 'block', NULL, 'PlayFiver/Galaxsys/Hilo.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:20:32'),
(426, 4, 'inativo', '12493', 'Crash', '12493', 'block', NULL, 'PlayFiver/Galaxsys/Crash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:20:43'),
(427, 4, 'inativo', '12492', 'BlackJack', '12492', 'block', NULL, 'PlayFiver/Galaxsys/BlackJack.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-11-29 23:20:53'),
(428, 5, 'inativo', '30', 'Power Stars', '30', 'slot', NULL, 'PlayFiver/Novomatic/Power-Stars.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:25'),
(429, 5, 'inativo', '3218', 'Queen of Hearts Deluxe', '3218', 'slot', NULL, 'PlayFiver/Novomatic/Queen-of-Hearts-Deluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 06:24:04'),
(430, 5, 'inativo', '103', 'Quest for Gold', '103', 'slot', NULL, 'PlayFiver/Novomatic/Quest-for-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-04 18:15:51'),
(431, 5, 'inativo', '102', 'Ramses II', '102', 'slot', NULL, 'PlayFiver/Novomatic/Ramses-II.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-10 02:12:10'),
(432, 5, 'inativo', '374', 'Red Lady', '374', 'slot', NULL, 'PlayFiver/Novomatic/Red-Lady.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-01 11:39:56'),
(433, 5, 'inativo', '114', 'Reel King', '114', 'slot', NULL, 'PlayFiver/Novomatic/Reel-King.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 0, '2024-03-29 01:55:33', '2024-08-12 17:59:53'),
(434, 5, 'inativo', '107', 'Rex', '107', 'slot', NULL, 'PlayFiver/Novomatic/Rex.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-03 04:57:59'),
(435, 5, 'inativo', '4571', 'River Queen', '4571', 'slot', NULL, 'PlayFiver/Novomatic/River-Queen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-06 04:25:24'),
(436, 5, 'inativo', '3210', 'Roaring Forties', '3210', 'slot', NULL, 'PlayFiver/Novomatic/Roaring-Forties.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 03:44:23'),
(437, 5, 'inativo', '3211', 'Roaring Wilds', '3211', 'slot', NULL, 'PlayFiver/Novomatic/Roaring-Wilds.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:35'),
(438, 5, 'inativo', '6657', 'Royal Dynasty', '6657', 'slot', NULL, 'PlayFiver/Novomatic/Royal-Dynasty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-07-30 17:09:55'),
(439, 5, 'inativo', '475', 'Royal Treasure', '475', 'slot', NULL, 'PlayFiver/Novomatic/Royal-Treasure.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-02 09:56:20'),
(440, 5, 'inativo', '95', 'Secret Elixir', '95', 'slot', NULL, 'PlayFiver/Novomatic/Secret-Elixir.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-02 10:05:18'),
(441, 5, 'inativo', '6878', 'Secret Treasure', '6878', 'slot', NULL, 'PlayFiver/Novomatic/Secret-Treasure.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 10:04:17'),
(442, 5, 'inativo', '3149', 'Sizzling 6', '3149', 'slot', NULL, 'PlayFiver/Novomatic/Sizzling-6.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 12, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:22'),
(443, 5, 'inativo', '3158', 'Supra Hot', '3158', 'slot', NULL, 'PlayFiver/Novomatic/Supra-Hot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-06 09:30:58');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(444, 5, 'inativo', '547', 'The Money Game', '547', 'slot', NULL, 'PlayFiver/Novomatic/The-Money-Game.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:28'),
(445, 5, 'inativo', '6872', 'Totally Wild', '6872', 'slot', NULL, 'PlayFiver/Novomatic/Totally-Wild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:29'),
(446, 5, 'inativo', '6990', 'Ultra Hot Deluxe', '6990', 'slot', NULL, 'PlayFiver/Novomatic/Ultra-Hot-Deluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-01 17:44:58'),
(447, 5, 'inativo', '549', 'Unicorn Magic', '549', 'slot', NULL, 'PlayFiver/Novomatic/Unicorn-Magic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-16 12:53:16'),
(448, 5, 'inativo', '4628', 'Wild Country', '4628', 'slot', NULL, 'PlayFiver/Novomatic/Wild-Country.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-16 19:57:41'),
(449, 5, 'inativo', '90', 'Xtra Hot', '90', 'slot', NULL, 'PlayFiver/Novomatic/Xtra-Hot.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-16 07:43:24'),
(450, 6, 'inativo', '3204', 'Silver Fang', '3204', 'slot', NULL, 'PlayFiver/Microgaming/Silver-Fang.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-07-30 06:50:32'),
(451, 6, 'inativo', '3203', 'Thunder Struck', '3203', 'slot', NULL, 'PlayFiver/Microgaming/Thunder-Struck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-09-25 01:06:31'),
(452, 6, 'inativo', '3202', 'Immortal Romance', '3202', 'slot', NULL, 'PlayFiver/Microgaming/Immortal-Romance.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-02 04:48:49'),
(453, 6, 'inativo', '3201', 'Game Of Thrones', '3201', 'slot', NULL, 'PlayFiver/Microgaming/Game-Of-Thrones.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:31'),
(454, 6, 'inativo', '4210', 'Burning Desire', '4210', 'slot', NULL, 'PlayFiver/Microgaming/Burning-Desire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 13:28:19'),
(455, 6, 'inativo', '4209', 'Alaskan Fishing', '4209', 'fish', NULL, 'PlayFiver/Microgaming/Alaskan-Fishing.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:42:28'),
(456, 6, 'inativo', '4208', 'Agent Jane Blonde', '4208', 'slot', NULL, 'PlayFiver/Microgaming/Agent-Jane-Blonde.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-14 05:17:42'),
(457, 6, 'inativo', '4191', 'Tomb Raider', '4191', 'slot', NULL, 'PlayFiver/Microgaming/Tomb-Raider.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 12:04:16'),
(458, 6, 'inativo', '4190', 'Deck the Halls', '4190', 'slot', NULL, 'PlayFiver/Microgaming/Deck-the-Halls.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 00:31:27'),
(459, 6, 'inativo', '4240', 'Six Acrobats', '4240', 'slot', NULL, 'PlayFiver/Microgaming/Six-Acrobats.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 11:42:27'),
(460, 6, 'inativo', '4239', 'Beautiful Bones', '4239', 'slot', NULL, 'PlayFiver/Microgaming/Beautiful-Bones.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:45'),
(461, 6, 'inativo', '4218', 'Monster Wheels', '4218', 'slot', NULL, 'PlayFiver/Microgaming/Monster-Wheels.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:44'),
(462, 6, 'inativo', '4260', 'Mermaids Millions', '4260', 'slot', NULL, 'PlayFiver/Microgaming/Mermaids-Millions.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-10 21:06:28'),
(463, 6, 'inativo', '4264', 'King Tusk', '4264', 'slot', NULL, 'PlayFiver/Microgaming/King-Tusk.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 11:28:14'),
(464, 6, 'inativo', '4263', 'Secret Romance', '4263', 'slot', NULL, 'PlayFiver/Microgaming/Secret-Romance.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:34'),
(465, 6, 'inativo', '4275', 'High Lander', '4275', 'slot', NULL, 'PlayFiver/Microgaming/High-Lander.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-03 19:55:02'),
(466, 6, 'inativo', '4273', 'Cool Wolf', '4273', 'slot', NULL, 'PlayFiver/Microgaming/Cool-Wolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:43'),
(467, 6, 'inativo', '6712', 'Break Away', '6712', 'slot', NULL, 'PlayFiver/Microgaming/Break-Away.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-12 21:29:51'),
(468, 6, 'inativo', '6905', 'Ancient Fortunes Zeus', '6905', 'slot', NULL, 'PlayFiver/Microgaming/Ancient-Fortunes-Zeus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-11 13:00:05'),
(469, 6, 'inativo', '6904', 'Tarzan Jewels of Opar', '6904', 'slot', NULL, 'PlayFiver/Microgaming/Tarzan-Jewels-of-Opar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 02:45:23'),
(470, 6, 'inativo', '6903', 'Emperor of the Sea', '6903', 'slot', NULL, 'PlayFiver/Microgaming/Emperor-of-the-Sea.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 15:39:49'),
(471, 6, 'inativo', '6937', 'Age Of Conquest', '6937', 'slot', NULL, 'PlayFiver/Microgaming/Age-Of-Conquest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:37'),
(472, 6, 'inativo', '7000', 'Avalon', '7000', 'slot', NULL, 'PlayFiver/Microgaming/Avalon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 0, '2024-03-29 01:55:33', '2024-09-27 22:48:01'),
(473, 6, 'inativo', '6999', 'Titans of the Sun Theia', '6999', 'slot', NULL, 'PlayFiver/Microgaming/Titans-of-the-Sun-Theia.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:20:41'),
(474, 6, 'inativo', '7049', '9 Masks of Fire', '7049', 'slot', NULL, 'PlayFiver/Microgaming/9-Masks-of-Fire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-02 04:37:52'),
(475, 6, 'inativo', '7057', '9 Pots of Gold', '7057', 'slot', NULL, 'PlayFiver/Microgaming/9-Pots-of-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-14 23:23:14'),
(476, 6, 'inativo', '7708', 'Assassin Moon', '7708', 'slot', NULL, 'PlayFiver/Microgaming/Assassin-Moon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 00:50:20'),
(477, 7, 'inativo', '6789', 'Hot Hot Fruit', '6789', 'slot', NULL, 'PlayFiver/Habanero/Hot-Hot-Fruit.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-31 17:39:16'),
(478, 7, 'inativo', '6811', 'Nuwa', '6811', 'slot', NULL, 'PlayFiver/Habanero/Nuwa.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-02 08:50:44'),
(479, 7, 'inativo', '6893', 'Hot Hot Halloween', '6893', 'slot', NULL, 'PlayFiver/Habanero/Hot-Hot-Halloween.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-13 03:53:28'),
(480, 7, 'inativo', '6933', 'Happy Ape', '6933', 'slot', NULL, 'PlayFiver/Habanero/Happy-Ape.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:19:54'),
(481, 7, 'inativo', '6932', 'Panda Panda', '6932', 'slot', NULL, 'PlayFiver/Habanero/Panda-Panda.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 01:06:17'),
(482, 7, 'inativo', '6931', 'Lucky Fortune Cat', '6931', 'slot', NULL, 'PlayFiver/Habanero/Lucky-Fortune-Cat.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-14 10:55:50'),
(483, 7, 'inativo', 'SGReturnToTheFeature', 'Return to the Future', 'SGReturnToTheFeature', 'slot', NULL, 'PlayFiver/Habanero/SGReturnToTheFeature.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:14:44'),
(484, 7, 'inativo', 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'SGTabernaDeLosMuertosUltra', 'slot', NULL, 'PlayFiver/Habanero/SGTabernaDeLosMuertosUltra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:08:36'),
(485, 7, 'inativo', 'SGTotemTowers', 'Totem towers', 'SGTotemTowers', 'slot', NULL, 'PlayFiver/Habanero/SGTotemTowers.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:02:32'),
(486, 7, 'inativo', 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'SGChristmasGiftRush', 'slot', NULL, 'PlayFiver/Habanero/SGChristmasGiftRush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 08:59:14'),
(487, 7, 'inativo', 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'SGOrbsOfAtlantis', 'slot', NULL, 'PlayFiver/Habanero/SGOrbsOfAtlantis.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:00'),
(488, 7, 'inativo', 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'SGBeforeTimeRunsOut', 'slot', NULL, 'PlayFiver/Habanero/SGBeforeTimeRunsOut.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 19:13:24'),
(489, 7, 'inativo', 'SGTechnoTumble', 'Techno tumble', 'SGTechnoTumble', 'slot', NULL, 'PlayFiver/Habanero/SGTechnoTumble.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:14:10'),
(490, 7, 'inativo', 'SGHappyApe', 'Happy ape', 'SGHappyApe', 'slot', NULL, 'PlayFiver/Habanero/SGHappyApe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:01'),
(491, 7, 'inativo', 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'SGTabernaDeLosMuertos', 'slot', NULL, 'PlayFiver/Habanero/SGTabernaDeLosMuertos.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:03'),
(492, 7, 'inativo', 'SGNaughtySanta', 'Notty Santa', 'SGNaughtySanta', 'slot', NULL, 'PlayFiver/Habanero/SGNaughtySanta.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:40:59'),
(494, 7, 'inativo', 'SGHeySushi', 'Hey sushi', 'SGHeySushi', 'slot', NULL, 'PlayFiver/Habanero/SGHeySushi.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:05'),
(495, 7, 'inativo', 'SGKnockoutFootballRush', 'Knockout football rush', 'SGKnockoutFootballRush', 'slot', NULL, 'PlayFiver/Habanero/SGKnockoutFootballRush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:55'),
(496, 7, 'inativo', 'SGColossalGems', 'Closal Gems', 'SGColossalGems', 'slot', NULL, 'PlayFiver/Habanero/SGColossalGems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:07'),
(497, 7, 'inativo', 'SGHotHotHalloween', 'hot hot halloween', 'SGHotHotHalloween', 'slot', NULL, 'PlayFiver/Habanero/SGHotHotHalloween.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:57:14'),
(498, 7, 'inativo', 'SGLuckyFortuneCat', 'Lucky fortune cat', 'SGLuckyFortuneCat', 'slot', NULL, 'PlayFiver/Habanero/SGLuckyFortuneCat.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:56:13'),
(499, 7, 'inativo', 'SGHotHotFruit', 'hot hot fruit', 'SGHotHotFruit', 'slot', NULL, 'PlayFiver/Habanero/SGHotHotFruit.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-02 09:44:37'),
(500, 7, 'inativo', 'SGMountMazuma', 'Mount Majuma', 'SGMountMazuma', 'slot', NULL, 'PlayFiver/Habanero/SGMountMazuma.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:58:12'),
(501, 7, 'inativo', 'SGWildTrucks', 'Wild Trucks', 'SGWildTrucks', 'slot', NULL, 'PlayFiver/Habanero/SGWildTrucks.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 0, '2024-05-27 15:25:59', '2024-08-14 08:57:45'),
(502, 7, 'inativo', 'SGLuckyLucky', 'Lucky Lucky', 'SGLuckyLucky', 'slot', NULL, 'PlayFiver/Habanero/SGLuckyLucky.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 00:09:35'),
(503, 7, 'inativo', 'SGKnockoutFootball', 'Knockout football', 'SGKnockoutFootball', 'slot', NULL, 'PlayFiver/Habanero/SGKnockoutFootball.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-04 14:30:57'),
(504, 7, 'inativo', 'SGJump', 'Jump!', 'SGJump', 'slot', NULL, 'PlayFiver/Habanero/SGJump.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:25:12'),
(505, 7, 'inativo', 'SGPumpkinPatch', 'Pumpkin patch', 'SGPumpkinPatch', 'slot', NULL, 'PlayFiver/Habanero/SGPumpkinPatch.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 08:35:48'),
(506, 7, 'inativo', 'SGWaysOfFortune', 'Way of Fortune', 'SGWaysOfFortune', 'slot', NULL, 'PlayFiver/Habanero/SGWaysOfFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:15:19'),
(507, 7, 'inativo', 'SGFourDivineBeasts', 'For Devine Beasts', 'SGFourDivineBeasts', 'slot', NULL, 'PlayFiver/Habanero/SGFourDivineBeasts.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:43:27'),
(508, 7, 'inativo', 'SGPandaPanda', 'Panda panda', 'SGPandaPanda', 'slot', NULL, 'PlayFiver/Habanero/SGPandaPanda.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(509, 7, 'inativo', 'SGOceansCall', 'Ocean s Call', 'SGOceansCall', 'slot', NULL, 'PlayFiver/Habanero/SGOceansCall.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:47:09'),
(510, 7, 'inativo', 'SGScruffyScallywags', 'Scruffy Skellywex', 'SGScruffyScallywags', 'slot', NULL, 'PlayFiver/Habanero/SGScruffyScallywags.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 10:40:02'),
(511, 7, 'inativo', 'SGNuwa', 'Nuwa', 'SGNuwa', 'slot', NULL, 'PlayFiver/Habanero/SGNuwa.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-11 04:24:47'),
(512, 7, 'inativo', 'SGTheKoiGate', 'Koi gate', 'SGTheKoiGate', 'slot', NULL, 'PlayFiver/Habanero/SGTheKoiGate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:21:14'),
(513, 7, 'inativo', 'SGFaCaiShen', 'Pacaishen', 'SGFaCaiShen', 'slot', NULL, 'PlayFiver/Habanero/SGFaCaiShen.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:40:11'),
(514, 7, 'inativo', 'SG12Zodiacs', '12 zodiacs', 'SG12Zodiacs', 'slot', NULL, 'PlayFiver/Habanero/SG12Zodiacs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 04:03:37'),
(515, 7, 'inativo', 'SGFireRooster', 'Fire rooster', 'SGFireRooster', 'slot', NULL, 'PlayFiver/Habanero/SGFireRooster.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-07 14:07:10'),
(516, 7, 'inativo', 'SGFenghuang', 'Phoenix', 'SGFenghuang', 'slot', NULL, 'PlayFiver/Habanero/SGFenghuang.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 23:15:45'),
(517, 7, 'inativo', 'SGBirdOfThunder', 'Bird of Thunder', 'SGBirdOfThunder', 'slot', NULL, 'PlayFiver/Habanero/SGBirdOfThunder.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 13:44:45'),
(518, 7, 'inativo', 'SGTheDeadEscape', 'The Dead Escape', 'SGTheDeadEscape', 'slot', NULL, 'PlayFiver/Habanero/SGTheDeadEscape.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(519, 7, 'inativo', 'SGBombsAway', 'Bombs Away', 'SGBombsAway', 'slot', NULL, 'PlayFiver/Habanero/SGBombsAway.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(520, 7, 'inativo', 'SGGoldRush', 'Gold rush', 'SGGoldRush', 'slot', NULL, 'PlayFiver/Habanero/SGGoldRush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:53:24'),
(521, 7, 'inativo', 'SGRuffledUp', 'Ruffled up', 'SGRuffledUp', 'slot', NULL, 'PlayFiver/Habanero/SGRuffledUp.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 21:30:35'),
(522, 7, 'inativo', 'SGRomanEmpire', 'Roman empire', 'SGRomanEmpire', 'slot', NULL, 'PlayFiver/Habanero/SGRomanEmpire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:04:30'),
(523, 7, 'inativo', 'SGCoyoteCrash', 'Coyote crash', 'SGCoyoteCrash', 'slot', NULL, 'PlayFiver/Habanero/SGCoyoteCrash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:39:43'),
(524, 7, 'inativo', 'SGWickedWitch', 'Wickt Location', 'SGWickedWitch', 'slot', NULL, 'PlayFiver/Habanero/SGWickedWitch.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:59:30'),
(525, 7, 'inativo', 'SGDragonsThrone', 'Dragon s Throne', 'SGDragonsThrone', 'slot', NULL, 'PlayFiver/Habanero/SGDragonsThrone.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:38:20'),
(526, 7, 'inativo', 'SGBuggyBonus', 'Buggy bonus', 'SGBuggyBonus', 'slot', NULL, 'PlayFiver/Habanero/SGBuggyBonus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:59:24'),
(527, 7, 'inativo', 'SGGlamRock', 'Glam rock', 'SGGlamRock', 'slot', NULL, 'PlayFiver/Habanero/SGGlamRock.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:09:29'),
(528, 7, 'inativo', 'SGSuperTwister', 'Super twister', 'SGSuperTwister', 'slot', NULL, 'PlayFiver/Habanero/SGSuperTwister.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:45:16'),
(529, 7, 'inativo', 'SGTreasureTomb', 'Treasure Tomb', 'SGTreasureTomb', 'slot', NULL, 'PlayFiver/Habanero/SGTreasureTomb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:37:52'),
(530, 7, 'inativo', 'SGJugglenaut', 'Jugglenut', 'SGJugglenaut', 'slot', NULL, 'PlayFiver/Habanero/SGJugglenaut.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-03 06:28:17'),
(531, 7, 'inativo', 'SGGalacticCash', 'Glactic Cash', 'SGGalacticCash', 'slot', NULL, 'PlayFiver/Habanero/SGGalacticCash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 22:18:56'),
(532, 7, 'inativo', 'SGZeus2', 'Zeus 2', 'SGZeus2', 'slot', NULL, 'PlayFiver/Habanero/SGZeus2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(533, 7, 'inativo', 'SGTheDragonCastle', 'Dragon castle', 'SGTheDragonCastle', 'slot', NULL, 'PlayFiver/Habanero/SGTheDragonCastle.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 01:10:47'),
(534, 7, 'inativo', 'SGKingTutsTomb', 'King Teeth Tomb', 'SGKingTutsTomb', 'slot', NULL, 'PlayFiver/Habanero/SGKingTutsTomb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:06:24'),
(535, 7, 'inativo', 'SGCarnivalCash', 'Carnival cash', 'SGCarnivalCash', 'slot', NULL, 'PlayFiver/Habanero/SGCarnivalCash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:30:15'),
(536, 7, 'inativo', 'SGTreasureDiver', 'Treasure diver', 'SGTreasureDiver', 'slot', NULL, 'PlayFiver/Habanero/SGTreasureDiver.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 02:49:46'),
(537, 7, 'inativo', 'SGLittleGreenMoney', 'Little Green Money', 'SGLittleGreenMoney', 'slot', NULL, 'PlayFiver/Habanero/SGLittleGreenMoney.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:53:26'),
(538, 7, 'inativo', 'SGMonsterMashCash', 'Monster Mash Cash', 'SGMonsterMashCash', 'slot', NULL, 'PlayFiver/Habanero/SGMonsterMashCash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 06:06:55'),
(539, 7, 'inativo', 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'SGShaolinFortunes100', 'slot', NULL, 'PlayFiver/Habanero/SGShaolinFortunes100.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:13:37'),
(540, 7, 'inativo', 'SGShaolinFortunes243', 'Xiaolin Fortune', 'SGShaolinFortunes243', 'slot', NULL, 'PlayFiver/Habanero/SGShaolinFortunes243.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:15:30'),
(541, 7, 'inativo', 'SGWeirdScience', 'Weird Science', 'SGWeirdScience', 'slot', NULL, 'PlayFiver/Habanero/SGWeirdScience.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 22:25:14'),
(542, 7, 'inativo', 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'SGBlackbeardsBounty', 'slot', NULL, 'PlayFiver/Habanero/SGBlackbeardsBounty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:30:56'),
(543, 7, 'inativo', 'SGDrFeelgood', 'Dr. Feelgood', 'SGDrFeelgood', 'slot', NULL, 'PlayFiver/Habanero/SGDrFeelgood.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 15:37:26'),
(544, 7, 'inativo', 'SGVikingsPlunder', 'Vikings plunder', 'SGVikingsPlunder', 'slot', NULL, 'PlayFiver/Habanero/SGVikingsPlunder.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 04:17:48'),
(545, 7, 'inativo', 'SGDoubleODollars', 'Double O Dollars', 'SGDoubleODollars', 'slot', NULL, 'PlayFiver/Habanero/SGDoubleODollars.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:25:17'),
(546, 7, 'inativo', 'SGSpaceFortune', 'Space fortune', 'SGSpaceFortune', 'slot', NULL, 'PlayFiver/Habanero/SGSpaceFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:01:45'),
(547, 7, 'inativo', 'SGPamperMe', 'Pamper me', 'SGPamperMe', 'slot', NULL, 'PlayFiver/Habanero/SGPamperMe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:54:33'),
(548, 7, 'inativo', 'SGZeus', 'Zeus', 'SGZeus', 'slot', NULL, 'PlayFiver/Habanero/SGZeus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:42:04'),
(549, 7, 'inativo', 'SGEgyptianDreams', 'Egyptian Dreams', 'SGEgyptianDreams', 'slot', NULL, 'PlayFiver/Habanero/SGEgyptianDreams.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 0, '2024-05-27 15:25:59', '2024-08-02 09:46:06'),
(550, 7, 'inativo', 'SGBarnstormerBucks', 'Barnstormer Bucks', 'SGBarnstormerBucks', 'slot', NULL, 'PlayFiver/Habanero/SGBarnstormerBucks.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:10:02'),
(551, 7, 'inativo', 'SGSuperStrike', 'Super strike', 'SGSuperStrike', 'slot', NULL, 'PlayFiver/Habanero/SGSuperStrike.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(552, 7, 'inativo', 'SGJungleRumble', 'Jungle rumble', 'SGJungleRumble', 'slot', NULL, 'PlayFiver/Habanero/SGJungleRumble.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-03 23:36:51'),
(553, 7, 'inativo', 'SGArcticWonders', 'Arctic Wonders', 'SGArcticWonders', 'slot', NULL, 'PlayFiver/Habanero/SGArcticWonders.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-07-19 23:08:29'),
(554, 7, 'inativo', 'SGTowerOfPizza', 'Tower of Pizza', 'SGTowerOfPizza', 'slot', NULL, 'PlayFiver/Habanero/SGTowerOfPizza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 08:00:31'),
(555, 7, 'inativo', 'SGMummyMoney', 'Mummy money', 'SGMummyMoney', 'slot', NULL, 'PlayFiver/Habanero/SGMummyMoney.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:09:43'),
(556, 7, 'inativo', 'SGBikiniIsland', 'bikini island', 'SGBikiniIsland', 'slot', NULL, 'PlayFiver/Habanero/SGBikiniIsland.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 07:23:32'),
(557, 7, 'inativo', 'SGQueenOfQueens1024', 'Queen of Queens II', 'SGQueenOfQueens1024', 'slot', NULL, 'PlayFiver/Habanero/SGQueenOfQueens1024.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:33:05'),
(558, 7, 'inativo', 'SGDragonsRealm', 'Dragon s Realm', 'SGDragonsRealm', 'slot', NULL, 'PlayFiver/Habanero/SGDragonsRealm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 19:38:08'),
(559, 7, 'inativo', 'SGAllForOne', 'All for one', 'SGAllForOne', 'slot', NULL, 'PlayFiver/Habanero/SGAllForOne.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:01:00'),
(560, 7, 'inativo', 'SGFlyingHigh', 'Flying high', 'SGFlyingHigh', 'slot', NULL, 'PlayFiver/Habanero/SGFlyingHigh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 18:32:25'),
(561, 7, 'inativo', 'SGMrBling', 'Mr. Bling', 'SGMrBling', 'slot', NULL, 'PlayFiver/Habanero/SGMrBling.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:41:26'),
(562, 7, 'inativo', 'SGMysticFortune', 'Mystic Fortune', 'SGMysticFortune', 'slot', NULL, 'PlayFiver/Habanero/SGMysticFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 10:36:01'),
(563, 7, 'inativo', 'SGQueenOfQueens243', 'Queen of queens', 'SGQueenOfQueens243', 'slot', NULL, 'PlayFiver/Habanero/SGQueenOfQueens243.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:24:27'),
(564, 7, 'inativo', 'SGGrapeEscape', 'The Graph Escape', 'SGGrapeEscape', 'slot', NULL, 'PlayFiver/Habanero/SGGrapeEscape.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:54:32'),
(565, 7, 'inativo', 'SGGoldenUnicorn', 'Golden unicorn', 'SGGoldenUnicorn', 'slot', NULL, 'PlayFiver/Habanero/SGGoldenUnicorn.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:57:01'),
(566, 7, 'inativo', 'SGFrontierFortunes', 'Frontier Fortune', 'SGFrontierFortunes', 'slot', NULL, 'PlayFiver/Habanero/SGFrontierFortunes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-14 05:53:46'),
(567, 7, 'inativo', 'SGIndianCashCatcher', 'Indian Cash Catcher', 'SGIndianCashCatcher', 'slot', NULL, 'PlayFiver/Habanero/SGIndianCashCatcher.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 0, '2024-05-27 15:25:59', '2024-07-31 16:38:29'),
(568, 7, 'inativo', 'SGSkysTheLimit', 'Skys the Limit', 'SGSkysTheLimit', 'slot', NULL, 'PlayFiver/Habanero/SGSkysTheLimit.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 01:07:48'),
(569, 7, 'inativo', 'SGTheBigDeal', 'The Big Deal', 'SGTheBigDeal', 'slot', NULL, 'PlayFiver/Habanero/SGTheBigDeal.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:39:01'),
(570, 7, 'inativo', 'SGCashosaurus', 'Cashosaurus', 'SGCashosaurus', 'slot', NULL, 'PlayFiver/Habanero/SGCashosaurus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-09 03:29:47'),
(571, 7, 'inativo', 'SGDiscoFunk', 'Disco funk', 'SGDiscoFunk', 'slot', NULL, 'PlayFiver/Habanero/SGDiscoFunk.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 21:59:55'),
(572, 7, 'inativo', 'SGCalaverasExplosivas', 'Calaveras Explociba', 'SGCalaverasExplosivas', 'slot', NULL, 'PlayFiver/Habanero/SGCalaverasExplosivas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-31 19:09:47'),
(573, 7, 'inativo', 'SGNineTails', 'Nine Tales', 'SGNineTails', 'slot', NULL, 'PlayFiver/Habanero/SGNineTails.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:14'),
(574, 7, 'inativo', 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'SGMysticFortuneDeluxe', 'slot', NULL, 'PlayFiver/Habanero/SGMysticFortuneDeluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 15:49:20'),
(575, 7, 'inativo', 'SGLuckyDurian', 'Lucky durian', 'SGLuckyDurian', 'slot', NULL, 'PlayFiver/Habanero/SGLuckyDurian.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 18:49:22'),
(576, 7, 'inativo', 'SGDiscoBeats', 'Disco beat', 'SGDiscoBeats', 'slot', NULL, 'PlayFiver/Habanero/SGDiscoBeats.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 16:27:34'),
(577, 7, 'inativo', 'SGLanternLuck', 'Lantern lucky', 'SGLanternLuck', 'slot', NULL, 'PlayFiver/Habanero/SGLanternLuck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:26:22'),
(578, 7, 'inativo', 'SGBombRunner', 'Boom runner', 'SGBombRunner', 'slot', NULL, 'PlayFiver/Habanero/SGBombRunner.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:20:15'),
(579, 8, 'inativo', '7820', 'Xmas Joker', '7820', 'slot', NULL, 'PlayFiver/Playngo/Xmas-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 09:26:19'),
(580, 8, 'inativo', '7819', 'Wild Blood', '7819', 'slot', NULL, 'PlayFiver/Playngo/Wild-Blood.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 08:35:21'),
(581, 8, 'inativo', '7818', 'Sticky Joker', '7818', 'slot', NULL, 'PlayFiver/Playngo/Sticky-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 07:18:49'),
(582, 8, 'inativo', '7817', 'Star Joker', '7817', 'slot', NULL, 'PlayFiver/Playngo/Star-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 07:43:04'),
(583, 8, 'inativo', '7816', 'Space Race', '7816', 'slot', NULL, 'PlayFiver/Playngo/Space-Race.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 08:03:42'),
(584, 8, 'inativo', '7815', 'Sizzling Spins', '7815', 'slot', NULL, 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-09-24 08:11:20'),
(585, 8, 'inativo', '7814', 'Scroll of Dead', '7814', 'slot', NULL, 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:22:49'),
(586, 8, 'inativo', '7813', 'Saxon', '7813', 'slot', NULL, 'PlayFiver/Playngo/Saxon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 12:01:31'),
(587, 8, 'inativo', '7812', 'Sails of Gold', '7812', 'slot', NULL, 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-01 01:16:25'),
(588, 8, 'inativo', '7811', 'Royal Masquerade', '7811', 'slot', NULL, 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-07-31 10:06:15'),
(589, 8, 'inativo', '7810', 'Rise of Merlin', '7810', 'slot', NULL, 'PlayFiver/Playngo/Rise-of-Merlin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-03-29 01:55:33', '2024-08-14 02:25:46'),
(590, 8, 'inativo', '7809', 'Rise of Athena', '7809', 'slot', NULL, 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-04 14:09:42'),
(591, 8, 'inativo', '7820', 'Xmas Joker', '7820', 'slot', NULL, 'PlayFiver/Playngo/Xmas-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-26 21:32:21'),
(592, 8, 'inativo', '7819', 'Wild Blood', '7819', 'slot', NULL, 'PlayFiver/Playngo/Wild-Blood.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 01:31:33'),
(593, 8, 'inativo', '7818', 'Sticky Joker', '7818', 'slot', NULL, 'PlayFiver/Playngo/Sticky-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 10:29:42'),
(594, 8, 'inativo', '7817', 'Star Joker', '7817', 'slot', NULL, 'PlayFiver/Playngo/Star-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 23:38:03'),
(595, 8, 'inativo', '7816', 'Space Race', '7816', 'slot', NULL, 'PlayFiver/Playngo/Space-Race.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 10:39:09'),
(596, 8, 'inativo', '7815', 'Sizzling Spins', '7815', 'slot', NULL, 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:22:53'),
(597, 8, 'inativo', '7814', 'Scroll of Dead', '7814', 'slot', NULL, 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:23:22'),
(598, 8, 'inativo', '7813', 'Saxon', '7813', 'slot', NULL, 'PlayFiver/Playngo/Saxon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 18:43:27'),
(599, 8, 'inativo', '7812', 'Sails of Gold', '7812', 'slot', NULL, 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 16:43:20'),
(600, 8, 'inativo', '7811', 'Royal Masquerade', '7811', 'slot', NULL, 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 07:46:07'),
(601, 8, 'inativo', '7809', 'Rise of Athena', '7809', 'slot', NULL, 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-12 06:29:51'),
(602, 8, 'inativo', '7820', 'Xmas Joker', '7820', 'slot', NULL, 'PlayFiver/Playngo/Xmas-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-26 21:16:05'),
(603, 8, 'inativo', '7819', 'Wild Blood', '7819', 'slot', NULL, 'PlayFiver/Playngo/Wild-Blood.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 10:59:39'),
(604, 8, 'inativo', '7818', 'Sticky Joker', '7818', 'slot', NULL, 'PlayFiver/Playngo/Sticky-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:23:22'),
(605, 8, 'inativo', '7817', 'Star Joker', '7817', 'slot', NULL, 'PlayFiver/Playngo/Star-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-15 03:25:02'),
(606, 8, 'inativo', '7816', 'Space Race', '7816', 'slot', NULL, 'PlayFiver/Playngo/Space-Race.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:22:47'),
(607, 8, 'inativo', '7815', 'Sizzling Spins', '7815', 'slot', NULL, 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:22:59'),
(608, 8, 'inativo', '7814', 'Scroll of Dead', '7814', 'slot', NULL, 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 17:19:22'),
(609, 8, 'inativo', '7813', 'Saxon', '7813', 'slot', NULL, 'PlayFiver/Playngo/Saxon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-31 08:36:42'),
(610, 8, 'inativo', '7812', 'Sails of Gold', '7812', 'slot', NULL, 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 13:05:14'),
(611, 8, 'inativo', '7811', 'Royal Masquerade', '7811', 'slot', NULL, 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 04:26:20'),
(612, 8, 'inativo', '7809', 'Rise of Athena', '7809', 'slot', NULL, 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 05:34:40'),
(613, 8, 'inativo', '7808', 'Riches of RA', '7808', 'slot', NULL, 'PlayFiver/Playngo/Riches-of-RA.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 11:21:46'),
(614, 8, 'inativo', '7807', 'Rich Wilde and the Amulet of Dead', '7807', 'slot', NULL, 'PlayFiver/Playngo/Rich-Wilde-and-the-Amulet-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-31 18:17:05'),
(615, 8, 'inativo', '7806', 'Prosperity Palace', '7806', 'slot', NULL, 'PlayFiver/Playngo/Prosperity-Palace.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 19:14:28'),
(616, 8, 'inativo', '7805', 'Prism of Gems', '7805', 'slot', NULL, 'PlayFiver/Playngo/Prism-of-Gems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-05 08:13:55'),
(617, 8, 'inativo', '7804', 'Photo Safari', '7804', 'slot', NULL, 'PlayFiver/Playngo/Photo-Safari.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-01 23:05:50'),
(618, 8, 'inativo', '7803', 'Pearl Lagoon', '7803', 'slot', NULL, 'PlayFiver/Playngo/Pearl-Lagoon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-02 11:32:35'),
(619, 8, 'inativo', '7802', 'New Year Riches', '7802', 'slot', NULL, 'PlayFiver/Playngo/New-Year-Riches.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-01 15:00:43'),
(620, 8, 'inativo', '7801', 'Mystery Joker', '7801', 'slot', NULL, 'PlayFiver/Playngo/Mystery-Joker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 01:19:36'),
(621, 8, 'inativo', '7800', 'MultiFruit 81', '7800', 'slot', NULL, 'PlayFiver/Playngo/MultiFruit-81.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 11:33:15'),
(622, 8, 'inativo', '7799', 'Miner Donkey Trouble', '7799', 'slot', NULL, 'PlayFiver/Playngo/Miner-Donkey-Trouble.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 20:59:21'),
(623, 8, 'inativo', '7798', 'Lord Merlin and the Lady of the Lake', '7798', 'slot', NULL, 'PlayFiver/Playngo/Lord-Merlin-and-the-Lady-of-the-Lake.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:23:22'),
(624, 8, 'inativo', '7797', 'Legacy of Dead', '7797', 'slot', NULL, 'PlayFiver/Playngo/Legacy-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 19:38:49'),
(625, 8, 'inativo', '7796', 'Irish Gold', '7796', 'slot', NULL, 'PlayFiver/Playngo/Irish-Gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 11:43:09'),
(626, 8, 'inativo', '7795', 'House of Doom', '7795', 'slot', NULL, 'PlayFiver/Playngo/House-of-Doom.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:22:45'),
(627, 8, 'inativo', '7794', 'Happy Halloween', '7794', 'slot', NULL, 'PlayFiver/Playngo/Happy-Halloween.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-04 04:12:36'),
(628, 8, 'inativo', '7793', 'Golden Legend', '7793', 'slot', NULL, 'PlayFiver/Playngo/Golden-Legend.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 07:27:12'),
(629, 8, 'inativo', '7792', 'Gold Trophy', '7792', 'slot', NULL, 'PlayFiver/Playngo/Gold-Trophy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-31 23:56:27'),
(630, 8, 'inativo', '7791', 'Ghost of Dead', '7791', 'slot', NULL, 'PlayFiver/Playngo/Ghost-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-04 14:00:01'),
(631, 8, 'inativo', '7790', 'Fu Er Dai', '7790', 'slot', NULL, 'PlayFiver/Playngo/Fu-Er-Dai.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-03 21:30:28'),
(632, 8, 'inativo', '7789', 'Dragonship', '7789', 'slot', NULL, 'PlayFiver/Playngo/Dragonship.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 03:33:33'),
(633, 8, 'inativo', '7788', 'Doom of Egypt', '7788', 'slot', NULL, 'PlayFiver/Playngo/Doom-of-Egypt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-15 06:40:38'),
(634, 8, 'inativo', '7787', 'Disco Diamonds', '7787', 'slot', NULL, 'PlayFiver/Playngo/Disco-Diamonds.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-07-19 23:27:35'),
(635, 8, 'inativo', '7786', 'Dawn of Egypt', '7786', 'slot', NULL, 'PlayFiver/Playngo/Dawn-of-Egypt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-12 02:29:51'),
(636, 8, 'inativo', '7785', 'Danish Flip', '7785', 'slot', NULL, 'PlayFiver/Playngo/Danish-Flip.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 04:24:18'),
(637, 8, 'inativo', '7784', 'Crystal Sun', '7784', 'slot', NULL, 'PlayFiver/Playngo/Crystal-Sun.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-10 12:12:56'),
(638, 8, 'inativo', '7783', 'CopsnRobbers', '7783', 'slot', NULL, 'PlayFiver/Playngo/CopsnRobbers.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 14:53:35'),
(639, 8, 'inativo', '7782', 'Coils of Cash', '7782', 'slot', NULL, 'PlayFiver/Playngo/Coils-of-Cash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-15 13:10:01'),
(640, 8, 'inativo', '7781', 'Charlie Chance', '7781', 'slot', NULL, 'PlayFiver/Playngo/Charlie-Chance.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 0, '2024-03-29 01:55:33', '2024-09-24 08:10:40'),
(641, 8, 'inativo', '7780', 'Cat Wilde and the Doom of Dead', '7780', 'slot', NULL, 'PlayFiver/Playngo/Cat-Wilde-and-the-Doom-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-08 05:13:44'),
(642, 8, 'inativo', '7779', 'Book of Dead', '7779', 'slot', NULL, 'PlayFiver/Playngo/Book-of-Dead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-26 22:52:34'),
(643, 8, 'inativo', '7778', 'Blinged', '7778', 'slot', NULL, 'PlayFiver/Playngo/Blinged.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-09 04:14:48'),
(644, 8, 'inativo', '7777', 'Aztec Idols', '7777', 'slot', NULL, 'PlayFiver/Playngo/Aztec-Idols.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:23:22'),
(645, 8, 'inativo', '7776', '5xMagic', '7776', 'slot', NULL, 'PlayFiver/Playngo/5xMagic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 10:17:16'),
(646, 8, 'inativo', '7775', '3 Clown Monty', '7775', 'slot', NULL, 'PlayFiver/Playngo/3-Clown-Monty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-14 07:05:40'),
(647, 8, 'inativo', '8107', 'Blazin Bullfrog', '8107', 'slot', NULL, 'PlayFiver/Playngo/Blazin-Bullfrog.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:23:22'),
(648, 8, 'inativo', '8106', 'Big win 777', '8106', 'slot', NULL, 'PlayFiver/Playngo/Big-win-777.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 00:36:26'),
(649, 8, 'inativo', '8127', 'Leprechauns Vault', '8127', 'slot', NULL, 'PlayFiver/Playngo/Leprechauns-Vault.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-09 12:27:12'),
(650, 8, 'inativo', '8142', 'Athena Ascending', '8142', 'slot', NULL, 'PlayFiver/Playngo/Athena-Ascending.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 23:52:03'),
(651, 9, 'inativo', '72', 'Twin Spin', '72', 'slot', NULL, 'PlayFiver/NetEnt/Twin-Spin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-07-30 15:56:40'),
(652, 9, 'inativo', '7194', 'Twin Spin Deluxe', '7194', 'slot', NULL, 'PlayFiver/NetEnt/Twin-Spin-Deluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-05 18:05:29'),
(653, 9, 'inativo', '7109', 'Twin Spin MegaWays', '7109', 'slot', NULL, 'PlayFiver/NetEnt/Twin-Spin-MegaWays.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 0, '2024-03-29 01:55:33', '2024-08-16 00:26:12'),
(654, 9, 'inativo', '7108', 'Vegas Night Life', '7108', 'slot', NULL, 'PlayFiver/NetEnt/Vegas-Night-Life.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-07-19 23:18:39'),
(656, 9, 'inativo', '7160', 'Vikings', '7160', 'slot', NULL, 'PlayFiver/NetEnt/Vikings.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 07:21:08'),
(657, 9, 'inativo', '7165', 'Wild Bazaar', '7165', 'slot', NULL, 'PlayFiver/NetEnt/Wild-Bazaar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:02'),
(658, 9, 'inativo', '7107', 'Wilderland', '7107', 'slot', NULL, 'PlayFiver/NetEnt/Wilderland.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 03:46:26'),
(659, 9, 'inativo', '7154', 'Wild Turkey', '7154', 'slot', NULL, 'PlayFiver/NetEnt/Wild-Turkey.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 14:30:49'),
(661, 9, 'inativo', '7150', 'Wild Worlds', '7150', 'slot', NULL, 'PlayFiver/NetEnt/Wild-Worlds.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-03 13:36:40'),
(662, 9, 'inativo', '7123', 'Wings of Riches', '7123', 'slot', NULL, 'PlayFiver/NetEnt/Wings-of-Riches.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 11:04:19'),
(663, 9, 'inativo', '7102', 'Wonderland Protector', '7102', 'slot', NULL, 'PlayFiver/NetEnt/Wonderland-Protector.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 02:01:29'),
(664, 9, 'inativo', '441', 'King of Slots', '441', 'slot', NULL, 'PlayFiver/NetEnt/King-of-Slots.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:04'),
(665, 9, 'inativo', '7178', 'Lost Relics', '7178', 'slot', NULL, 'PlayFiver/NetEnt/Lost-Relics.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-04 14:01:50'),
(666, 9, 'inativo', '7188', 'Lucky Angler', '7188', 'slot', NULL, 'PlayFiver/NetEnt/Lucky-Angler.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(667, 9, 'inativo', '533', 'Magic Portals', '533', 'slot', NULL, 'PlayFiver/NetEnt/Magic-Portals.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 01:46:22'),
(668, 9, 'inativo', '4164', 'Motorhead', '4164', 'slot', NULL, 'PlayFiver/NetEnt/Motorhead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-29 23:56:18'),
(669, 9, 'inativo', '7174', 'Mr Green: Grand Tour', '7174', 'slot', NULL, 'PlayFiver/NetEnt/Mr-Green_-Grand-Tour.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-29 04:07:38'),
(670, 9, 'inativo', '7173', 'Mr Green: Moonlight', '7173', 'slot', NULL, 'PlayFiver/NetEnt/Mr-Green_-Moonlight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(671, 9, 'inativo', '7125', 'Ozzy Osbourne', '7125', 'slot', NULL, 'PlayFiver/NetEnt/Ozzy-Osbourne.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 23:08:15'),
(673, 9, 'inativo', '7186', 'Planet of the Apes', '7186', 'slot', NULL, 'PlayFiver/NetEnt/Planet-of-the-Apes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 0, '2024-03-29 01:55:33', '2024-08-13 21:54:17');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(674, 9, 'inativo', '7127', 'Reel Rush 2', '7127', 'slot', NULL, 'PlayFiver/NetEnt/Reel-Rush-2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-01 14:54:36'),
(675, 9, 'inativo', '26', 'Reel Rush', '26', 'slot', NULL, 'PlayFiver/NetEnt/Reel-Rush.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(676, 9, 'inativo', '7106', 'Riches of Midgard', '7106', 'slot', NULL, 'PlayFiver/NetEnt/Riches-of-Midgard.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-13 23:50:28'),
(677, 9, 'inativo', '7122', 'Rise of Maya', '7122', 'slot', NULL, 'PlayFiver/NetEnt/Rise-of-Maya.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(678, 9, 'inativo', '7152', 'Robin Hood', '7152', 'slot', NULL, 'PlayFiver/NetEnt/Robin-Hood.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-26 20:34:14'),
(679, 9, 'inativo', '7124', 'Santa vs Rudolf', '7124', 'slot', NULL, 'PlayFiver/NetEnt/Santa-vs-Rudolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(680, 9, 'inativo', '7197', 'Scruffy Duck', '7197', 'slot', NULL, 'PlayFiver/NetEnt/Scruffy-Duck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(681, 9, 'inativo', '7187', 'Secret Of The Stones', '7187', 'slot', NULL, 'PlayFiver/NetEnt/Secret-Of-The-Stones.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 13:05:19'),
(682, 9, 'inativo', '4163', 'Secrets of Atlantis', '4163', 'slot', NULL, 'PlayFiver/NetEnt/Secrets-of-Atlantis.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-28 21:54:59'),
(683, 9, 'inativo', '179', 'StarBurst', '179', 'slot', NULL, 'PlayFiver/NetEnt/StarBurst.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-01 20:56:29'),
(684, 9, 'inativo', '7112', 'Street Fighter II: The World Warrior', '7112', 'slot', NULL, 'PlayFiver/NetEnt/Street-Fighter-II_-The-World-Warrior.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 15:23:38'),
(685, 9, 'inativo', '7157', 'Strolling Staxx', '7157', 'slot', NULL, 'PlayFiver/NetEnt/Strolling-Staxx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:20'),
(686, 9, 'inativo', '7111', 'Super Striker', '7111', 'slot', NULL, 'PlayFiver/NetEnt/Super-Striker.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-03-29 01:55:33', '2024-08-10 13:39:44'),
(687, 9, 'inativo', '7053', 'Sweety Honey Fruity', '7053', 'slot', NULL, 'PlayFiver/NetEnt/Sweety-Honey-Fruity.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-27 19:18:51'),
(688, 9, 'inativo', '7172', 'Swipe & Roll', '7172', 'slot', NULL, 'PlayFiver/NetEnt/Swipe-&-Roll.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:07'),
(689, 9, 'inativo', '7130', 'The Wish Master', '7130', 'slot', NULL, 'PlayFiver/NetEnt/The-Wish-Master.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-08 19:29:10'),
(690, 9, 'inativo', '7110', 'Trollpot 5000', '7110', 'slot', NULL, 'PlayFiver/NetEnt/Trollpot-5000.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 0, '2024-03-29 01:55:33', '2024-08-02 08:50:54'),
(691, 9, 'inativo', '7158', 'Turn Your Fortune', '7158', 'slot', NULL, 'PlayFiver/NetEnt/Turn-Your-Fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-03-29 01:55:33', '2024-10-10 16:21:08'),
(692, 9, 'inativo', '7055', 'Twin Happiness', '7055', 'slot', NULL, 'PlayFiver/NetEnt/Twin-Happiness.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 10:34:31'),
(693, 9, 'inativo', '7170', 'Jumanji', '7170', 'slot', NULL, 'PlayFiver/NetEnt/Jumanji.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 02:25:29'),
(694, 9, 'inativo', '7133', 'King of 3 Kingdoms', '7133', 'slot', NULL, 'PlayFiver/NetEnt/King-of-3-Kingdoms.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:30'),
(695, 9, 'inativo', '7126', 'Long Pao', '7126', 'slot', NULL, 'PlayFiver/NetEnt/Long-Pao.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-03-29 01:55:33', '2024-08-10 09:23:42'),
(696, 9, 'inativo', '7128', 'Magic Maid Cafe', '7128', 'slot', NULL, 'PlayFiver/NetEnt/Magic-Maid-Cafe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 05:40:53'),
(697, 9, 'inativo', '544', 'Reel Steal', '544', 'slot', NULL, 'PlayFiver/NetEnt/Reel-Steal.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-03-29 01:55:33', '2024-06-21 22:25:30'),
(698, 9, 'inativo', '489', 'Jimi Hendrix', '489', 'slot', NULL, 'PlayFiver/NetEnt/Jimi-Hendrix.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-07-30 11:46:16'),
(699, 9, 'inativo', '7159', 'Jingle Spin', '7159', 'slot', NULL, 'PlayFiver/NetEnt/Jingle-Spin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-03-29 01:55:33', '2024-08-01 19:18:09'),
(1195, 3, 'inativo', 'mines', 'MINES', 'mines', 'block', NULL, '01JNC3RD4TNEHTJQACD2GEE4CM.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4384, 0, 1, '2024-03-29 05:55:33', '2025-09-05 13:34:14'),
(1194, 3, 'inativo', '11675', 'HILO', '11675', 'block', NULL, 'PlayFiver/Spribe/12565.png', '0', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 74, 0, 0, '2024-03-29 05:55:33', '2025-06-03 16:37:59'),
(1193, 3, 'inativo', '11671', 'DICE', '11671', 'block', NULL, 'PlayFiver/Spribe/12562.png', '0', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 73, 0, 0, '2024-03-29 05:55:33', '2025-06-03 16:38:18'),
(1192, 3, 'inativo', '11677', 'MINI ROULETTE', '11677', 'block', NULL, '01JNC3MG41DX3N1PTPDG9ZRAQF.png', '0', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 73, 0, 0, '2024-03-29 05:55:33', '2025-06-03 16:38:54'),
(1191, 3, 'inativo', '11678', 'HOTLINE', '11678', 'block', NULL, 'PlayFiver/Spribe/12564.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 70, 0, 1, '2024-03-29 05:55:33', '2024-11-29 23:15:00'),
(752, 10, 'inativo', 'hand_of_gold', 'HAND OF GOLD', 'hand_of_gold', 'slot', NULL, 'PlayFiver/Playson/hand_of_gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:05'),
(753, 10, 'inativo', 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'legend_of_cleopatra', 'slot', NULL, 'PlayFiver/Playson/legend_of_cleopatra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:45:55'),
(754, 10, 'inativo', '40_joker_staxx', '40 JOKER STAXX', '40_joker_staxx', 'slot', NULL, 'PlayFiver/Playson/40_joker_staxx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:23'),
(755, 10, 'inativo', 'burning_wins', 'BURNING WINS', 'burning_wins', 'slot', NULL, 'PlayFiver/Playson/burning_wins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:30'),
(756, 10, 'inativo', 'book_of_gold', 'BOOK OF GOLD', 'book_of_gold', 'slot', NULL, 'PlayFiver/Playson/book_of_gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:15'),
(757, 10, 'inativo', '100_joker_staxx', '100 JOKER STAXX', '100_joker_staxx', 'slot', NULL, 'PlayFiver/Playson/100_joker_staxx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:42'),
(758, 10, 'inativo', 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'book_of_gold_classic', 'slot', NULL, 'PlayFiver/Playson/book_of_gold_classic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:36'),
(759, 10, 'inativo', 'buffalo_xmas', 'BUFFALO XMAS', 'buffalo_xmas', 'slot', NULL, 'PlayFiver/Playson/buffalo_xmas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:46:50'),
(761, 11, 'inativo', '1hl323e1lxuqdrkr', 'AUTO_MEGA_ROULETTE', '1hl323e1lxuqdrkr', 'cards', NULL, 'PlayFiver/Pragmaticlive/1hl323e1lxuqdrkr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:31:30'),
(762, 11, 'inativo', '1hl65ce1lxuqdrkr', 'MEGA_ROULETTE', '1hl65ce1lxuqdrkr', 'cards', NULL, 'PlayFiver/Pragmaticlive/1hl65ce1lxuqdrkr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:31:35'),
(763, 11, 'inativo', '5bzl2835s5ruvweg', 'AUTO_ROULETTE', '5bzl2835s5ruvweg', 'cards', NULL, 'PlayFiver/Pragmaticlive/5bzl2835s5ruvweg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:57:49'),
(764, 11, 'inativo', 'autorwra311autor', 'SPEED_AUTO_ROULETTE', 'autorwra311autor', 'cards', NULL, 'PlayFiver/Pragmaticlive/autorwra311autor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:57:36'),
(765, 11, 'inativo', 'chroma229rwltr22', 'ROULETTE_RUBY', 'chroma229rwltr22', 'cards', NULL, 'PlayFiver/Pragmaticlive/chroma229rwltr22.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:58:28'),
(766, 11, 'inativo', 'fl9knouu0yjez2wi', 'SPEED_ROULETTE_1', 'fl9knouu0yjez2wi', 'cards', NULL, 'PlayFiver/Pragmaticlive/fl9knouu0yjez2wi.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2024-12-12 01:44:02'),
(767, 11, 'inativo', 'g03y1t9vvuhrfytl', 'ROULETTE_AZURE', 'g03y1t9vvuhrfytl', 'cards', NULL, 'PlayFiver/Pragmaticlive/g03y1t9vvuhrfytl.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:10'),
(768, 11, 'inativo', 'lucky6roulettea3', 'LUCKY_6_ROULETTE', 'lucky6roulettea3', 'cards', NULL, 'PlayFiver/Pragmaticlive/lucky6roulettea3.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:15'),
(769, 11, 'inativo', 'p8l1j84prrmxzyic', 'TURKISH_ROULETTE', 'p8l1j84prrmxzyic', 'cards', NULL, 'PlayFiver/Pragmaticlive/p8l1j84prrmxzyic.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:21'),
(770, 11, 'inativo', 'r20speedrtwo201s', 'SPEED_ROULETTE_2', 'r20speedrtwo201s', 'cards', NULL, 'PlayFiver/Pragmaticlive/r20speedrtwo201s.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:33'),
(771, 11, 'inativo', 'rmycjoqq18k2r161', 'ROULETTE_INDIAN', 'rmycjoqq18k2r161', 'cards', NULL, 'PlayFiver/Pragmaticlive/rmycjoqq18k2r161.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:39'),
(772, 11, 'inativo', 'romania233rwl291', 'ROMANIAN_ROULETTE', 'romania233rwl291', 'cards', NULL, 'PlayFiver/Pragmaticlive/romania233rwl291.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:45'),
(773, 11, 'inativo', 'roulerw234rwl292', 'SPANISH_ROULETTE', 'roulerw234rwl292', 'cards', NULL, 'PlayFiver/Pragmaticlive/roulerw234rwl292.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:39:59'),
(774, 11, 'inativo', 's2x6b4jdeqza2ge2', 'GERMAN_ROULETTE', 's2x6b4jdeqza2ge2', 'cards', NULL, 'PlayFiver/Pragmaticlive/s2x6b4jdeqza2ge2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-11 14:00:05'),
(775, 11, 'inativo', 't4jzencinod6iqwi', 'RUSSIAN_ROULETTE', 't4jzencinod6iqwi', 'cards', NULL, 'PlayFiver/Pragmaticlive/t4jzencinod6iqwi.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 0, '2024-05-27 15:25:59', '2024-08-13 18:02:43'),
(776, 11, 'inativo', 'v1c52fgw7yy02upz', 'ROULETTE_ITALIA_TRICOLORE', 'v1c52fgw7yy02upz', 'cards', NULL, 'PlayFiver/Pragmaticlive/v1c52fgw7yy02upz.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:32:51'),
(777, 11, 'inativo', 'yqpz3ichst2xg439', 'ROULETTE_MACAO', 'yqpz3ichst2xg439', 'cards', NULL, 'PlayFiver/Pragmaticlive/yqpz3ichst2xg439.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:31:24'),
(778, 11, 'inativo', '2q57e43m4ivqwaq3', 'SPEED_BACCARAT_6', '2q57e43m4ivqwaq3', 'cards', NULL, 'PlayFiver/Pragmaticlive/2q57e43m4ivqwaq3.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-29 23:01:50'),
(779, 11, 'inativo', '886ewimul28yw14j', 'SPEED_BACCARAT_5', '886ewimul28yw14j', 'cards', NULL, 'PlayFiver/Pragmaticlive/886ewimul28yw14j.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:48:11'),
(780, 11, 'inativo', '9j3eagurfwmml7z2', 'BACCARAT_2', '9j3eagurfwmml7z2', 'cards', NULL, 'PlayFiver/Pragmaticlive/9j3eagurfwmml7z2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 22:29:50'),
(781, 11, 'inativo', 'b0jf7rlboleibnap', 'SPEED_BACCARAT_14', 'b0jf7rlboleibnap', 'cards', NULL, 'PlayFiver/Pragmaticlive/b0jf7rlboleibnap.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-29 23:01:04'),
(782, 11, 'inativo', 'bcapuntobanco001', 'PUNTO_BANCO_ITALIA_TRICOLORE', 'bcapuntobanco001', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcapuntobanco001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:48:08'),
(783, 11, 'inativo', 'bcpirpmfpeobc191', 'BACCARAT_7', 'bcpirpmfpeobc191', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc191.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 21:29:50'),
(784, 11, 'inativo', 'bcpirpmfpeobc192', 'BACCARAT_8', 'bcpirpmfpeobc192', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc192.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:06:15'),
(785, 11, 'inativo', 'bcpirpmfpeobc193', 'SPEED_BACCARAT_15', 'bcpirpmfpeobc193', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc193.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:51:25'),
(786, 11, 'inativo', 'bcpirpmfpeobc194', 'SPEED_BACCARAT_10', 'bcpirpmfpeobc194', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc194.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 18:59:39'),
(787, 11, 'inativo', 'bcpirpmfpeobc196', 'SPEED_BACCARAT_9', 'bcpirpmfpeobc196', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc196.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 07:05:48'),
(788, 11, 'inativo', 'bcpirpmfpeobc197', 'SPEED_BACCARAT_7', 'bcpirpmfpeobc197', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc197.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 13:36:30'),
(789, 11, 'inativo', 'bcpirpmfpeobc198', 'SPEED_BACCARAT_8', 'bcpirpmfpeobc198', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc198.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 20:27:43'),
(790, 11, 'inativo', 'bcpirpmfpeobc199', 'SUPER_8_BACCARAT', 'bcpirpmfpeobc199', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpeobc199.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:20:28'),
(791, 11, 'inativo', 'bcpirpmfpobc1910', 'FORTUNE_6_BACCARAT', 'bcpirpmfpobc1910', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpobc1910.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:18:11'),
(792, 11, 'inativo', 'bcpirpmfpobc1912', 'BACCARAT_9', 'bcpirpmfpobc1912', 'cards', NULL, 'PlayFiver/Pragmaticlive/bcpirpmfpobc1912.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 02:03:20'),
(793, 11, 'inativo', 'cbcf6qas8fscb221', 'SPEED_BACCARAT_12', 'cbcf6qas8fscb221', 'cards', NULL, 'PlayFiver/Pragmaticlive/cbcf6qas8fscb221.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:43:06'),
(794, 11, 'inativo', 'cbcf6qas8fscb222', 'BACCARAT_3', 'cbcf6qas8fscb222', 'cards', NULL, 'PlayFiver/Pragmaticlive/cbcf6qas8fscb222.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:22:16'),
(795, 11, 'inativo', 'cbcf6qas8fscb224', 'SPEED_BACCARAT_11', 'cbcf6qas8fscb224', 'cards', NULL, 'PlayFiver/Pragmaticlive/cbcf6qas8fscb224.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:19:26'),
(796, 11, 'inativo', 'h22z8qhp17sa0vkh', 'BACCARAT_1', 'h22z8qhp17sa0vkh', 'cards', NULL, 'PlayFiver/Pragmaticlive/h22z8qhp17sa0vkh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:35:21'),
(797, 11, 'inativo', 'kkqnazmd8ttq7fgd', 'SPEED_BACCARAT_2', 'kkqnazmd8ttq7fgd', 'cards', NULL, 'PlayFiver/Pragmaticlive/kkqnazmd8ttq7fgd.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 21:00:01'),
(798, 11, 'inativo', 'm88hicogrzeod202', 'SPEED_BACCARAT_13', 'm88hicogrzeod202', 'cards', NULL, 'PlayFiver/Pragmaticlive/m88hicogrzeod202.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:42:04'),
(799, 11, 'inativo', 'mbc371rpmfmbc371', 'MEGA_BACCARAT', 'mbc371rpmfmbc371', 'cards', NULL, 'PlayFiver/Pragmaticlive/mbc371rpmfmbc371.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-11-29 22:59:00'),
(800, 11, 'inativo', 'ne074fgn4bd1150i', 'BACCARAT_5', 'ne074fgn4bd1150i', 'cards', NULL, 'PlayFiver/Pragmaticlive/ne074fgn4bd1150i.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 01:20:41'),
(801, 11, 'inativo', 'oq808ojps709qqaf', 'BACCARAT_6', 'oq808ojps709qqaf', 'cards', NULL, 'PlayFiver/Pragmaticlive/oq808ojps709qqaf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 13:49:26'),
(802, 11, 'inativo', 'pwnhicogrzeodk79', 'SPEED_BACCARAT_1', 'pwnhicogrzeodk79', 'cards', NULL, 'PlayFiver/Pragmaticlive/pwnhicogrzeodk79.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:42:56'),
(803, 11, 'inativo', 's8s9f0quk3ygiyb1', 'SPEED_BACCARAT_3', 's8s9f0quk3ygiyb1', 'cards', NULL, 'PlayFiver/Pragmaticlive/s8s9f0quk3ygiyb1.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 03:09:11'),
(804, 11, 'inativo', 'lc419kkmr2sxfpbk', 'MEGA_SIC_BO', 'lc419kkmr2sxfpbk', 'cards', NULL, 'PlayFiver/Pragmaticlive/lc419kkmr2sxfpbk.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 17:44:40'),
(805, 11, 'inativo', 'sba71kkmr2ssba71', 'SICBO', 'sba71kkmr2ssba71', 'cards', NULL, 'PlayFiver/Pragmaticlive/sba71kkmr2ssba71.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:28:14'),
(806, 11, 'inativo', 'md500q83g7cdefw1', 'MEGA_WHEEL', 'md500q83g7cdefw1', 'cards', NULL, 'PlayFiver/Pragmaticlive/md500q83g7cdefw1.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 11, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:28:02'),
(807, 11, 'inativo', 'ge49e4os88bp4bi5', 'DRAGON_TIGER', 'ge49e4os88bp4bi5', 'cards', NULL, 'PlayFiver/Pragmaticlive/ge49e4os88bp4bi5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:28:08'),
(808, 11, 'inativo', 'pbvzrfk1fyft4dwe', 'SWEET_BONANZA_CANDYLAND', 'pbvzrfk1fyft4dwe', 'cards', NULL, 'PlayFiver/Pragmaticlive/pbvzrfk1fyft4dwe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:44:19'),
(809, 11, 'inativo', 'jzbzy021lg8xy9i2', 'ANDAR_BAHAR', 'jzbzy021lg8xy9i2', 'cards', NULL, 'PlayFiver/Pragmaticlive/jzbzy021lg8xy9i2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-12-12 01:42:16'),
(810, 11, 'inativo', 'bigbassnewbb1320', 'BIG_BASS_CRASH', 'bigbassnewbb1320', 'fish', NULL, 'PlayFiver/Pragmaticlive/bigbassnewbb1320.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:29:57'),
(811, 11, 'inativo', 'spacemanyxe123nh', 'SPACEMAN', 'spacemanyxe123nh', 'block', NULL, 'PlayFiver/Pragmaticlive/spacemanyxe123nh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4201, 0, 1, '2024-05-27 15:25:59', '2025-03-02 15:56:03'),
(813, 12, 'inativo', 'WildTriads', 'WildTriads', 'WildTriads', 'slot', NULL, 'PlayFiver/Toptrend/WildTriads.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 17, 0, 0, '2024-05-27 15:25:59', '2024-08-03 12:50:01'),
(814, 12, 'inativo', 'GoldenDragon', 'Golden Dragon', 'GoldenDragon', 'slot', NULL, 'PlayFiver/Toptrend/GoldenDragon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:58:51'),
(815, 12, 'inativo', 'ReelsOfFortune', 'Reels Of Fortune', 'ReelsOfFortune', 'slot', NULL, 'PlayFiver/Toptrend/ReelsOfFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:09:23'),
(816, 12, 'inativo', 'GoldenAmazon', 'Golden Amazon', 'GoldenAmazon', 'slot', NULL, 'PlayFiver/Toptrend/GoldenAmazon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-09 05:44:44'),
(817, 12, 'inativo', 'MonkeyLuck', 'MonkeyLuck', 'MonkeyLuck', 'slot', NULL, 'PlayFiver/Toptrend/MonkeyLuck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 06:28:34'),
(818, 12, 'inativo', 'LeagueOfChampions', 'League Of Champions', 'LeagueOfChampions', 'slot', NULL, 'PlayFiver/Toptrend/LeagueOfChampions.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:22:32'),
(819, 12, 'inativo', 'MadMonkeyH5', 'MadMonkey', 'MadMonkeyH5', 'slot', NULL, 'PlayFiver/Toptrend/MadMonkeyH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 16:12:29'),
(820, 12, 'inativo', 'DynastyEmpire', 'Dynasty Empire', 'DynastyEmpire', 'slot', NULL, 'PlayFiver/Toptrend/DynastyEmpire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-10-03 23:38:20'),
(821, 12, 'inativo', 'SuperKids', 'SuperKids', 'SuperKids', 'slot', NULL, 'PlayFiver/Toptrend/SuperKids.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:03:09'),
(822, 12, 'inativo', 'HotVolcanoH5', 'HotVolcano', 'HotVolcanoH5', 'slot', NULL, 'PlayFiver/Toptrend/HotVolcanoH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:19:07'),
(823, 12, 'inativo', 'Huluwa', 'Huluwa', 'Huluwa', 'slot', NULL, 'PlayFiver/Toptrend/Huluwa.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(824, 12, 'inativo', 'LegendOfLinkH5', 'LegendOfLink', 'LegendOfLinkH5', 'slot', NULL, 'PlayFiver/Toptrend/LegendOfLinkH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:09'),
(825, 12, 'inativo', 'DetectiveBlackCat', 'DetectiveBlackCat', 'DetectiveBlackCat', 'slot', NULL, 'PlayFiver/Toptrend/DetectiveBlackCat.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(826, 12, 'inativo', 'ChilliGoldH5', 'Chilli Gold', 'ChilliGoldH5', 'slot', NULL, 'PlayFiver/Toptrend/ChilliGoldH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:10:06'),
(827, 12, 'inativo', 'SilverLionH5', 'Silver Lion', 'SilverLionH5', 'slot', NULL, 'PlayFiver/Toptrend/SilverLionH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 02:19:03'),
(828, 12, 'inativo', 'ThunderingZeus', 'ThunderingZeus', 'ThunderingZeus', 'slot', NULL, 'PlayFiver/Toptrend/ThunderingZeus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 27, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:11'),
(829, 12, 'inativo', 'DragonPalaceH5', 'Dragon Palace', 'DragonPalaceH5', 'slot', NULL, 'PlayFiver/Toptrend/DragonPalaceH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 23:38:38'),
(830, 12, 'inativo', 'MadMonkey2', 'MadMonkey', 'MadMonkey2', 'slot', NULL, 'PlayFiver/Toptrend/MadMonkey2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:12'),
(831, 12, 'inativo', 'MedusaCurse', 'Medusa Curse', 'MedusaCurse', 'slot', NULL, 'PlayFiver/Toptrend/MedusaCurse.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:16'),
(832, 12, 'inativo', 'BattleHeroes', 'Battle Heroes', 'BattleHeroes', 'slot', NULL, 'PlayFiver/Toptrend/BattleHeroes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:46:24'),
(833, 12, 'inativo', 'NeptunesGoldH5', 'Neptunes Gold', 'NeptunesGoldH5', 'slot', NULL, 'PlayFiver/Toptrend/NeptunesGoldH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 18:07:01'),
(834, 12, 'inativo', 'HeroesNeverDie', 'Heroes Never Die', 'HeroesNeverDie', 'slot', NULL, 'PlayFiver/Toptrend/HeroesNeverDie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(835, 12, 'inativo', 'WildWildWitch', 'Wild Wild Witch', 'WildWildWitch', 'slot', NULL, 'PlayFiver/Toptrend/WildWildWitch.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:58:06'),
(836, 12, 'inativo', 'WildKartRacers', 'Wild Kart Racers', 'WildKartRacers', 'slot', NULL, 'PlayFiver/Toptrend/WildKartRacers.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 02:30:52'),
(837, 12, 'inativo', 'KingDinosaur', 'KingDinosaur', 'KingDinosaur', 'slot', NULL, 'PlayFiver/Toptrend/KingDinosaur.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:34:24'),
(838, 12, 'inativo', 'GoldenGenie', 'GoldenGenie', 'GoldenGenie', 'slot', NULL, 'PlayFiver/Toptrend/GoldenGenie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 19:25:33'),
(839, 12, 'inativo', 'UltimateFighter', 'UltimateFighter', 'UltimateFighter', 'slot', NULL, 'PlayFiver/Toptrend/UltimateFighter.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:02:52'),
(840, 12, 'inativo', 'EverlastingSpins', 'EverlastingSpins', 'EverlastingSpins', 'slot', NULL, 'PlayFiver/Toptrend/EverlastingSpins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-07 09:40:05'),
(841, 12, 'inativo', 'Zoomania', 'Zoomania', 'Zoomania', 'slot', NULL, 'PlayFiver/Toptrend/Zoomania.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:33:54'),
(842, 12, 'inativo', 'LaserCats', 'Laser Cats', 'LaserCats', 'slot', NULL, 'PlayFiver/Toptrend/LaserCats.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:06:52'),
(843, 12, 'inativo', 'DiamondFortune', 'DiamondFortune', 'DiamondFortune', 'slot', NULL, 'PlayFiver/Toptrend/DiamondFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:11:25'),
(844, 12, 'inativo', 'GoldenClaw', 'GoldenClaw', 'GoldenClaw', 'slot', NULL, 'PlayFiver/Toptrend/GoldenClaw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:02'),
(845, 12, 'inativo', 'PandaWarrior', 'PandaWarrior', 'PandaWarrior', 'slot', NULL, 'PlayFiver/Toptrend/PandaWarrior.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:52:27'),
(846, 12, 'inativo', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'slot', NULL, 'PlayFiver/Toptrend/RoyalGoldenDragon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-02 09:16:50'),
(847, 12, 'inativo', 'MegaMaya', 'MegaMaya', 'MegaMaya', 'slot', NULL, 'PlayFiver/Toptrend/MegaMaya.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:46:11'),
(848, 12, 'inativo', 'MegaPhoenix', 'MegaPhoenix', 'MegaPhoenix', 'slot', NULL, 'PlayFiver/Toptrend/MegaPhoenix.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 18:53:02'),
(849, 12, 'inativo', 'DolphinGoldH5', 'DolphinGold', 'DolphinGoldH5', 'slot', NULL, 'PlayFiver/Toptrend/DolphinGoldH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:36:33'),
(850, 12, 'inativo', 'DragonKingH5', 'DragonKing', 'DragonKingH5', 'slot', NULL, 'PlayFiver/Toptrend/DragonKingH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 13:24:20'),
(851, 12, 'inativo', 'LuckyPandaH5', 'LuckyPanda', 'LuckyPandaH5', 'slot', NULL, 'PlayFiver/Toptrend/LuckyPandaH5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:34:06'),
(852, 13, 'inativo', 'btball5x20', 'Crazy Basketball', 'btball5x20', 'slot', NULL, 'PlayFiver/Dreamtech/btball5x20.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:11'),
(853, 13, 'inativo', 'dnp', 'DragonPhoenix Prosper', 'dnp', 'slot', NULL, 'PlayFiver/Dreamtech/dnp.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-31 23:19:37'),
(854, 13, 'inativo', 'crystal', 'Glory of Heroes', 'crystal', 'slot', NULL, 'PlayFiver/Dreamtech/crystal.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-15 09:10:10'),
(855, 13, 'inativo', 'fls', 'FULUSHOU', 'fls', 'slot', NULL, 'PlayFiver/Dreamtech/fls.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 08:29:43'),
(856, 13, 'inativo', 'fourss', 'Four Holy Beasts', 'fourss', 'slot', NULL, 'PlayFiver/Dreamtech/fourss.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 23:50:33'),
(857, 13, 'inativo', 'casino', '3D Slot', 'casino', 'slot', NULL, 'PlayFiver/Dreamtech/casino.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 22:21:29'),
(858, 13, 'inativo', 'crazy5x243', 'Crazy GO GO GO', 'crazy5x243', 'slot', NULL, 'PlayFiver/Dreamtech/crazy5x243.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:16:43'),
(859, 13, 'inativo', 'rocknight', 'RocknRoll Night', 'rocknight', 'slot', NULL, 'PlayFiver/Dreamtech/rocknight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 12:07:22'),
(860, 13, 'inativo', 'bluesea', 'Blue Sea', 'bluesea', 'slot', NULL, 'PlayFiver/Dreamtech/bluesea.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:43:11'),
(861, 13, 'inativo', 'circus', 'Crazy Circus', 'circus', 'slot', NULL, 'PlayFiver/Dreamtech/circus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:46:32'),
(862, 13, 'inativo', 'bikini', 'Bikini Party', 'bikini', 'slot', NULL, 'PlayFiver/Dreamtech/bikini.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:02'),
(863, 13, 'inativo', 'foryouth5x25', 'SO YOUNG', 'foryouth5x25', 'slot', NULL, 'PlayFiver/Dreamtech/foryouth5x25.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:28:12'),
(864, 13, 'inativo', 'fourbeauty', 'Four Beauties', 'fourbeauty', 'slot', NULL, 'PlayFiver/Dreamtech/fourbeauty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:25:59'),
(865, 13, 'inativo', 'sweethouse', 'Candy House', 'sweethouse', 'slot', NULL, 'PlayFiver/Dreamtech/sweethouse.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:37:54'),
(866, 13, 'inativo', 'legend5x25', 'Legend of the King', 'legend5x25', 'slot', NULL, 'PlayFiver/Dreamtech/legend5x25.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:46:41'),
(867, 13, 'inativo', 'opera', 'Beijing opera', 'opera', 'slot', NULL, 'PlayFiver/Dreamtech/opera.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:40:31'),
(868, 13, 'inativo', 'bigred', 'Big Red', 'bigred', 'slot', NULL, 'PlayFiver/Dreamtech/bigred.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:35:36'),
(869, 13, 'inativo', 'wrathofthor', 'Wrath of Thor', 'wrathofthor', 'slot', NULL, 'PlayFiver/Dreamtech/wrathofthor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-02 06:42:34'),
(870, 13, 'inativo', 'boxingarena', 'Boxing Arena', 'boxingarena', 'slot', NULL, 'PlayFiver/Dreamtech/boxingarena.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 06:43:51'),
(871, 13, 'inativo', 'fantasyforest', 'Elf Kingdom', 'fantasyforest', 'slot', NULL, 'PlayFiver/Dreamtech/fantasyforest.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(872, 13, 'inativo', 'egyptian', 'Egyptian Empire', 'egyptian', 'slot', NULL, 'PlayFiver/Dreamtech/egyptian.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:15:05'),
(873, 13, 'inativo', 'hotpotfeast', 'Hotpot Feast', 'hotpotfeast', 'slot', NULL, 'PlayFiver/Dreamtech/hotpotfeast.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 11:23:24'),
(874, 13, 'inativo', 'magician', 'Magician', 'magician', 'slot', NULL, 'PlayFiver/Dreamtech/magician.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:54:11'),
(875, 13, 'inativo', 'galaxywars', 'Galaxy Wars', 'galaxywars', 'slot', NULL, 'PlayFiver/Dreamtech/galaxywars.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 13:20:16'),
(876, 13, 'inativo', 'easyrider', 'Easy Rider', 'easyrider', 'slot', NULL, 'PlayFiver/Dreamtech/easyrider.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(877, 13, 'inativo', 'goldjade5x50', 'Jin Yu Man Tang', 'goldjade5x50', 'slot', NULL, 'PlayFiver/Dreamtech/goldjade5x50.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:16'),
(878, 13, 'inativo', 'shokudo', 'shokudo', 'shokudo', 'slot', NULL, 'PlayFiver/Dreamtech/shokudo.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:46:49'),
(879, 13, 'inativo', 'train', 'Treasure Hunt Trip', 'train', 'slot', NULL, 'PlayFiver/Dreamtech/train.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 07:37:05'),
(880, 13, 'inativo', 'lovefighters', 'Love Fighters', 'lovefighters', 'slot', NULL, 'PlayFiver/Dreamtech/lovefighters.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:09:14'),
(881, 13, 'inativo', 'genie', 'Aladdin s Wish', 'genie', 'slot', NULL, 'PlayFiver/Dreamtech/genie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:01'),
(882, 13, 'inativo', 'garden', 'Little Big Garden', 'garden', 'slot', NULL, 'PlayFiver/Dreamtech/garden.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:01:38'),
(883, 13, 'inativo', 'alchemist', 'Crazy Alchemist', 'alchemist', 'slot', NULL, 'PlayFiver/Dreamtech/alchemist.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:28:31'),
(884, 13, 'inativo', 'dinosaur5x25', 'Dinosaur World', 'dinosaur5x25', 'slot', NULL, 'PlayFiver/Dreamtech/dinosaur5x25.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 12:10:43'),
(885, 13, 'inativo', 'tombshadow', 'Tomb Shadow', 'tombshadow', 'slot', NULL, 'PlayFiver/Dreamtech/tombshadow.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 10:52:13'),
(886, 13, 'inativo', 'clash', 'Clash of Three kingdoms', 'clash', 'slot', NULL, 'PlayFiver/Dreamtech/clash.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:23:29'),
(887, 13, 'inativo', 'magicbean', 'Magic Bean Legend', 'magicbean', 'slot', NULL, 'PlayFiver/Dreamtech/magicbean.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-07-19 22:45:12'),
(888, 13, 'inativo', 'secretdate', 'Secret Date', 'secretdate', 'slot', NULL, 'PlayFiver/Dreamtech/secretdate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 20:11:10'),
(889, 13, 'inativo', 'bacteria', 'Germ Lab', 'bacteria', 'slot', NULL, 'PlayFiver/Dreamtech/bacteria.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:03'),
(890, 13, 'inativo', 'baseball', 'Baseball Frenzy', 'baseball', 'slot', NULL, 'PlayFiver/Dreamtech/baseball.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:12:32'),
(891, 13, 'inativo', 'mysticalstones', 'Mystical Stones', 'mysticalstones', 'slot', NULL, 'PlayFiver/Dreamtech/mysticalstones.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:07'),
(892, 13, 'inativo', 'sincity', 'Sin City', 'sincity', 'slot', NULL, 'PlayFiver/Dreamtech/sincity.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:47:26'),
(893, 13, 'inativo', 'wheel', 'Secrets of The Pentagram', 'wheel', 'slot', NULL, 'PlayFiver/Dreamtech/wheel.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:56:20'),
(894, 13, 'inativo', 'westwild', 'West Wild', 'westwild', 'slot', NULL, 'PlayFiver/Dreamtech/westwild.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 07:26:58'),
(895, 13, 'inativo', 'halloween', 'Witch Winnings', 'halloween', 'slot', NULL, 'PlayFiver/Dreamtech/halloween.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 19:05:06'),
(896, 13, 'inativo', 'bloodmoon', 'Blood Wolf legend', 'bloodmoon', 'slot', NULL, 'PlayFiver/Dreamtech/bloodmoon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 05:25:22'),
(897, 13, 'inativo', 'dragonball2', 'Heroes of the East', 'dragonball2', 'slot', NULL, 'PlayFiver/Dreamtech/dragonball2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 21:37:00'),
(898, 13, 'inativo', 'muaythai', 'Muaythai', 'muaythai', 'slot', NULL, 'PlayFiver/Dreamtech/muaythai.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:10:58'),
(899, 13, 'inativo', 'sailor', 'Sailor Princess', 'sailor', 'slot', NULL, 'PlayFiver/Dreamtech/sailor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:11:37'),
(900, 13, 'inativo', 'nightclub', 'Infinity Club', 'nightclub', 'slot', NULL, 'PlayFiver/Dreamtech/nightclub.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 12:33:29'),
(901, 13, 'inativo', 'nezha', 'Nezha Legend', 'nezha', 'slot', NULL, 'PlayFiver/Dreamtech/nezha.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:06:54'),
(902, 13, 'inativo', 'bird', 'Bird Island', 'bird', 'slot', NULL, 'PlayFiver/Dreamtech/bird.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:58'),
(903, 13, 'inativo', 'honor', 'Field Of Honor', 'honor', 'slot', NULL, 'PlayFiver/Dreamtech/honor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:47:19'),
(904, 13, 'inativo', 'train2', 'Treasure Hunt Trip 2', 'train2', 'slot', NULL, 'PlayFiver/Dreamtech/train2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 16:12:31'),
(905, 13, 'inativo', 'shiningstars', 'ShiningStars', 'shiningstars', 'slot', NULL, 'PlayFiver/Dreamtech/shiningstars.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:54:31'),
(906, 13, 'inativo', 'tgow2plus', 'Cai Shen Dao Plus', 'tgow2plus', 'slot', NULL, 'PlayFiver/Dreamtech/tgow2plus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(907, 13, 'inativo', 'peeping', 'Peeping', 'peeping', 'slot', NULL, 'PlayFiver/Dreamtech/peeping.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:57'),
(908, 14, 'inativo', 'greatwall', 'The Great Wall Treasure', 'greatwall', 'slot', NULL, 'PlayFiver/Evoplay/greatwall.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:24'),
(909, 14, 'inativo', 'chinesenewyear', 'Chinese New Year', 'chinesenewyear', 'slot', NULL, 'PlayFiver/Evoplay/chinesenewyear.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-08-13 21:54:50'),
(910, 14, 'inativo', 'jewellerystore', 'Jewelry store', 'jewellerystore', 'slot', NULL, 'PlayFiver/Evoplay/jewellerystore.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 10:27:11'),
(911, 14, 'inativo', 'redcliff', 'Red cliff', 'redcliff', 'slot', NULL, 'PlayFiver/Evoplay/redcliff.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-09 11:41:17'),
(912, 14, 'inativo', 'ElvenPrincesses', 'Elven Princess', 'ElvenPrincesses', 'slot', NULL, 'PlayFiver/Evoplay/ElvenPrincesses.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:30:27'),
(913, 14, 'inativo', 'robinzon', 'Robinson', 'robinzon', 'slot', NULL, 'PlayFiver/Evoplay/robinzon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:13:44'),
(914, 14, 'inativo', 'aeronauts', 'Aeronauts', 'aeronauts', 'slot', NULL, 'PlayFiver/Evoplay/aeronauts.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-03 21:32:03'),
(915, 14, 'inativo', 'monsterlab', 'Monster rap', 'monsterlab', 'slot', NULL, 'PlayFiver/Evoplay/monsterlab.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-16 17:42:06'),
(916, 14, 'inativo', 'TriptotheFuture', 'Trip to the Future', 'TriptotheFuture', 'slot', NULL, 'PlayFiver/Evoplay/TriptotheFuture.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:23:14'),
(917, 14, 'inativo', 'NukeWorld', 'Nook World', 'NukeWorld', 'slot', NULL, 'PlayFiver/Evoplay/NukeWorld.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:24:02'),
(918, 14, 'inativo', 'legendofkaan', 'Legend of Khan', 'legendofkaan', 'slot', NULL, 'PlayFiver/Evoplay/legendofkaan.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:04:10'),
(919, 14, 'inativo', 'LivingTales', 'Night of the Living Tales', 'LivingTales', 'slot', NULL, 'PlayFiver/Evoplay/LivingTales.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:29'),
(920, 14, 'inativo', 'IceMania', 'Ice mania', 'IceMania', 'slot', NULL, 'PlayFiver/Evoplay/IceMania.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-06 00:29:49'),
(921, 14, 'inativo', 'ValleyOfDreams', 'Valley of Dreams', 'ValleyOfDreams', 'slot', NULL, 'PlayFiver/Evoplay/ValleyOfDreams.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 19:10:57'),
(922, 14, 'inativo', 'FruitNova', 'Fruit Nova', 'FruitNova', 'slot', NULL, 'PlayFiver/Evoplay/FruitNova.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:58:16'),
(923, 14, 'inativo', 'TreeOfLight', 'Tree of light', 'TreeOfLight', 'slot', NULL, 'PlayFiver/Evoplay/TreeOfLight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 17:55:47'),
(924, 14, 'inativo', 'TempleOfDead', 'Temple of the dead', 'TempleOfDead', 'slot', NULL, 'PlayFiver/Evoplay/TempleOfDead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 09:33:20'),
(925, 14, 'inativo', 'RunesOfDestiny', 'Runes of Destiny', 'RunesOfDestiny', 'slot', NULL, 'PlayFiver/Evoplay/RunesOfDestiny.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 06:48:12'),
(926, 14, 'inativo', 'EllensFortune', 'Ellen Fortune', 'EllensFortune', 'slot', NULL, 'PlayFiver/Evoplay/EllensFortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(927, 14, 'inativo', 'UnlimitedWishes', 'Unlimited Wishes', 'UnlimitedWishes', 'slot', NULL, 'PlayFiver/Evoplay/UnlimitedWishes.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:47:28'),
(928, 14, 'inativo', 'FoodFeast', 'Food fist', 'FoodFeast', 'slot', NULL, 'PlayFiver/Evoplay/FoodFeast.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:31'),
(929, 14, 'inativo', 'EpicLegends', 'Epic legends', 'EpicLegends', 'slot', NULL, 'PlayFiver/Evoplay/EpicLegends.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 08:04:35'),
(930, 14, 'inativo', 'SweetSugar', 'Sweet sugar', 'SweetSugar', 'slot', NULL, 'PlayFiver/Evoplay/SweetSugar.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-29 23:55:17'),
(931, 14, 'inativo', 'CycleofLuck', 'Cycle of Luck', 'CycleofLuck', 'slot', NULL, 'PlayFiver/Evoplay/CycleofLuck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-01 05:53:19'),
(932, 14, 'inativo', 'GangsterNight', 'Gangster night', 'GangsterNight', 'slot', NULL, 'PlayFiver/Evoplay/GangsterNight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:42'),
(933, 14, 'inativo', 'GoldOfSirens', 'Gold of sirens', 'GoldOfSirens', 'slot', NULL, 'PlayFiver/Evoplay/GoldOfSirens.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:06:24'),
(934, 14, 'inativo', 'BloodyBrilliant', 'Bloody brilliant', 'BloodyBrilliant', 'slot', NULL, 'PlayFiver/Evoplay/BloodyBrilliant.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:07:19'),
(935, 14, 'inativo', 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'TempleOfDeadBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/TempleOfDeadBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 08:34:42'),
(936, 14, 'inativo', 'ShadowOfLuxor', 'Shadow of Luxor', 'ShadowOfLuxor', 'slot', NULL, 'PlayFiver/Evoplay/ShadowOfLuxor.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-05 06:26:24'),
(937, 14, 'inativo', 'CycleofLuckBonusBuy', 'Cycle of Luck BB', 'CycleofLuckBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/CycleofLuckBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:33'),
(938, 14, 'inativo', 'AnubisMoon', 'Anubis moon', 'AnubisMoon', 'slot', NULL, 'PlayFiver/Evoplay/AnubisMoon.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(939, 14, 'inativo', 'FruitDisco', 'Fruit disco', 'FruitDisco', 'slot', NULL, 'PlayFiver/Evoplay/FruitDisco.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-04 13:45:51'),
(940, 14, 'inativo', 'FruitSuperNova30', 'Fruit Super Nova 30', 'FruitSuperNova30', 'slot', NULL, 'PlayFiver/Evoplay/FruitSuperNova30.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 19:42:49'),
(941, 14, 'inativo', 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'CurseOfThePharaoh', 'slot', NULL, 'PlayFiver/Evoplay/CurseOfThePharaoh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:25');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(942, 14, 'inativo', 'GoldOfSirensBonusBuy', 'Gold of Sirens BB', 'GoldOfSirensBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/GoldOfSirensBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:29:52'),
(943, 14, 'inativo', 'FruitSuperNova60', 'Fruit Super Nova 60', 'FruitSuperNova60', 'slot', NULL, 'PlayFiver/Evoplay/FruitSuperNova60.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(944, 14, 'inativo', 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'CurseofthePharaohBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/CurseofthePharaohBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 17:37:03'),
(945, 14, 'inativo', 'FruitSuperNova100', 'Fruit Super Nova 100', 'FruitSuperNova100', 'slot', NULL, 'PlayFiver/Evoplay/FruitSuperNova100.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:38:29'),
(946, 14, 'inativo', 'FruitSuperNova80', 'Whoft Super Nova 80', 'FruitSuperNova80', 'slot', NULL, 'PlayFiver/Evoplay/FruitSuperNova80.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:38'),
(947, 14, 'inativo', 'DragonsTavern', 'Dragons Tavern', 'DragonsTavern', 'slot', NULL, 'PlayFiver/Evoplay/DragonsTavern.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(948, 14, 'inativo', 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'ChristmasReachBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/ChristmasReachBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 22:35:57'),
(949, 14, 'inativo', 'WildOverlords', 'Wild overlord', 'WildOverlords', 'slot', NULL, 'PlayFiver/Evoplay/WildOverlords.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 05:30:25'),
(950, 14, 'inativo', 'DragonsTavernBonusBuy', 'Dragons Tavern BB', 'DragonsTavernBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/DragonsTavernBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 00:25:01'),
(951, 14, 'inativo', 'BudaiReels', 'Budai reels', 'BudaiReels', 'slot', NULL, 'PlayFiver/Evoplay/BudaiReels.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:35'),
(952, 14, 'inativo', 'BudaiReelsBonusBuy', 'Budai Lils BB', 'BudaiReelsBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/BudaiReelsBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:48:34'),
(953, 14, 'inativo', 'MoneyMinter', 'Money minter', 'MoneyMinter', 'slot', NULL, 'PlayFiver/Evoplay/MoneyMinter.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 23:48:21'),
(954, 14, 'inativo', 'TheGreatestCatch', 'The Greatest Catch', 'TheGreatestCatch', 'slot', NULL, 'PlayFiver/Evoplay/TheGreatestCatch.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(955, 14, 'inativo', 'TreeOfLightBB', 'Tree of Light BB', 'TreeOfLightBB', 'slot', NULL, 'PlayFiver/Evoplay/TreeOfLightBB.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 20:17:20'),
(956, 14, 'inativo', 'WolfHiding', 'Wolf Hiding', 'WolfHiding', 'slot', NULL, 'PlayFiver/Evoplay/WolfHiding.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(957, 14, 'inativo', 'CaminoDeChili', 'Camino de Chili', 'CaminoDeChili', 'slot', NULL, 'PlayFiver/Evoplay/CaminoDeChili.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:18:10'),
(958, 14, 'inativo', 'CandyDreamsSweetPlanet', 'candy dreams', 'CandyDreamsSweetPlanet', 'slot', NULL, 'PlayFiver/Evoplay/CandyDreamsSweetPlanet.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4300, 0, 0, '2024-05-27 15:25:59', '2024-10-10 16:49:32'),
(959, 14, 'inativo', 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'WildOverlordsBonusBuy', 'slot', NULL, 'PlayFiver/Evoplay/WildOverlordsBonusBuy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:27'),
(960, 14, 'inativo', 'TempleOfThunder', 'Temple of Thunder', 'TempleOfThunder', 'slot', NULL, 'PlayFiver/Evoplay/TempleOfThunder.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 06:23:25'),
(961, 15, 'inativo', 'sun_of_egypt', 'SUN OF EGYPT', 'sun_of_egypt', 'slot', NULL, 'PlayFiver/Booongo/sun_of_egypt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 18:42:56'),
(962, 15, 'inativo', 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'sun_of_egypt_2', 'slot', NULL, 'PlayFiver/Booongo/sun_of_egypt_2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(963, 15, 'inativo', 'happy_fish', 'HAPPY FISH', 'happy_fish', 'fish', NULL, 'PlayFiver/Booongo/happy_fish.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:42:40'),
(964, 15, 'inativo', 'queen_of_the_sun', 'QUEEN OF THE SUN', 'queen_of_the_sun', 'slot', NULL, 'PlayFiver/Booongo/queen_of_the_sun.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 06:30:04'),
(965, 15, 'inativo', 'tiger_jungle', 'TIGER JUNGLE', 'tiger_jungle', 'slot', NULL, 'PlayFiver/Booongo/tiger_jungle.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:33:01'),
(966, 15, 'inativo', 'black_wolf', 'BLACK WOLF', 'black_wolf', 'slot', NULL, 'PlayFiver/Booongo/black_wolf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:23:51'),
(967, 15, 'inativo', 'hit_the_gold', 'HIT THE GOLD', 'hit_the_gold', 'slot', NULL, 'PlayFiver/Booongo/hit_the_gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:09'),
(968, 15, 'inativo', 'candy_boom', 'CANDY BOOM', 'candy_boom', 'slot', NULL, 'PlayFiver/Booongo/candy_boom.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:17'),
(969, 15, 'inativo', 'scarab_riches', 'SCARAB RICHES', 'scarab_riches', 'slot', NULL, 'PlayFiver/Booongo/scarab_riches.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 18:53:56'),
(970, 15, 'inativo', 'golden_dancing_lion', 'GOLDEN DANCING LION', 'golden_dancing_lion', 'slot', NULL, 'PlayFiver/Booongo/golden_dancing_lion.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:41:02'),
(971, 15, 'inativo', 'dragon_pearls', 'DRAGON PEARLS', 'dragon_pearls', 'slot', NULL, 'PlayFiver/Booongo/dragon_pearls.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-11-29 08:02:46'),
(972, 15, 'inativo', '3_coins', '3 COINS', '3_coins', 'slot', NULL, 'PlayFiver/Booongo/3_coins.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:24:27'),
(973, 15, 'inativo', 'super_rich_god', 'SUPER RICH GOD', 'super_rich_god', 'slot', NULL, 'PlayFiver/Booongo/super_rich_god.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 20:18:09'),
(974, 15, 'inativo', '15_dragon_pearls', '15 DRAGON PEARLS', '15_dragon_pearls', 'slot', NULL, 'PlayFiver/Booongo/15_dragon_pearls.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:22:27'),
(975, 15, 'inativo', 'aztec_sun', 'AZTEC SUN', 'aztec_sun', 'slot', NULL, 'PlayFiver/Booongo/aztec_sun.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:08:25'),
(976, 15, 'inativo', 'scarab_temple', 'SCARAB TEMPLE', 'scarab_temple', 'slot', NULL, 'PlayFiver/Booongo/scarab_temple.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:30:42'),
(977, 15, 'inativo', 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'gods_temple_deluxe', 'slot', NULL, 'PlayFiver/Booongo/gods_temple_deluxe.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(978, 15, 'inativo', 'book_of_sun', 'BOOK OF SUN', 'book_of_sun', 'slot', NULL, 'PlayFiver/Booongo/book_of_sun.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:13:42'),
(979, 15, 'inativo', '777_gems', '777 GEMS', '777_gems', 'slot', NULL, 'PlayFiver/Booongo/777_gems.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 00:27:13'),
(980, 15, 'inativo', 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'book_of_sun_multichance', 'slot', NULL, 'PlayFiver/Booongo/book_of_sun_multichance.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:11'),
(981, 15, 'inativo', 'olympian_gods', 'OLYMPIAN GODS', 'olympian_gods', 'slot', NULL, 'PlayFiver/Booongo/olympian_gods.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 09:14:53'),
(982, 15, 'inativo', '777_gems_respin', '777 GEMS RESPIN', '777_gems_respin', 'slot', NULL, 'PlayFiver/Booongo/777_gems_respin.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:18:32'),
(983, 15, 'inativo', 'tigers_gold', 'TIGERS GOLD', 'tigers_gold', 'slot', NULL, 'PlayFiver/Booongo/tigers_gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:37:47'),
(984, 15, 'inativo', 'moon_sisters', 'MOON SISTERS', 'moon_sisters', 'slot', NULL, 'PlayFiver/Booongo/moon_sisters.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-10 01:34:15'),
(985, 15, 'inativo', 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'book_of_sun_choice', 'slot', NULL, 'PlayFiver/Booongo/book_of_sun_choice.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-26 21:20:48'),
(986, 15, 'inativo', 'super_marble', 'SUPER MARBLE', 'super_marble', 'slot', NULL, 'PlayFiver/Booongo/super_marble.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-13 20:23:25'),
(987, 15, 'inativo', 'buddha_fortune', 'BUDDHA FORTUNE', 'buddha_fortune', 'slot', NULL, 'PlayFiver/Booongo/buddha_fortune.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:46:23'),
(988, 15, 'inativo', 'great_panda', 'GREAT PANDA', 'great_panda', 'slot', NULL, 'PlayFiver/Booongo/great_panda.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:13'),
(989, 15, 'inativo', '15_golden_eggs', '15 GOLDEN EGGS', '15_golden_eggs', 'slot', NULL, 'PlayFiver/Booongo/15_golden_eggs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:47:14'),
(990, 15, 'inativo', 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'thunder_of_olympus', 'slot', NULL, 'PlayFiver/Booongo/thunder_of_olympus.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:56:40'),
(991, 15, 'inativo', 'eye_of_gold', 'EYE OF GOLD', 'eye_of_gold', 'slot', NULL, 'PlayFiver/Booongo/eye_of_gold.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:14:56'),
(992, 15, 'inativo', 'tiger_stone', 'TIGER STONE', 'tiger_stone', 'slot', NULL, 'PlayFiver/Booongo/tiger_stone.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:26:29'),
(993, 15, 'inativo', 'magic_apple', 'MAGIC APPLE', 'magic_apple', 'slot', NULL, 'PlayFiver/Booongo/magic_apple.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 20:07:12'),
(994, 15, 'inativo', 'wolf_saga', 'WOLF SAGA', 'wolf_saga', 'slot', NULL, 'PlayFiver/Booongo/wolf_saga.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:21'),
(995, 15, 'inativo', 'magic_ball', 'MAGIC BALL', 'magic_ball', 'slot', NULL, 'PlayFiver/Booongo/magic_ball.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-29 00:53:05'),
(996, 15, 'inativo', 'scarab_boost', 'SCARAB BOOST', 'scarab_boost', 'slot', NULL, 'PlayFiver/Booongo/scarab_boost.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 02:20:15'),
(997, 15, 'inativo', 'wukong', 'WUKONG', 'wukong', 'slot', NULL, 'PlayFiver/Booongo/wukong.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(998, 15, 'inativo', 'pearl_diver', 'PEARL DIVER', 'pearl_diver', 'slot', NULL, 'PlayFiver/Booongo/pearl_diver.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:14:53'),
(999, 15, 'inativo', '3_coins_egypt', '3 COINS EGYPT', '3_coins_egypt', 'slot', NULL, 'PlayFiver/Booongo/3_coins_egypt.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:00:24'),
(1000, 15, 'inativo', 'ganesha_boost', 'GANESHA BOOST', 'ganesha_boost', 'slot', NULL, 'PlayFiver/Booongo/ganesha_boost.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 16:03:34'),
(1001, 15, 'inativo', 'wolf_night', 'WOLF NIGHT', 'wolf_night', 'slot', NULL, 'PlayFiver/Booongo/wolf_night.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:15'),
(1002, 15, 'inativo', 'book_of_wizard', 'BOOK OF WIZARD', 'book_of_wizard', 'slot', NULL, 'PlayFiver/Booongo/book_of_wizard.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:30:15'),
(1003, 15, 'inativo', 'lord_fortune_2', 'LORD FORTUNE 2', 'lord_fortune_2', 'slot', NULL, 'PlayFiver/Booongo/lord_fortune_2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 16:14:49'),
(1004, 15, 'inativo', 'gold_express', 'GOLD EXPRESS', 'gold_express', 'slot', NULL, 'PlayFiver/Booongo/gold_express.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:58:18'),
(1005, 15, 'inativo', 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'book_of_wizard_crystal', 'slot', NULL, 'PlayFiver/Booongo/book_of_wizard_crystal.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:22:26'),
(1006, 15, 'inativo', 'pearl_diver_2', 'PEARL DIVER 2', 'pearl_diver_2', 'slot', NULL, 'PlayFiver/Booongo/pearl_diver_2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1007, 15, 'inativo', 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'sun_of_egypt_3', 'slot', NULL, 'PlayFiver/Booongo/sun_of_egypt_3.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-04 17:10:17'),
(1008, 15, 'inativo', 'caishen_wealth', 'CAISHEN WEALTH', 'caishen_wealth', 'slot', NULL, 'PlayFiver/Booongo/caishen_wealth.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:14:41'),
(1009, 15, 'inativo', 'aztec_fire', 'AZTEC FIRE', 'aztec_fire', 'slot', NULL, 'PlayFiver/Booongo/aztec_fire.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:06:49'),
(1010, 16, 'inativo', '67', 'Golden eggs', '67', 'slot', NULL, 'PlayFiver/Cq9/67.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-05 22:10:24'),
(1011, 16, 'inativo', '161', 'Hercules', '161', 'slot', NULL, 'PlayFiver/Cq9/161.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1012, 16, 'inativo', '16', 'Super 5', '16', 'slot', NULL, 'PlayFiver/Cq9/16.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 01:02:29'),
(1013, 16, 'inativo', '72', 'Happy Rich Year', '72', 'slot', NULL, 'PlayFiver/Cq9/72.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:35'),
(1014, 16, 'inativo', '1', 'Fruit King', '1', 'slot', NULL, 'PlayFiver/Cq9/1.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:35:28'),
(1015, 16, 'inativo', '163', 'Neja Advent', '163', 'slot', NULL, 'PlayFiver/Cq9/163.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1016, 16, 'inativo', '26', '777', '26', 'slot', NULL, 'PlayFiver/Cq9/26.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:36:36'),
(1017, 16, 'inativo', '50', 'Good fortune', '50', 'slot', NULL, 'PlayFiver/Cq9/50.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:46'),
(1018, 16, 'inativo', '31', 'God of war', '31', 'slot', NULL, 'PlayFiver/Cq9/31.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:02:38'),
(1019, 16, 'inativo', '64', 'Zeus', '64', 'slot', NULL, 'PlayFiver/Cq9/64.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:49'),
(1020, 16, 'inativo', '69', 'Pasaycen', '69', 'slot', NULL, 'PlayFiver/Cq9/69.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:04:34'),
(1021, 16, 'inativo', '89', 'Thor', '89', 'slot', NULL, 'PlayFiver/Cq9/89.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:53:26'),
(1022, 16, 'inativo', '46', 'Wolf moon', '46', 'slot', NULL, 'PlayFiver/Cq9/46.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 18:56:08'),
(1023, 16, 'inativo', '139', 'Fire chibi', '139', 'slot', NULL, 'PlayFiver/Cq9/139.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1024, 16, 'inativo', '15', 'Gu Gu Gu', '15', 'slot', NULL, 'PlayFiver/Cq9/15.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-08 08:28:45'),
(1025, 16, 'inativo', '140', 'Fire Chibi 2', '140', 'slot', NULL, 'PlayFiver/Cq9/140.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1026, 16, 'inativo', '8', 'So Sweet', '8', 'slot', NULL, 'PlayFiver/Cq9/8.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:02:22'),
(1027, 16, 'inativo', '147', 'Flower fortune', '147', 'slot', NULL, 'PlayFiver/Cq9/147.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 11:42:05'),
(1028, 16, 'inativo', '113', 'Flying Kai Shen', '113', 'slot', NULL, 'PlayFiver/Cq9/113.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:02:29'),
(1029, 16, 'inativo', '58', 'Gu Gu Gu 2', '58', 'slot', NULL, 'PlayFiver/Cq9/58.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 13:49:17'),
(1030, 16, 'inativo', '128', 'Wheel money', '128', 'slot', NULL, 'PlayFiver/Cq9/128.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:36'),
(1031, 16, 'inativo', '5', 'Mr Rich', '5', 'slot', NULL, 'PlayFiver/Cq9/5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:02:39'),
(1032, 16, 'inativo', '180', 'Gu Gu Gu 3', '180', 'slot', NULL, 'PlayFiver/Cq9/180.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:40'),
(1033, 16, 'inativo', '118', 'SkullSkull', '118', 'slot', NULL, 'PlayFiver/Cq9/118.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:45'),
(1034, 16, 'inativo', '148', 'Fortune totem', '148', 'slot', NULL, 'PlayFiver/Cq9/148.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 15:21:35'),
(1035, 16, 'inativo', '144', 'Diamond treasure', '144', 'slot', NULL, 'PlayFiver/Cq9/144.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 00:58:27'),
(1036, 16, 'inativo', '19', 'Hot spin', '19', 'slot', NULL, 'PlayFiver/Cq9/19.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:33'),
(1037, 16, 'inativo', '112', 'Pyramid radar', '112', 'slot', NULL, 'PlayFiver/Cq9/112.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:20:59'),
(1038, 16, 'inativo', '160', 'Pa Kai Shen2', '160', 'slot', NULL, 'PlayFiver/Cq9/160.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:25'),
(1039, 16, 'inativo', '47', 'Pharaoh gold', '47', 'slot', NULL, 'PlayFiver/Cq9/47.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:16:37'),
(1040, 16, 'inativo', '13', 'Sakura legend', '13', 'slot', NULL, 'PlayFiver/Cq9/13.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-11 04:50:14'),
(1041, 16, 'inativo', '34', 'Gopher s War', '34', 'slot', NULL, 'PlayFiver/Cq9/34.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 00:38:43'),
(1042, 16, 'inativo', '59', 'Summer mood', '59', 'slot', NULL, 'PlayFiver/Cq9/59.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 09:21:33'),
(1043, 16, 'inativo', '95', 'Football boots', '95', 'slot', NULL, 'PlayFiver/Cq9/95.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-03 21:29:01'),
(1044, 16, 'inativo', '57', 'The Beast War', '57', 'slot', NULL, 'PlayFiver/Cq9/57.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-04 04:24:59'),
(1045, 16, 'inativo', '17', 'Great lion', '17', 'slot', NULL, 'PlayFiver/Cq9/17.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:29:06'),
(1046, 16, 'inativo', '20', '888', '20', 'slot', NULL, 'PlayFiver/Cq9/20.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-07-19 22:38:32'),
(1047, 16, 'inativo', '182', 'Thor 2', '182', 'slot', NULL, 'PlayFiver/Cq9/182.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-28 20:31:29'),
(1048, 16, 'inativo', '66', 'Fire 777', '66', 'slot', NULL, 'PlayFiver/Cq9/66.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:41'),
(1049, 16, 'inativo', '2', 'God of Chess', '2', 'slot', NULL, 'PlayFiver/Cq9/2.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 15:41:33'),
(1050, 16, 'inativo', '21', 'Big wolf', '21', 'slot', NULL, 'PlayFiver/Cq9/21.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 18:47:31'),
(1051, 16, 'inativo', '197', 'Dragon s Treasure', '197', 'slot', NULL, 'PlayFiver/Cq9/197.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 01:59:57'),
(1052, 16, 'inativo', '208', 'Money tree', '208', 'slot', NULL, 'PlayFiver/Cq9/208.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-14 00:55:45'),
(1053, 16, 'inativo', '212', 'Burning Si-Yow', '212', 'slot', NULL, 'PlayFiver/Cq9/212.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:33'),
(1054, 16, 'inativo', '214', 'Ninja raccoon', '214', 'slot', NULL, 'PlayFiver/Cq9/214.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-12 07:29:49'),
(1055, 16, 'inativo', '218', 'Dollar night', '218', 'slot', NULL, 'PlayFiver/Cq9/218.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:15:48'),
(1056, 17, 'inativo', 'vs5ultrab', 'Ultra Burn', 'vs5ultrab', 'slot', NULL, 'PlayFiver/Reelkingdom/vs5ultrab.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1057, 17, 'inativo', 'vs5ultra', 'Ultra Hold and Spin', 'vs5ultra', 'slot', NULL, 'PlayFiver/Reelkingdom/vs5ultra.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-11 15:00:05'),
(1058, 17, 'inativo', 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10returndead.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 13:23:25'),
(1059, 17, 'inativo', 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'fish', NULL, 'PlayFiver/Reelkingdom/vs10bbbonanza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:30:47'),
(1060, 17, 'inativo', 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'slot', NULL, 'PlayFiver/Reelkingdom/vs20hburnhs.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:29:27'),
(1061, 17, 'inativo', 'vswayslight', 'Lucky Lightning', 'vswayslight', 'slot', NULL, 'PlayFiver/Reelkingdom/vswayslight.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 17:27:09'),
(1062, 17, 'inativo', 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'fish', NULL, 'PlayFiver/Reelkingdom/vs12bbb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-16 00:38:43'),
(1063, 17, 'inativo', 'vs10floatdrg', 'Floating Dragon', 'vs10floatdrg', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10floatdrg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 18:40:29'),
(1064, 17, 'inativo', 'vs1024temuj', 'Temujin Treasures', 'vs1024temuj', 'slot', NULL, 'PlayFiver/Reelkingdom/vs1024temuj.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 21:21:53'),
(1065, 17, 'inativo', 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'fish', NULL, 'PlayFiver/Reelkingdom/vs10bxmasbnza.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 14:43:02'),
(1066, 17, 'inativo', 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'fish', NULL, 'PlayFiver/Reelkingdom/vswaysbbb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2024-10-10 17:13:00'),
(1067, 17, 'inativo', 'vs40bigjuan', 'Big Juan', 'vs40bigjuan', 'slot', NULL, 'PlayFiver/Reelkingdom/vs40bigjuan.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-08-01 18:33:22'),
(1068, 17, 'inativo', 'vs10starpirate', 'Star Pirates Code', 'vs10starpirate', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10starpirate.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-27 12:07:56'),
(1069, 17, 'inativo', 'vs5hotburn', 'Hot to burn', 'vs5hotburn', 'slot', NULL, 'PlayFiver/Reelkingdom/vs5hotburn.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-07-30 22:14:38'),
(1070, 17, 'inativo', 'vs25bkofkngdm', 'Book of Kingdoms', 'vs25bkofkngdm', 'slot', NULL, 'PlayFiver/Reelkingdom/vs25bkofkngdm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 11:49:53'),
(1071, 17, 'inativo', 'vs10eyestorm', 'Eye of the Storm', 'vs10eyestorm', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10eyestorm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-30 20:59:12'),
(1072, 17, 'inativo', 'vs10amm', 'The Amazing Money Machine', 'vs10amm', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10amm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:35:32'),
(1073, 17, 'inativo', 'vs10luckcharm', 'Lucky Grace And Charm', 'vs10luckcharm', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10luckcharm.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1074, 17, 'inativo', 'vs25goldparty', 'Gold Party(r)', 'vs25goldparty', 'slot', NULL, 'PlayFiver/Reelkingdom/vs25goldparty.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:23:36'),
(1075, 17, 'inativo', 'vs20rockvegas', 'Rock Vegas Mega Hold e Spin', 'vs20rockvegas', 'slot', NULL, 'PlayFiver/Reelkingdom/vs20rockvegas.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:29:40'),
(1076, 17, 'inativo', 'vs10tictac', 'Tic Tac Take', 'vs10tictac', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10tictac.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:29:44'),
(1077, 17, 'inativo', 'vs243queenie', 'Queenie', 'vs243queenie', 'slot', NULL, 'PlayFiver/Reelkingdom/vs243queenie.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-15 10:10:03'),
(1078, 17, 'inativo', 'vs10spiritadv', 'Spirit of Adventure', 'vs10spiritadv', 'slot', NULL, 'PlayFiver/Reelkingdom/vs10spiritadv.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 17:15:04'),
(1079, 17, 'inativo', 'vs5littlegem', 'Little Gem Hold and Spin', 'vs5littlegem', 'slot', NULL, 'PlayFiver/Reelkingdom/vs5littlegem.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2024-05-27 15:25:59', '2024-08-02 09:47:48'),
(1080, 18, 'inativo', '01rb77cq1gtenhmo', 'Auto-Roulette VIP', '01rb77cq1gtenhmo', 'cards', NULL, 'PlayFiver/Evolution/01rb77cq1gtenhmo.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:28:59'),
(1081, 18, 'inativo', 'qgqrucipvltnvnvq', 'Speed Baccarat W', 'qgqrucipvltnvnvq', 'cards', NULL, 'PlayFiver/Evolution/qgqrucipvltnvnvq.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:06:37'),
(1082, 18, 'inativo', 'JapSpeedBac00001', 'Japanese Speed Baccarat A', 'JapSpeedBac00001', 'cards', NULL, 'PlayFiver/Evolution/JapSpeedBac00001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 02:33:32'),
(1083, 18, 'inativo', 'NoCommBac0000001', 'No Commission Baccarat', 'NoCommBac0000001', 'cards', NULL, 'PlayFiver/Evolution/NoCommBac0000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:28:47'),
(1084, 18, 'inativo', 'PTBaccarat000001', 'Prosperity Tree Baccarat', 'PTBaccarat000001', 'cards', NULL, 'PlayFiver/Evolution/PTBaccarat000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-02 08:42:05'),
(1085, 18, 'inativo', 'p63cmvmwagteemoy', 'Korean Speed Baccarat A', 'p63cmvmwagteemoy', 'cards', NULL, 'PlayFiver/Evolution/p63cmvmwagteemoy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:04:15'),
(1086, 18, 'inativo', 'MonBigBaller0001', 'MONOPOLY Big Baller', 'MonBigBaller0001', 'cards', NULL, 'PlayFiver/Evolution/MonBigBaller0001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:28:34'),
(1087, 18, 'inativo', 'LightningTable01', 'Lightning Roulette', 'LightningTable01', 'cards', NULL, 'PlayFiver/Evolution/LightningTable01.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:28:22'),
(1088, 18, 'inativo', 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', 'ndgvz5mlhfuaad6e', 'cards', NULL, 'PlayFiver/Evolution/ndgvz5mlhfuaad6e.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:31:49'),
(1089, 18, 'inativo', 'obj64qcnqfunjelj', 'Speed Baccarat J', 'obj64qcnqfunjelj', 'cards', NULL, 'PlayFiver/Evolution/obj64qcnqfunjelj.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 03:59:27'),
(1090, 18, 'inativo', 'PorROULigh000001', 'Roleta Relampago', 'PorROULigh000001', 'cards', NULL, 'PlayFiver/Evolution/PorROULigh000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 45, 0, 1, '2024-05-27 15:25:59', '2025-03-02 15:15:21'),
(1091, 18, 'inativo', 'ovfzgqahvicqtiwu', 'Lightning Roulette Italia', 'ovfzgqahvicqtiwu', 'cards', NULL, 'PlayFiver/Evolution/ovfzgqahvicqtiwu.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:28:10'),
(1092, 18, 'inativo', 'HSpeedBac0000002', 'Hindi Speed Baccarat B', 'HSpeedBac0000002', 'cards', NULL, 'PlayFiver/Evolution/HSpeedBac0000002.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 16:37:02'),
(1094, 18, 'inativo', '8clwnwrupuvf0osq', 'Ruleta en Vivo', '8clwnwrupuvf0osq', 'cards', NULL, 'PlayFiver/Evolution/8clwnwrupuvf0osq.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:29:31'),
(1095, 18, 'inativo', 'xie6wodezmfwmmcb', 'Punto Banco', 'xie6wodezmfwmmcb', 'cards', NULL, 'PlayFiver/Evolution/xie6wodezmfwmmcb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 04:45:03'),
(1096, 18, 'inativo', '48z5pjps3ntvqc1b', 'Auto-Roulette', '48z5pjps3ntvqc1b', 'cards', NULL, 'PlayFiver/Evolution/48z5pjps3ntvqc1b.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:27:59'),
(1097, 18, 'inativo', 'mkvhbciosnfqhat7', 'Arabic Roulette', 'mkvhbciosnfqhat7', 'cards', NULL, 'PlayFiver/Evolution/mkvhbciosnfqhat7.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:29:20'),
(1098, 18, 'inativo', 'RedDoorRoulette1', 'Red Door Roulette', 'RedDoorRoulette1', 'cards', NULL, 'PlayFiver/Evolution/RedDoorRoulette1.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:29:26'),
(1100, 18, 'inativo', 'nmwde3fd7hvqhq43', 'Speed Baccarat F', 'nmwde3fd7hvqhq43', 'cards', NULL, 'PlayFiver/Evolution/nmwde3fd7hvqhq43.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-05 23:16:45'),
(1101, 18, 'inativo', 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', 'ocye2ju2bsoyq6vv', 'cards', NULL, 'PlayFiver/Evolution/ocye2ju2bsoyq6vv.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:05:34'),
(1102, 18, 'inativo', 'EmperorSB0000001', 'Emperor Sic Bo', 'EmperorSB0000001', 'cards', NULL, 'PlayFiver/Evolution/EmperorSB0000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 12:44:56'),
(1103, 18, 'inativo', 'CrazyTime0000002', 'Crazy Time A', 'CrazyTime0000002', 'cards', NULL, 'PlayFiver/Evolution/CrazyTime0000002.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:05:59'),
(1104, 18, 'inativo', 'ovu5eja74ccmyoiq', 'Speed Baccarat N', 'ovu5eja74ccmyoiq', 'cards', NULL, 'PlayFiver/Evolution/ovu5eja74ccmyoiq.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 04:26:23'),
(1105, 18, 'inativo', 'SBCTable00000001', 'Side Bet City', 'SBCTable00000001', 'cards', NULL, 'PlayFiver/Evolution/SBCTable00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1106, 18, 'inativo', 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', 'nmwdzhbg7hvqh6a7', 'cards', NULL, 'PlayFiver/Evolution/nmwdzhbg7hvqh6a7.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 07:38:36'),
(1111, 18, 'inativo', 'AmericanTable001', 'American Roulette', 'AmericanTable001', 'cards', NULL, 'PlayFiver/Evolution/AmericanTable001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:27:44'),
(1112, 18, 'inativo', 'PorROU0000000001', 'Roleta ao Vivo', 'PorROU0000000001', 'cards', NULL, 'PlayFiver/Evolution/PorROU0000000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:27:23'),
(1113, 18, 'inativo', 'pv5q45yjhasyt46y', 'Emperor Roulette', 'pv5q45yjhasyt46y', 'cards', NULL, 'PlayFiver/Evolution/pv5q45yjhasyt46y.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:29:44'),
(1114, 18, 'inativo', 'ndgv45bghfuaaebf', 'Speed Baccarat E', 'ndgv45bghfuaaebf', 'cards', NULL, 'PlayFiver/Evolution/ndgv45bghfuaaebf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:27:10'),
(1116, 18, 'inativo', '7x0b1tgh7agmf6hv', 'Immersive Roulette', '7x0b1tgh7agmf6hv', 'cards', NULL, 'PlayFiver/Evolution/7x0b1tgh7agmf6hv.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:26:59'),
(1118, 18, 'inativo', 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', 'ovu5h6b3ujb4y53w', 'cards', NULL, 'PlayFiver/Evolution/ovu5h6b3ujb4y53w.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-14 20:57:57'),
(1119, 18, 'inativo', 'qsf63ownyvbqnz33', 'Speed Baccarat Z', 'qsf63ownyvbqnz33', 'cards', NULL, 'PlayFiver/Evolution/qsf63ownyvbqnz33.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:21:37'),
(1120, 18, 'inativo', 'ndgvwvgthfuaad3q', 'Speed Baccarat C', 'ndgvwvgthfuaad3q', 'cards', NULL, 'PlayFiver/Evolution/ndgvwvgthfuaad3q.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1122, 18, 'inativo', 'CSPTable00000001', 'Caribbean Stud Poker', 'CSPTable00000001', 'cards', NULL, 'PlayFiver/Evolution/CSPTable00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 01:46:12'),
(1123, 18, 'inativo', 'qgqrhfvsvltnueqf', 'Speed Baccarat U', 'qgqrhfvsvltnueqf', 'cards', NULL, 'PlayFiver/Evolution/qgqrhfvsvltnueqf.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 22:26:24'),
(1125, 18, 'inativo', 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', 'f1f4rm9xgh4j3u2z', 'cards', NULL, 'PlayFiver/Evolution/f1f4rm9xgh4j3u2z.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:30:24'),
(1126, 18, 'inativo', 'Monopoly00000001', 'MONOPOLY Live', 'Monopoly00000001', 'cards', NULL, 'PlayFiver/Evolution/Monopoly00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:30:12'),
(1129, 18, 'inativo', 'leqhceumaq6qfoug', 'Speed Baccarat A', 'leqhceumaq6qfoug', 'cards', NULL, 'PlayFiver/Evolution/leqhceumaq6qfoug.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-10-06 06:11:00'),
(1130, 18, 'inativo', 'qgonc7t4ucdiel4o', 'Speed Baccarat T', 'qgonc7t4ucdiel4o', 'cards', NULL, 'PlayFiver/Evolution/qgonc7t4ucdiel4o.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-09 23:19:15'),
(1131, 18, 'inativo', '7nyiaws9tgqrzaz3', 'Football Studio Roulette', '7nyiaws9tgqrzaz3', 'cards', NULL, 'PlayFiver/Evolution/7nyiaws9tgqrzaz3.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-12-13 04:03:35'),
(1132, 18, 'inativo', 'ETHTable00000001', 'Extreme Texas Hold em', 'ETHTable00000001', 'cards', NULL, 'PlayFiver/Evolution/ETHTable00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1133, 18, 'inativo', 'ndgvs3tqhfuaadyg', 'Baccarat C', 'ndgvs3tqhfuaadyg', 'cards', NULL, 'PlayFiver/Evolution/ndgvs3tqhfuaadyg.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-07-28 22:10:16'),
(1134, 18, 'inativo', 'lkcbrbdckjxajdol', 'Speed Roulette', 'lkcbrbdckjxajdol', 'cards', NULL, 'PlayFiver/Evolution/lkcbrbdckjxajdol.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-11-29 23:10:54'),
(1135, 18, 'inativo', 'o4kymodby2fa2c7g', 'Speed Baccarat S', 'o4kymodby2fa2c7g', 'cards', NULL, 'PlayFiver/Evolution/o4kymodby2fa2c7g.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-05-27 15:25:59', '2024-12-12 01:41:59'),
(1136, 18, 'inativo', 'nxpkul2hgclallno', 'Speed Baccarat I', 'nxpkul2hgclallno', 'cards', NULL, 'PlayFiver/Evolution/nxpkul2hgclallno.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-01 19:40:36'),
(1137, 18, 'inativo', 'CrazyTime0000001', 'Crazy Time', 'CrazyTime0000001', 'cards', NULL, 'PlayFiver/Evolution/CrazyTime0000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:30'),
(1138, 18, 'inativo', 'vctlz20yfnmp1ylr', 'Roulette', 'vctlz20yfnmp1ylr', 'cards', NULL, 'PlayFiver/Evolution/vctlz20yfnmp1ylr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:39'),
(1139, 18, 'inativo', 'zixzea8nrf1675oh', 'Baccarat Squeeze', 'zixzea8nrf1675oh', 'cards', NULL, 'PlayFiver/Evolution/zixzea8nrf1675oh.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:32'),
(1140, 18, 'inativo', 'TRPTable00000001', 'Triple Card Poker', 'TRPTable00000001', 'cards', NULL, 'PlayFiver/Evolution/TRPTable00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 01:19:27'),
(1141, 18, 'inativo', 'teenpattitable01', 'Teen Patti', 'teenpattitable01', 'cards', NULL, 'PlayFiver/Evolution/teenpattitable01.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:11:20'),
(1142, 18, 'inativo', 'peekbaccarat0001', 'Peek Baccarat', 'peekbaccarat0001', 'cards', NULL, 'PlayFiver/Evolution/peekbaccarat0001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:47'),
(1143, 18, 'inativo', 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', 'o4kyj7tgpwqqy4m4', 'cards', NULL, 'PlayFiver/Evolution/o4kyj7tgpwqqy4m4.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-31 22:44:22'),
(1144, 18, 'inativo', 'FunkyTime0000001', 'Funky Time', 'FunkyTime0000001', 'cards', NULL, 'PlayFiver/Evolution/FunkyTime0000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:45'),
(1145, 18, 'inativo', 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', 'XxxtremeLigh0001', 'cards', NULL, 'PlayFiver/Evolution/XxxtremeLigh0001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2025-03-02 16:06:16'),
(1146, 18, 'inativo', 'AndarBahar000001', 'Super Andar Bahar', 'AndarBahar000001', 'cards', NULL, 'PlayFiver/Evolution/AndarBahar000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 00:34:34'),
(1147, 18, 'inativo', 'o4kylkahpwqqy57w', 'Speed Baccarat R', 'o4kylkahpwqqy57w', 'cards', NULL, 'PlayFiver/Evolution/o4kylkahpwqqy57w.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-16 12:11:19'),
(1148, 18, 'inativo', '60i0lcfx5wkkv3sy', 'Baccarat B', '60i0lcfx5wkkv3sy', 'cards', NULL, 'PlayFiver/Evolution/60i0lcfx5wkkv3sy.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 23:31:38'),
(1149, 18, 'inativo', 'PorBacBo00000001', 'Bac Bo Ao Vivo', 'PorBacBo00000001', 'cards', NULL, 'PlayFiver/Evolution/PorBacBo00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 23:11:36'),
(1150, 18, 'inativo', 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', 'ocye5hmxbsoyrcii', 'cards', NULL, 'PlayFiver/Evolution/ocye5hmxbsoyrcii.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:11:48'),
(1151, 18, 'inativo', 'THBTable00000001', 'Texas Hold em Bonus Poker', 'THBTable00000001', 'cards', NULL, 'PlayFiver/Evolution/THBTable00000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:51'),
(1152, 18, 'inativo', 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', 'BonsaiBacc000002', 'cards', NULL, 'PlayFiver/Evolution/BonsaiBacc000002.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:11:58'),
(1153, 18, 'inativo', 'DoubleBallRou001', 'Double Ball Roulette', 'DoubleBallRou001', 'cards', NULL, 'PlayFiver/Evolution/DoubleBallRou001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:54'),
(1154, 18, 'inativo', 'lv2kzclunt2qnxo5', 'Speed Baccarat B', 'lv2kzclunt2qnxo5', 'cards', NULL, 'PlayFiver/Evolution/lv2kzclunt2qnxo5.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 14:08:28'),
(1155, 18, 'inativo', 'HoldemTable00001', 'Casino Hold em', 'HoldemTable00001', 'cards', NULL, 'PlayFiver/Evolution/HoldemTable00001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:12:09'),
(1156, 18, 'inativo', 'qsf7alptyvbqohva', 'Speed Baccarat 2', 'qsf7alptyvbqohva', 'cards', NULL, 'PlayFiver/Evolution/qsf7alptyvbqohva.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:40'),
(1157, 18, 'inativo', 'pv2zgy42anvdwk3l', 'Lotus Roulette', 'pv2zgy42anvdwk3l', 'cards', NULL, 'PlayFiver/Evolution/pv2zgy42anvdwk3l.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:19:12'),
(1158, 18, 'inativo', 'ovu5cwp54ccmymck', 'Speed Baccarat L', 'ovu5cwp54ccmymck', 'cards', NULL, 'PlayFiver/Evolution/ovu5cwp54ccmymck.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:41:33'),
(1159, 18, 'inativo', 'FanTan0000000001', 'Fan Tan', 'FanTan0000000001', 'cards', NULL, 'PlayFiver/Evolution/FanTan0000000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:35'),
(1160, 18, 'inativo', 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', 'BonsaiBacc000003', 'cards', NULL, 'PlayFiver/Evolution/BonsaiBacc000003.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:12:20'),
(1161, 18, 'inativo', 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', 'rep5ca4ynyjl7wdw', 'cards', NULL, 'PlayFiver/Evolution/rep5ca4ynyjl7wdw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1162, 18, 'inativo', 'ovu5dsly4ccmynil', 'Speed Baccarat M', 'ovu5dsly4ccmynil', 'cards', NULL, 'PlayFiver/Evolution/ovu5dsly4ccmynil.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 11:43:20'),
(1163, 18, 'inativo', 'LightningBac0001', 'Lightning Baccarat', 'LightningBac0001', 'cards', NULL, 'PlayFiver/Evolution/LightningBac0001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:12:37'),
(1164, 18, 'inativo', 'oytmvb9m1zysmc44', 'Baccarat A', 'oytmvb9m1zysmc44', 'cards', NULL, 'PlayFiver/Evolution/oytmvb9m1zysmc44.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:12:46'),
(1165, 18, 'inativo', 'StockMarket00001', 'Stock Market', 'StockMarket00001', 'cards', NULL, 'PlayFiver/Evolution/StockMarket00001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 21:13:15'),
(1166, 18, 'inativo', 'TopCard000000004', 'Futebol Studio Ao Vivo', 'TopCard000000004', 'cards', NULL, 'PlayFiver/Evolution/TopCard000000004.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:56'),
(1167, 18, 'inativo', 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', 'qsf7bpfvyvbqolwp', 'cards', NULL, 'PlayFiver/Evolution/qsf7bpfvyvbqolwp.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:13:00'),
(1168, 18, 'inativo', 'TopDice000000001', 'Football Studio Dice', 'TopDice000000001', 'cards', NULL, 'PlayFiver/Evolution/TopDice000000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:22'),
(1169, 18, 'inativo', 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', 'k2oswnib7jjaaznw', 'cards', NULL, 'PlayFiver/Evolution/k2oswnib7jjaaznw.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-08-01 14:03:32'),
(1170, 18, 'inativo', 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', 'qsf65xtoyvbqoaop', 'cards', NULL, 'PlayFiver/Evolution/qsf65xtoyvbqoaop.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-29 23:13:10');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `is_influencer_mode`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(1171, 18, 'inativo', 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', 'ovu5fzje4ccmyqnr', 'cards', NULL, 'PlayFiver/Evolution/ovu5fzje4ccmyqnr.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-11-29 23:13:23'),
(1172, 18, 'inativo', 'qgqrrnuqvltnvejx', 'Speed Baccarat V', 'qgqrrnuqvltnvejx', 'cards', NULL, 'PlayFiver/Evolution/qgqrrnuqvltnvejx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-05-27 15:25:59', '2024-07-30 10:52:01'),
(1173, 18, 'inativo', 'ImperialQuest001', 'Imperial Quest', 'ImperialQuest001', 'cards', NULL, 'PlayFiver/Evolution/ImperialQuest001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:00'),
(1174, 18, 'inativo', 'wzg6kdkad1oe7m5k', 'VIP Roulette', 'wzg6kdkad1oe7m5k', 'cards', NULL, 'PlayFiver/Evolution/wzg6kdkad1oe7m5k.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-05-27 15:25:59', '2024-11-30 15:30:53'),
(1175, 18, 'inativo', 'TopCard000000001', 'Football Studio', 'TopCard000000001', 'cards', NULL, 'PlayFiver/Evolution/TopCard000000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2024-05-27 15:25:59', '2024-12-13 04:11:33'),
(1176, 18, 'inativo', 'SuperSicBo000001', 'Super Sic Bo', 'SuperSicBo000001', 'cards', NULL, 'PlayFiver/Evolution/SuperSicBo000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1177, 18, 'inativo', 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', 'ovu5fbxm4ccmypmb', 'cards', NULL, 'PlayFiver/Evolution/ovu5fbxm4ccmypmb.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-05-27 15:27:59'),
(1178, 18, 'inativo', 'nxpj4wumgclak2lx', 'Speed Baccarat H', 'nxpj4wumgclak2lx', 'cards', NULL, 'PlayFiver/Evolution/nxpj4wumgclak2lx.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-05-27 15:25:59', '2024-08-07 22:22:08'),
(1179, 18, 'inativo', 'GoldVaultRo00001', 'Gold Vault Roulette', 'GoldVaultRo00001', 'cards', NULL, 'PlayFiver/Evolution/GoldVaultRo00001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-05-27 15:25:59', '2024-09-28 07:31:13'),
(1180, 18, 'inativo', 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', 'XXXtremeLB000001', 'cards', NULL, 'PlayFiver/Evolution/XXXtremeLB000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2024-05-27 15:25:59', '2025-03-02 15:15:43'),
(1181, 18, 'inativo', 'SpeedAutoRo00001', 'Speed Auto Roulette', 'SpeedAutoRo00001', 'cards', NULL, 'PlayFiver/Evolution/SpeedAutoRo00001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:04'),
(1182, 18, 'inativo', 'BacBo00000000001', 'Bac Bo', 'BacBo00000000001', 'cards', NULL, 'PlayFiver/Evolution/BacBo00000000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:27'),
(1183, 18, 'inativo', 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', 'BonsaiBacc000001', 'cards', NULL, 'PlayFiver/Evolution/BonsaiBacc000001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:06'),
(1184, 18, 'inativo', 'LightningDice001', 'Lightning Dice', 'LightningDice001', 'cards', NULL, 'PlayFiver/Evolution/LightningDice001.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:18:07'),
(1185, 18, 'inativo', 'LightningSpain01', 'Ruleta Relampago en Vivo', 'LightningSpain01', 'cards', NULL, 'PlayFiver/Evolution/LightningSpain01.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-05-27 15:25:59', '2024-10-10 16:17:52'),
(1188, 11126, 'inativo', '8891', 'JETX', '8891', 'block', NULL, 'PlayFiver/Jetx/8891.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2024-09-25 01:04:15', '2024-11-29 21:59:44'),
(1189, 11126, 'inativo', '8892', 'JETX3', '8892', 'block', NULL, 'PlayFiver/Jetx/8892.png', '1', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-09-25 02:07:14', '2024-11-29 21:37:57'),
(1190, 3, 'inativo', '11672', 'GOAL', '11672', 'block', NULL, 'PlayFiver/Spribe/12566.png', '0', 0, 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 77, 0, 0, '2024-03-29 05:55:33', '2025-06-03 16:37:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `playconnect_code` varchar(191) DEFAULT NULL,
  `playconnect_token` varchar(191) DEFAULT NULL,
  `playconnect_secret_key` varchar(191) DEFAULT NULL,
  `merchant_url` varchar(191) DEFAULT NULL,
  `merchant_id` varchar(191) DEFAULT NULL,
  `merchant_key` varchar(191) DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `agent_secret_key` varchar(255) DEFAULT NULL,
  `api_endpoint` varchar(255) DEFAULT NULL,
  `salsa_base_uri` varchar(255) DEFAULT NULL,
  `salsa_pn` varchar(255) DEFAULT NULL,
  `salsa_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vibra_site_id` varchar(191) DEFAULT NULL,
  `vibra_game_mode` varchar(191) DEFAULT NULL,
  `worldslot_agent_code` varchar(191) DEFAULT NULL,
  `worldslot_agent_token` varchar(191) DEFAULT NULL,
  `worldslot_agent_secret_key` varchar(191) DEFAULT NULL,
  `worldslot_api_endpoint` varchar(191) NOT NULL DEFAULT 'https://api.worldslotgame.com/api/v2/',
  `games2_agent_code` varchar(191) DEFAULT NULL,
  `games2_agent_token` varchar(191) DEFAULT NULL,
  `games2_agent_secret_key` varchar(191) DEFAULT NULL,
  `games2_api_endpoint` varchar(191) NOT NULL DEFAULT 'api.games2api.xyz',
  `evergame_agent_code` varchar(191) DEFAULT NULL,
  `evergame_agent_token` varchar(191) DEFAULT NULL,
  `evergame_api_endpoint` varchar(191) DEFAULT NULL,
  `venix_agent_code` varchar(191) DEFAULT NULL,
  `venix_agent_token` varchar(191) DEFAULT NULL,
  `venix_agent_secret` varchar(191) DEFAULT NULL,
  `play_gaming_hall` varchar(191) DEFAULT NULL,
  `play_gaming_key` varchar(191) DEFAULT NULL,
  `play_gaming_login` varchar(191) DEFAULT NULL,
  `pig_agent_code` varchar(191) DEFAULT NULL,
  `pig_agent_token` varchar(191) DEFAULT NULL,
  `pig_agent_secret` varchar(191) DEFAULT NULL,
  `imperium_games_hall` varchar(191) DEFAULT NULL,
  `imperium_games_key` varchar(191) DEFAULT NULL,
  `imperium_games_login` varchar(191) DEFAULT NULL,
  `drakon_agent_code` varchar(191) DEFAULT NULL,
  `drakon_agent_secret` varchar(191) DEFAULT NULL,
  `drakon_agent_token` varchar(191) NOT NULL,
  `agent_code_1` varchar(191) DEFAULT NULL,
  `agent_token_1` varchar(191) DEFAULT NULL,
  `agent_secret_key_1` varchar(191) DEFAULT NULL,
  `api_endpoint_1` varchar(191) DEFAULT NULL,
  `evergame_agent_token2` varchar(255) DEFAULT NULL,
  `evergame_secret_key2` varchar(255) NOT NULL,
  `evergame_api_endpoint2` varchar(255) NOT NULL,
  `playfiver_code` varchar(255) DEFAULT NULL,
  `playfiver_token` varchar(255) DEFAULT NULL,
  `playfiver_secret` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `playconnect_code`, `playconnect_token`, `playconnect_secret_key`, `merchant_url`, `merchant_id`, `merchant_key`, `agent_code`, `agent_token`, `agent_secret_key`, `api_endpoint`, `salsa_base_uri`, `salsa_pn`, `salsa_key`, `created_at`, `updated_at`, `vibra_site_id`, `vibra_game_mode`, `worldslot_agent_code`, `worldslot_agent_token`, `worldslot_agent_secret_key`, `worldslot_api_endpoint`, `games2_agent_code`, `games2_agent_token`, `games2_agent_secret_key`, `games2_api_endpoint`, `evergame_agent_code`, `evergame_agent_token`, `evergame_api_endpoint`, `venix_agent_code`, `venix_agent_token`, `venix_agent_secret`, `play_gaming_hall`, `play_gaming_key`, `play_gaming_login`, `pig_agent_code`, `pig_agent_token`, `pig_agent_secret`, `imperium_games_hall`, `imperium_games_key`, `imperium_games_login`, `drakon_agent_code`, `drakon_agent_secret`, `drakon_agent_token`, `agent_code_1`, `agent_token_1`, `agent_secret_key_1`, `api_endpoint_1`, `evergame_agent_token2`, `evergame_secret_key2`, `evergame_api_endpoint2`, `playfiver_code`, `playfiver_token`, `playfiver_secret`) VALUES
(1, '', '', '', 'https://gis.slotegrator.com/api/index.php/v1', NULL, NULL, 'junim', '1dfe1cdf712cb5eadfe7b8f6db884807', '88bd78c0cf6ede996e8152b75f658a49', 'https://galaxysevers.com.br/api/v2/', NULL, NULL, NULL, '2023-11-30 18:03:08', '2026-01-27 02:27:43', NULL, NULL, 'apiawd', 'seuagente', 'suakey', 'https://api.apiawd.online/api/v1/', NULL, NULL, NULL, 'https://api.games2api.xyz', 'Moro', '', 'https://api.evergame.org/api/casinoapi', '', NULL, NULL, '', '', 'arthur', 'victor', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'https://apigg.slotgamesapi.com', 'pgdasorte123', 'pgdasorte321', 'https://api.softapi.site/api/v1/game_launch', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) DEFAULT NULL,
  `stripe_production` tinyint(4) DEFAULT 0,
  `stripe_public_key` varchar(255) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `stripe_webhook_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public_key` varchar(191) DEFAULT NULL,
  `private_key` varchar(191) DEFAULT NULL,
  `ezzebank_uri` varchar(191) DEFAULT NULL,
  `ezzebank_cliente_id` varchar(191) DEFAULT NULL,
  `ezzebank_cliente_secret` varchar(191) DEFAULT NULL,
  `suitpay_split` varchar(191) NOT NULL,
  `suitpay_split_name` varchar(191) NOT NULL,
  `digitopay_uri` varchar(255) DEFAULT NULL,
  `digitopay_cliente_id` varchar(255) DEFAULT NULL,
  `digitopay_cliente_secret` varchar(255) DEFAULT NULL,
  `bspay_uri` varchar(255) DEFAULT NULL,
  `bspay_cliente_id` varchar(255) DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) DEFAULT NULL,
  `ezze_user` varchar(255) DEFAULT NULL,
  `ezze_senha` varchar(255) DEFAULT NULL,
  `callback_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `created_at`, `updated_at`, `public_key`, `private_key`, `ezzebank_uri`, `ezzebank_cliente_id`, `ezzebank_cliente_secret`, `suitpay_split`, `suitpay_split_name`, `digitopay_uri`, `digitopay_cliente_id`, `digitopay_cliente_secret`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `ezze_user`, `ezze_senha`, `callback_url`) VALUES
(1, 'https://knucklespay.space/api/v2/', 'Aqui', 'Aqui', 0, NULL, NULL, NULL, '2023-11-30 21:05:51', '2026-01-27 02:30:40', NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, 'https://api.pixupbr.com/v2/', 'Instapixel77_5737022278', '', 'testerInfinity@infinitysoft.com', '', 'Não precisa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prizes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `possibilities` text NOT NULL,
  `prize` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games`
--

CREATE TABLE `ggr_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) DEFAULT NULL,
  `aggregator` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_drakon`
--

CREATE TABLE `ggr_games_drakon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `game` varchar(255) NOT NULL,
  `balance_bet` decimal(15,2) NOT NULL,
  `balance_win` decimal(15,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_fivers`
--

CREATE TABLE `ggr_games_fivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `liked_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(55, '2024_01_19_170650_create_categories_table', 30),
(56, '2024_01_19_170657_create_providers_table', 30),
(57, '2024_01_19_170658_create_games_table', 31),
(58, '2023_10_07_183920_create_categories_table', 32),
(59, '2023_10_07_183921_create_providers_table', 33),
(60, '2023_10_07_183922_create_games_table', 34),
(61, '2024_01_20_144529_create_category_games_table', 35),
(62, '2024_01_20_182155_add_vibra_to_games_keys_table', 36),
(63, '2024_01_21_173742_create_game_favorites_table', 37),
(64, '2024_01_21_173752_create_game_likes_table', 37),
(65, '2024_01_21_173803_create_game_reviews_table', 37),
(66, '2024_01_11_231932_create_vibra_casino_games_table', 38),
(69, '2024_01_28_194456_add_vip_to_wallet_table', 40),
(68, '2024_01_28_194645_create_vips_table', 39),
(70, '2024_01_28_231843_create_vip_users_table', 41),
(71, '2024_01_29_102939_add_paid_to_limits_table', 41),
(72, '2024_01_10_001705_create_sub_affiliates_table', 42),
(73, '2024_01_30_120547_create_affiliate_withdraws_table', 43),
(74, '2024_02_09_233936_add_worldslot_to_games_keys_table', 44),
(75, '2024_02_10_191215_add_disable_spin_to_settings_table', 45),
(76, '2024_02_17_210822_add_games2_to_games_keys_table', 46),
(78, '2024_02_20_004853_add_sub_to_settings_table', 47),
(79, '2024_02_24_121146_add_header_to_custom_layouts_table', 48),
(80, '2024_02_26_144235_create_ggr_games_world_slots_table', 49),
(81, '2024_03_01_172613_add_evergame_to_games_keys_table', 50),
(82, '2024_03_03_201700_add_venixkey_to_games_keys_table', 51),
(83, '2024_03_08_201557_add_play_gaming_to_games_keys_table', 52),
(84, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 53),
(85, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 54),
(86, '2024_03_21_223739_add_sharkpay_to_gateways_table', 55),
(87, '2024_03_21_230017_add_reference_to_transactions_table', 56),
(88, '2024_03_24_125025_add_rollver_protection_to_settings_table', 57),
(89, '2024_03_24_134101_add_accept_bonus_to_transactions_table', 58),
(90, '2024_03_24_172243_add_receita_to_affiliate_histories_table', 59),
(91, '2024_03_26_161932_add_baseline_column_to_settings_table', 60),
(92, '2024_03_26_234226_add_playigaming_column_to_games_key_table', 61),
(93, '2024_03_25_231103_add_mercado_pago_column_to_gateways_table', 62),
(94, '2024_03_30_215051_add_social_to_custom_layouts_table', 63),
(98, '2024_03_30_225900_create_digito_pay_payments_table', 66),
(96, '2024_03_30_225929_add_digitopay_to_gateways_table', 64),
(97, '2024_03_31_124211_add_digitopay_to_settings_table', 65),
(99, '2024_04_02_140932_add_default_gateway_to_settings_table', 67),
(100, '2024_03_08_201557_add_imperium_games_to_games_keys_table', 68);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `challenge_name` varchar(191) NOT NULL,
  `challenge_description` text NOT NULL,
  `challenge_rules` text NOT NULL,
  `challenge_type` varchar(20) NOT NULL DEFAULT 'game',
  `challenge_link` varchar(191) DEFAULT NULL,
  `challenge_start_date` datetime NOT NULL,
  `challenge_end_date` datetime NOT NULL,
  `challenge_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `challenge_total` bigint(20) NOT NULL DEFAULT 1,
  `challenge_currency` varchar(5) NOT NULL,
  `challenge_provider` varchar(50) DEFAULT NULL,
  `challenge_gameid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recargas_cumulativas` decimal(10,2) DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_deposit`
--

CREATE TABLE `mission_deposit` (
  `id` bigint(20) NOT NULL,
  `bonus_amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name_mission` varchar(255) DEFAULT NULL,
  `deposit_acumulated_necessario` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mission_deposit`
--

INSERT INTO `mission_deposit` (`id`, `bonus_amount`, `description`, `name_mission`, `deposit_acumulated_necessario`, `created_at`, `updated_at`) VALUES
(1, 10.00, NULL, 'Recarga cumulativa: 1000', 1000.00, '2024-08-15 05:57:39', '2024-10-19 19:46:59'),
(2, 50.00, NULL, 'Recarga Acumulativa: 5000', 5000.00, '2024-08-15 06:29:46', '2024-10-19 19:47:17'),
(3, 250.00, NULL, 'Recarga Acumulativa: 25000', 25000.00, '2024-08-15 06:46:57', '2024-10-19 19:47:35'),
(4, 500.00, NULL, 'Recarga Acumulativa: 50000', 50000.00, '2024-08-21 06:08:56', '2024-10-19 19:47:54'),
(5, 1000.00, NULL, 'Recarga Acumulativa: 100000', 100000.00, '2024-08-21 06:09:18', '2024-10-19 19:48:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_deposit_user`
--

CREATE TABLE `mission_deposit_user` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mission_deposit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `wallet_bonus` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mission_deposit_user`
--

INSERT INTO `mission_deposit_user` (`id`, `user_id`, `mission_deposit_id`, `status`, `wallet_bonus`, `created_at`, `updated_at`) VALUES
(114, 1, 1, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(115, 1, 2, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(116, 1, 3, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(117, 1, 4, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(118, 1, 5, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(119, 17484599, 1, '0', 10.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(120, 17484599, 2, '0', 50.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(121, 17484599, 3, '0', 250.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(122, 17484599, 4, '0', 500.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(123, 17484599, 5, '0', 1000.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(124, 17484600, 1, '0', 10.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(125, 17484600, 2, '0', 50.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(126, 17484600, 3, '0', 250.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(127, 17484600, 4, '0', 500.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(128, 17484600, 5, '0', 1000.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(129, 17484601, 1, '0', 10.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(130, 17484601, 2, '0', 50.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(131, 17484601, 3, '0', 250.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(132, 17484601, 4, '0', 500.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(133, 17484601, 5, '0', 1000.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(134, 17484602, 1, '0', 10.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(135, 17484602, 2, '0', 50.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(136, 17484602, 3, '0', 250.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(137, 17484602, 4, '0', 500.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(138, 17484602, 5, '0', 1000.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(139, 17484603, 1, '0', 10.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(140, 17484603, 2, '0', 50.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(141, 17484603, 3, '0', 250.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(142, 17484603, 4, '0', 500.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(143, 17484603, 5, '0', 1000.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(144, 17484604, 1, '0', 10.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(145, 17484604, 2, '0', 50.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(146, 17484604, 3, '0', 250.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(147, 17484604, 4, '0', 500.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(148, 17484604, 5, '0', 1000.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(149, 17484605, 1, '0', 10.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(150, 17484605, 2, '0', 50.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(151, 17484605, 3, '0', 250.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(152, 17484605, 4, '0', 500.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(153, 17484605, 5, '0', 1000.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(154, 17484606, 1, '0', 10.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(155, 17484606, 2, '0', 50.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(156, 17484606, 3, '0', 250.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(157, 17484606, 4, '0', 500.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(158, 17484606, 5, '0', 1000.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(159, 17484607, 1, '0', 10.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(160, 17484607, 2, '0', 50.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(161, 17484607, 3, '0', 250.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(162, 17484607, 4, '0', 500.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(163, 17484607, 5, '0', 1000.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(164, 17484608, 1, '0', 10.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(165, 17484608, 2, '0', 50.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(166, 17484608, 3, '0', 250.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(167, 17484608, 4, '0', 500.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(168, 17484608, 5, '0', 1000.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(169, 17484609, 1, '0', 10.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(170, 17484609, 2, '0', 50.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(171, 17484609, 3, '0', 250.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(172, 17484609, 4, '0', 500.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(173, 17484609, 5, '0', 1000.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(174, 17484611, 1, '0', 10.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(175, 17484611, 2, '0', 50.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(176, 17484611, 3, '0', 250.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(177, 17484611, 4, '0', 500.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(178, 17484611, 5, '0', 1000.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(179, 17484612, 1, '0', 10.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(180, 17484612, 2, '0', 50.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(181, 17484612, 3, '0', 250.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(182, 17484612, 4, '0', 500.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(183, 17484612, 5, '0', 1000.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(184, 17484613, 1, '0', 10.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(185, 17484613, 2, '0', 50.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(186, 17484613, 3, '0', 250.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(187, 17484613, 4, '0', 500.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(188, 17484613, 5, '0', 1000.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(189, 17484614, 1, '0', 10.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(190, 17484614, 2, '0', 50.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(191, 17484614, 3, '0', 250.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(192, 17484614, 4, '0', 500.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(193, 17484614, 5, '0', 1000.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(194, 17484615, 1, '0', 10.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(195, 17484615, 2, '0', 50.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(196, 17484615, 3, '0', 250.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(197, 17484615, 4, '0', 500.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(198, 17484615, 5, '0', 1000.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(199, 17484616, 1, '0', 10.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(200, 17484616, 2, '0', 50.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(201, 17484616, 3, '0', 250.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(202, 17484616, 4, '0', 500.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(203, 17484616, 5, '0', 1000.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(204, 17484617, 1, '0', 10.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(205, 17484617, 2, '0', 50.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(206, 17484617, 3, '0', 250.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(207, 17484617, 4, '0', 500.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(208, 17484617, 5, '0', 1000.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(209, 17484618, 1, '0', 10.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(210, 17484618, 2, '0', 50.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(211, 17484618, 3, '0', 250.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(212, 17484618, 4, '0', 500.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(213, 17484618, 5, '0', 1000.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(214, 17484619, 1, '0', 10.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(215, 17484619, 2, '0', 50.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(216, 17484619, 3, '0', 250.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(217, 17484619, 4, '0', 500.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(218, 17484619, 5, '0', 1000.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(219, 17484620, 1, '0', 10.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(220, 17484620, 2, '0', 50.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(221, 17484620, 3, '0', 250.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(222, 17484620, 4, '0', 500.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(223, 17484620, 5, '0', 1000.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(224, 17484621, 1, '0', 10.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(225, 17484621, 2, '0', 50.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(226, 17484621, 3, '0', 250.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(227, 17484621, 4, '0', 500.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(228, 17484621, 5, '0', 1000.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(229, 17484622, 1, '0', 10.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(230, 17484622, 2, '0', 50.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(231, 17484622, 3, '0', 250.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(232, 17484622, 4, '0', 500.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(233, 17484622, 5, '0', 1000.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(234, 17484623, 1, '0', 10.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(235, 17484623, 2, '0', 50.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(236, 17484623, 3, '0', 250.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(237, 17484623, 4, '0', 500.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(238, 17484623, 5, '0', 1000.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(239, 17484624, 1, '0', 10.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(240, 17484624, 2, '0', 50.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(241, 17484624, 3, '0', 250.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(242, 17484624, 4, '0', 500.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(243, 17484624, 5, '0', 1000.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(244, 17484625, 1, '0', 10.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(245, 17484625, 2, '0', 50.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(246, 17484625, 3, '0', 250.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(247, 17484625, 4, '0', 500.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(248, 17484625, 5, '0', 1000.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(249, 17484626, 1, '0', 10.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(250, 17484626, 2, '0', 50.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(251, 17484626, 3, '0', 250.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(252, 17484626, 4, '0', 500.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(253, 17484626, 5, '0', 1000.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(254, 17484627, 1, '0', 10.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(255, 17484627, 2, '0', 50.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(256, 17484627, 3, '0', 250.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(257, 17484627, 4, '0', 500.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(258, 17484627, 5, '0', 1000.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(259, 17484628, 1, '0', 10.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(260, 17484628, 2, '0', 50.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(261, 17484628, 3, '0', 250.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(262, 17484628, 4, '0', 500.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(263, 17484628, 5, '0', 1000.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(264, 17484629, 1, '0', 10.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(265, 17484629, 2, '0', 50.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(266, 17484629, 3, '0', 250.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(267, 17484629, 4, '0', 500.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(268, 17484629, 5, '0', 1000.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(269, 17484630, 1, '0', 10.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(270, 17484630, 2, '0', 50.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(271, 17484630, 3, '0', 250.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(272, 17484630, 4, '0', 500.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(273, 17484630, 5, '0', 1000.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(274, 17484631, 1, '0', 10.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(275, 17484631, 2, '0', 50.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(276, 17484631, 3, '0', 250.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(277, 17484631, 4, '0', 500.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(278, 17484631, 5, '0', 1000.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(279, 17484632, 1, '0', 10.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(280, 17484632, 2, '0', 50.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(281, 17484632, 3, '0', 250.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(282, 17484632, 4, '0', 500.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(283, 17484632, 5, '0', 1000.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(284, 17484633, 1, '0', 10.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(285, 17484633, 2, '0', 50.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(286, 17484633, 3, '0', 250.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(287, 17484633, 4, '0', 500.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(288, 17484633, 5, '0', 1000.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(289, 17484634, 1, '0', 10.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(290, 17484634, 2, '0', 50.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(291, 17484634, 3, '0', 250.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(292, 17484634, 4, '0', 500.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(293, 17484634, 5, '0', 1000.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(294, 17484635, 1, '0', 10.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(295, 17484635, 2, '0', 50.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(296, 17484635, 3, '0', 250.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(297, 17484635, 4, '0', 500.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(298, 17484635, 5, '0', 1000.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(299, 17484636, 1, '0', 10.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(300, 17484636, 2, '0', 50.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(301, 17484636, 3, '0', 250.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(302, 17484636, 4, '0', 500.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(303, 17484636, 5, '0', 1000.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(304, 17484637, 1, '0', 10.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(305, 17484637, 2, '0', 50.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(306, 17484637, 3, '0', 250.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(307, 17484637, 4, '0', 500.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(308, 17484637, 5, '0', 1000.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(309, 17484638, 1, '0', 10.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(310, 17484638, 2, '0', 50.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(311, 17484638, 3, '0', 250.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(312, 17484638, 4, '0', 500.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(313, 17484638, 5, '0', 1000.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(314, 17484639, 1, '0', 10.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(315, 17484639, 2, '0', 50.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(316, 17484639, 3, '0', 250.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(317, 17484639, 4, '0', 500.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(318, 17484639, 5, '0', 1000.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(319, 17484640, 1, '0', 10.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(320, 17484640, 2, '0', 50.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(321, 17484640, 3, '0', 250.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(322, 17484640, 4, '0', 500.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(323, 17484640, 5, '0', 1000.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(324, 17484641, 1, '0', 10.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(325, 17484641, 2, '0', 50.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(326, 17484641, 3, '0', 250.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(327, 17484641, 4, '0', 500.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(328, 17484641, 5, '0', 1000.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(329, 17484642, 1, '0', 10.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(330, 17484642, 2, '0', 50.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(331, 17484642, 3, '0', 250.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(332, 17484642, 4, '0', 500.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(333, 17484642, 5, '0', 1000.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(334, 17484643, 1, '0', 10.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(335, 17484643, 2, '0', 50.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(336, 17484643, 3, '0', 250.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(337, 17484643, 4, '0', 500.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(338, 17484643, 5, '0', 1000.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(339, 17484644, 1, '0', 10.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(340, 17484644, 2, '0', 50.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(341, 17484644, 3, '0', 250.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(342, 17484644, 4, '0', 500.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(343, 17484644, 5, '0', 1000.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(344, 17484645, 1, '0', 10.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(345, 17484645, 2, '0', 50.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(346, 17484645, 3, '0', 250.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(347, 17484645, 4, '0', 500.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(348, 17484645, 5, '0', 1000.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(349, 17484646, 1, '0', 10.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(350, 17484646, 2, '0', 50.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(351, 17484646, 3, '0', 250.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(352, 17484646, 4, '0', 500.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(353, 17484646, 5, '0', 1000.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(354, 17484647, 1, '0', 10.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(355, 17484647, 2, '0', 50.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(356, 17484647, 3, '0', 250.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(357, 17484647, 4, '0', 500.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(358, 17484647, 5, '0', 1000.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(359, 17484648, 1, '0', 10.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(360, 17484648, 2, '0', 50.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(361, 17484648, 3, '0', 250.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(362, 17484648, 4, '0', 500.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(363, 17484648, 5, '0', 1000.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(364, 17484649, 1, '0', 10.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(365, 17484649, 2, '0', 50.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(366, 17484649, 3, '0', 250.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(367, 17484649, 4, '0', 500.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(368, 17484649, 5, '0', 1000.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(369, 17484650, 1, '0', 10.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(370, 17484650, 2, '0', 50.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(371, 17484650, 3, '0', 250.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(372, 17484650, 4, '0', 500.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(373, 17484650, 5, '0', 1000.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(374, 17484651, 1, '0', 10.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(375, 17484651, 2, '0', 50.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(376, 17484651, 3, '0', 250.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(377, 17484651, 4, '0', 500.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(378, 17484651, 5, '0', 1000.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(379, 17484652, 1, '0', 10.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(380, 17484652, 2, '0', 50.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(381, 17484652, 3, '0', 250.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(382, 17484652, 4, '0', 500.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(383, 17484652, 5, '0', 1000.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(384, 17484653, 1, '0', 10.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(385, 17484653, 2, '0', 50.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(386, 17484653, 3, '0', 250.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(387, 17484653, 4, '0', 500.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(388, 17484653, 5, '0', 1000.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(389, 17484654, 1, '0', 10.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(390, 17484654, 2, '0', 50.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(391, 17484654, 3, '0', 250.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(392, 17484654, 4, '0', 500.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(393, 17484654, 5, '0', 1000.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(394, 17484655, 1, '0', 10.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(395, 17484655, 2, '0', 50.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(396, 17484655, 3, '0', 250.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(397, 17484655, 4, '0', 500.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(398, 17484655, 5, '0', 1000.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(399, 17484656, 1, '0', 10.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(400, 17484656, 2, '0', 50.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(401, 17484656, 3, '0', 250.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(402, 17484656, 4, '0', 500.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(403, 17484656, 5, '0', 1000.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(404, 17484657, 1, '0', 10.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(405, 17484657, 2, '0', 50.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(406, 17484657, 3, '0', 250.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(407, 17484657, 4, '0', 500.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(408, 17484657, 5, '0', 1000.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(409, 17484658, 1, '0', 10.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(410, 17484658, 2, '0', 50.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(411, 17484658, 3, '0', 250.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(412, 17484658, 4, '0', 500.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(413, 17484658, 5, '0', 1000.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(414, 17484659, 1, '0', 10.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(415, 17484659, 2, '0', 50.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(416, 17484659, 3, '0', 250.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(417, 17484659, 4, '0', 500.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(418, 17484659, 5, '0', 1000.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(419, 17484660, 1, '0', 10.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(420, 17484660, 2, '0', 50.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(421, 17484660, 3, '0', 250.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(422, 17484660, 4, '0', 500.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(423, 17484660, 5, '0', 1000.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(424, 17484661, 1, '0', 10.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(425, 17484661, 2, '0', 50.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(426, 17484661, 3, '0', 250.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(427, 17484661, 4, '0', 500.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(428, 17484661, 5, '0', 1000.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(429, 17484662, 1, '0', 10.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(430, 17484662, 2, '0', 50.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(431, 17484662, 3, '0', 250.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(432, 17484662, 4, '0', 500.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(433, 17484662, 5, '0', 1000.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(434, 17484663, 1, '0', 10.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(435, 17484663, 2, '0', 50.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(436, 17484663, 3, '0', 250.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(437, 17484663, 4, '0', 500.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(438, 17484663, 5, '0', 1000.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(439, 17484664, 1, '0', 10.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(440, 17484664, 2, '0', 50.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(441, 17484664, 3, '0', 250.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(442, 17484664, 4, '0', 500.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(443, 17484664, 5, '0', 1000.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(444, 17484665, 1, '0', 10.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(445, 17484665, 2, '0', 50.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(446, 17484665, 3, '0', 250.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(447, 17484665, 4, '0', 500.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(448, 17484665, 5, '0', 1000.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(449, 17484666, 1, '0', 10.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(450, 17484666, 2, '0', 50.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(451, 17484666, 3, '0', 250.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(452, 17484666, 4, '0', 500.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(453, 17484666, 5, '0', 1000.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(454, 17484667, 1, '0', 10.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(455, 17484667, 2, '0', 50.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(456, 17484667, 3, '0', 250.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(457, 17484667, 4, '0', 500.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(458, 17484667, 5, '0', 1000.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(459, 17484668, 1, '0', 10.00, '2024-12-02 21:22:52', '2024-12-02 21:22:52'),
(460, 17484668, 2, '0', 50.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(461, 17484668, 3, '0', 250.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(462, 17484668, 4, '0', 500.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(463, 17484668, 5, '0', 1000.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(464, 17484669, 1, '0', 10.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(465, 17484669, 2, '0', 50.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(466, 17484669, 3, '0', 250.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(467, 17484669, 4, '0', 500.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(468, 17484669, 5, '0', 1000.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(469, 17484670, 1, '0', 10.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(470, 17484670, 2, '0', 50.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(471, 17484670, 3, '0', 250.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(472, 17484670, 4, '0', 500.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(473, 17484670, 5, '0', 1000.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(474, 17484671, 1, '0', 10.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(475, 17484671, 2, '0', 50.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(476, 17484671, 3, '0', 250.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(477, 17484671, 4, '0', 500.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(478, 17484671, 5, '0', 1000.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(479, 17484672, 1, '0', 10.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(480, 17484672, 2, '0', 50.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(481, 17484672, 3, '0', 250.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(482, 17484672, 4, '0', 500.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(483, 17484672, 5, '0', 1000.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(484, 17484673, 1, '0', 10.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(485, 17484673, 2, '0', 50.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(486, 17484673, 3, '0', 250.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(487, 17484673, 4, '0', 500.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(488, 17484673, 5, '0', 1000.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(489, 17484674, 1, '0', 10.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(490, 17484674, 2, '0', 50.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(491, 17484674, 3, '0', 250.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(492, 17484674, 4, '0', 500.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(493, 17484674, 5, '0', 1000.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(494, 17484675, 1, '0', 10.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(495, 17484675, 2, '0', 50.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(496, 17484675, 3, '0', 250.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(497, 17484675, 4, '0', 500.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(498, 17484675, 5, '0', 1000.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(499, 17484676, 1, '0', 10.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(500, 17484676, 2, '0', 50.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(501, 17484676, 3, '0', 250.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(502, 17484676, 4, '0', 500.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(503, 17484676, 5, '0', 1000.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(504, 17484677, 1, '0', 10.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(505, 17484677, 2, '0', 50.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(506, 17484677, 3, '0', 250.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(507, 17484677, 4, '0', 500.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(508, 17484677, 5, '0', 1000.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(509, 17484678, 1, '0', 10.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(510, 17484678, 2, '0', 50.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(511, 17484678, 3, '0', 250.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(512, 17484678, 4, '0', 500.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(513, 17484678, 5, '0', 1000.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(514, 17484679, 1, '0', 10.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(515, 17484679, 2, '0', 50.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(516, 17484679, 3, '0', 250.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(517, 17484679, 4, '0', 500.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(518, 17484679, 5, '0', 1000.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(519, 17484680, 1, '0', 10.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(520, 17484680, 2, '0', 50.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(521, 17484680, 3, '0', 250.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(522, 17484680, 4, '0', 500.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(523, 17484680, 5, '0', 1000.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(524, 17484681, 1, '0', 10.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(525, 17484681, 2, '0', 50.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(526, 17484681, 3, '0', 250.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(527, 17484681, 4, '0', 500.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(528, 17484681, 5, '0', 1000.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(529, 17484682, 1, '0', 10.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(530, 17484682, 2, '0', 50.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(531, 17484682, 3, '0', 250.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(532, 17484682, 4, '0', 500.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(533, 17484682, 5, '0', 1000.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(534, 17484683, 1, '0', 10.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(535, 17484683, 2, '0', 50.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(536, 17484683, 3, '0', 250.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(537, 17484683, 4, '0', 500.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(538, 17484683, 5, '0', 1000.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(539, 17484684, 1, '0', 10.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(540, 17484684, 2, '0', 50.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(541, 17484684, 3, '0', 250.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(542, 17484684, 4, '0', 500.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(543, 17484684, 5, '0', 1000.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(544, 17484685, 1, '0', 10.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(545, 17484685, 2, '0', 50.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(546, 17484685, 3, '0', 250.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(547, 17484685, 4, '0', 500.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(548, 17484685, 5, '0', 1000.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(549, 17484686, 1, '0', 10.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(550, 17484686, 2, '0', 50.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(551, 17484686, 3, '0', 250.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(552, 17484686, 4, '0', 500.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(553, 17484686, 5, '0', 1000.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(554, 17484687, 1, '0', 10.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(555, 17484687, 2, '0', 50.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(556, 17484687, 3, '0', 250.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(557, 17484687, 4, '0', 500.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(558, 17484687, 5, '0', 1000.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(559, 17484688, 1, '0', 10.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(560, 17484688, 2, '0', 50.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(561, 17484688, 3, '0', 250.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(562, 17484688, 4, '0', 500.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(563, 17484688, 5, '0', 1000.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(564, 17484689, 1, '0', 10.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(565, 17484689, 2, '0', 50.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(566, 17484689, 3, '0', 250.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(567, 17484689, 4, '0', 500.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(568, 17484689, 5, '0', 1000.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(569, 17484690, 1, '0', 10.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(570, 17484690, 2, '0', 50.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(571, 17484690, 3, '0', 250.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(572, 17484690, 4, '0', 500.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(573, 17484690, 5, '0', 1000.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(574, 17484691, 1, '0', 10.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(575, 17484691, 2, '0', 50.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(576, 17484691, 3, '0', 250.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(577, 17484691, 4, '0', 500.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(578, 17484691, 5, '0', 1000.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(579, 17484692, 1, '0', 10.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(580, 17484692, 2, '0', 50.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(581, 17484692, 3, '0', 250.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(582, 17484692, 4, '0', 500.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(583, 17484692, 5, '0', 1000.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(584, 17484693, 1, '0', 10.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(585, 17484693, 2, '0', 50.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(586, 17484693, 3, '0', 250.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(587, 17484693, 4, '0', 500.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(588, 17484693, 5, '0', 1000.00, '2024-12-12 01:36:43', '2024-12-12 01:36:43'),
(589, 17484694, 1, '0', 10.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(590, 17484694, 2, '0', 50.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(591, 17484694, 3, '0', 250.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(592, 17484694, 4, '0', 500.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(593, 17484694, 5, '0', 1000.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(594, 17484695, 1, '0', 10.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(595, 17484695, 2, '0', 50.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(596, 17484695, 3, '0', 250.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(597, 17484695, 4, '0', 500.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(598, 17484695, 5, '0', 1000.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(599, 17484696, 1, '0', 10.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(600, 17484696, 2, '0', 50.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(601, 17484696, 3, '0', 250.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(602, 17484696, 4, '0', 500.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(603, 17484696, 5, '0', 1000.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(604, 17484697, 1, '0', 10.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(605, 17484697, 2, '0', 50.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(606, 17484697, 3, '0', 250.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(607, 17484697, 4, '0', 500.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(608, 17484697, 5, '0', 1000.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(609, 17484698, 1, '0', 10.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(610, 17484698, 2, '0', 50.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(611, 17484698, 3, '0', 250.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(612, 17484698, 4, '0', 500.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(613, 17484698, 5, '0', 1000.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(614, 17484699, 1, '0', 10.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(615, 17484699, 2, '0', 50.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(616, 17484699, 3, '0', 250.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(617, 17484699, 4, '0', 500.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(618, 17484699, 5, '0', 1000.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(619, 17484700, 1, '0', 10.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(620, 17484700, 2, '0', 50.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(621, 17484700, 3, '0', 250.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(622, 17484700, 4, '0', 500.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(623, 17484700, 5, '0', 1000.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(624, 17484701, 1, '0', 10.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(625, 17484701, 2, '0', 50.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(626, 17484701, 3, '0', 250.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(627, 17484701, 4, '0', 500.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(628, 17484701, 5, '0', 1000.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(629, 17484702, 1, '0', 10.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(630, 17484702, 2, '0', 50.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(631, 17484702, 3, '0', 250.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(632, 17484702, 4, '0', 500.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(633, 17484702, 5, '0', 1000.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(634, 17484703, 1, '0', 10.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(635, 17484703, 2, '0', 50.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(636, 17484703, 3, '0', 250.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(637, 17484703, 4, '0', 500.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(638, 17484703, 5, '0', 1000.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(639, 17484704, 1, '0', 10.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(640, 17484704, 2, '0', 50.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(641, 17484704, 3, '0', 250.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(642, 17484704, 4, '0', 500.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(643, 17484704, 5, '0', 1000.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(644, 17484705, 1, '0', 10.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(645, 17484705, 2, '0', 50.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(646, 17484705, 3, '0', 250.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(647, 17484705, 4, '0', 500.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(648, 17484705, 5, '0', 1000.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(649, 17484706, 1, '0', 10.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(650, 17484706, 2, '0', 50.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(651, 17484706, 3, '0', 250.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(652, 17484706, 4, '0', 500.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(653, 17484706, 5, '0', 1000.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(654, 17484707, 1, '0', 10.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(655, 17484707, 2, '0', 50.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(656, 17484707, 3, '0', 250.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(657, 17484707, 4, '0', 500.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(658, 17484707, 5, '0', 1000.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(659, 17484708, 1, '0', 10.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(660, 17484708, 2, '0', 50.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(661, 17484708, 3, '0', 250.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(662, 17484708, 4, '0', 500.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(663, 17484708, 5, '0', 1000.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(664, 17484709, 1, '0', 10.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(665, 17484709, 2, '0', 50.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(666, 17484709, 3, '0', 250.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(667, 17484709, 4, '0', 500.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(668, 17484709, 5, '0', 1000.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(669, 17484710, 1, '0', 10.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(670, 17484710, 2, '0', 50.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(671, 17484710, 3, '0', 250.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(672, 17484710, 4, '0', 500.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(673, 17484710, 5, '0', 1000.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(674, 17484711, 1, '0', 10.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(675, 17484711, 2, '0', 50.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(676, 17484711, 3, '0', 250.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(677, 17484711, 4, '0', 500.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(678, 17484711, 5, '0', 1000.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(679, 17484712, 1, '0', 10.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(680, 17484712, 2, '0', 50.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(681, 17484712, 3, '0', 250.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(682, 17484712, 4, '0', 500.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(683, 17484712, 5, '0', 1000.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(684, 17484713, 1, '0', 10.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(685, 17484713, 2, '0', 50.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(686, 17484713, 3, '0', 250.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(687, 17484713, 4, '0', 500.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(688, 17484713, 5, '0', 1000.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(689, 17484714, 1, '0', 10.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(690, 17484714, 2, '0', 50.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(691, 17484714, 3, '0', 250.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(692, 17484714, 4, '0', 500.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(693, 17484714, 5, '0', 1000.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(694, 17484715, 1, '0', 10.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(695, 17484715, 2, '0', 50.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(696, 17484715, 3, '0', 250.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(697, 17484715, 4, '0', 500.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(698, 17484715, 5, '0', 1000.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(699, 17484716, 1, '0', 10.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(700, 17484716, 2, '0', 50.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(701, 17484716, 3, '0', 250.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(702, 17484716, 4, '0', 500.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(703, 17484716, 5, '0', 1000.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(704, 17484717, 1, '0', 10.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(705, 17484717, 2, '0', 50.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(706, 17484717, 3, '0', 250.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(707, 17484717, 4, '0', 500.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(708, 17484717, 5, '0', 1000.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(709, 17484718, 1, '0', 10.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(710, 17484718, 2, '0', 50.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(711, 17484718, 3, '0', 250.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(712, 17484718, 4, '0', 500.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(713, 17484718, 5, '0', 1000.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(714, 17484719, 1, '0', 10.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(715, 17484719, 2, '0', 50.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(716, 17484719, 3, '0', 250.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(717, 17484719, 4, '0', 500.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(718, 17484719, 5, '0', 1000.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(719, 17484720, 1, '0', 10.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(720, 17484720, 2, '0', 50.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(721, 17484720, 3, '0', 250.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(722, 17484720, 4, '0', 500.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(723, 17484720, 5, '0', 1000.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(724, 17484721, 1, '0', 10.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(725, 17484721, 2, '0', 50.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(726, 17484721, 3, '0', 250.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(727, 17484721, 4, '0', 500.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(728, 17484721, 5, '0', 1000.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(729, 17484722, 1, '0', 10.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(730, 17484722, 2, '0', 50.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(731, 17484722, 3, '0', 250.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(732, 17484722, 4, '0', 500.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(733, 17484722, 5, '0', 1000.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(734, 17484723, 1, '0', 10.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(735, 17484723, 2, '0', 50.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(736, 17484723, 3, '0', 250.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(737, 17484723, 4, '0', 500.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(738, 17484723, 5, '0', 1000.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(739, 17484724, 1, '0', 10.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(740, 17484724, 2, '0', 50.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(741, 17484724, 3, '0', 250.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(742, 17484724, 4, '0', 500.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(743, 17484724, 5, '0', 1000.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(744, 17484725, 1, '0', 10.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(745, 17484725, 2, '0', 50.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(746, 17484725, 3, '0', 250.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(747, 17484725, 4, '0', 500.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(748, 17484725, 5, '0', 1000.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(749, 17484726, 1, '0', 10.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(750, 17484726, 2, '0', 50.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(751, 17484726, 3, '0', 250.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(752, 17484726, 4, '0', 500.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(753, 17484726, 5, '0', 1000.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(754, 17484727, 1, '0', 10.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(755, 17484727, 2, '0', 50.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(756, 17484727, 3, '0', 250.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(757, 17484727, 4, '0', 500.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(758, 17484727, 5, '0', 1000.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(759, 17484728, 1, '0', 10.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(760, 17484728, 2, '0', 50.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(761, 17484728, 3, '0', 250.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(762, 17484728, 4, '0', 500.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01');
INSERT INTO `mission_deposit_user` (`id`, `user_id`, `mission_deposit_id`, `status`, `wallet_bonus`, `created_at`, `updated_at`) VALUES
(763, 17484728, 5, '0', 1000.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(764, 17484729, 1, '0', 10.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(765, 17484729, 2, '0', 50.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(766, 17484729, 3, '0', 250.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(767, 17484729, 4, '0', 500.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(768, 17484729, 5, '0', 1000.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(769, 17484730, 1, '0', 10.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(770, 17484730, 2, '0', 50.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(771, 17484730, 3, '0', 250.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(772, 17484730, 4, '0', 500.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(773, 17484730, 5, '0', 1000.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(774, 17484731, 1, '0', 10.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(775, 17484731, 2, '0', 50.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(776, 17484731, 3, '0', 250.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(777, 17484731, 4, '0', 500.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(778, 17484731, 5, '0', 1000.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(779, 17484732, 1, '0', 10.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(780, 17484732, 2, '0', 50.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(781, 17484732, 3, '0', 250.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(782, 17484732, 4, '0', 500.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(783, 17484732, 5, '0', 1000.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(784, 17484733, 1, '0', 10.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(785, 17484733, 2, '0', 50.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(786, 17484733, 3, '0', 250.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(787, 17484733, 4, '0', 500.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(788, 17484733, 5, '0', 1000.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(789, 17484734, 1, '0', 10.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(790, 17484734, 2, '0', 50.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(791, 17484734, 3, '0', 250.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(792, 17484734, 4, '0', 500.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(793, 17484734, 5, '0', 1000.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(794, 17484735, 1, '0', 10.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(795, 17484735, 2, '0', 50.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(796, 17484735, 3, '0', 250.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(797, 17484735, 4, '0', 500.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(798, 17484735, 5, '0', 1000.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(799, 2, 1, '0', 10.00, '2025-02-26 14:56:22', '2025-02-26 14:56:22'),
(800, 2, 2, '0', 50.00, '2025-02-26 14:56:22', '2025-02-26 14:56:22'),
(801, 2, 3, '0', 250.00, '2025-02-26 14:56:22', '2025-02-26 14:56:22'),
(802, 2, 4, '0', 500.00, '2025-02-26 14:56:22', '2025-02-26 14:56:22'),
(803, 2, 5, '0', 1000.00, '2025-02-26 14:56:22', '2025-02-26 14:56:22'),
(804, 3, 1, '0', 10.00, '2025-02-26 15:01:14', '2025-02-26 15:01:14'),
(805, 3, 2, '0', 50.00, '2025-02-26 15:01:14', '2025-02-26 15:01:14'),
(806, 3, 3, '0', 250.00, '2025-02-26 15:01:14', '2025-02-26 15:01:14'),
(807, 3, 4, '0', 500.00, '2025-02-26 15:01:14', '2025-02-26 15:01:14'),
(808, 3, 5, '0', 1000.00, '2025-02-26 15:01:14', '2025-02-26 15:01:14'),
(809, 4, 1, '0', 10.00, '2025-03-02 00:02:21', '2025-03-02 00:02:21'),
(810, 4, 2, '0', 50.00, '2025-03-02 00:02:21', '2025-03-02 00:02:21'),
(811, 4, 3, '0', 250.00, '2025-03-02 00:02:21', '2025-03-02 00:02:21'),
(812, 4, 4, '0', 500.00, '2025-03-02 00:02:21', '2025-03-02 00:02:21'),
(813, 4, 5, '0', 1000.00, '2025-03-02 00:02:21', '2025-03-02 00:02:21'),
(814, 5, 1, '0', 10.00, '2025-03-02 15:08:39', '2025-03-02 15:08:39'),
(815, 5, 2, '0', 50.00, '2025-03-02 15:08:39', '2025-03-02 15:08:39'),
(816, 5, 3, '0', 250.00, '2025-03-02 15:08:39', '2025-03-02 15:08:39'),
(817, 5, 4, '0', 500.00, '2025-03-02 15:08:39', '2025-03-02 15:08:39'),
(818, 5, 5, '0', 1000.00, '2025-03-02 15:08:39', '2025-03-02 15:08:39'),
(819, 6, 1, '0', 10.00, '2025-03-02 17:16:44', '2025-03-02 17:16:44'),
(820, 6, 2, '0', 50.00, '2025-03-02 17:16:44', '2025-03-02 17:16:44'),
(821, 6, 3, '0', 250.00, '2025-03-02 17:16:44', '2025-03-02 17:16:44'),
(822, 6, 4, '0', 500.00, '2025-03-02 17:16:44', '2025-03-02 17:16:44'),
(823, 6, 5, '0', 1000.00, '2025-03-02 17:16:44', '2025-03-02 17:16:44'),
(824, 7, 1, '0', 10.00, '2025-03-05 08:44:45', '2025-03-05 08:44:45'),
(825, 7, 2, '0', 50.00, '2025-03-05 08:44:45', '2025-03-05 08:44:45'),
(826, 7, 3, '0', 250.00, '2025-03-05 08:44:45', '2025-03-05 08:44:45'),
(827, 7, 4, '0', 500.00, '2025-03-05 08:44:45', '2025-03-05 08:44:45'),
(828, 7, 5, '0', 1000.00, '2025-03-05 08:44:45', '2025-03-05 08:44:45'),
(829, 8, 1, '0', 10.00, '2025-03-05 20:28:29', '2025-03-05 20:28:29'),
(830, 8, 2, '0', 50.00, '2025-03-05 20:28:29', '2025-03-05 20:28:29'),
(831, 8, 3, '0', 250.00, '2025-03-05 20:28:29', '2025-03-05 20:28:29'),
(832, 8, 4, '0', 500.00, '2025-03-05 20:28:29', '2025-03-05 20:28:29'),
(833, 8, 5, '0', 1000.00, '2025-03-05 20:28:29', '2025-03-05 20:28:29'),
(834, 9, 1, '0', 10.00, '2025-03-09 03:59:11', '2025-03-09 03:59:11'),
(835, 9, 2, '0', 50.00, '2025-03-09 03:59:11', '2025-03-09 03:59:11'),
(836, 9, 3, '0', 250.00, '2025-03-09 03:59:11', '2025-03-09 03:59:11'),
(837, 9, 4, '0', 500.00, '2025-03-09 03:59:11', '2025-03-09 03:59:11'),
(838, 9, 5, '0', 1000.00, '2025-03-09 03:59:11', '2025-03-09 03:59:11'),
(839, 10, 1, '0', 10.00, '2025-03-09 17:24:00', '2025-03-09 17:24:00'),
(840, 10, 2, '0', 50.00, '2025-03-09 17:24:00', '2025-03-09 17:24:00'),
(841, 10, 3, '0', 250.00, '2025-03-09 17:24:00', '2025-03-09 17:24:00'),
(842, 10, 4, '0', 500.00, '2025-03-09 17:24:00', '2025-03-09 17:24:00'),
(843, 10, 5, '0', 1000.00, '2025-03-09 17:24:00', '2025-03-09 17:24:00'),
(844, 11, 1, '0', 10.00, '2025-03-11 18:28:59', '2025-03-11 18:28:59'),
(845, 11, 2, '0', 50.00, '2025-03-11 18:28:59', '2025-03-11 18:28:59'),
(846, 11, 3, '0', 250.00, '2025-03-11 18:28:59', '2025-03-11 18:28:59'),
(847, 11, 4, '0', 500.00, '2025-03-11 18:28:59', '2025-03-11 18:28:59'),
(848, 11, 5, '0', 1000.00, '2025-03-11 18:28:59', '2025-03-11 18:28:59'),
(849, 12, 1, '0', 10.00, '2025-03-13 12:04:49', '2025-03-13 12:04:49'),
(850, 12, 2, '0', 50.00, '2025-03-13 12:04:49', '2025-03-13 12:04:49'),
(851, 12, 3, '0', 250.00, '2025-03-13 12:04:49', '2025-03-13 12:04:49'),
(852, 12, 4, '0', 500.00, '2025-03-13 12:04:49', '2025-03-13 12:04:49'),
(853, 12, 5, '0', 1000.00, '2025-03-13 12:04:49', '2025-03-13 12:04:49'),
(854, 13, 1, '0', 10.00, '2025-03-16 20:29:46', '2025-03-16 20:29:46'),
(855, 13, 2, '0', 50.00, '2025-03-16 20:29:46', '2025-03-16 20:29:46'),
(856, 13, 3, '0', 250.00, '2025-03-16 20:29:46', '2025-03-16 20:29:46'),
(857, 13, 4, '0', 500.00, '2025-03-16 20:29:46', '2025-03-16 20:29:46'),
(858, 13, 5, '0', 1000.00, '2025-03-16 20:29:46', '2025-03-16 20:29:46'),
(859, 14, 1, '0', 10.00, '2025-03-16 22:50:54', '2025-03-16 22:50:54'),
(860, 14, 2, '0', 50.00, '2025-03-16 22:50:54', '2025-03-16 22:50:54'),
(861, 14, 3, '0', 250.00, '2025-03-16 22:50:54', '2025-03-16 22:50:54'),
(862, 14, 4, '0', 500.00, '2025-03-16 22:50:54', '2025-03-16 22:50:54'),
(863, 14, 5, '0', 1000.00, '2025-03-16 22:50:54', '2025-03-16 22:50:54'),
(864, 15, 1, '0', 10.00, '2025-03-17 23:03:54', '2025-03-17 23:03:54'),
(865, 15, 2, '0', 50.00, '2025-03-17 23:03:54', '2025-03-17 23:03:54'),
(866, 15, 3, '0', 250.00, '2025-03-17 23:03:54', '2025-03-17 23:03:54'),
(867, 15, 4, '0', 500.00, '2025-03-17 23:03:54', '2025-03-17 23:03:54'),
(868, 15, 5, '0', 1000.00, '2025-03-17 23:03:54', '2025-03-17 23:03:54'),
(869, 16, 1, '0', 10.00, '2025-03-18 19:29:42', '2025-03-18 19:29:42'),
(870, 16, 2, '0', 50.00, '2025-03-18 19:29:42', '2025-03-18 19:29:42'),
(871, 16, 3, '0', 250.00, '2025-03-18 19:29:42', '2025-03-18 19:29:42'),
(872, 16, 4, '0', 500.00, '2025-03-18 19:29:42', '2025-03-18 19:29:42'),
(873, 16, 5, '0', 1000.00, '2025-03-18 19:29:42', '2025-03-18 19:29:42'),
(874, 17, 1, '0', 10.00, '2025-03-19 20:26:36', '2025-03-19 20:26:36'),
(875, 17, 2, '0', 50.00, '2025-03-19 20:26:36', '2025-03-19 20:26:36'),
(876, 17, 3, '0', 250.00, '2025-03-19 20:26:36', '2025-03-19 20:26:36'),
(877, 17, 4, '0', 500.00, '2025-03-19 20:26:36', '2025-03-19 20:26:36'),
(878, 17, 5, '0', 1000.00, '2025-03-19 20:26:36', '2025-03-19 20:26:36'),
(879, 18, 1, '0', 10.00, '2025-03-21 02:36:52', '2025-03-21 02:36:52'),
(880, 18, 2, '0', 50.00, '2025-03-21 02:36:52', '2025-03-21 02:36:52'),
(881, 18, 3, '0', 250.00, '2025-03-21 02:36:52', '2025-03-21 02:36:52'),
(882, 18, 4, '0', 500.00, '2025-03-21 02:36:52', '2025-03-21 02:36:52'),
(883, 18, 5, '0', 1000.00, '2025-03-21 02:36:52', '2025-03-21 02:36:52'),
(884, 19, 1, '0', 10.00, '2025-03-21 22:52:46', '2025-03-21 22:52:46'),
(885, 19, 2, '0', 50.00, '2025-03-21 22:52:46', '2025-03-21 22:52:46'),
(886, 19, 3, '0', 250.00, '2025-03-21 22:52:46', '2025-03-21 22:52:46'),
(887, 19, 4, '0', 500.00, '2025-03-21 22:52:46', '2025-03-21 22:52:46'),
(888, 19, 5, '0', 1000.00, '2025-03-21 22:52:46', '2025-03-21 22:52:46'),
(889, 20, 1, '0', 10.00, '2025-03-22 20:12:16', '2025-03-22 20:12:16'),
(890, 20, 2, '0', 50.00, '2025-03-22 20:12:16', '2025-03-22 20:12:16'),
(891, 20, 3, '0', 250.00, '2025-03-22 20:12:16', '2025-03-22 20:12:16'),
(892, 20, 4, '0', 500.00, '2025-03-22 20:12:16', '2025-03-22 20:12:16'),
(893, 20, 5, '0', 1000.00, '2025-03-22 20:12:16', '2025-03-22 20:12:16'),
(894, 21, 1, '0', 10.00, '2025-03-23 20:45:52', '2025-03-23 20:45:52'),
(895, 21, 2, '0', 50.00, '2025-03-23 20:45:52', '2025-03-23 20:45:52'),
(896, 21, 3, '0', 250.00, '2025-03-23 20:45:52', '2025-03-23 20:45:52'),
(897, 21, 4, '0', 500.00, '2025-03-23 20:45:52', '2025-03-23 20:45:52'),
(898, 21, 5, '0', 1000.00, '2025-03-23 20:45:52', '2025-03-23 20:45:52'),
(899, 22, 1, '0', 10.00, '2025-06-03 19:33:08', '2025-06-03 19:33:08'),
(900, 22, 2, '0', 50.00, '2025-06-03 19:33:08', '2025-06-03 19:33:08'),
(901, 22, 3, '0', 250.00, '2025-06-03 19:33:08', '2025-06-03 19:33:08'),
(902, 22, 4, '0', 500.00, '2025-06-03 19:33:08', '2025-06-03 19:33:08'),
(903, 22, 5, '0', 1000.00, '2025-06-03 19:33:08', '2025-06-03 19:33:08'),
(904, 23, 1, '0', 10.00, '2025-06-03 22:07:41', '2025-06-03 22:07:41'),
(905, 23, 2, '0', 50.00, '2025-06-03 22:07:41', '2025-06-03 22:07:41'),
(906, 23, 3, '0', 250.00, '2025-06-03 22:07:41', '2025-06-03 22:07:41'),
(907, 23, 4, '0', 500.00, '2025-06-03 22:07:41', '2025-06-03 22:07:41'),
(908, 23, 5, '0', 1000.00, '2025-06-03 22:07:41', '2025-06-03 22:07:41'),
(909, 24, 1, '0', 10.00, '2025-06-03 23:00:22', '2025-06-03 23:00:22'),
(910, 24, 2, '0', 50.00, '2025-06-03 23:00:22', '2025-06-03 23:00:22'),
(911, 24, 3, '0', 250.00, '2025-06-03 23:00:22', '2025-06-03 23:00:22'),
(912, 24, 4, '0', 500.00, '2025-06-03 23:00:22', '2025-06-03 23:00:22'),
(913, 24, 5, '0', 1000.00, '2025-06-03 23:00:22', '2025-06-03 23:00:22'),
(914, 25, 1, '0', 10.00, '2025-06-04 08:11:34', '2025-06-04 08:11:34'),
(915, 25, 2, '0', 50.00, '2025-06-04 08:11:34', '2025-06-04 08:11:34'),
(916, 25, 3, '0', 250.00, '2025-06-04 08:11:34', '2025-06-04 08:11:34'),
(917, 25, 4, '0', 500.00, '2025-06-04 08:11:34', '2025-06-04 08:11:34'),
(918, 25, 5, '0', 1000.00, '2025-06-04 08:11:34', '2025-06-04 08:11:34'),
(919, 26, 1, '0', 10.00, '2025-06-04 08:34:00', '2025-06-04 08:34:00'),
(920, 26, 2, '0', 50.00, '2025-06-04 08:34:00', '2025-06-04 08:34:00'),
(921, 26, 3, '0', 250.00, '2025-06-04 08:34:00', '2025-06-04 08:34:00'),
(922, 26, 4, '0', 500.00, '2025-06-04 08:34:00', '2025-06-04 08:34:00'),
(923, 26, 5, '0', 1000.00, '2025-06-04 08:34:00', '2025-06-04 08:34:00'),
(924, 27, 1, '0', 10.00, '2025-06-04 09:22:41', '2025-06-04 09:22:41'),
(925, 27, 2, '0', 50.00, '2025-06-04 09:22:41', '2025-06-04 09:22:41'),
(926, 27, 3, '0', 250.00, '2025-06-04 09:22:41', '2025-06-04 09:22:41'),
(927, 27, 4, '0', 500.00, '2025-06-04 09:22:41', '2025-06-04 09:22:41'),
(928, 27, 5, '0', 1000.00, '2025-06-04 09:22:41', '2025-06-04 09:22:41'),
(929, 28, 1, '0', 10.00, '2025-06-04 13:49:29', '2025-06-04 13:49:29'),
(930, 28, 2, '0', 50.00, '2025-06-04 13:49:29', '2025-06-04 13:49:29'),
(931, 28, 3, '0', 250.00, '2025-06-04 13:49:29', '2025-06-04 13:49:29'),
(932, 28, 4, '0', 500.00, '2025-06-04 13:49:29', '2025-06-04 13:49:29'),
(933, 28, 5, '0', 1000.00, '2025-06-04 13:49:29', '2025-06-04 13:49:29'),
(934, 29, 1, '0', 10.00, '2025-06-04 14:08:07', '2025-06-04 14:08:07'),
(935, 29, 2, '0', 50.00, '2025-06-04 14:08:07', '2025-06-04 14:08:07'),
(936, 29, 3, '0', 250.00, '2025-06-04 14:08:07', '2025-06-04 14:08:07'),
(937, 29, 4, '0', 500.00, '2025-06-04 14:08:07', '2025-06-04 14:08:07'),
(938, 29, 5, '0', 1000.00, '2025-06-04 14:08:07', '2025-06-04 14:08:07'),
(939, 30, 1, '0', 10.00, '2025-06-04 17:23:02', '2025-06-04 17:23:02'),
(940, 30, 2, '0', 50.00, '2025-06-04 17:23:02', '2025-06-04 17:23:02'),
(941, 30, 3, '0', 250.00, '2025-06-04 17:23:02', '2025-06-04 17:23:02'),
(942, 30, 4, '0', 500.00, '2025-06-04 17:23:02', '2025-06-04 17:23:02'),
(943, 30, 5, '0', 1000.00, '2025-06-04 17:23:02', '2025-06-04 17:23:02'),
(944, 31, 1, '0', 10.00, '2025-06-04 19:18:30', '2025-06-04 19:18:30'),
(945, 31, 2, '0', 50.00, '2025-06-04 19:18:30', '2025-06-04 19:18:30'),
(946, 31, 3, '0', 250.00, '2025-06-04 19:18:30', '2025-06-04 19:18:30'),
(947, 31, 4, '0', 500.00, '2025-06-04 19:18:30', '2025-06-04 19:18:30'),
(948, 31, 5, '0', 1000.00, '2025-06-04 19:18:30', '2025-06-04 19:18:30'),
(949, 32, 1, '0', 10.00, '2025-06-05 13:01:31', '2025-06-05 13:01:31'),
(950, 32, 2, '0', 50.00, '2025-06-05 13:01:31', '2025-06-05 13:01:31'),
(951, 32, 3, '0', 250.00, '2025-06-05 13:01:31', '2025-06-05 13:01:31'),
(952, 32, 4, '0', 500.00, '2025-06-05 13:01:31', '2025-06-05 13:01:31'),
(953, 32, 5, '0', 1000.00, '2025-06-05 13:01:31', '2025-06-05 13:01:31'),
(954, 33, 1, '0', 10.00, '2025-06-05 14:54:27', '2025-06-05 14:54:27'),
(955, 33, 2, '0', 50.00, '2025-06-05 14:54:27', '2025-06-05 14:54:27'),
(956, 33, 3, '0', 250.00, '2025-06-05 14:54:27', '2025-06-05 14:54:27'),
(957, 33, 4, '0', 500.00, '2025-06-05 14:54:27', '2025-06-05 14:54:27'),
(958, 33, 5, '0', 1000.00, '2025-06-05 14:54:27', '2025-06-05 14:54:27'),
(959, 34, 1, '0', 10.00, '2025-06-06 02:02:38', '2025-06-06 02:02:38'),
(960, 34, 2, '0', 50.00, '2025-06-06 02:02:38', '2025-06-06 02:02:38'),
(961, 34, 3, '0', 250.00, '2025-06-06 02:02:38', '2025-06-06 02:02:38'),
(962, 34, 4, '0', 500.00, '2025-06-06 02:02:38', '2025-06-06 02:02:38'),
(963, 34, 5, '0', 1000.00, '2025-06-06 02:02:38', '2025-06-06 02:02:38'),
(964, 35, 1, '0', 10.00, '2025-06-06 18:59:09', '2025-06-06 18:59:09'),
(965, 35, 2, '0', 50.00, '2025-06-06 18:59:09', '2025-06-06 18:59:09'),
(966, 35, 3, '0', 250.00, '2025-06-06 18:59:09', '2025-06-06 18:59:09'),
(967, 35, 4, '0', 500.00, '2025-06-06 18:59:09', '2025-06-06 18:59:09'),
(968, 35, 5, '0', 1000.00, '2025-06-06 18:59:09', '2025-06-06 18:59:09'),
(969, 36, 1, '0', 10.00, '2025-06-07 09:44:07', '2025-06-07 09:44:07'),
(970, 36, 2, '0', 50.00, '2025-06-07 09:44:07', '2025-06-07 09:44:07'),
(971, 36, 3, '0', 250.00, '2025-06-07 09:44:07', '2025-06-07 09:44:07'),
(972, 36, 4, '0', 500.00, '2025-06-07 09:44:07', '2025-06-07 09:44:07'),
(973, 36, 5, '0', 1000.00, '2025-06-07 09:44:07', '2025-06-07 09:44:07'),
(974, 37, 1, '0', 10.00, '2025-06-10 06:24:45', '2025-06-10 06:24:45'),
(975, 37, 2, '0', 50.00, '2025-06-10 06:24:45', '2025-06-10 06:24:45'),
(976, 37, 3, '0', 250.00, '2025-06-10 06:24:45', '2025-06-10 06:24:45'),
(977, 37, 4, '0', 500.00, '2025-06-10 06:24:45', '2025-06-10 06:24:45'),
(978, 37, 5, '0', 1000.00, '2025-06-10 06:24:45', '2025-06-10 06:24:45'),
(979, 38, 1, '0', 10.00, '2025-06-14 13:57:20', '2025-06-14 13:57:20'),
(980, 38, 2, '0', 50.00, '2025-06-14 13:57:20', '2025-06-14 13:57:20'),
(981, 38, 3, '0', 250.00, '2025-06-14 13:57:20', '2025-06-14 13:57:20'),
(982, 38, 4, '0', 500.00, '2025-06-14 13:57:20', '2025-06-14 13:57:20'),
(983, 38, 5, '0', 1000.00, '2025-06-14 13:57:20', '2025-06-14 13:57:20'),
(984, 39, 1, '0', 10.00, '2025-06-14 14:07:02', '2025-06-14 14:07:02'),
(985, 39, 2, '0', 50.00, '2025-06-14 14:07:02', '2025-06-14 14:07:02'),
(986, 39, 3, '0', 250.00, '2025-06-14 14:07:02', '2025-06-14 14:07:02'),
(987, 39, 4, '0', 500.00, '2025-06-14 14:07:02', '2025-06-14 14:07:02'),
(988, 39, 5, '0', 1000.00, '2025-06-14 14:07:02', '2025-06-14 14:07:02'),
(989, 40, 1, '0', 10.00, '2025-06-16 18:07:47', '2025-06-16 18:07:47'),
(990, 40, 2, '0', 50.00, '2025-06-16 18:07:47', '2025-06-16 18:07:47'),
(991, 40, 3, '0', 250.00, '2025-06-16 18:07:47', '2025-06-16 18:07:47'),
(992, 40, 4, '0', 500.00, '2025-06-16 18:07:47', '2025-06-16 18:07:47'),
(993, 40, 5, '0', 1000.00, '2025-06-16 18:07:47', '2025-06-16 18:07:47'),
(994, 41, 1, '0', 10.00, '2025-06-16 18:41:27', '2025-06-16 18:41:27'),
(995, 41, 2, '0', 50.00, '2025-06-16 18:41:27', '2025-06-16 18:41:27'),
(996, 41, 3, '0', 250.00, '2025-06-16 18:41:27', '2025-06-16 18:41:27'),
(997, 41, 4, '0', 500.00, '2025-06-16 18:41:27', '2025-06-16 18:41:27'),
(998, 41, 5, '0', 1000.00, '2025-06-16 18:41:27', '2025-06-16 18:41:27'),
(999, 42, 1, '0', 10.00, '2025-06-16 20:02:00', '2025-06-16 20:02:00'),
(1000, 42, 2, '0', 50.00, '2025-06-16 20:02:00', '2025-06-16 20:02:00'),
(1001, 42, 3, '0', 250.00, '2025-06-16 20:02:00', '2025-06-16 20:02:00'),
(1002, 42, 4, '0', 500.00, '2025-06-16 20:02:00', '2025-06-16 20:02:00'),
(1003, 42, 5, '0', 1000.00, '2025-06-16 20:02:00', '2025-06-16 20:02:00'),
(1004, 43, 1, '0', 10.00, '2025-06-16 21:20:11', '2025-06-16 21:20:11'),
(1005, 43, 2, '0', 50.00, '2025-06-16 21:20:11', '2025-06-16 21:20:11'),
(1006, 43, 3, '0', 250.00, '2025-06-16 21:20:11', '2025-06-16 21:20:11'),
(1007, 43, 4, '0', 500.00, '2025-06-16 21:20:11', '2025-06-16 21:20:11'),
(1008, 43, 5, '0', 1000.00, '2025-06-16 21:20:11', '2025-06-16 21:20:11'),
(1009, 44, 1, '0', 10.00, '2025-06-17 18:41:33', '2025-06-17 18:41:33'),
(1010, 44, 2, '0', 50.00, '2025-06-17 18:41:33', '2025-06-17 18:41:33'),
(1011, 44, 3, '0', 250.00, '2025-06-17 18:41:33', '2025-06-17 18:41:33'),
(1012, 44, 4, '0', 500.00, '2025-06-17 18:41:33', '2025-06-17 18:41:33'),
(1013, 44, 5, '0', 1000.00, '2025-06-17 18:41:33', '2025-06-17 18:41:33'),
(1014, 45, 1, '0', 10.00, '2025-06-17 21:45:18', '2025-06-17 21:45:18'),
(1015, 45, 2, '0', 50.00, '2025-06-17 21:45:18', '2025-06-17 21:45:18'),
(1016, 45, 3, '0', 250.00, '2025-06-17 21:45:18', '2025-06-17 21:45:18'),
(1017, 45, 4, '0', 500.00, '2025-06-17 21:45:18', '2025-06-17 21:45:18'),
(1018, 45, 5, '0', 1000.00, '2025-06-17 21:45:18', '2025-06-17 21:45:18'),
(1019, 46, 1, '0', 10.00, '2025-06-17 22:43:34', '2025-06-17 22:43:34'),
(1020, 46, 2, '0', 50.00, '2025-06-17 22:43:34', '2025-06-17 22:43:34'),
(1021, 46, 3, '0', 250.00, '2025-06-17 22:43:34', '2025-06-17 22:43:34'),
(1022, 46, 4, '0', 500.00, '2025-06-17 22:43:34', '2025-06-17 22:43:34'),
(1023, 46, 5, '0', 1000.00, '2025-06-17 22:43:34', '2025-06-17 22:43:34'),
(1024, 47, 1, '0', 10.00, '2025-06-18 04:30:52', '2025-06-18 04:30:52'),
(1025, 47, 2, '0', 50.00, '2025-06-18 04:30:52', '2025-06-18 04:30:52'),
(1026, 47, 3, '0', 250.00, '2025-06-18 04:30:52', '2025-06-18 04:30:52'),
(1027, 47, 4, '0', 500.00, '2025-06-18 04:30:52', '2025-06-18 04:30:52'),
(1028, 47, 5, '0', 1000.00, '2025-06-18 04:30:52', '2025-06-18 04:30:52'),
(1029, 48, 1, '0', 10.00, '2025-06-19 20:26:17', '2025-06-19 20:26:17'),
(1030, 48, 2, '0', 50.00, '2025-06-19 20:26:17', '2025-06-19 20:26:17'),
(1031, 48, 3, '0', 250.00, '2025-06-19 20:26:17', '2025-06-19 20:26:17'),
(1032, 48, 4, '0', 500.00, '2025-06-19 20:26:17', '2025-06-19 20:26:17'),
(1033, 48, 5, '0', 1000.00, '2025-06-19 20:26:17', '2025-06-19 20:26:17'),
(1034, 49, 1, '0', 10.00, '2025-06-20 00:55:23', '2025-06-20 00:55:23'),
(1035, 49, 2, '0', 50.00, '2025-06-20 00:55:23', '2025-06-20 00:55:23'),
(1036, 49, 3, '0', 250.00, '2025-06-20 00:55:23', '2025-06-20 00:55:23'),
(1037, 49, 4, '0', 500.00, '2025-06-20 00:55:23', '2025-06-20 00:55:23'),
(1038, 49, 5, '0', 1000.00, '2025-06-20 00:55:23', '2025-06-20 00:55:23'),
(1039, 50, 1, '0', 10.00, '2025-06-23 13:26:57', '2025-06-23 13:26:57'),
(1040, 50, 2, '0', 50.00, '2025-06-23 13:26:57', '2025-06-23 13:26:57'),
(1041, 50, 3, '0', 250.00, '2025-06-23 13:26:57', '2025-06-23 13:26:57'),
(1042, 50, 4, '0', 500.00, '2025-06-23 13:26:57', '2025-06-23 13:26:57'),
(1043, 50, 5, '0', 1000.00, '2025-06-23 13:26:57', '2025-06-23 13:26:57'),
(1044, 51, 1, '0', 10.00, '2025-06-23 14:16:36', '2025-06-23 14:16:36'),
(1045, 51, 2, '0', 50.00, '2025-06-23 14:16:36', '2025-06-23 14:16:36'),
(1046, 51, 3, '0', 250.00, '2025-06-23 14:16:36', '2025-06-23 14:16:36'),
(1047, 51, 4, '0', 500.00, '2025-06-23 14:16:36', '2025-06-23 14:16:36'),
(1048, 51, 5, '0', 1000.00, '2025-06-23 14:16:36', '2025-06-23 14:16:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mission_id` int(10) UNSIGNED NOT NULL,
  `rounds` bigint(20) DEFAULT 0,
  `rewards` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wallet_mission` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 51),
(2, 'App\\Models\\User', 78),
(2, 'App\\Models\\User', 82),
(2, 'App\\Models\\User', 83),
(2, 'App\\Models\\User', 84),
(2, 'App\\Models\\User', 85),
(2, 'App\\Models\\User', 86),
(2, 'App\\Models\\User', 87),
(2, 'App\\Models\\User', 92),
(2, 'App\\Models\\User', 93),
(2, 'App\\Models\\User', 94),
(2, 'App\\Models\\User', 95),
(2, 'App\\Models\\User', 96),
(2, 'App\\Models\\User', 97),
(2, 'App\\Models\\User', 98),
(2, 'App\\Models\\User', 100),
(2, 'App\\Models\\User', 104),
(2, 'App\\Models\\User', 105),
(2, 'App\\Models\\User', 106),
(2, 'App\\Models\\User', 107),
(2, 'App\\Models\\User', 108),
(2, 'App\\Models\\User', 109),
(2, 'App\\Models\\User', 111),
(2, 'App\\Models\\User', 112),
(2, 'App\\Models\\User', 141),
(2, 'App\\Models\\User', 142),
(2, 'App\\Models\\User', 143),
(2, 'App\\Models\\User', 144),
(2, 'App\\Models\\User', 145),
(2, 'App\\Models\\User', 146),
(2, 'App\\Models\\User', 159),
(2, 'App\\Models\\User', 160),
(2, 'App\\Models\\User', 161),
(2, 'App\\Models\\User', 162),
(2, 'App\\Models\\User', 163),
(2, 'App\\Models\\User', 164),
(2, 'App\\Models\\User', 165),
(2, 'App\\Models\\User', 166),
(2, 'App\\Models\\User', 167),
(2, 'App\\Models\\User', 168),
(2, 'App\\Models\\User', 169),
(2, 'App\\Models\\User', 170),
(2, 'App\\Models\\User', 171),
(2, 'App\\Models\\User', 172),
(2, 'App\\Models\\User', 173),
(2, 'App\\Models\\User', 174),
(2, 'App\\Models\\User', 175),
(2, 'App\\Models\\User', 176),
(2, 'App\\Models\\User', 177),
(2, 'App\\Models\\User', 178),
(2, 'App\\Models\\User', 179),
(2, 'App\\Models\\User', 180),
(2, 'App\\Models\\User', 181),
(2, 'App\\Models\\User', 182),
(2, 'App\\Models\\User', 183),
(2, 'App\\Models\\User', 184),
(2, 'App\\Models\\User', 185),
(2, 'App\\Models\\User', 186),
(2, 'App\\Models\\User', 187),
(2, 'App\\Models\\User', 17484566),
(2, 'App\\Models\\User', 17484567),
(2, 'App\\Models\\User', 17484568),
(2, 'App\\Models\\User', 17484569),
(2, 'App\\Models\\User', 17484570),
(2, 'App\\Models\\User', 17484571),
(2, 'App\\Models\\User', 17484572),
(2, 'App\\Models\\User', 17484573),
(2, 'App\\Models\\User', 17484574),
(2, 'App\\Models\\User', 17484575),
(2, 'App\\Models\\User', 17484576),
(2, 'App\\Models\\User', 17484577),
(2, 'App\\Models\\User', 17484578),
(2, 'App\\Models\\User', 17484579),
(2, 'App\\Models\\User', 17484580),
(2, 'App\\Models\\User', 17484581),
(2, 'App\\Models\\User', 17484582),
(2, 'App\\Models\\User', 17484583),
(2, 'App\\Models\\User', 17484584),
(2, 'App\\Models\\User', 17484585),
(2, 'App\\Models\\User', 17484586),
(2, 'App\\Models\\User', 17484587),
(2, 'App\\Models\\User', 17484588),
(2, 'App\\Models\\User', 17484589),
(2, 'App\\Models\\User', 17484590),
(2, 'App\\Models\\User', 17484591),
(2, 'App\\Models\\User', 17484592),
(2, 'App\\Models\\User', 17484593),
(2, 'App\\Models\\User', 17484594),
(2, 'App\\Models\\User', 17484595),
(2, 'App\\Models\\User', 17484596),
(2, 'App\\Models\\User', 17484597),
(2, 'App\\Models\\User', 17484598),
(2, 'App\\Models\\User', 17484599),
(2, 'App\\Models\\User', 17484600),
(2, 'App\\Models\\User', 17484601),
(2, 'App\\Models\\User', 17484602),
(2, 'App\\Models\\User', 17484603),
(2, 'App\\Models\\User', 17484604),
(2, 'App\\Models\\User', 17484605),
(2, 'App\\Models\\User', 17484606),
(2, 'App\\Models\\User', 17484607),
(2, 'App\\Models\\User', 17484608),
(2, 'App\\Models\\User', 17484609),
(2, 'App\\Models\\User', 17484611),
(2, 'App\\Models\\User', 17484612),
(2, 'App\\Models\\User', 17484613),
(2, 'App\\Models\\User', 17484614),
(2, 'App\\Models\\User', 17484615),
(2, 'App\\Models\\User', 17484616),
(2, 'App\\Models\\User', 17484617),
(2, 'App\\Models\\User', 17484618),
(2, 'App\\Models\\User', 17484619),
(2, 'App\\Models\\User', 17484620),
(2, 'App\\Models\\User', 17484621),
(2, 'App\\Models\\User', 17484622),
(2, 'App\\Models\\User', 17484623),
(2, 'App\\Models\\User', 17484624),
(2, 'App\\Models\\User', 17484625),
(2, 'App\\Models\\User', 17484626),
(2, 'App\\Models\\User', 17484627),
(2, 'App\\Models\\User', 17484628),
(2, 'App\\Models\\User', 17484629),
(2, 'App\\Models\\User', 17484630),
(2, 'App\\Models\\User', 17484631),
(2, 'App\\Models\\User', 17484632),
(2, 'App\\Models\\User', 17484633),
(2, 'App\\Models\\User', 17484634),
(2, 'App\\Models\\User', 17484635),
(2, 'App\\Models\\User', 17484636),
(2, 'App\\Models\\User', 17484637),
(2, 'App\\Models\\User', 17484638),
(2, 'App\\Models\\User', 17484639),
(2, 'App\\Models\\User', 17484645),
(2, 'App\\Models\\User', 17484646),
(2, 'App\\Models\\User', 17484647),
(2, 'App\\Models\\User', 17484648),
(2, 'App\\Models\\User', 17484653),
(2, 'App\\Models\\User', 17484654),
(2, 'App\\Models\\User', 17484656),
(2, 'App\\Models\\User', 17484657),
(2, 'App\\Models\\User', 17484658),
(2, 'App\\Models\\User', 17484659),
(2, 'App\\Models\\User', 17484660),
(2, 'App\\Models\\User', 17484661),
(2, 'App\\Models\\User', 17484662),
(2, 'App\\Models\\User', 17484663),
(2, 'App\\Models\\User', 17484664),
(2, 'App\\Models\\User', 17484665),
(2, 'App\\Models\\User', 17484666),
(2, 'App\\Models\\User', 17484667),
(2, 'App\\Models\\User', 17484668),
(2, 'App\\Models\\User', 17484669),
(2, 'App\\Models\\User', 17484670),
(2, 'App\\Models\\User', 17484671),
(2, 'App\\Models\\User', 17484672),
(2, 'App\\Models\\User', 17484673),
(2, 'App\\Models\\User', 17484674),
(2, 'App\\Models\\User', 17484675),
(2, 'App\\Models\\User', 17484676),
(2, 'App\\Models\\User', 17484677),
(2, 'App\\Models\\User', 17484678),
(2, 'App\\Models\\User', 17484679),
(2, 'App\\Models\\User', 17484680),
(2, 'App\\Models\\User', 17484681),
(2, 'App\\Models\\User', 17484682),
(2, 'App\\Models\\User', 17484683),
(2, 'App\\Models\\User', 17484684),
(2, 'App\\Models\\User', 17484685),
(2, 'App\\Models\\User', 17484686),
(2, 'App\\Models\\User', 17484687),
(2, 'App\\Models\\User', 17484688),
(2, 'App\\Models\\User', 17484689),
(2, 'App\\Models\\User', 17484690),
(2, 'App\\Models\\User', 17484691),
(2, 'App\\Models\\User', 17484692),
(2, 'App\\Models\\User', 17484693),
(2, 'App\\Models\\User', 17484694),
(2, 'App\\Models\\User', 17484695),
(2, 'App\\Models\\User', 17484696),
(2, 'App\\Models\\User', 17484697),
(2, 'App\\Models\\User', 17484698),
(2, 'App\\Models\\User', 17484699),
(2, 'App\\Models\\User', 17484700),
(2, 'App\\Models\\User', 17484701),
(2, 'App\\Models\\User', 17484702),
(2, 'App\\Models\\User', 17484703),
(2, 'App\\Models\\User', 17484704),
(2, 'App\\Models\\User', 17484705),
(2, 'App\\Models\\User', 17484706),
(2, 'App\\Models\\User', 17484707),
(2, 'App\\Models\\User', 17484708),
(2, 'App\\Models\\User', 17484709),
(2, 'App\\Models\\User', 17484710),
(2, 'App\\Models\\User', 17484711),
(2, 'App\\Models\\User', 17484712),
(2, 'App\\Models\\User', 17484713),
(2, 'App\\Models\\User', 17484714),
(2, 'App\\Models\\User', 17484715),
(2, 'App\\Models\\User', 17484716),
(2, 'App\\Models\\User', 17484717),
(2, 'App\\Models\\User', 17484718),
(2, 'App\\Models\\User', 17484719),
(2, 'App\\Models\\User', 17484720),
(2, 'App\\Models\\User', 17484721),
(2, 'App\\Models\\User', 17484722),
(2, 'App\\Models\\User', 17484723),
(2, 'App\\Models\\User', 17484724),
(2, 'App\\Models\\User', 17484725),
(2, 'App\\Models\\User', 17484726),
(2, 'App\\Models\\User', 17484727),
(2, 'App\\Models\\User', 17484728),
(2, 'App\\Models\\User', 17484729),
(2, 'App\\Models\\User', 17484730),
(2, 'App\\Models\\User', 17484731),
(2, 'App\\Models\\User', 17484732),
(2, 'App\\Models\\User', 17484733),
(2, 'App\\Models\\User', 17484734),
(2, 'App\\Models\\User', 17484735);

-- --------------------------------------------------------

--
-- Estrutura para tabela `music`
--

CREATE TABLE `music` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `music`
--

INSERT INTO `music` (`id`, `name`, `path`, `created_at`, `updated_at`) VALUES
(2, 'You Spin Me Round', 'music/01J4E2SB085N1409SMP9WZNTQC.mp3', '2024-08-04 06:56:15', '2024-08-04 06:56:15'),
(3, 'Yesterday', 'music/01J4E2WSHNF1TQMZG55XZKWDMG.mp3', '2024-08-04 06:58:08', '2024-08-04 06:58:08'),
(4, 'See You Again', 'music/01J4E2X8PZBBV30W782F1P7518.mp3', '2024-08-04 06:58:24', '2024-08-04 06:58:24'),
(5, 'Without You', 'music/01J4E2XRSTXVYT4ZXV7Z0AX12W.mp3', '2024-08-04 06:58:40', '2024-08-04 06:58:40'),
(6, 'Will Smith 9. Live It Up', 'music/01J4E2YZYVG89TZZN56XKEYJ9P.mp3', '2024-08-04 06:59:20', '2024-08-04 06:59:20'),
(7, 'Waiting For Love', 'music/01J4E300WNHP4S2CGTY6CTTBJS.mp3', '2024-08-04 06:59:54', '2024-08-04 06:59:54'),
(8, 'Wait Wait Wait', 'music/01J4E30FP0QWCKJRVX8HXZJXS5.mp3', '2024-08-04 07:00:09', '2024-08-04 07:00:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `game` varchar(191) NOT NULL,
  `game_uuid` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_money` varchar(50) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `providers` varchar(191) NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `round_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hash` varchar(191) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
(5, 'admin-create', 'web', '2023-10-12 18:56:02', '2023-10-12 18:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 18:56:27', '2023-10-12 18:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 18:56:55', '2023-10-12 18:56:55'),
(8, 'category-view', 'web', '2023-10-12 19:01:31', '2023-10-12 19:01:31'),
(9, 'category-create', 'web', '2023-10-12 19:01:46', '2023-10-12 19:01:46'),
(10, 'category-edit', 'web', '2023-10-12 19:01:59', '2023-10-12 19:01:59'),
(11, 'category-delete', 'web', '2023-10-12 19:02:09', '2023-10-12 19:02:09'),
(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 19:06:18', '2023-10-12 19:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 19:06:44', '2023-10-12 19:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_notifications`
--

CREATE TABLE `post_notifications` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `post_notifications`
--

INSERT INTO `post_notifications` (`id`, `imagem`, `titulo`, `message`, `created_at`, `updated_at`) VALUES
(3, '01J5SXQGMYJPB7NZANG48BCA5M.png', 'Bem-vindo a Bordo! Explore o Melhor da Nossa Plataforma', 'Bem-vindo a bordo! Estamos felizes em ter você em nossa plataforma e empolgados para acompanhá-lo em cada passo desta jornada. Aqui, você encontrará ferramentas e recursos projetados para facilitar sua experiência e ajudar a alcançar seus objetivos. Nossa', '2024-08-21 07:34:25', '2024-08-21 07:34:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `rtp` bigint(20) DEFAULT 90,
  `views` bigint(20) DEFAULT 1,
  `distribution` varchar(50) DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(1, 'Provedores/PGSOFT.webp', 'PGSOFT', 'PGSOFT', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(2, 'Provedores/PRAGMATIC.webp', 'PRAGMATIC', 'PRAGMATIC', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(3, 'Provedores/SPRIBE.webp', 'SPRIBE', 'SPRIBE', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(4, 'Provedores/GALAXSYS.webp', 'GALAXSYS', 'GALAXSYS', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(5, 'Provedores/NOVAMATIC.webp', 'NOVAMATIC', 'NOVAMATIC', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(6, 'Provedores/MICROGAMING.webp', 'MICROGAMING', 'MICROGAMING', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(7, 'Provedores/HABANERO.webp', 'HABANERO', 'HABANERO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(8, 'Provedores/PLAYNGO.webp', 'PLAYNGO', 'PLAYNGO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(9, 'Provedores/NETENT.webp', 'NETENT', 'NETENT', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(10, 'Provedores/PLAYSON.webp', 'PLAYSON', 'PLAYSON', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(11, 'Provedores/PRAGMATICLIVE.webp', 'PRAGMATICLIVE', 'PRAGMATICLIVE', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(12, 'Provedores/TOPTREND.webp', 'TOPTREND', 'TOPTREND', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(13, 'Provedores/DREAMTECH.webp', 'DREAMTECH', 'DREAMTECH', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(14, 'Provedores/EVOPLAY.webp', 'EVOPLAY', 'EVOPLAY', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(15, 'Provedores/BOOONGO.webp', 'BOOONGO', 'BOOONGO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(16, 'Provedores/CQ9.webp', 'CQ9', 'CQ9', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(17, 'Provedores/REELKINGDOM.webp', 'REELKINGDOM', 'REELKINGDOM', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(18, 'Provedores/EVOLUTION.webp', 'EVOLUTION', 'EVOLUTION', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(19, 'Provedores/JETX.webp', 'JETX', 'JETX', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 16:20:41', '2023-10-12 16:20:41'),
(2, 'afiliado', 'web', '2023-10-12 16:21:08', '2023-10-12 16:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sen_saques`
--

CREATE TABLE `sen_saques` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `valid_saque` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sen_saques`
--

INSERT INTO `sen_saques` (`id`, `user_id`, `valid_saque`, `created_at`, `updated_at`) VALUES
(1, 13, '$2y$10$K26wlbCZxWurWV/jEjy.9uuw6V5YyJywXukx8odEtQYLOPQwK.HMC', '2025-09-01 13:17:08', '2025-09-01 13:17:08'),
(2, 5, '$2y$10$B/fVt/t/lIUHB8Ilp5/Sd.RGzVxEdi5WIkqf6C8CU0uHiaNlYTWt.', '2025-09-02 09:39:11', '2025-09-02 09:39:11'),
(3, 17, '$2y$10$tdyykWvIJeW.x2t/h85O3OBCyMf8FQSYAdz81clHWZsHNiNkMpJ1K', '2025-09-02 11:59:36', '2025-09-02 11:59:36'),
(4, 23, '$2y$10$2DdJ/PpidCjoQ/N91G7e2.3zF/G.SLYKxl53XOkgK8e.NF.lIJEcy', '2025-09-02 17:55:39', '2025-09-02 17:55:39'),
(5, 27, '$2y$10$AxWkADHX96DAD8/1sytdFe1sS/GgmWbZm8X7EHKIbc4keuinBBO12', '2025-09-03 22:07:34', '2025-09-03 22:07:34'),
(6, 28, '$2y$10$HYW6x8BXls0FRqEH0/r4UuvZaZz.p.PuaXr.alyTgOPlvDPFzy0v2', '2025-09-03 23:35:24', '2025-09-03 23:35:24'),
(7, 37, '$2y$10$8a4IgGCdx/Oy8X2r5oSqBuzgM.IdHFHXbsRe4cE.f6X4wzTok4ZU2', '2025-09-05 13:56:16', '2025-09-05 13:56:16'),
(8, 11, '$2y$10$x0MIBNHxqGrJ.QmyvNfHROKu00PpWnRtxxCM/9/32a51JNB0hOQSm', '2025-09-05 20:12:35', '2025-09-05 20:12:35'),
(9, 7, '$2y$10$8jhONQF2DnvIu6kZfmt6De4Z4bF8YIOp2GQZSjSpO8t4aEq9/9HLK', '2025-09-06 15:29:18', '2025-09-06 15:29:18'),
(10, 2, '$2y$10$xkaMrCCcD5zwf/dV1Raav.nyjg/rroSsUuSpN4IpucJX0DZNhgu8C', '2026-01-26 23:10:17', '2026-01-26 23:10:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` text DEFAULT NULL,
  `software_favicon` varchar(255) DEFAULT NULL,
  `software_logo_white` varchar(255) DEFAULT NULL,
  `software_logo_black` varchar(255) DEFAULT NULL,
  `software_background` varchar(255) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT 20,
  `ngr_percent` bigint(20) DEFAULT 20,
  `soccer_percentage` bigint(20) DEFAULT 30,
  `prefix` varchar(191) NOT NULL DEFAULT 'R$',
  `storage` varchar(191) NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT 0,
  `min_deposit` decimal(10,2) DEFAULT 20.00,
  `max_deposit` decimal(10,2) DEFAULT 0.00,
  `min_withdrawal` decimal(10,2) DEFAULT 20.00,
  `max_withdrawal` decimal(10,2) DEFAULT 0.00,
  `rollover` bigint(20) DEFAULT 10,
  `rollover_deposit` bigint(20) DEFAULT 1,
  `suitpay_is_enable` tinyint(4) DEFAULT 1,
  `stripe_is_enable` tinyint(4) DEFAULT 1,
  `bspay_is_enable` tinyint(4) DEFAULT 0,
  `sharkpay_is_enable` tinyint(4) DEFAULT 1,
  `turn_on_football` tinyint(4) DEFAULT 1,
  `revshare_reverse` tinyint(1) DEFAULT 1,
  `bonus_vip` bigint(20) DEFAULT 100,
  `activate_vip_bonus` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_jackpot` varchar(255) DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT 0,
  `withdrawal_limit` bigint(20) DEFAULT NULL,
  `withdrawal_period` varchar(30) DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT 0,
  `perc_sub_lv1` bigint(20) NOT NULL DEFAULT 4,
  `perc_sub_lv2` bigint(20) NOT NULL DEFAULT 2,
  `perc_sub_lv3` bigint(20) NOT NULL DEFAULT 3,
  `disable_rollover` tinyint(4) DEFAULT 0,
  `rollover_protection` bigint(20) NOT NULL DEFAULT 1,
  `cpa_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_value` decimal(10,2) DEFAULT NULL,
  `cpa_percentage_baseline` varchar(14) DEFAULT NULL,
  `cpa_percentage_n1` varchar(14) DEFAULT NULL,
  `cpa_percentage_n2` varchar(14) DEFAULT NULL,
  `ezzepay_is_enable` tinyint(4) DEFAULT 0,
  `digitopay_is_enable` tinyint(4) NOT NULL DEFAULT 0,
  `default_gateway` varchar(191) NOT NULL DEFAULT 'digitopay',
  `image_cassino_sidebar` varchar(255) DEFAULT NULL,
  `image_favoritos_sidebar` varchar(255) DEFAULT NULL,
  `image_wallet_sidebar` varchar(255) DEFAULT NULL,
  `image_suporte_sidebar` varchar(255) DEFAULT NULL,
  `image_promotions_sidebar` varchar(255) DEFAULT NULL,
  `image_indique_sidebar` varchar(255) DEFAULT NULL,
  `image_home_bottom` varchar(255) DEFAULT NULL,
  `image_cassino_bottom` varchar(255) DEFAULT NULL,
  `image_deposito_bottom` varchar(255) DEFAULT NULL,
  `image_convidar_bottom` varchar(255) DEFAULT NULL,
  `image_wallet_bottom` varchar(255) DEFAULT NULL,
  `image_user_nav` varchar(255) DEFAULT NULL,
  `image_home_sidebar` varchar(255) DEFAULT NULL,
  `image_menu_nav` varchar(255) NOT NULL,
  `message_home_page` varchar(255) DEFAULT NULL,
  `valor_por_bau` decimal(10,0) DEFAULT NULL,
  `deposito_minimo_bau` decimal(10,0) DEFAULT NULL,
  `cirus_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `cirus_aposta` decimal(20,2) NOT NULL DEFAULT 20.00,
  `cirus_valor` decimal(20,2) NOT NULL DEFAULT 20.00,
  `icon_bt_1` varchar(255) DEFAULT NULL,
  `icon_bt_2` varchar(255) DEFAULT NULL,
  `icon_bt_3` varchar(255) DEFAULT NULL,
  `icon_bt_4` varchar(255) DEFAULT NULL,
  `icon_bt_5` varchar(255) DEFAULT NULL,
  `name_bt_1` varchar(255) DEFAULT NULL,
  `name_bt_2` varchar(255) DEFAULT NULL,
  `name_bt_3` varchar(255) DEFAULT NULL,
  `name_bt_4` varchar(255) DEFAULT NULL,
  `img_bg_1` varchar(255) DEFAULT NULL,
  `icon_bt_6` varchar(255) DEFAULT NULL,
  `icon_bt_7` varchar(255) DEFAULT NULL,
  `icon_bt_8` varchar(255) DEFAULT NULL,
  `icon_wt_1` varchar(255) DEFAULT NULL,
  `icon_wt_2` varchar(255) DEFAULT NULL,
  `icon_wt_3` varchar(255) DEFAULT NULL,
  `icon_wt_4` varchar(255) DEFAULT NULL,
  `icon_wt_5` varchar(255) DEFAULT NULL,
  `saldo_ini` decimal(10,2) DEFAULT NULL,
  `ezzebank_is_enable` tinyint(4) NOT NULL DEFAULT 0,
  `modal_pop_up` text NOT NULL,
  `img_modal_pop` varchar(255) DEFAULT NULL,
  `modal_active` tinyint(4) NOT NULL DEFAULT 0,
  `icon_wt_6` varchar(255) DEFAULT NULL,
  `icon_wt_7` varchar(255) DEFAULT NULL,
  `icon_wt_8` varchar(255) DEFAULT NULL,
  `software_loading` varchar(255) DEFAULT NULL,
  `image_home_bottom_hover` varchar(255) DEFAULT NULL,
  `image_cassino_bottom_hover` varchar(255) DEFAULT NULL,
  `image_deposito_bottom_hover` varchar(255) DEFAULT NULL,
  `image_convidar_bottom_hover` varchar(255) DEFAULT NULL,
  `image_wallet_bottom_hover` varchar(255) DEFAULT NULL,
  `icon_wt_9` varchar(255) DEFAULT NULL,
  `background_perfil_top` varchar(255) DEFAULT NULL,
  `sub_background_perfil_top` varchar(255) DEFAULT NULL,
  `icon_wt_10` varchar(255) DEFAULT NULL,
  `collum_games` varchar(255) NOT NULL DEFAULT '3',
  `disable_rollover_cadastro` tinyint(4) NOT NULL DEFAULT 0,
  `rollover_cadastro` bigint(20) DEFAULT NULL,
  `disable_deposit_min` tinyint(4) NOT NULL DEFAULT 0,
  `deposit_min_saque` decimal(10,2) NOT NULL DEFAULT 20.00,
  `icon_nav_bottom_left` varchar(255) DEFAULT NULL,
  `icon_nav_bottom_right` varchar(255) DEFAULT NULL,
  `icon_bottom_right` varchar(255) DEFAULT NULL,
  `icon_bottom_left` varchar(255) DEFAULT NULL,
  `icon_wt_11` varchar(255) NOT NULL,
  `icon_wt_12` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `sharkpay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `image_jackpot`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `disable_rollover`, `rollover_protection`, `cpa_baseline`, `cpa_value`, `cpa_percentage_baseline`, `cpa_percentage_n1`, `cpa_percentage_n2`, `ezzepay_is_enable`, `digitopay_is_enable`, `default_gateway`, `image_cassino_sidebar`, `image_favoritos_sidebar`, `image_wallet_sidebar`, `image_suporte_sidebar`, `image_promotions_sidebar`, `image_indique_sidebar`, `image_home_bottom`, `image_cassino_bottom`, `image_deposito_bottom`, `image_convidar_bottom`, `image_wallet_bottom`, `image_user_nav`, `image_home_sidebar`, `image_menu_nav`, `message_home_page`, `valor_por_bau`, `deposito_minimo_bau`, `cirus_baseline`, `cirus_aposta`, `cirus_valor`, `icon_bt_1`, `icon_bt_2`, `icon_bt_3`, `icon_bt_4`, `icon_bt_5`, `name_bt_1`, `name_bt_2`, `name_bt_3`, `name_bt_4`, `img_bg_1`, `icon_bt_6`, `icon_bt_7`, `icon_bt_8`, `icon_wt_1`, `icon_wt_2`, `icon_wt_3`, `icon_wt_4`, `icon_wt_5`, `saldo_ini`, `ezzebank_is_enable`, `modal_pop_up`, `img_modal_pop`, `modal_active`, `icon_wt_6`, `icon_wt_7`, `icon_wt_8`, `software_loading`, `image_home_bottom_hover`, `image_cassino_bottom_hover`, `image_deposito_bottom_hover`, `image_convidar_bottom_hover`, `image_wallet_bottom_hover`, `icon_wt_9`, `background_perfil_top`, `sub_background_perfil_top`, `icon_wt_10`, `collum_games`, `disable_rollover_cadastro`, `rollover_cadastro`, `disable_deposit_min`, `deposit_min_saque`, `icon_nav_bottom_left`, `icon_nav_bottom_right`, `icon_bottom_right`, `icon_bottom_left`, `icon_wt_11`, `icon_wt_12`) VALUES
(1, 'Zeroum', 'O Plataforma onlines.cash  é uma das mais renomadas empresas internacionais de operação de cassino online, oferecendo uma ampla variedade de jogos empolgantes, como jogos ao vivo com crupiê real, slots, pesca, loterias, esportes e muito mais. Estamos autorizados e regulamentados pelo governo de Curaçao, operando com a licença número Antillephone emitida para a 8048/JAZ. Passamos por todas as verificações', 'uploads/GYry2nI8XhwxVEFbsQnwPC1GMq5aUWy5Uvj4lyOu.png', 'uploads/yQe8aBM9bi791OFMYaEbtK1MFAHsP7hs50pQYtdT.png', 'uploads/4gEJdcGmxVnPuj2Tx7UfHZYb75vwd7FVh2yyVfpx.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 2, 2.00, 40000.00, 2.00, 200.00, 30, 1, 1, 0, 0, 0, 0, 0, 100, 1, '2026-01-27 02:26:44', 'uploads/2lu6QCF82SDaDIGUN3NK2479el4C0upRKa9g7siD.webp', 0, 3, 'daily', 0, 30, 15, 3, 0, 10, 20.00, 3.00, '1', '50', '10', 0, 0, 'suitpay', 'uploads/9bWM9v18lbZDkhA5TzZaueDCN1y7tkbBWFKlrexR.png', 'uploads/Hji6bluV48qiTQPxyC8jylBI5rmJ0ZYiApzCmfit.avif', 'uploads/UclWu3ugP4vilQglgMjpAJPjWT4zxF4wlfmGVzdS.webp', 'uploads/oQBdU3j3cCP4LLReOq31hDCvhwY6hyb3IstG5EVa.png', 'uploads/HxmOJT0Jk7xbAVHw9zM133atBJrG56mevF4mCWzZ.png', 'uploads/FOBC1W4pBz8tly5xWsajosHkzpC8lhk2oL7qWRiv.png', 'uploads/tfBoffDrZFqQJsHM3WTJQTkvTrCl5qYAzCDB7oQ3.png', 'uploads/fGXDQmVVndF1YOdpOJTk4t3041xGboyLJQ4iKhxJ.png', 'uploads/h20H9WLsdjUeXar52PNWD9q13C14K2YcFXy4Trx1.png', 'uploads/X2ZnEIZySFXoPVOajOravdk6vR3l8tBkVpmLcLyk.png', 'uploads/siz2Qxm3sf9fStOeze53zugSMmNWeSOZxtLWLnoS.png', 'uploads/2gG8djPHVaT6XIJp3b6eP8BEPsBnXr9s6qaSwlKt.png', 'uploads/iD1OmGAmetuS2vGWLn0gjglv6KhYnxeHm5tbqpxp.png', 'uploads/W4fPdZy0VIPJMPkvH7E8qDs8I2FdIyDGHKeYQHvZ.png', 'Descubra a maior rede de cassinos do mundo, onde prêmios abundantes e bônus incríveis esperam por você, além de um exclusivo sistema de baú repleto de surpresas!', 10, 40, 10.00, 50.00, 10.00, 'uploads/eWpQcgZGkbwrhrNfpW1BepDOrXEWzuh5BNV9HG4z.avif', 'uploads/P1XArH6s5KrOeeMcWgPRA8uQVQTme3zUaXSWI9pV.avif', 'uploads/f9T4FvH6AErXT6r6KLEOONqIz2DdjARvrEX6CXVL.avif', 'uploads/r5KZk1fSozvUAqydbCMjTFv7P8wVoxFS6RBoshlR.avif', 'uploads/oDZr05OwyFwjRpXRVn2xXMvxGayW9lQwpaaHp5b9.avif', 'Agente', 'Promoção', 'Suporte ', 'VIP', 'uploads/BEoSexK5u5NQCebgYBM8YHRzD5kOfJzu7pAYAeyb.webp', 'uploads/faQwqq6CGAXiINRMJqaa5CE24Coc0JuRudyWqR3x.png', 'uploads/jW0GzrSVlfLHqNvpcIZs7a1DH3w3WFgDK16DZfNz.png', 'uploads/xgqf3MLF4tmK0WyVLfLsXx6i8KW5yCF4lGHCAQDH.png', 'uploads/TAVyjVn6sDpol0RxbYim03SXxQSajRontWVX5vk8.png', 'uploads/AEoJv6yBKIDVRylgOPwfWFno2IINBmXzRMWWMtjS.png', 'uploads/IFymUhQ9ydjHzR0btaggtnroDnnQESwimXwIExUf.png', 'uploads/6zlK3abcTXd8Hcat2aj0ivUbMkpEes4s0JZT5uT6.png', 'uploads/RnwFBWpBjUIF8uIeqbtjoxFVVr8Y3BnxWSSsv2xf.png', 0.05, 0, '', 'uploads/sEXmt7VJamxBe6XJ7BUZJiIxHiGNgrRyXlbGArsI.jpg', 0, 'uploads/4U4mW2NvHsAcjQb3YSpSCNTUXe6XGOLCx5nfsipB.png', 'uploads/D0T4psJl7U2h8BORhNgltYFWa0QABz8fk6VXXms8.png', 'uploads/RhLbKTy5djoegYu5TwuQgVHnRn6wjNpcRRrbdfJC.png', 'uploads/344lfCG3i1LyvTLgJwVbUAwNwJF8iWhZPdU3zxfE.png', 'uploads/VWaLG1fZB9o5JbUPTKvvLHJMjfGoLfNj9m64iuQB.png', 'uploads/zJICA57MfhxjkTgTu60r1mbDRJ1lul3p07gzxcas.png', 'uploads/nBb90g1ARw7oySS13ZOinxmKaxL1ul5rXyGE8AIW.png', 'uploads/LaBQ1lwiL9PawxEMgWC9jzWbF1Jhg62Hods9wMOB.png', 'uploads/S1wqBLLXb0WQzzq59wMiQNbpNP0XZPyVvH5u13bm.png', 'uploads/S5aRwtWah2TJ4ITZ2laaJhWrR2v6VVYpIK5V4i8z.png', 'uploads/RIUu9JCj8xCrIxJBNbpTS7Fzo97oTt1UOGaqMlL0.png', 'uploads/vCundEuA5eFsWPfkEtXwamYxJSorisd2aIuWF5FD.webp', 'uploads/vJ7q12GQ2NSN0mmcqPBYELuEtKmC3UltqCx5zLMR.png', '3', 0, 10, 0, 0.00, '[]', '[]', '[]', '[]', 'uploads/JVFum605m9XLZZ4HqQbgPTYuZPJOgn1UGLxlUGBG.png', 'uploads/bd4qTcWOhoulkPBLwOnO3poJLfMyfsAr7UPwlMc5.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `setting_mails`
--

INSERT INTO `setting_mails` (`id`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', '', '', '', '', '2024-03-16 16:32:46', '2024-08-28 01:35:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `slider_texts`
--

CREATE TABLE `slider_texts` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `slider_texts`
--

INSERT INTO `slider_texts` (`id`, `message`, `created_at`, `updated_at`) VALUES
(2, '🚀 Nossa nova atualização está finalmente aqui e traz MUITAS melhorias incríveis. 💻 Agora, você pode personalizar seu perfil com temas super legais, adicionar GIFs e até mesmo reagir com emojis nos comentários! ', '2024-08-19 19:07:51', '2024-08-19 19:07:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `suit_pay_payments`
--

INSERT INTO `suit_pay_payments` (`id`, `payment_id`, `user_id`, `withdrawal_id`, `pix_key`, `pix_type`, `amount`, `observation`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 35, 3, '85940938531', 'document', 200.00, 'Saque direto', 0, '2025-06-24 00:54:34', '2025-06-24 00:54:34'),
(2, NULL, 35, 3, '85940938531', 'document', 200.00, 'Saque direto', 0, '2025-06-24 00:54:36', '2025-06-24 00:54:36'),
(3, NULL, 35, 3, '85940938531', 'document', 200.00, 'Saque direto', 0, '2025-06-24 00:54:38', '2025-06-24 00:54:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT 0.000000000000,
  `balance_min` decimal(27,12) NOT NULL DEFAULT 10000.100000000000,
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT 45.00,
  `mode` enum('balance_min','percentage') NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `system_wallets`
--

INSERT INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
(1, 'system', 261.800000000000, 10000.100000000000, 45.00, 'percentage', '2023-10-11 16:11:15', '2023-10-16 18:42:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(20) NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `accept_bonus` tinyint(1) NOT NULL DEFAULT 1,
  `token` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `external_id`, `payment_id`, `user_id`, `payment_method`, `price`, `currency`, `status`, `created_at`, `updated_at`, `reference`, `accept_bonus`, `token`) VALUES
(1, '690d0dc95c959', '690d0dc95c959', 1, 'pix', 2.00, 'BRL', 0, '2025-11-06 18:06:17', '2025-11-06 18:06:17', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) DEFAULT NULL,
  `oauth_type` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT 'uploads/bored_ape.png',
  `last_name` varchar(191) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT 0,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `inviter` int(11) DEFAULT NULL,
  `inviter_code` varchar(25) DEFAULT NULL,
  `affiliate_revenue_share` bigint(20) NOT NULL DEFAULT 2,
  `affiliate_revenue_share_fake` bigint(20) DEFAULT NULL,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT 10.00,
  `affiliate_bau_baseline` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_value` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_bau_aposta` decimal(20,2) NOT NULL DEFAULT 20.00,
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT 40.00,
  `is_demo_agent` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `language` varchar(191) NOT NULL DEFAULT 'pt_BR',
  `role_id` int(11) DEFAULT 3,
  `influencer_mode` tinyint(4) NOT NULL DEFAULT 0,
  `facebook_id` varchar(191) NOT NULL,
  `whatsapp_id` varchar(191) NOT NULL,
  `telegram_id` varchar(191) NOT NULL,
  `aniversario` varchar(191) NOT NULL,
  `utilizou_bonus_cadastro` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_bau_baseline`, `affiliate_bau_value`, `affiliate_bau_aposta`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`, `influencer_mode`, `facebook_id`, `whatsapp_id`, `telegram_id`, `aniversario`, `utilizou_bonus_cadastro`) VALUES
(1, 'Naoapagar', 'admin@eu.com', NULL, '$2y$10$T9PdSTsUNKezMKdIBBY/g.hEUbbViHL/TEcYaZ0ojCWwS/B0lOPsS', NULL, '2025-11-06 18:06:12', '2025-11-06 18:06:13', NULL, NULL, 'uploads/bored_ape.png', NULL, NULL, NULL, 0, 0, NULL, 'V6RWYN2QA4', 0, NULL, 3.00, 10.00, 10.00, 50.00, 20.00, 0, 'active', 'pt_BR', 3, 0, '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_symbol` varchar(255) NOT NULL,
  `bet_level` bigint(20) NOT NULL DEFAULT 1,
  `bet_required` bigint(20) DEFAULT NULL,
  `bet_period` varchar(191) DEFAULT NULL,
  `bet_bonus` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `vips`
--

INSERT INTO `vips` (`id`, `bet_symbol`, `bet_level`, `bet_required`, `bet_period`, `bet_bonus`, `created_at`, `updated_at`) VALUES
(7, '01J3FPQDA60S47G47M4TGQCW9V.png', 2, 1000, NULL, 5, '2024-07-23 11:48:16', '2024-07-23 11:48:16'),
(6, '01J3FPPWWR1XY0M7H9T1Z4EJHF.png', 1, 500, NULL, 2, '2024-07-23 11:47:59', '2024-07-23 11:47:59'),
(8, '01J3FPQYYV5WH02YK9ZZ29TM2H.png', 3, 2000, NULL, 15, '2024-07-23 11:48:34', '2024-07-23 11:48:34'),
(9, '01J3FPS6E1CHPBT0G9XK3APQAP.png', 4, 5000, NULL, 20, '2024-07-23 11:49:14', '2024-07-23 11:49:14'),
(10, '01J3FPSSFSXBNVPXX724Y6EYK5.png', 5, 10000, NULL, 30, '2024-07-23 11:49:34', '2024-07-23 11:49:34'),
(11, '01J3FPTC37N4RHTR26AKTW29S6.png', 6, 25000, NULL, 50, '2024-07-23 11:49:53', '2024-07-23 11:49:53'),
(12, '01J3FPTVE860R6EST315TJKNJ7.png', 7, 50000, NULL, 100, '2024-07-23 11:50:09', '2024-07-23 11:50:09'),
(13, '01J3FPVMX8W8N50M6J1DN4M3Y4.png', 8, 100000, NULL, 150, '2024-07-23 11:50:35', '2024-07-23 11:50:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vip_users`
--

CREATE TABLE `vip_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vip_id` int(10) UNSIGNED NOT NULL,
  `level` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `vip_users`
--

INSERT INTO `vip_users` (`id`, `user_id`, `vip_id`, `level`, `points`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 6, 0, 0, 1, '2026-01-27 02:05:10', '2026-01-27 02:05:10'),
(2, 2, 7, 0, 0, 1, '2026-01-27 02:21:24', '2026-01-27 02:21:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency` varchar(20) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_bonus_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_deposit_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_withdrawal` decimal(10,2) DEFAULT 0.00,
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `balance_demo` decimal(20,8) DEFAULT 1.00000000,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `hide_balance` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_won` bigint(20) NOT NULL DEFAULT 0,
  `total_lose` bigint(20) NOT NULL DEFAULT 0,
  `last_won` bigint(20) NOT NULL DEFAULT 0,
  `last_lose` bigint(20) NOT NULL DEFAULT 0,
  `vip_level` bigint(20) DEFAULT 0,
  `vip_points` bigint(20) DEFAULT 0,
  `vip_wallet` decimal(20,2) DEFAULT 0.00,
  `mission_deposit_wallet` decimal(20,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`, `vip_wallet`, `mission_deposit_wallet`) VALUES
(1, 1, 'BRL', 'R$', 0.00, 0.50, 0.00, 0.00, 0.05, 0.00000000, 1.00000000, 0.00, 0, 1, '2025-11-06 18:06:12', '2025-11-06 18:06:22', 0.00, 0, 0, 0, 0, 0, 0, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `change` varchar(50) DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_roi` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_entry` decimal(20,2) NOT NULL DEFAULT 0.00,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `game` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) DEFAULT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `cpf` varchar(14) DEFAULT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `account_withdraws`
--
ALTER TABLE `account_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `aprove_save_settings`
--
ALTER TABLE `aprove_save_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `aprove_withdrawals`
--
ALTER TABLE `aprove_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `baus`
--
ALTER TABLE `baus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bs_pay_payments`
--
ALTER TABLE `bs_pay_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `digito_pay_payments_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `digito_pay_payments_withdrawal_id_index` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `eventos_plataforma`
--
ALTER TABLE `eventos_plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_provider_id_index` (`provider_id`),
  ADD KEY `games_game_code_index` (`game_code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_is_influencer_mode` (`is_influencer_mode`);

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_drakon`
--
ALTER TABLE `ggr_games_drakon`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `mission_deposit`
--
ALTER TABLE `mission_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_deposit_user`
--
ALTER TABLE `mission_deposit_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mission_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `mission_users_mission_id_index` (`mission_id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `post_notifications`
--
ALTER TABLE `post_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `sen_saques`
--
ALTER TABLE `sen_saques`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `slider_texts`
--
ALTER TABLE `slider_texts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `vip_users`
--
ALTER TABLE `vip_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vip_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `vip_users_vip_id_index` (`vip_id`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `account_withdraws`
--
ALTER TABLE `account_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `aprove_withdrawals`
--
ALTER TABLE `aprove_withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `baus`
--
ALTER TABLE `baus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de tabela `bs_pay_payments`
--
ALTER TABLE `bs_pay_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos_plataforma`
--
ALTER TABLE `eventos_plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1196;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games_drakon`
--
ALTER TABLE `ggr_games_drakon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mission_deposit`
--
ALTER TABLE `mission_deposit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `mission_deposit_user`
--
ALTER TABLE `mission_deposit_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1049;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `music`
--
ALTER TABLE `music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_notifications`
--
ALTER TABLE `post_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sen_saques`
--
ALTER TABLE `sen_saques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `slider_texts`
--
ALTER TABLE `slider_texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `vip_users`
--
ALTER TABLE `vip_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
