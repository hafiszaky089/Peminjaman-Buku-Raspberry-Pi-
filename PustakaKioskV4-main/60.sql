-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pustaka_kiosk
CREATE DATABASE IF NOT EXISTS `pustaka_kiosk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pustaka_kiosk`;

-- Dumping structure for table pustaka_kiosk.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'ADMIN',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustaka_kiosk.admins: ~0 rows (approximately)
INSERT INTO `admins` (`id`, `username`, `password`, `role`, `created_at`) VALUES
	(1, 'admin', 'admin123', 'ADMIN', '2026-05-14 10:35:50');

-- Dumping structure for table pustaka_kiosk.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qr_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_copies` int DEFAULT '1',
  `available_copies` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qr_code` (`qr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustaka_kiosk.books: ~10 rows (approximately)
INSERT INTO `books` (`id`, `qr_code`, `title`, `author`, `isbn`, `category`, `publisher`, `total_copies`, `available_copies`, `created_at`) VALUES
	(3, 'BK-749965NP', 'Membuat Kacang Lebih Enak', 'Karmila', 'ISBN 978-602-8266-83-3', 'Teknologi & Ilmu Terapan', 'Permata Equator Media', 1, 0, '2026-06-05 14:27:07'),
	(4, 'BK-634894OM', 'Benang-Benang Cantik', 'Vina Dwi Laning', 'ISBN 978-602-8266-92-5', 'Teknologi & Ilmu Terapan', 'Permata Equator Media', 1, 1, '2026-06-05 14:28:19'),
	(5, 'BK-8213028K', 'Gaya Bahasa dan Peribahasa dalam Bahasa Indonesia', 'Diah Erna Triningsih', 'ISBN 979-28-0599-4', 'Bahasa', 'PT Intan Pariwara', 1, 1, '2026-06-05 14:31:42'),
	(6, 'BK-952159SO', 'Masjid Kuno di Jawa Tengah', 'Santoso, Budi, Sudaryanto, dan Djoko Dwi Nugroho.', 'ISBN 978-979-704-683-5', 'Agama', 'Dinas Kebudayaan dan Pariwisata, Museum Jawa Tengah Ranggawarsita, Semarang', 1, 1, '2026-06-05 14:37:19'),
	(7, 'BK-248149AB', 'Pohon-Pohon Raksasa di Rimba Nusantara', 'Korrie Layun Rampan', 'ISBN 979-407-760-7', 'Sastra', 'PT Balai Pustaka (Persero)', 1, 1, '2026-06-05 14:39:45'),
	(8, 'BK-4024218I', 'Manifes Partai Komunis', 'Karl Marx dan Friedrich Engels', ' ', 'Sejarah & Geografi', 'Jajasan Pembaruan', 1, 1, '2026-06-05 14:41:44'),
	(9, 'BK-521609E1', 'Ada Apa di Balik Segitiga ?', 'Munal Hani\'ah', 'ISBN 979-28-0343-3', 'Sains & Matematika', 'PT Intan Pariwara', 1, 1, '2026-06-05 14:43:18'),
	(10, 'BK-617099XD', 'Pedoman Umum Ejaan Bahasa Indonesia yang Disempurnakan', 'Lukman Ali', '-', 'Bahasa', 'Departemen Pendidikan dan Kebudayaan', 1, 1, '2026-06-05 14:45:21'),
	(11, 'BK-736259W3', 'Aneka Masakan Nasi yang Bergizi', 'Murni Anugrah Lestyorini', 'ISBN 979-760-760-468-3', 'Teknologi & Ilmu Terapan', 'Seti-Aji', 1, 1, '2026-06-05 14:47:22'),
	(12, 'BK-877168OV', 'Ayo Meresensi Buku', 'Sudaryanto', 'ISBN 978-979-026-184-6', 'Sastra', 'PT Pustaka Insan Madani', 1, 1, '2026-06-05 14:50:10'),
	(13, 'BK-016423M1', 'Rangkuman dan Evaluasi Ilmu Pengetahuan Sosial', 'Muhammad Munif', '-', 'Ilmu Sosial', 'Usaha Makmur Solo', 1, 1, '2026-06-05 14:52:35'),
	(14, 'BK-1979734B', 'Pakinangan Masyarakat Jawa Tengah', 'Suhartati, Rina Prayekti, & Laela Nurhayati Dewi.', 'ISBN 978-979-704-684-2', 'Kesenian & Rekreasi', 'Dinas Kebudayaan dan Pariwisata Provinsi Jawa Tengah', 1, 1, '2026-06-05 14:56:08'),
	(16, 'BK-188196AP', 'Segalanya untuk Rakyat', 'Sardan Marbun', '-', 'Ilmu Sosial', 'Sambung Hati 9949', 1, 1, '2026-06-06 02:38:08'),
	(17, 'BK-5073472I', 'A Cup of Chicken Soup for the Soul: Kisah-Kisah untuk Membuka Hati dan Mengobarkan Semangat Kembali', 'Jack Canfield, Mark Victor Hansen, & Barry Spilchuk', 'ISBN 979-605-651-3', 'Psikologi', 'PT Gramedia Pustaka Utama', 1, 1, '2026-06-06 02:40:59'),
	(18, 'BK-672330BA', 'Pengayaan Matematika Dasar 1', 'Andrian Yusnandar, S.Pd. & Prof. Dr. H. Wahyudin', 'ISBN 978-979-3175-02-7', 'Sains & Matematika', 'CV. Sumber Harapan', 1, 1, '2026-06-06 02:44:03'),
	(19, 'BK-853104N9', 'Qishashul-Anbiya (Sejarah 25 Rasul)', 'Ny. H. Hadiyah Salim', 'ISBN 979-400-217-8', 'Agama', 'PT Alma\'arif', 1, 1, '2026-06-06 02:46:49'),
	(20, 'BK-01556034', 'Pedoman Umum Ejaan Bahasa Indonesia & Pedoman Umum Pembentukan Istilah', 'Badan Pengembangan dan Pembinaan Bahasa, Kementerian Pendidikan dan Kebudayaan Republik Indonesia', '-', 'Bahasa', ' Badan Pengembangan dan Pembinaan Bahasa (Kementerian Pendidikan dan Kebudayaan RI)', 1, 1, '2026-06-06 02:50:39'),
	(21, 'BK-251396ER', 'Jurus Bisnis Rakyat: 12 Jawara Usaha Kecil', 'Ari Gunawan & Sulistiyono', 'ISBN 978-602-736-500-1', 'Ilmu Sosial', 'PT Imaji Kali Aksi', 1, 1, '2026-06-06 02:53:42'),
	(22, 'BK-429211VK', 'Masa Pemuda Putra Sang Fajar: 1919–1922', 'Sari Pusparini Soleh', 'ISBN 979-692-122-7', 'Sejarah & Geografi', 'PT Remaja Rosdakarya & Yayasan Bung Karno', 1, 1, '2026-06-06 03:02:28'),
	(23, 'BK-992272EJ', 'Puisi Dunia I (Gema Jiwa Slavia dan Latin)', 'M. Taslim Ali', 'ISBN 979-407-567-1', 'Sastra', 'PT Balai Pustaka (Persero)', 1, 1, '2026-06-06 03:07:28'),
	(24, 'BK-261377A3', 'Belajar Menulis', 'Monica Abigail W.', 'ISBN 978-602-8567-08-4', 'Buku Pendidikan', 'PT Temprina Media Grafika', 1, 1, '2026-06-06 03:10:54'),
	(25, 'BK-478012MB', 'Tas Plastik', 'Nyoman Sri Utami', '-', 'Buku Fiksi Anak', 'PT Pelangi Indonesia', 1, 1, '2026-06-06 03:13:46'),
	(26, 'BK-633060ML', 'Anak Kecil dengan Biolanya ', 'Pavel Vezhinov ', 'ISBN 979-666-606-5', 'Sastra', 'PT Balai Pustaka (Persero)', 1, 1, '2026-06-06 03:16:53'),
	(27, 'BK-857620VN', 'Sejarah Indonesia Jilid 7: Zaman Kemerdekaan dan Diplomasi Mempertahankan Kemerdekaan', 'Eko Praptanto', 'ISBN 978-979-050-021-1', 'Sejarah & Geografi', 'PT Bina Sumber Daya MIPA', 1, 1, '2026-06-06 03:24:46'),
	(28, 'BK-301734ZL', 'Serendipity: Penemuan-Penemuan di Bidang Sains yang Tidak Disengaja', 'Royston M. Roberts', 'ISBN 0-471-50658-3', 'Sejarah & Geografi', 'PT Pakar Raya Pustaka', 1, 1, '2026-06-06 03:31:25'),
	(29, 'BK-742363UE', 'Jangir Bali', 'Nur Sutan Iskandar', 'ISBN 979-666-225-6', 'Sastra', 'PT Balai Pustaka', 1, 1, '2026-06-06 03:35:36'),
	(30, 'BK-9428142K', 'RPUL & RIPAL', ' Drs. Satyo Adi', 'ISBN 602-864-411-0 ', 'Sejarah & Geografi', 'Bintang Timur / CV Bringin 55', 1, 1, '2026-06-06 03:36:58'),
	(31, 'BK-027545YO', 'Tanaman Kelapa yang Berdaya Guna', 'Westriningsih', ' ISBN 978-602-8266-91-8', 'Sains & Matematika', 'PT Permata Equator Media', 1, 1, '2026-06-06 03:39:00'),
	(32, 'BK-161301OU', '30 Menit Beres Ulangan Harian & Dapat Nilai 100 SD/MI Kelas 5', 'Asosiasi Guru Bangsa', 'ISBN 978-602-7732-28-5', 'Buku Pendidikan', 'Laskar Aksara / Laskar Askara', 1, 1, '2026-06-06 03:41:00'),
	(33, 'BK-276135QG', 'Ke Rumah Kakek', 'Nyoman Sri Utami', ' ISBN 978-602-0832-30-2', 'Karya Fiksi Anak', 'Yayasan Literasi Anak Indonesia (YLAI)', 1, 1, '2026-06-06 03:41:59'),
	(34, 'BK-324959D2', 'Bagian Seri: Bagaimana Kita Mengukur Luas', 'Chris Woodford', 'ISBN 979-534-536-7', 'Sains & Matematika', 'PT Pakar Raya Pustaka', 1, 1, '2026-06-06 03:43:07'),
	(35, 'BK-3961310W', 'Lima Masalah Terbesar Sains yang Belum Terpecahkan', 'Arthur W. Wiggins & Charles M. Wynn', 'ISBN 978-979-534-709-5', 'Sains & Matematika', 'PT Pakar Raya Pustaka Bandung', 1, 1, '2026-06-06 03:44:37'),
	(36, 'BK-489405RZ', 'Tuntunan Sekar Macapat', 'Ki Tentrem Warsena, L.C.', '-', 'Bahasa', 'CV Cendrawasih', 1, 1, '2026-06-06 03:45:54'),
	(37, 'BK-567030DJ', '30 Tahun Indelan Merdeka ', 'Sudharmono, S.H. ', '-', 'Sejarah & Geografi', 'PT. Ciccero Indonesia', 1, 1, '2026-06-06 03:48:22'),
	(38, 'BK-709927CW', 'Mempelajari Banguan Ruang Limas ', 'Evi Rine Hartuti', '-', 'Sains & Matematika', ' PT Intan Pariwara', 1, 1, '2026-06-06 03:50:06'),
	(39, 'BK-811387C1', 'Kerajinan Tangan dan Kesenian 5', 'Dra. Yati Priyati Sofyan dan Drs. Djamhur', 'ISBN 979-571-044-3', 'Kesenian & Rekreasi', 'PT Ganeca Exact Bandung', 1, 1, '2026-06-06 03:51:37'),
	(40, 'BK-9110119H', 'Kesebangunan', 'Dewi Marsiyah', 'ISBN 978-979-28-0636-6', 'Sains & Matematika', 'PT Intan Pariwara', 1, 1, '2026-06-06 03:53:14'),
	(41, 'BK-0116827F', 'Himpunan Lengkap', ' ', ' ', 'Pendidikan', ' ', 1, 1, '2026-06-06 03:54:07'),
	(42, 'BK-940439IN', 'Kisah Raden Patah Adipati Unus & Sultan Trenggono', 'Ahmad Shodikin', '-', 'Sejarah & Geografi', 'Putra Bintoro', 1, 1, '2026-06-07 13:58:45'),
	(43, 'BK-352066Y3', 'Terapi Jus untuk Kesehatan', 'Rianti Amanda', 'ISBN 978-602-99898-2-6', 'Teknologi & Ilmu Terapan', 'CV Sanggabuana', 1, 1, '2026-06-07 14:43:53'),
	(44, 'BK-438051R0', 'Lelagon Dolanan: Seneng Nembang', 'Ign. Supardjo (Ignatius Supardjo)', '-', 'Bahasa', 'CV Cendrawasih', 1, 1, '2026-06-07 14:46:00'),
	(45, 'BK-562982XS', 'Akhir Sebuah Gerhana', 'Deriawan D.', 'ISBN 979-9117-02-X', 'Karya Fiksi', 'CV Griya Wiyata', 1, 1, '2026-06-07 14:47:59'),
	(46, 'BK-6991780H', 'Rumah Mati di Siberia', 'F.M. Destojewski (Fyodor Dostoevsky)', 'ISBN 979-666-658-8', 'Sastra', 'PT Balai Pustaka (Persero)', 1, 1, '2026-06-07 14:50:22'),
	(47, 'BK-82455651', 'Mengapa Disebut Bentuk Baku dan Tidak Baku?', 'Dirgo Sabariyanto', 'ISBN 979-507-090-8; ISBN 979-507-091-6', 'Bahasa', 'Mitra Gama Widya', 1, 1, '2026-06-07 14:52:28'),
	(48, 'BK-952927V5', 'Lari, Gung! Lari!', 'Mahfud Ikhwan', 'ISBN 979-3632-88-9', 'Karya Fiksi', 'PT Sunda Kelapa Pustaka', 1, 1, '2026-06-07 14:53:35'),
	(49, 'BK-0176495X', 'Evaluasi Hasil Belajar Bahasa Indonesia: Jilid 5', 'Tim Bakti Guru', '-', 'Buku Pendidikan', 'PT Remaja Rosdakarya', 1, 1, '2026-06-07 14:56:24'),
	(50, 'BK-222363ZJ', 'Tuntunan Sekar Macapat', 'Ki Tentrem Warsena, L.C.', '-', 'Sastra', 'CV Cendrawasih', 1, 1, '2026-06-07 15:00:06'),
	(51, 'BK-408571SD', 'Mengenal Alat Ukur', 'Alnurrizk Muthfisari', 'ISBN 979-28-0173-6', 'Sains & Matematika', 'PT Intan Pariwara', 1, 1, '2026-06-07 15:01:12'),
	(52, 'BK-523441YB', 'Bagaimana Hewan dan Tumbuhan Mempertahankan Diri', 'Wigati Hadi Omegawati', 'ISBN 979-28-0540-6', 'Sains & Matematika', 'PT Intan Pariwara', 1, 1, '2026-06-07 15:02:38'),
	(53, 'BK-560588XM', 'Menentukan Debit', 'Muklis', 'ISBN 979-28-0203-0', 'Sains & Matematika', 'PT Intan Pariwara', 1, 1, '2026-06-07 15:04:26'),
	(54, 'BK-667756SG', 'Sejarah Indonesia Jilid 2: Zaman Sejarah Kuna', 'Eko Praptanto', 'ISBN 978-979-050-016-7', 'Sejarah & Geografi', 'PT Bina Sumber Daya MIPA', 1, 1, '2026-06-07 15:05:40'),
	(55, 'BK-741840FM', 'Kerajinan Tangan dan Kesenian 1: Untuk Sekolah Dasar Kelas 1', 'Tim Bina Karya Guru', 'ISBN 979-741-201-6', 'Pendidikan Dasar', 'Erlangga', 1, 1, '2026-06-07 15:06:57'),
	(56, 'BK-818356BE', 'Bunga Rampai Peribahasa & Pantun untuk SD, SMP, SMA, dan Umum', 'M. Syamsul Hidayat, S.Pd.', '-', 'Sastra', 'Apollo / Apollo Lestari', 1, 1, '2026-06-07 15:08:43'),
	(57, 'BK-924727H8', 'Museum Ranggawarsita sebagai Media dan Sumber Belajar Berbasis Kompetensi di SD/MI, SMP/MTs, SMA/MA', 'Dra. Hermawati, M.T., Drs. Sunarto, & Rohayati, B.B.A.', '-', 'Pendidikan', 'Dinas Kebudayaan dan Pariwisata Provinsi Jawa Tengah', 1, 1, '2026-06-07 15:12:01'),
	(58, 'BK-1759553G', 'Habis Gelap Terbitlah Terang', 'Raden Adjeng (R.A.) Kartini', 'ISBN 978-979-407-063-5', 'Sejarah & Geografi', 'PT Balai Pustaka (Persero)', 1, 1, '2026-06-07 15:13:34'),
	(59, 'BK-219372F8', 'Budidaya dan Manfaat Mengkudu, Blustru, Ciplukan, & Mahkota Dewa', 'Kardono', 'ISBN 978-979-050-077-8', 'Teknologi & Ilmu Terapan', 'PT Armandelta Selaras', 1, 1, '2026-06-07 15:14:55'),
	(60, 'BK-297454MY', 'Pertanian Organik', 'Nashshar F.M.', 'ISBN 978-602-8701-06-8', 'Sains & Matematika', 'Walatra', 1, 1, '2026-06-07 15:16:35'),
	(61, 'BK-406348BY', 'Kawruh Pepak Basa Jawa', 'Sunarto Wiguno / Sutopo', 'ISBN 978-602-9792-64-5', 'Bahasa', 'Palito Media / Brian Publisher', 1, 1, '2026-06-07 15:18:24'),
	(62, 'BK-520676IB', 'Menuju Ginjal Sehat', 'Prof. Dr. dr. Djoko Santoso, Sp.PD-KGH, FINASIM', 'ISBN 979-1490-47-4', 'Teknologi & Ilmu Terapan', 'JP Books (PT. JePe Press Media Utama)', 1, 1, '2026-06-07 15:20:34'),
	(63, 'BK-768794Y1', 'Dongeng Basa Jawi', 'Drs. Slamet Raharjo', '-', 'Sastra', 'Media Wiyata', 1, 1, '2026-06-07 15:23:07');

-- Dumping structure for table pustaka_kiosk.members
CREATE TABLE IF NOT EXISTS `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfid_uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'SISWA',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_uid` (`rfid_uid`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustaka_kiosk.members: ~4 rows (approximately)
INSERT INTO `members` (`id`, `rfid_uid`, `name`, `student_id`, `role`, `created_at`) VALUES
	(1, '584187125992', 'Ripki', '3.33.23.1.20', 'SISWA', '2026-05-16 06:54:59'),
	(2, '427211199557', 'zaky', '157', 'GURU', '2026-05-28 13:35:02'),
	(3, '219453756617', 'aziz', '234', 'GURU', '2026-05-28 13:35:38'),
	(5, '290605077527', 'test', '231', 'SISWA', '2026-06-07 07:31:54');

-- Dumping structure for table pustaka_kiosk.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `book_id` int NOT NULL,
  `type` enum('PINJAM','KEMBALI') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('BERJALAN','SELESAI') COLLATE utf8mb4_unicode_ci DEFAULT 'BERJALAN',
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` timestamp NULL DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustaka_kiosk.transactions: ~0 rows (approximately)
INSERT INTO `transactions` (`id`, `member_id`, `book_id`, `type`, `status`, `transaction_date`, `due_date`, `return_date`) VALUES
	(9, 1, 3, 'KEMBALI', 'SELESAI', '2026-06-06 15:49:23', '2026-06-13 15:49:23', '2026-06-06 15:59:56'),
	(10, 1, 3, 'PINJAM', 'BERJALAN', '2026-06-07 03:56:55', '2026-06-14 03:56:55', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
