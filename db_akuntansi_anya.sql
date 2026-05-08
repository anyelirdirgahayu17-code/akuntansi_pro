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

-- Dumping structure for table db_akuntansi.buku_besars
CREATE TABLE IF NOT EXISTS `buku_besars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `perkiraan_id` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `no_ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jurnal_detail_id` bigint unsigned NOT NULL,
  `posisi` enum('Debit','Kredit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_besars_perkiraan_id_foreign` (`perkiraan_id`),
  KEY `buku_besars_jurnal_detail_id_foreign` (`jurnal_detail_id`),
  CONSTRAINT `buku_besars_jurnal_detail_id_foreign` FOREIGN KEY (`jurnal_detail_id`) REFERENCES `jurnal_details` (`id`),
  CONSTRAINT `buku_besars_perkiraan_id_foreign` FOREIGN KEY (`perkiraan_id`) REFERENCES `perkiraans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.buku_besars: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.faktur_pembelians
CREATE TABLE IF NOT EXISTS `faktur_pembelians` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pemasok_id` bigint unsigned NOT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `diskon` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ppn` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('Draft','Final','Void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_bayar` enum('Belum Lunas','Sebagian','Lunas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `jurnal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faktur_pembelians_no_faktur_unique` (`no_faktur`),
  KEY `faktur_pembelians_pemasok_id_foreign` (`pemasok_id`),
  KEY `faktur_pembelians_jurnal_id_foreign` (`jurnal_id`),
  CONSTRAINT `faktur_pembelians_jurnal_id_foreign` FOREIGN KEY (`jurnal_id`) REFERENCES `jurnal_umums` (`id`),
  CONSTRAINT `faktur_pembelians_pemasok_id_foreign` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasoks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.faktur_pembelians: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.faktur_penjualans
CREATE TABLE IF NOT EXISTS `faktur_penjualans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pelanggan_id` bigint unsigned NOT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `diskon` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ppn` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('Draft','Final','Void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_bayar` enum('Belum Lunas','Sebagian','Lunas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `jurnal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faktur_penjualans_no_faktur_unique` (`no_faktur`),
  KEY `faktur_penjualans_pelanggan_id_foreign` (`pelanggan_id`),
  KEY `faktur_penjualans_jurnal_id_foreign` (`jurnal_id`),
  CONSTRAINT `faktur_penjualans_jurnal_id_foreign` FOREIGN KEY (`jurnal_id`) REFERENCES `jurnal_umums` (`id`),
  CONSTRAINT `faktur_penjualans_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.faktur_penjualans: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.jurnal_details
CREATE TABLE IF NOT EXISTS `jurnal_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jurnal_id` bigint unsigned NOT NULL,
  `perkiraan_id` bigint unsigned NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jurnal_details_jurnal_id_foreign` (`jurnal_id`),
  KEY `jurnal_details_perkiraan_id_foreign` (`perkiraan_id`),
  CONSTRAINT `jurnal_details_jurnal_id_foreign` FOREIGN KEY (`jurnal_id`) REFERENCES `jurnal_umums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jurnal_details_perkiraan_id_foreign` FOREIGN KEY (`perkiraan_id`) REFERENCES `perkiraans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.jurnal_details: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.jurnal_umums
CREATE TABLE IF NOT EXISTS `jurnal_umums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_jurnal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` enum('Umum','Penyesuaian','Penutup') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Draft','Posted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `posted_at` timestamp NULL DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jurnal_umums_no_jurnal_unique` (`no_jurnal`),
  KEY `jurnal_umums_created_by_foreign` (`created_by`),
  CONSTRAINT `jurnal_umums_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.jurnal_umums: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.laporan_keuangans
CREATE TABLE IF NOT EXISTS `laporan_keuangans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipe` enum('Neraca','Laba Rugi','Arus Kas','Perubahan Modal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode_bulan` int NOT NULL,
  `periode_tahun` int NOT NULL,
  `data` json NOT NULL,
  `generated_at` datetime NOT NULL,
  `generated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laporan_keuangans_generated_by_foreign` (`generated_by`),
  CONSTRAINT `laporan_keuangans_generated_by_foreign` FOREIGN KEY (`generated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.laporan_keuangans: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.migrations: ~16 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2026_05_08_021424_create_perkiraans_table', 1),
	(6, '2026_05_08_073323_create_pelanggans_table', 2),
	(7, '2026_05_08_073621_create_pemasoks_table', 2),
	(8, '2026_05_08_073828_create_jurnal_umums_table', 3),
	(9, '2026_05_08_073952_create_jurnal_details_table', 3),
	(10, '2026_05_08_074334_create_buku_besars_table', 4),
	(11, '2026_05_08_074451_create_saldo_akuns_table', 4),
	(12, '2026_05_08_074631_create_faktur_penjualans_table', 5),
	(13, '2026_05_08_074722_create_faktur_pembelians_table', 5),
	(14, '2026_05_08_074827_create_pembayarans_table', 5),
	(15, '2026_05_08_074947_create_neraca_saldos_table', 6),
	(16, '2026_05_08_075030_create_laporan_keuangans_table', 6);

-- Dumping structure for table db_akuntansi.neraca_saldos
CREATE TABLE IF NOT EXISTS `neraca_saldos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `periode_bulan` int NOT NULL,
  `periode_tahun` int NOT NULL,
  `perkiraan_id` bigint unsigned NOT NULL,
  `saldo_debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_kredit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_neraca_unique` (`periode_bulan`,`periode_tahun`,`perkiraan_id`),
  KEY `neraca_saldos_perkiraan_id_foreign` (`perkiraan_id`),
  CONSTRAINT `neraca_saldos_perkiraan_id_foreign` FOREIGN KEY (`perkiraan_id`) REFERENCES `perkiraans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.neraca_saldos: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.password_resets: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.pelanggans
CREATE TABLE IF NOT EXISTS `pelanggans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `npwp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_piutang` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jatuh_tempo` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelanggans_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.pelanggans: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.pemasoks
CREATE TABLE IF NOT EXISTS `pemasoks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `npwp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rekening` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pemasoks_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.pemasoks: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.pembayarans
CREATE TABLE IF NOT EXISTS `pembayarans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_pembayaran` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tipe` enum('Masuk','Keluar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber` enum('Penjualan','Pembelian','Lainnya') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber_id` bigint unsigned DEFAULT NULL,
  `sumber_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pelanggan_id` bigint unsigned DEFAULT NULL,
  `pemasok_id` bigint unsigned DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL DEFAULT '0.00',
  `metode` enum('Tunai','Transfer','Cek') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_referensi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `jurnal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pembayarans_no_pembayaran_unique` (`no_pembayaran`),
  KEY `pembayarans_pelanggan_id_foreign` (`pelanggan_id`),
  KEY `pembayarans_pemasok_id_foreign` (`pemasok_id`),
  KEY `pembayarans_jurnal_id_foreign` (`jurnal_id`),
  CONSTRAINT `pembayarans_jurnal_id_foreign` FOREIGN KEY (`jurnal_id`) REFERENCES `jurnal_umums` (`id`),
  CONSTRAINT `pembayarans_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggans` (`id`),
  CONSTRAINT `pembayarans_pemasok_id_foreign` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasoks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.pembayarans: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.perkiraans
CREATE TABLE IF NOT EXISTS `perkiraans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('Aktiva Lancar','Aktiva Tetap','Kewajiban Lancar','Kewajiban Jangka Panjang','Ekuitas','Pendapatan','Beban Pokok','Beban Operasional','Beban Lain-lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelompok` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saldo_normal` enum('Debit','Kredit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_header` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `saldo_awal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perkiraans_kode_unique` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.perkiraans: ~5 rows (approximately)
INSERT INTO `perkiraans` (`id`, `kode`, `nama`, `jenis`, `kelompok`, `saldo_normal`, `is_header`, `is_active`, `saldo_awal`, `deskripsi`, `created_at`, `updated_at`) VALUES
	(1, '1101', 'Kas Utama', 'Aktiva Lancar', NULL, 'Debit', 0, 1, 1000000.00, NULL, NULL, NULL),
	(2, '1102', 'Bank Mandiri', 'Aktiva Lancar', NULL, 'Debit', 0, 1, 5000000.00, NULL, NULL, NULL),
	(3, '2101', 'Hutang Usaha', 'Kewajiban Jangka Panjang', NULL, 'Kredit', 0, 1, 0.00, NULL, NULL, NULL),
	(4, '4101', 'Pendapatan Jasa', 'Pendapatan', NULL, 'Kredit', 0, 1, 1500000.00, NULL, NULL, NULL),
	(5, '0002', 'Kas di Tangan', 'Aktiva Lancar', NULL, 'Debit', 0, 1, 5000000.00, NULL, NULL, NULL);

-- Dumping structure for table db_akuntansi.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.saldo_akuns
CREATE TABLE IF NOT EXISTS `saldo_akuns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `perkiraan_id` bigint unsigned NOT NULL,
  `tahun` int NOT NULL,
  `bulan` int NOT NULL,
  `saldo_awal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_akhir` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `saldo_akuns_perkiraan_id_tahun_bulan_unique` (`perkiraan_id`,`tahun`,`bulan`),
  CONSTRAINT `saldo_akuns_perkiraan_id_foreign` FOREIGN KEY (`perkiraan_id`) REFERENCES `perkiraans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.saldo_akuns: ~0 rows (approximately)

-- Dumping structure for table db_akuntansi.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_akuntansi.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
