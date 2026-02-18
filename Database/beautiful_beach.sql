-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 09, 2026 lúc 04:42 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `beautiful_beach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sex` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `full_name`, `email`, `username`, `phone`, `password`, `birthday`, `created_at`, `updated_at`, `status`, `sex`, `avatar`) VALUES
(1, 'Mckenna Okuneva', 'gibson.elvie@example.net', 'jerel15', '+1 (831) 509-2510', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1994-01-26', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nam', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop'),
(2, 'Daniela Aufderhar', 'aryanna.jones@example.com', 'wkerluke', '1-606-990-9570', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1977-10-17', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nữ', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?w=200&h=200&fit=crop'),
(3, 'Brook Ullrich MD', 'ngoodwin@example.net', 'ona92', '(951) 719-3944', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2008-12-17', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nữ', 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=200&h=200&fit=crop'),
(4, 'Leopoldo Schneider', 'aheller@example.org', 'lockman.ernestina', '1-346-643-0987', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2004-01-11', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nữ', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200&h=200&fit=crop'),
(5, 'Jaylon Treutel', 'ike.murazik@example.org', 'gordon22', '1-260-325-1425', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2013-10-17', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nam', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop'),
(6, 'Bettie Prohaska', 'trantow.mohammed@example.com', 'nash.wyman', '445.623.3833', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2000-01-09', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nữ', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200&h=200&fit=crop'),
(7, 'Mrs. Mafalda Shanahan III', 'ngerlach@example.net', 'cwalsh', '+17012190689', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2010-04-21', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nam', 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=200&h=200&fit=crop'),
(8, 'Paris Eichmann', 'oberbrunner.antonina@example.org', 'deja54', '(352) 351-3406', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2018-06-17', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nam', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200&h=200&fit=crop'),
(9, 'Aiden Little PhD', 'king.walker@example.org', 'lenna.pollich', '1-727-750-3932', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2015-05-03', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nữ', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop'),
(10, 'Jamey Steuber', 'letitia.schaefer@example.net', 'ghowe', '(423) 489-8162', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2023-04-01', '2026-02-05 08:04:46', '2026-02-05 08:04:46', 1, 'Nam', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop'),
(11, 'Nguyễn Anh Dương', 'admin@example.com', 'admin@example.com', 'admin@example.com', '$2y$10$2a9OwXlD0HEeoZ5Q8jQ4teU8UU/BVRIx/tVr6GWEuNryw//4WH23y', '2006-02-09', '2026-02-05 10:58:51', '2026-02-05 10:58:51', 0, '0', '/uploads/account/9e9f76e4-12e8-4d85-8d3d-8f5eca7ae267.jpeg'),
(12, 'Nguyễn Anh Dương', 'duonganhdn2000@gmail.com', 'duonganhdn2000@gmail.com', '0967908595', '$2y$10$Hs84qDNwWEbOa/kl9Dd4reTe6HTq71Is5RpodwKtBxHjsU.U6kZ16', '2006-02-09', '2026-02-05 11:01:26', '2026-02-05 11:10:06', 1, '0', '/uploads/account/ae8df5e1-f1db-435c-b289-0648b3c8bb83.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `beaches`
--

CREATE TABLE `beaches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `beaches`
--

INSERT INTO `beaches` (`id`, `name`, `description`, `location`, `region_id`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(1, 'Mertz Track Beach', 'Sint consequatur deserunt accusantium voluptatem eos est repellat officia. Perferendis dolores ipsum qui soluta voluptatem sit hic.', '480 Lera Port Apt. 795\nWest Vilma, KS 35856', 1, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '49.961204', '-68.579194'),
(2, 'Jameson Lodge Beach', 'Libero iusto optio dolor atque incidunt sed ab. Voluptatum illum dolore dolorem voluptatem repellendus ratione qui. Ut a delectus adipisci.', '101 Kirk Locks\nNorth Bufordburgh, SC 40666-0470', 1, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-25.361649', '-16.85523'),
(3, 'Rolando Fall Beach', 'Maiores eos velit velit vel. Assumenda molestiae hic perspiciatis repellendus itaque et sit aut.', '52096 Roob Shoal\nEast Ashtyn, CA 52249-2979', 1, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '44.792947', '8.716392'),
(4, 'Ibrahim Trail Beach', 'Officia possimus ipsum eius assumenda et. Quasi neque amet et perferendis odio voluptatum sit.', '13707 Johathan Ramp\nEast Guyburgh, MI 80372-2011', 1, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-22.281932', '166.710407'),
(5, 'Claudia Valleys Beach', 'Ratione voluptates numquam incidunt nihil alias et debitis eos. Vel explicabo odio consequatur sit dicta quisquam aut.', '44533 Schmeler Ville Apt. 900\nSouth Maeve, NV 61926', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-0.695781', '-20.581592'),
(6, 'Lorenzo Center Beach', 'Ipsa perferendis animi aut repellat veritatis. Molestiae doloribus nulla voluptate nisi.', '5599 Elenor Meadow\nLake Broderickchester, NM 53268-6822', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-24.614424', '130.029177'),
(7, 'Daugherty Run Beach', 'Corrupti quam dignissimos itaque qui dolorem. Et nisi autem beatae asperiores.', '98019 Bruen Parkways Apt. 766\nNew Jazmyn, TN 26485-4155', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '64.615502', '136.215426'),
(8, 'Edna Way Beach', 'Consequatur cum enim pariatur iure. Temporibus quibusdam odit quam. Ea iste laudantium doloremque aliquid deserunt quia qui.', '37949 Madison Junction\nWest Rickeychester, PA 31778-1837', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-12.684286', '52.641878'),
(9, 'Vandervort Village Beach', 'Porro ipsam et repellat quisquam. Laudantium rerum qui ut qui.', '8187 Maude Ramp\nSabinahaven, CT 55890-7120', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '86.770542', '-114.39814'),
(10, 'Delaney Crossroad Beach', 'Odit voluptates qui ut eaque. Aut esse dolorem non facilis quas.', '277 Kihn Viaduct\nEast Timmyborough, PA 43857', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '67.772408', '-42.916687'),
(11, 'Prosacco Views Beach', 'Corporis debitis debitis ut vel. Ipsum dolores recusandae aut aliquam itaque consequatur. Aliquid qui dolor occaecati doloremque et enim aliquid autem.', '420 Doyle Hill Suite 666\nWest Marcelina, LA 61666-2259', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '44.683717', '-0.060947'),
(12, 'Coby Ville Beach', 'Asperiores quia rem sint ut aliquam et quis. Nobis voluptatem molestiae eveniet doloribus culpa culpa facere dicta.', '812 Ledner Burgs\nJustusmouth, OH 59160-5778', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-20.826189', '5.344782'),
(13, 'Collier Forge Beach', 'Doloremque et dolorem sed inventore vel sit. Nulla et laboriosam corporis natus commodi.', '11050 Tristian Forks\nNew Cristianshire, CA 61172', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-61.933605', '-20.531898'),
(14, 'Eldridge Mountains Beach', 'Veritatis ipsum sit sequi et qui veritatis sed. Quo facilis eos quaerat consequatur non qui nesciunt autem.', '629 Walsh Island Apt. 753\nValentinebury, HI 01130-0880', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '5.385318', '36.985903'),
(15, 'Witting Causeway Beach', 'Eos ea aut quod repudiandae facilis quis. Nemo labore inventore eos sed natus.', '93731 Stark Street Apt. 726\nDahliafort, PA 60127-0437', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '45.582866', '0.154628'),
(16, 'Zackery Harbor Beach', 'Laboriosam perspiciatis eos iure pariatur iste sed placeat veniam. Qui molestiae repudiandae nihil voluptas odit sequi. Omnis ut porro non qui optio ducimus maiores modi.', '82548 Destany Course Apt. 167\nNew Tanyamouth, CA 99542', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '12.004096', '-94.382743'),
(17, 'Schowalter Rest Beach', 'Itaque enim voluptas modi saepe nihil accusamus. Vel sed tempora aut debitis labore.', '5853 Pfannerstill Neck Suite 578\nJonesborough, MT 70318', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-13.404711', '59.509905'),
(18, 'Ben Lane Beach', 'Nihil facilis autem est. Maiores corporis nihil voluptatem totam alias. Eaque eum aut illum illum voluptate.', '2974 Mauricio Extensions Apt. 071\nNicolasstad, KS 97906-3301', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '30.870441', '142.902221'),
(19, 'Langworth Plaza Beach', 'Unde iure ut placeat recusandae. Quasi sequi sed praesentium recusandae dolores explicabo non beatae.', '723 Haag Square Suite 619\nAxelshire, NY 11071-9014', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '-55.928443', '71.910944'),
(20, 'Leffler Turnpike Beach', 'Quia incidunt sit neque. Quod impedit non voluptatem animi esse.', '511 Wisozk Village\nPacochafurt, NC 08066', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46', '82.914769', '103.679032');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `beach_id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `message`, `account_id`, `beach_id`, `content_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Hello', 12, 4, NULL, 1, '2026-02-06 15:01:58', '2026-02-06 15:01:58'),
(3, 'Hello', 12, 2, NULL, 1, '2026-02-06 15:02:48', '2026-02-06 15:02:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `beach_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `beach_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `account_id`, `beach_id`, `created_at`, `updated_at`) VALUES
(1, 12, 2, '2026-02-06 10:12:38', '2026-02-06 10:12:38'),
(2, 12, 3, '2026-02-06 10:12:40', '2026-02-06 10:12:40'),
(3, 12, 3, '2026-02-06 15:09:35', '2026-02-06 15:09:35'),
(4, 12, 3, '2026-02-06 15:40:11', '2026-02-06 15:40:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_banners`
--

CREATE TABLE `image_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_banners`
--

INSERT INTO `image_banners` (`id`, `img`, `created_at`, `updated_at`, `type`, `title`, `content`) VALUES
(1, 'https://images.pexels.com/photos/2049422/pexels-photo-2049422.jpeg', '2026-02-05 09:10:55', '2026-02-05 09:10:55', 1, 'Welcome to SeaView', 'Khám phá những bãi biển đẹp nhất thế giới cùng chúng tôi.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_beaches`
--

CREATE TABLE `image_beaches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_link` varchar(255) NOT NULL,
  `beach_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_beaches`
--

INSERT INTO `image_beaches` (`id`, `img_link`, `beach_id`, `created_at`, `updated_at`) VALUES
(3, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/1-14.jpg', 1, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(4, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/2-15.jpg', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(5, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/15-2.jpg', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(6, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/20-2.jpg', 2, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(7, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/9-3.jpg', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(8, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/15-2.jpg', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(9, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/28-2.jpg', 3, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(11, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/1-14.jpg', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(12, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/30-2.jpg', 4, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(13, 'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=800&q=80', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(14, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/5-9.jpg', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(15, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/22-2.jpg', 5, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(16, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/4-15.jpg', 6, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(17, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/27-2.jpg', 6, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(18, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/31-2.jpg', 6, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(20, 'https://images.unsplash.com/photo-1515238152791-8216bfdf89a7?w=800&q=80', 7, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(21, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/9-3.jpg', 7, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(22, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/16-2.jpg', 8, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(23, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/22-2.jpg', 8, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(24, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/23-2.jpg', 8, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(25, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/3-13.jpg', 9, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(26, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/25-2.jpg', 9, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(27, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/30-2.jpg', 9, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(29, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/15-2.jpg', 10, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(30, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/24-2.jpg', 10, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(31, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80', 11, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(33, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/28-2.jpg', 11, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(35, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/2-15.jpg', 12, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(36, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/16-2.jpg', 12, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(38, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/15-2.jpg', 13, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(39, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/25-2.jpg', 13, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(41, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/14-2.jpg', 14, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(42, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/17-2.jpg', 14, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(43, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/19-2.jpg', 15, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(44, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/26-2.jpg', 15, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(45, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/33-1.jpg', 15, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(46, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/11-3.jpg', 16, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(47, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/20-2.jpg', 16, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(48, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/25-2.jpg', 16, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(49, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/14-2.jpg', 17, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(50, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/17-2.jpg', 17, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(51, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/23-2.jpg', 17, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(52, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/14-2.jpg', 18, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(53, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/18-2.jpg', 18, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(54, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/23-2.jpg', 18, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(57, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/8-4.jpg', 19, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(58, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/4-15.jpg', 20, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(59, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/16-2.jpg', 20, '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(60, 'https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/27-2.jpg', 20, '2026-02-05 08:04:46', '2026-02-05 08:04:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_08_16_143052_create_regions_table', 1),
(6, '2025_08_17_090537_create_beaches_table', 1),
(7, '2025_08_17_091319_create_image_beaches_table', 1),
(8, '2025_08_19_031629_create_accounts_table', 1),
(9, '2025_08_19_134641_create_contents_table', 1),
(10, '2025_08_20_165228_add_column_status_to_accounts_table', 1),
(11, '2025_08_21_052245_add_column_sex_to_accounts_table', 1),
(12, '2025_08_22_061041_create_favorites_table', 1),
(13, '2025_08_23_154458_create_comments_table', 1),
(14, '2025_08_28_152322_add_column_img_to_contents_table', 1),
(15, '2025_08_29_092349_create_image_banners_table', 1),
(16, '2025_08_29_093913_add_column_avt_to_accounts_table', 1),
(17, '2025_08_29_103725_add_column_status_to_image_banners_table', 1),
(18, '2025_08_30_082050_add_column_content_add_image_banners_table', 1),
(19, '2025_09_05_193619_add_lat_long_to_your_beaches', 1),
(20, '2025_09_08_154354_create_visits_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', 'b49c238a8604806dac617394b4d9b1f78af65bee76489cb838a8df1dd5cc4afa', '[\"*\"]', '2026-02-05 09:14:18', NULL, '2026-02-05 09:14:07', '2026-02-05 09:14:18'),
(2, 'App\\Models\\Account', 12, 'account-token', 'd6ca65896fe95c937669a83dcdb26d4eefba361b51400021be391eb8472cc0b8', '[\"*\"]', '2026-02-06 06:03:29', NULL, '2026-02-05 11:10:15', '2026-02-06 06:03:29'),
(3, 'App\\Models\\Account', 12, 'account-token', 'df647064e739fd3bc90f9e3bb818abec2e0f6da34363d672e35e971b92da3f49', '[\"*\"]', '2026-02-06 15:01:58', NULL, '2026-02-06 06:03:41', '2026-02-06 15:01:58'),
(4, 'App\\Models\\Account', 12, 'account-token', '7f57730c5273240f40be5e4f0bc7f45957dfa4da93c0afb36d2ddeff6621853f', '[\"*\"]', '2026-02-06 15:41:54', NULL, '2026-02-06 15:02:24', '2026-02-06 15:41:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bartolettihaven', '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(2, 'Brandtfurt', '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(3, 'East Tressatown', '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(4, 'Cedrickfurt', '2026-02-05 08:04:46', '2026-02-05 08:04:46'),
(5, 'Lake Alexandreaborough', '2026-02-05 08:04:46', '2026-02-05 08:04:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$10$kf6NB860sP/NfoPXMzhTQ.xb3zvQsIWBkgjn9q3GR5O8bv.iCZ7/i', NULL, '2026-02-05 08:04:46', '2026-02-05 08:04:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `visits`
--

INSERT INTO `visits` (`id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', '2026-02-06 04:10:30', '2026-02-06 04:10:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`),
  ADD UNIQUE KEY `accounts_username_unique` (`username`),
  ADD UNIQUE KEY `accounts_phone_unique` (`phone`);

--
-- Chỉ mục cho bảng `beaches`
--
ALTER TABLE `beaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beaches_region_id_foreign` (`region_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_content_id_foreign` (`content_id`),
  ADD KEY `comments_account_id_foreign` (`account_id`),
  ADD KEY `comments_beach_id_foreign` (`beach_id`);

--
-- Chỉ mục cho bảng `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_beach_id_foreign` (`beach_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_account_id_foreign` (`account_id`),
  ADD KEY `favorites_beach_id_foreign` (`beach_id`);

--
-- Chỉ mục cho bảng `image_banners`
--
ALTER TABLE `image_banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image_beaches`
--
ALTER TABLE `image_beaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_beaches_beach_id_foreign` (`beach_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `beaches`
--
ALTER TABLE `beaches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `image_banners`
--
ALTER TABLE `image_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `image_beaches`
--
ALTER TABLE `image_beaches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `beaches`
--
ALTER TABLE `beaches`
  ADD CONSTRAINT `beaches_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `comments_beach_id_foreign` FOREIGN KEY (`beach_id`) REFERENCES `beaches` (`id`),
  ADD CONSTRAINT `comments_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Các ràng buộc cho bảng `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_beach_id_foreign` FOREIGN KEY (`beach_id`) REFERENCES `beaches` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `favorites_beach_id_foreign` FOREIGN KEY (`beach_id`) REFERENCES `beaches` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `image_beaches`
--
ALTER TABLE `image_beaches`
  ADD CONSTRAINT `image_beaches_beach_id_foreign` FOREIGN KEY (`beach_id`) REFERENCES `beaches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
