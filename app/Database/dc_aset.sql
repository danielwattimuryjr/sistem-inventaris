-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2022 pada 11.34
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dc_aset`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `asets`
--

CREATE TABLE `asets` (
  `id_aset` varchar(128) NOT NULL,
  `kode_aset` varchar(128) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `kondisi` varchar(128) DEFAULT 'Baik',
  `status_aset` varchar(50) DEFAULT NULL,
  `umur_ekonomis` int(11) DEFAULT NULL,
  `jenis_bantuan` varchar(128) DEFAULT NULL,
  `jenis_aset` varchar(128) DEFAULT 'Berwujud',
  `qr_code` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jenis_bmn` varchar(128) DEFAULT NULL,
  `kode_barang` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Struktur dari tabel `data_aset`
--

CREATE TABLE `data_aset` (
  `id_aset` int(11) NOT NULL,
  `nama_aset` varchar(128) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `kode_kategori` varchar(128) DEFAULT NULL,
  `nama_kategori` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `kode_kategori`, `nama_kategori`, `updated_at`) VALUES
(1, 'MED', 'MEDIS', '2020-09-24 22:48:11'),
(2, 'NON', 'NON-MEDIS', '2020-09-24 22:48:34');
-- --------------------------------------------------------

--
-- Struktur dari tabel `keputusan_pengadaan`
--

CREATE TABLE `keputusan_pengadaan` (
  `id_nilai` int(11) NOT NULL,
  `id_aset` int(11) DEFAULT NULL,
  `id_spesifikasi` int(11) DEFAULT NULL,
  `id_kualitas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria_kualitas`
--

CREATE TABLE `kriteria_kualitas` (
  `id_kualitas` int(11) NOT NULL,
  `keterangan` varchar(128) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kriteria_kualitas`
--

INSERT INTO `kriteria_kualitas` (`id_kualitas`, `keterangan`, `nilai`) VALUES
(1, 'Sangat Baik', 0.5),
(2, 'Baik', 0.4),
(3, 'Cukup', 0.3),
(4, 'Jelek', 0.2),
(5, 'Sangat Jelek', 0.1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria_spesifikasi`
--

CREATE TABLE `kriteria_spesifikasi` (
  `id_spesifikasi` int(11) NOT NULL,
  `keterangan` varchar(128) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kriteria_spesifikasi`
--

INSERT INTO `kriteria_spesifikasi` (`id_spesifikasi`, `keterangan`, `nilai`) VALUES
(1, 'Sangat Baik', 0.5),
(2, 'Baik', 0.4),
(3, 'Cukup', 0.3),
(4, 'Jelek', 0.2),
(5, 'Sangat Jelek', 0.1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi_aset`
--

CREATE TABLE `lokasi_aset` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lokasi_aset`
--

INSERT INTO `lokasi_aset` (`id_lokasi`, `nama_lokasi`, `updated_at`) VALUES
(1, 'Head Office', '2021-11-04 13:08:25'),
(2, 'Produksi', '2021-11-04 13:08:40'),
(3, 'Gudang', '2021-11-04 13:08:49'),
(4, 'Laboratorium', '2021-11-04 13:09:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_aset`
--

CREATE TABLE `monitoring_aset` (
  `id_monitoring` int(11) NOT NULL,
  `id_aset` varchar(128) DEFAULT NULL,
  `kerusakan` text DEFAULT NULL,
  `akibat` text DEFAULT NULL,
  `faktor` text DEFAULT NULL,
  `monitoring` text DEFAULT NULL,
  `pemeliharaan` text DEFAULT NULL,
  `jml_rusak` varchar(128) DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengadaan`
--

CREATE TABLE `pengadaan` (
  `id_pengadaan` int(11) NOT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_aset` varchar(128) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `satuan` varchar(128) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `tahun_pengadaan` varchar(4) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengadaan`
--

INSERT INTO `pengadaan` (`id_pengadaan`, `id_lokasi`, `id_user`, `nama_aset`, `volume`, `satuan`, `harga_satuan`, `tahun_pengadaan`, `status`, `created_at`) VALUES
(3, 1, 8, 'Full Set Komputer Core i5 Lcd 19inc Lenovo', 2, 'Unit', 5000000, '2020', '1', '2021-11-04 14:20:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penghapusan`
--

CREATE TABLE `penghapusan` (
  `id_penghapusan` int(11) NOT NULL,
  `id_aset` varchar(128) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `faktor` text DEFAULT NULL,
  `tgl_penghapusan` date DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(6) NOT NULL,
  `nama_user` varchar(125) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `jabatan` varchar(128) NOT NULL,
  `role` enum('1','2','3') DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_user`, `username`, `password`, `jabatan`, `role`, `foto`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', '1', '1a8e897e32abe9537b1183c8e27611b8.png'),
(8, 'Natalia Sukmalina', 'staff', '25d55ad283aa400af464c76d713c07ad', 'Staf General Affair', '3', '3a635aedf846db95f937cb65e73a3e3e.jpg'),
(9, 'Binanga Sinaga', 'manager', '25d55ad283aa400af464c76d713c07ad', 'Manager General Affair', '2', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `asets`
--
ALTER TABLE `asets`
  ADD PRIMARY KEY (`id_aset`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD UNIQUE (`kode_barang`),
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_jenis` (`id_kategori`);

--
-- Indeks untuk tabel `data_aset`
--
ALTER TABLE `data_aset`
  ADD PRIMARY KEY (`id_aset`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `keputusan_pengadaan`
--
ALTER TABLE `keputusan_pengadaan`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_spesifikasi` (`id_spesifikasi`),
  ADD KEY `id_kualitas` (`id_kualitas`),
  ADD KEY `id_aset` (`id_aset`);

--
-- Indeks untuk tabel `kriteria_kualitas`
--
ALTER TABLE `kriteria_kualitas`
  ADD PRIMARY KEY (`id_kualitas`);

--
-- Indeks untuk tabel `kriteria_spesifikasi`
--
ALTER TABLE `kriteria_spesifikasi`
  ADD PRIMARY KEY (`id_spesifikasi`);

--
-- Indeks untuk tabel `lokasi_aset`
--
ALTER TABLE `lokasi_aset`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `monitoring_aset`
--
ALTER TABLE `monitoring_aset`
  ADD PRIMARY KEY (`id_monitoring`),
  ADD KEY `id_aset` (`id_aset`);

--
-- Indeks untuk tabel `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `penghapusan`
--
ALTER TABLE `penghapusan`
  ADD PRIMARY KEY (`id_penghapusan`),
  ADD KEY `id_aset` (`id_aset`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `data_aset`
--
ALTER TABLE `data_aset`
  MODIFY `id_aset` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `keputusan_pengadaan`
--
ALTER TABLE `keputusan_pengadaan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kriteria_kualitas`
--
ALTER TABLE `kriteria_kualitas`
  MODIFY `id_kualitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kriteria_spesifikasi`
--
ALTER TABLE `kriteria_spesifikasi`
  MODIFY `id_spesifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `lokasi_aset`
--
ALTER TABLE `lokasi_aset`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `monitoring_aset`
--
ALTER TABLE `monitoring_aset`
  MODIFY `id_monitoring` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengadaan`
--
ALTER TABLE `pengadaan`
  MODIFY `id_pengadaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `penghapusan`
--
ALTER TABLE `penghapusan`
  MODIFY `id_penghapusan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `asets`
--
ALTER TABLE `asets`
  ADD CONSTRAINT `asets_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asets_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_aset` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keputusan_pengadaan`
--
ALTER TABLE `keputusan_pengadaan`
  ADD CONSTRAINT `keputusan_pengadaan_ibfk_1` FOREIGN KEY (`id_spesifikasi`) REFERENCES `kriteria_spesifikasi` (`id_spesifikasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keputusan_pengadaan_ibfk_2` FOREIGN KEY (`id_kualitas`) REFERENCES `kriteria_kualitas` (`id_kualitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keputusan_pengadaan_ibfk_3` FOREIGN KEY (`id_aset`) REFERENCES `data_aset` (`id_aset`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `monitoring_aset`
--
ALTER TABLE `monitoring_aset`
  ADD CONSTRAINT `monitoring_aset_ibfk_1` FOREIGN KEY (`id_aset`) REFERENCES `asets` (`id_aset`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD CONSTRAINT `pengadaan_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_aset` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengadaan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penghapusan`
--
ALTER TABLE `penghapusan`
  ADD CONSTRAINT `penghapusan_ibfk_1` FOREIGN KEY (`id_aset`) REFERENCES `asets` (`id_aset`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- Additionals Barang Data
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204002', 'A.C. Sentral', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204004', 'A.C. Split', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204026', 'Acces Point', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080502005', 'Accustic Emmisim Device', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080159014', 'Acrylic', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080120001', 'Adaptor (Alat Laboratorium Fisika)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105062', 'Adult Volume Ventilator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102008', 'Aero Sterisator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3110202033', 'Air Compressor (Alat Eksplorasi Geofisika Elektronik/electric)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080108060', 'Air Compressor (Alat Laboratorium Mekanika Tanah Dan Batuan)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204013', 'Air Curtain', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080602046', 'Air Purlier', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080602053', 'Air Sampler', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205999', 'Alat Dapur Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105011', 'Alat Detektor Uang Palsu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206025', 'Alat Hiasan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030305999', 'Alat Kalibrasi Alinnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050199999', 'Alat Kantor Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070128999', 'Alat Kedokteran Anaesthesi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110999', 'Alat Kedokteran Anak Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108999', 'Alat Kedokteran Bagian Penyakit Dalam Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070126999', 'Alat Kedokteran Bedah Jantung Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104999', 'Alat Kedokteran Bedah Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070123999', 'Alat Kedokteran Bedah Orthopedi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121999', 'Alat Kedokteran Gawat Darurat Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102999', 'Alat Kedokteran Gigi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070124999', 'Alat Kedokteran I C U Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114999', 'Alat Kedokteran Jantung Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070109999', 'Alat Kedokteran Kamar Jenasah Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070120999', 'Alat Kedokteran Kulit Dan Kelamin Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070199999', 'Alat Kedokteran Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107999', 'Alat Kedokteran Mata Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113999', 'Alat Kedokteran Neurologi (Syaraf) Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119999', 'Alat Kedokteran Nuklir Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116999', 'Alat Kedokteran Patologi Anatomy Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115999', 'Alat Kedokteran Radiodiagnostic Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070118999', 'Alat Kedokteran Radioterapy Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106999', 'Alat Kedokteran THT Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070117999', 'Alat Kedokteran Transfusi Darah Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101999', 'Alat Kedokteran Umum Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105999', 'Alat Kesehatan Kebidanan Dan Penyakit Kandungan Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112999', 'Alat Kesehatan Rehabilitasi Medis Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070299999', 'Alat Kesehatan Umum Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201999', 'Alat Komunikasi Telephone Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080119999', 'Alat Laboratorium Farmasi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080115999', 'Alat Laboratorium Immunologi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080101999', 'Alat Laboratorium Kimia Air Teknik Penyehatan Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080112999', 'Alat Laboratorium Microbiologi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114999', 'Alat Laboratorium Patologi Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111999', 'Alat Laboratorium Umum Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TETAP LAINNYA', '6020101999', 'Alat Musik Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150299999', 'Alat Pelindung Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141005', 'Alat Pemadam Kebakaran', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080117019', 'Alat Pemanas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102086', 'Alat Pemanas Prosesing ( Water Heater )', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050203999', 'Alat Pembersih Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105024', 'Alat Pemotong Kertas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010301999', 'Alat Penarik Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3040106043', 'Alat Pencacah Daun', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204999', 'Alat Pendingin Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3040103005', 'Alat Pengering (Dryer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105015', 'Alat Penghancur Kertas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105085', 'Alat Penghancur Plastik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080156017', 'Alat Pengolah Air Limbah', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3130302999', 'Alat Pengolahan Air Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104999', 'Alat Penyimpan Perlengkapan Kantor Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105052', 'Alat Perekam Suara (Voice Pen)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050299999', 'Alat Rumah Tangga Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206999', 'Alat Rumah Tangga Lainnya ( Home Use )', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105073', 'Alat Sidik Jari', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3190102001', 'Alat Tenis Meja', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030399999', 'Alat Ukur Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070201001', 'Alat-Alat Mikroklimat', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102025', 'Amalgam Pistol/Stoper (Alat Kedokteran Gigi)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102022', 'Amalgamator', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101025', 'Ambubag', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080804002', 'Ampere Meter / Clamp Meter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206005', 'Amplifier', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104011', 'Anaesthesi App', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080801015', 'Anaesthetic Monitor / Analyzer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070128001', 'Anesthesi Apparatus', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115001', 'Angiography Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104032', 'Anuscopy Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104034', 'Appendectomy Instrumen Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115002', 'Apron', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101017', 'Arteriklem', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104036', 'Arthroscopy', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102026', 'Articulator Free Place', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010205001', 'Asrama Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101025', 'Audio Visual', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106006', 'Audiometer (Alat Kedokteran Tht)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101028', 'Autoclave Table', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111115', 'Autoclave Unit (Alat Laboratorium Umum)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105066', 'Automatic Blood Cheminaryan Analizer (Hitachi)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101029', 'Automatic Chart Proyektor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102099', 'Automatic Emergency Light', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115003', 'Automatic Film Processing Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121002', 'Automatic Film Processor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116001', 'Automatic Rotary Microtome', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114019', 'Automatic Tissue Embedding Appatarus', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114016', 'Automatic Tissue Processor (Alat Laboratorium Patologi)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116002', 'Automatic Tisue Prosessor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070109003', 'Autopsi Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070109001', 'Autopsy Table', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030308026', 'Avometer Su 20 - 20 K', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110065', 'Baby Incubator (Alat Kedokteran Anak)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105060', 'Baby Incubator (Alat Kesehatan Kebidanan Dan Penyakit Kandungan)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150201001', 'Baju Anti Panas', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150201002', 'Baju Anti Radiasi', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101032', 'Bak Instrument (Stainles,Kaca,Email)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101034', 'Bak Spuit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080112011', 'Balance Electric', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201006', 'Bangku Panjang Besi/Metal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201007', 'Bangku Panjang Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010101001', 'Bangunan Gedung Kantor Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010105001', 'Bangunan Gedung Laboratorium Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010110001', 'Bangunan Gedung Pendidikan Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010109001', 'Bangunan Gedung Pertemuan Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010108001', 'Bangunan Gedung Tempat Ibadah Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010102001', 'Bangunan Gudang Tertutup Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010106001', 'Bangunan Rumah Sakit Umum', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010125999', 'Bangunan Terbuka Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121004', 'Basic Craniotomy Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104038', 'Basic Surgical Instrument', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121006', 'Basic Thoracic Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3170111006', 'Basket Centrifuge', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080204014', 'Beaker', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070111062', 'Bed Pasien', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101038', 'Bed Side Monitor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108045', 'Bed Side Monitor Complete', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101039', 'Bed Skreen/Sherm', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070125001', 'Bedside Monitor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116004', 'Binoculer Microscope (Alat Kedokteran Patologi Anatomy)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107012', 'Bio Microscope (Slit Lamp)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104040', 'Biopsi Tang', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205018', 'Blender', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111022', 'Blender', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070117001', 'Blood Bank', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114013', 'Blood Bank Incubator', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114005', 'Blood Bank Refrigerator (Alat Laboratorium Patologi)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080113101', 'Blood Cell Counter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070124002', 'Blood Gas Analyzer (Alat Kedokteran I C U)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114008', 'Blood Pressure Monitor (Alat Kedokteran Jantung)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119071', 'Blood Presure Meter/Tensimeter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3170119019', 'Blower', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110066', 'Blue Light', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070123003', 'Bone', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070203004', 'Boneka Anatomi', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070203005', 'Boneka Resucitasi Anne', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102031', 'Boor Gigi', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102032', 'Bracket Holder', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206080', 'Bracket Standing Peralatan', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101042', 'Brancard', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104007', 'Brandkas', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108023', 'Bronchoscope (Alat Kedokteran Bagian Penyakit Dalam)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104013', 'Buffet', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105003', 'Caesarean Section Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102128', 'Camera Digital', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102003', 'Camera Electronic', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102060', 'Camera Film', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206020', 'Camera Video', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104047', 'Canule', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100201001', 'Card Reader (Peralatan Mainframe)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119082', 'Cardio Vascular Instrument', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105057', 'Cardiotocography', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105078', 'Cardiotocography Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105007', 'CCTV - Camera Control Television System', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070125002', 'Central Oxygen', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070125003', 'Central Suction (Alat Kedokteran I C C U)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114005', 'Central Suction (Alat Kedokteran Jantung)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101047', 'Centrifuge (Alat Kedokteran Umum)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111001', 'Centrifuge (Alat Laboratorium Umum)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030211008', 'Cermin Besar', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101065', 'Chairman/Audio Conference', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107056', 'Chalazion Instrument Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060347004', 'Charger', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104049', 'Child Basic Instrument Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204015', 'Chiller                                           ', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080113100', 'Chloridemeter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102012', 'Clinical Chair', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070124003', 'Co2 Analyzer (Alat Kedokteran I C U)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114028', 'Coagulation Meter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080155006', 'Coagulation Timer (Laboratorium Hematologi & Urinalisis)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206045', 'Coffee Maker', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204008', 'Cold Storage (Alat Pendingin)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104053', 'Colone Fiberscope', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104018', 'Colposcope (Alat Kedokteran Bedah)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121013', 'Colposcopy', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119004', 'Complete Stese Test System With Bicyele', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112012', 'Compression Therapy', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010303999', 'Compressor Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070126001', 'Continous Suction Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3170113008', 'Continuous Tray Dryer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080704006', 'Control Panel', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080152002', 'Controller Tekanan', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106042', 'Corong Telinga', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100201006', 'CPU (Peralatan Mainframe)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104016', 'Cryo Surgery', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080115003', 'Cryostat Microtome', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115007', 'CT-Scan', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105082', 'Cup Vaccum Ektraksi', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102041', 'Curret Lurus/Bengkok', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104058', 'Cystoscopy', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121015', 'Cyto Urethroscope', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108068', 'Defibrilator', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119009', 'Dehumidifier (Alat Kedokteran Nuklir)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102005', 'Dental Hand Instruments Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102002', 'Dental Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070120001', 'Dermatology Laser', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121017', 'Dermatome And Mesh', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108071', 'Desinfction Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106048', 'Diagnostic Audio Meter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101003', 'Diagnostik Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080145037', 'Diamond Saw', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101091', 'Digital LED Running Text', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080149009', 'Digital Thermometer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206036', 'Dispenser', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105083', 'Dopler (Fetal Heart Sound Detector)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070118012', 'Dosimeter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070111021', 'Dressing Forceps', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102167', 'Drone                                             ', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080110114', 'Drying Oven', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104068', 'Dual Temperature Steam Stirilizer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206068', 'DVD Player', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203011', 'DVD Writer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114022', 'ECG 3 Channel', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114023', 'Echo Cardiograph System', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113002', 'Echo Encephalograph', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114025', 'Echocolor Doppler', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107061', 'Echoscan, Usg Mata', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114026', 'EKG Elektro Photo Cardiograph For Recording Elektro And', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114027', 'EKG Monitor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104073', 'Electric Cauter', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104071', 'Electric Suction Pump', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113001', 'Electro Encephalograph (Alat Kedokteran Neurologi (syaraf))', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070122001', 'Electro Shock Therapy', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113004', 'Electro Stimulator (Alat Kedokteran Neurologi (syaraf))', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113008', 'Electro Surgery (Alat Kedokteran Neurologi (syaraf))', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104013', 'Electro Surgery Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112014', 'Electro Tilt Table', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114001', 'Electrocardiograph', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080203002', 'Electronic Analytical Balance (General Laboratory Tool)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108016', 'Elektrocardiograph (ECG) 1 Chanel', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010302001', 'Elevator /Lift', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121022', 'Emergency Kit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104074', 'Emergency Trolley', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070122003', 'EMG', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108078', 'Endoscope Trolly', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106059', 'Endoscopy Set', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104014', 'Endoscopy Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108029', 'Endotracheal Tube', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102047', 'Engine Portable Lengkap', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106011', 'ENT Treatment', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121024', 'ENT Treatment Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206006', 'Equalizer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112015', 'Ergocycle', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119078', 'Erithroyte Sedimentation Pate (ESR) Recorder', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010302004', 'Escalator', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101064', 'Examination Lamp', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112018', 'Exercise Pulley Weight', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112019', 'Exercise Treadmil', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114030', 'Exercise Treadmil Test', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204007', 'Exhause Fan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203007', 'External', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203017', 'External/ Portable Hardisk', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201010', 'Facsimile', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104005', 'Filing Cabinet Besi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104006', 'Filing Cabinet Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070118016', 'Film Pass Box', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101067', 'Film Viewer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080115038', 'Filter Cartigges', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108084', 'Finger Exercise', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112022', 'Finger Exercise Table', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060207005', 'Finger Printer Time and Attandance Acces Control System', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105004', 'Fire Alarm', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150404008', 'Fire Alarm System', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204015', 'Firewall', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101069', 'Flow Meter 02', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105058', 'Focusing Screen/Layar LCD Projector', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080118022', 'Food Trolley', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010110005', 'Forklift', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080115013', 'Freezer - 30 Derajat Celcius', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114004', 'Freezer (Alat Laboratorium Patologi)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201025', 'Gantungan Jas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080120008', 'Garpu Tala', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104008', 'Gastro Instestinal Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('KONSTRUKSI DALAM PENGERJAAN (KDP)', '7010101003', 'Gedung dan Bangunan Dalam Pengerjaan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010114002', 'Gedung Garasi/Pool Semi Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010113001', 'Gedung Pos Jaga Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115009', 'General Purpose X-Ray Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060347002', 'Genset', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030207001', 'Gergaji', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104082', 'Gergaji Gips Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3020201002', 'Gerobak Dorong', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114010', 'Glucosa Analyzer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101020', 'Gunting Bengkok', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101021', 'Gunting Lurus', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105090', 'Gynecology Examination Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119077', 'Haemotology Analyzer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111102', 'Hair Dryer/Spray Dryer/Dryer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080126017', 'Hand Drill', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102034', 'Hand Piece', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206046', 'Handy Cam', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201006', 'Handy Talky (HT)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100201012', 'Hard Disk', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110033', 'HB Meter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106067', 'Head Lamp (Alat Kedokteran THT)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101007', 'Head Lamp (Alat Kedokteran Umum)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206055', 'Heater (Alat Rumah Tangga Lainnya ( Home Use ))', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070111029', "Hegar Mayo'S Needle Holder 15 cm", 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141121', 'Hematocrit Reader', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114011', 'Hematology Analyzer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108098', 'Hemodialisis Unit', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114032', 'Holter Monitor', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105002', 'Hydrant', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108101', 'Hyper Hypothermia System (Alat Kedokteran Bagian Penyakit Dalam)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070124004', 'Icu Bed Electric', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111003', 'Incubator (Alat Laboratorium Umum)', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110074', 'Incubator Transport', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110076', 'Infant Incubator Mobile', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121028', 'Infant Ventilator', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102010', 'Infra Red', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080203059', 'Infrared Lamp', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080306039', 'Infrared Thermometer', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101080', 'Infusion Pump', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108103', 'Infusion Warmer For Blood', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080113088', 'Ink Huber Tester', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030601003', 'Instalasi Gardu Listrik Induk Kapasitas Besar', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104020', 'Instalasi Gas Medik', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030599999', 'Instalasi Pembangkit Listrik Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030901001', 'Instalasi Penangkal Petir Manual', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030401999', 'Instalasi Pengolahan Bahan Bangunan Percontohan Lainnya', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030603001', 'Instalasi Pusat Pengatur Listrik Kapasitas Kecil', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5030603002', 'Instalasi Pusat Pengatur Listrik Kapasitas Sedang', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101018', 'Instrumen Cabinet', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104027', 'Instrument Bedah Syaraf', 1);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105094', 'Instrument Trolley, Stainless Steel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101031', 'Intercom Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050202003', 'Jam Elektronik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('INSTALASI DAN JARINGAN', '5040301002', 'Jaringan Telepon Diatas Tanah Kapasitas Sedang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3170119004', 'Jet Pump', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204021', 'Kabel UTP', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206035', 'Kaca Hias', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106070', 'Kaca Larynx', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102156', 'Kamera Stile', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104010', 'Kardex Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206056', 'Karpet', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070120011', 'Kasur Anti Decubitus', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201016', 'Kasur/Spring Bed', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020101999', 'Kendaraan Dinas Bermotor Perorangan Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3020201999', 'Kendaraan Tak Bermotor Angkutan Barang Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107043', 'Keratometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100202014', 'Keyboard (Peralatan Mini Komputer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203009', 'Keyboard (Peralatan Personal Komputer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204006', 'Kipas Angin', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205008', 'Kitchen Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205002', 'Kompor Gas (Alat Dapur)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205001', 'Kompor Listrik (Alat Dapur)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100101999', 'Komputer Jaringan Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101088', 'Korentang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105070', 'Kotak Surat', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030208013', 'Kunci Pas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201003', 'Kursi Besi/Metal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101127', 'Kursi Dorong', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201020', 'Kursi Fiber Glas/Plastik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070120010', 'Kursi Gynecologi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201004', 'Kursi Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080153999', 'Lainnya (Alat Laboratorium Kesehatan Kerja)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105097', 'Lampu Gynaecologi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105047', 'Lampu-lampu Kristal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100102002', 'Lap Top', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104111', 'Laparatomi Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106015', 'Laryngoscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104021', 'Laser Coagulator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107074', 'Laser Diode Photocoagulator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206010', 'Laser Disc', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112027', 'Laser Therapy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107075', 'Laser Yag Opthamic System', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105048', 'LCD Projector/Infocus', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070118020', 'Lead Apron', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080117016', 'Lemari Asam', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104001', 'Lemari Besi/Metal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204001', 'Lemari Es', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104002', 'Lemari Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101097', 'Lemari Obat (Kaca)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3040104004', 'Lemari Penyimpan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206064', 'Lemari Plastik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101022', 'Lemari Steriil', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107034', 'Lensa Meter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107011', 'Lensometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101039', 'Light Signal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3020201004', 'Lori Dorong', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206007', 'Loudspeaker', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TETAP LAINNYA', '6020102003', 'Lukisan Cat Minyak', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115013', 'Mamography X-Ray Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206052', 'Manequin (Boneka)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111035', 'Manometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3190103003', 'Matras', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104121', 'Mayo Table Stand Mobile, Stainles Steel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104122', 'Mayo Vaginal Ugosit Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104002', 'Mayor Surgeri Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104123', 'Meeker Disection Clamp', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206013', 'Megaphone', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104124', 'Meja Gynokologie', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201001', 'Meja Kerja Besi/Metal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201002', 'Meja Kerja Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080118026', 'Meja Kerja Stainless', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201009', 'Meja Komputer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201018', 'Meja Makan Besi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201019', 'Meja Makan Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104126', 'Meja Operasi Minor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110049', 'Meja Periksa 200X90X100 cc', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201008', 'Meja Rapat', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201014', 'Meja Resepsionis', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201035', 'Meja Ruang Tamu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3190106008', 'Meja Sit Up Portable                              ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101096', 'Meja Suntik Beroda', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201030', 'Meja Taman                                        ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201031', 'Meja TV                                           ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104127', 'Mesh Graft Dermatome', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105017', 'Mesin Absensi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030212034', 'Mesin Analisa System', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105080', 'Mesin Antrian', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060104045', 'Mesin Barcode', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030101005', 'Mesin Bor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030102002', 'Mesin Bor Tangan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050203004', 'Mesin Cuci', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010307010', 'Mesin Diesel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050103007', 'Mesin Fotocopy Folio', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050103011', 'Mesin Fotocopy Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030102008', 'Mesin Gergaji Besi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030101007', 'Mesin Gerinda', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030102001', 'Mesin Gerinda Tangan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050102003', 'Mesin Hitung Elektronik/Calculator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050102002', 'Mesin Hitung Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050102001', 'Mesin Hitung Manual', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206022', 'Mesin Jahit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060104014', 'Mesin Jilid', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050101008', 'Mesin Ketik Elektronik/Selektrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050101004', 'Mesin Ketik Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050101005', 'Mesin Ketik Listrik Potable (11-13 Inci)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050101001', 'Mesin Ketik Manual Portable (11-13 Inci)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030101018', 'Mesin Kompresor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030101019', 'Mesin Las Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060104010', 'Mesin Pemotong Biasa', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206041', 'Mesin Pengering Pakaian', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050203001', 'Mesin Penghisap Debu/Vacuum Cleaner', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050102007', 'Mesin Penghitung Uang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030212025', 'Mesin Pompa air PMK', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060104022', 'Mesin Pres', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080134025', 'Mesin Press Kain', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080137002', 'Mesin Setrika Kulit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201999', 'Meubelair Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104129', 'Micro Surgery Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112030', 'Micro Wave Diathermy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141159', 'Micrometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206014', 'Microphone', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101036', 'Microphone/Wireless MIC', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111225', 'Micropipette 50-200 UI', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111020', 'Microscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080112044', 'Microscope Binocular', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111118', 'Microscope Dengan Camera', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080107008', 'Microskop Binacular', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116015', 'Microtome (Alat Kedokteran Patologi Anatomy)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108113', 'Microwafe Therapy Apparatus', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205029', 'Microwave', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141170', 'Microwave Oven', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106080', 'Mikro Laringoscopy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080116006', 'Mikroskop Binokuler', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206037', 'Mimbar/Podium', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020102003', 'Mini Bus ( Penumpang 14 Orang Kebawah )', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100101002', 'Mini Komputer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080113083', 'Mini Pump Air Sample Flow Meter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119099', 'Minor Sugry Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104001', 'Minor Surgeri Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101002', 'Minor Surgical Set (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141172', 'Mixer (Alat Laboratorium Pertanian)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020105001', 'Mobil Ambulance', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104022', 'Mobile Operating Lamp', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104024', 'Mobile X-Ray C-Arm', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204004', 'Modem', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204035', 'Modul Untuk Penambahan di Core Switch', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203002', 'Monitor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TETAP LAINNYA', '6010101001', 'Monografi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070109002', 'Motuary Refrigerator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115014', 'MRI (Magnitic Resonanse/Imaging)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201026', 'Nakas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106016', 'Nasofaringoscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108024', 'Nebulizer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108008', 'Needle Punction Sternal/Spinal', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104003', 'Nephrectomy Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121035', 'Neurosurgery Operating Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100102003', 'Note Book', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070201016', 'O 2 Masker', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101108', 'Operating Lamp', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104015', 'Operating Microscope (Alat Kedokteran Bedah)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104012', 'Operating Table Bedah', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107032', 'Opthalmoscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107028', 'Opthalmoscope Binocyular Indirect Vision', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030301102', 'Orbital Shaker', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104141', 'Orthopedi Instrument Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104005', 'Orthopedy Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106096', 'Otoscope Halogen Lamp', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111005', 'Oven (Alat Laboratorium Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205020', 'Oven Gas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205006', 'Oven Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101175', 'Over Bed Table', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105028', 'Overhead Projector', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105027', 'Oxygen Regulator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114003', 'Oxygen Tank', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108006', 'Oxygen Therapy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101109', 'Oxygen Therapy Set Lengkap', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100102001', 'P.C Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114037', 'Pace Maker', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4040104001', 'Pagar Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201005', 'Pager', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101061', 'Paging Mic', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105061', 'Papan Gambar', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105081', 'Papan Pengumuman', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105008', 'Papan Visual/Papan Nama', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112032', 'Parafin Bath', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030211007', 'Pararel Bar', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201022', 'Partisi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105107', 'Partus Instrument Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070113005', 'Patient Monitor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121042', 'Patient Strecher', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100101007', 'PC Workstation', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110067', 'Pediatric/Infant Ventilator (Alat Kedokteran Anak)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206089', 'Pengharum Ruangan Aromaterapi                     ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060309999', 'Peralatan Antena UHF Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030212017', 'Peralatan Bengkel Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204999', 'Peralatan Jaringan Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100299999', 'Peralatan Komputer Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100202999', 'Peralatan Mini Komputer Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3190102999', 'Peralatan Permainan Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203999', 'Peralatan Personal Komputer Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101999', 'Peralatan Studio Audio Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107085', 'Perimeter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105999', 'Perkakas Kantor Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030201006', 'Perkakas Pemotong Plat', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100102999', 'Personal Komputer Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201003', 'Pesawat Telephone', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107086', 'Phacoemulsi Fication', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107040', 'Photo Fundus Unit (Alat Kedokteran Mata)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TETAP LAINNYA', '6020301001', 'Piala', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104146', 'Pinset Bayonet (Alat Kedokteran Bedah)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114026', 'Plasma Extrator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111106', 'Plat Pemanas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114029', 'Platelet Mixer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080401007', 'Pocket Dosimeter (For X,Y, Thermain)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080127005', 'Polisishing Machine', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010305010', 'Pompa Air', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080138030', 'Pompa Airasil', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010305007', 'Pompa Angin', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080106091', 'Pompa Hidrolik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010305999', 'Pompa Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204005', 'Portable Air Conditioner (Alat Pendingin)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106103', 'Portable Microwave Therapy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030317114', 'Portable Weather Season', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080128014', 'Portal Press', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101060', 'Power Amplifier', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080110142', 'Preccision Thermocouple Calibration Standard', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080805008', 'Pressure Gauge (Alat Laboratorium Tekanan Dan Suhu)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203003', 'Printer (Peralatan Personal Komputer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104150', 'Probe', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201023', 'Publik Astari (Pembatas Antrian)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101119', 'Pulse Oximeter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070126009', 'Pulse Oxymeter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108130', 'Pulse Oxymetry', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204027', 'Rackmount', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080402020', 'Radio Pharmacenticai & GW', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104003', 'Rak Besi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050104004', 'Rak Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141410', 'Rak Pengering', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205015', 'Rak Piring Alumunium', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201024', 'Rak Sepatu ( Almunium )', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204014', 'Rak Server', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3040104003', 'Rak-Rak Penyimpan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3180102003', 'Rambu Cermin', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204009', 'Reach In Frezzer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108017', 'Reflek Hammer Stainless Steel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101120', 'Reflex Hammer (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107030', 'Refractometer (Alat Kedokteran Mata)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111125', 'Refrigerator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080114006', 'Refrigerator Centrifuge', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080605036', 'Refrigerator/Freezer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101121', 'Respirator (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101123', 'Resusitasi Anak', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101124', 'Resusitasi Bayi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101122', 'Resusitasi Dewasa', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107031', 'Retinoscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104155', 'Retractor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205005', 'Rice Cooker (Alat Dapur)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050103012', 'Risograf', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204002', 'Router', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('RUMAH NEGARA', '4010201004', 'Rumah Negara Golongan I Tipe B Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('RUMAH NEGARA', '4010201007', 'Rumah Negara Golongan I Tipe C Permanen', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN DAN GEDUNG', '4010101004', 'Rumah Panel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111031', 'S C R E E N', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('BANGUNAN AIR', '5020705006', 'Saluran Air Kotor Sambungan Dari Rumah', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080156101', 'Sample Consetrator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070111033', 'Scalpels Blades', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100202010', 'Scanner (Peralatan Mini Komputer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100203004', 'Scanner (Peralatan Personal Komputer)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105128', 'Scherm', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080503031', 'Scoop', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020101001', 'Sedan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201008', 'Selective Colling', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102086', 'Semen Stoper', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3020202001', 'Sepeda', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020104001', 'Sepeda Motor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070204001', 'Sepeda Statis', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204001', 'Server', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104161', 'Set Laparoscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107010', 'Set Of Trial Lensess In Case With Trial Frame', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104164', 'Set Thoracotomy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104165', 'Set Vasculer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206032', 'Seterika', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119027', 'Shaker Bath', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141233', 'Sharp Knife', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112037', 'Short Wave Diathermy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112038', 'Shoulder Whell Exercise', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3170121006', 'Shredder', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201005', 'Sice', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201017', 'Sketsel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102057', 'Slide Projector', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107033', 'Slit Lamp (Alat Kedokteran Mata)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107093', 'Snellen Chard', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201033', 'Sofa                                              ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105051', 'Softboard', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TAK BERWUJUD', '8010101001', 'Software Komputer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206008', 'Sound System', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106008', 'Soundprocibox (Alat Kedokteran Tht)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070103006', 'Speculum', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108020', 'Spirometer (Alat Kedokteran Bagian Penyakit Dalam)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105003', 'Sprinkler', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206019', 'Stabilisator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080112025', 'Stabilizer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101139', 'Standar Infus', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101140', 'Standar Waskom', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101141', 'Standard Colector For Table', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108141', 'Static/Kinetik Projection Perimeter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT ANGKUTAN BERMOTOR', '3020101003', 'Station Wagon', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141252', 'Steam Boiler', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030104003', 'Steam Cleaner', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101001', 'Sterilisator', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101004', 'Stetoscope (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101143', 'Stimulator (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111066', 'Stirer/Pengocok', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ALAT BESAR', '3010108001', 'Stone Crushing Plant', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100201004', 'Storage Modul Disk (Peralatan Mainframe)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101134', 'Suction Pump', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104175', 'Surgical Instrument', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104174', 'Surgical Instrument Basic', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070118033', 'Survey Meter (Alat Kedokteran Radioterapy)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030301046', 'Survey Meter (Alat Ukur Universal)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204024', 'Switch', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060323015', 'Switcher/Patch Panel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101144', 'Syringe Pump (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101026', 'Tabung 02', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205009', 'Tabung Gas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111050', 'Tabung Gas N2', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105001', 'Tabung Pemadam Api', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('TANAH', '2010101002', 'Tanah Bangunan Rumah Negara Golongan II', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('TANAH', '2010104003', 'Tanah Bangunan Rumah Sakit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080154026', 'Tang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070102100', 'Tang Spatel/Kawat', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206070', 'Tangga', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206034', 'Tangga Aluminium', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030208001', 'Tanggem', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206081', 'Tangki Air', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206004', 'Tape Recorder (Alat Rumah Tangga Lainnya ( Home Use ))', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050205004', 'Teko Listrik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201001', 'Telephone (PABX)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060201004', 'Telephone Mobile', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106127', 'Telescope (Alat Kedokteran Tht)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206002', 'Televisi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206085', 'Tempat Sampah                                     ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201010', 'Tempat Tidur Besi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201011', 'Tempat Tidur Kayu', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101145', 'Temperatur Monitor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114043', 'Temporay Fase Maker', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150302005', 'Tenda', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101005', 'Tensimeter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030308012', 'Termometer Standar', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030103031', 'Tester Listrik/Telepon/Internet', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112040', 'Therapeutical Nerve & Muscle Situmulation', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3150302017', 'Thermal Imaging Camera', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080110066', 'Thermohygrometer (Alat Laboratorium Logam, Mesin Dan Listrik)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030317050', 'Thermometer (Alat Pengukur Keadaan Alam)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3090409052', 'Thermometer Digital Portable', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101171', 'Thermometer Gun                                   ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070111005', 'Thermometer Oral, Air Raksa', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107005', 'Three Mirror Contact Lenses', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119110', 'Thyroid Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119032', 'Thyroid Up Take', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101009', 'Timbangan Badan (Alat Kedokteran Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206024', 'Timbangan Barang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101010', 'Timbangan Bayi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110087', 'Timbangan bayi                                    ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030310010', 'Timbangan Cepat Capasitas 200 Kg', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080101009', 'Timbangan Elektronik', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206023', 'Timbangan Orang', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111023', 'Timbangan/Neraca', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070123020', 'Tissue Prosessor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030309021', 'TLD Badge                                         ', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107045', 'Tonometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106130', 'Tonsil Artery Forcep', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030205003', 'Tool Cabinet Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030205001', 'Tool Kit Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108152', 'TP.9900Rj - 9900 Trolly Emergency', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104185', 'Tracheotomy Set (Alat Kedokteran Bedah)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112041', 'Traction Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080203087', 'Transformer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030301019', 'Transistor Tester Semitest I', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030308027', 'Trappo 1.000 Watt', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070114045', 'Treadmill/On (Giken)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070107035', 'Trial Lens & Frame Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102045', 'Tripod Camera', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070103002', 'Tromol Gaas', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101151', 'Tromol Has', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106145', 'Tuning Fork', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206021', 'Tustel', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080113081', 'TV Monitor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('ASET TETAP LAINNYA', '6010303999', 'Ukiran dan Lukisan Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070205020', 'Ukur Tinggi Badan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112043', 'Ultra Saound Theraphy', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108030', 'Ultra Sono Graphy (USG) Internal Medicine', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080605033', 'Ultrasonic Cleaner (Alat Laboratorium Penunjang)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108025', 'Ultrasonic Nebulizer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070112044', 'Ultrasonic Theraphy Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060101048', 'Uninterruptible Power Supply (UPS)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080199999', 'Unit Alat Laboratorium Lainnya', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206017', 'Unit Power Supply', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141297', 'Unit Sterilisasi', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060204001', 'Unit Tranceiver VHF Portable', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070116014', 'Universal Microscope', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050204011', 'Up Right Chiller/Frezzer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070104190', 'Urological Surgery Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070119109', 'Urology Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101154', 'Utility Trolly', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3030307020', 'V.S.W.R Standing Review', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141300', 'Vaccum Tester', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111028', 'Vacum Pump', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080503015', 'Vacuum Air Picnometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070105054', 'Vacuum Extractor (Alat Kesehatan Kebidanan Dan Penyakit Kandungan', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080602036', 'Vacuum Sampler', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108033', 'Ventilator Internal Medicine', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206057', 'Vertikal Blind', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206003', 'Video Cassette', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102132', 'Video Conference', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3060102134', 'Video Router', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108154', 'Vital Sign Monitor', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141307', 'Volumetric Glass', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080141308', 'Vortex Mixer(Alat Laboratorium Pertanian)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108161', 'Walker Polding', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070101008', 'Waskom', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3080111002', 'Water Bath (Alat Laboratorium Umum)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206033', 'Water Filter', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070110013', 'Water Seal Drainage Set', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070121049', 'Wheel Chair (Alat Kedokteran Gawat Darurat)', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050105010', 'White Board', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050206012', 'Wireless', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN KHUSUS TIK', '3100204023', 'Wireless Access Point', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3050201028', 'Workstation', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070108163', 'Wright Respirometer', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070115017', 'X-Ray Mobile Unit', 2);
INSERT INTO barang (jenis_bmn, kode_barang, nama_barang, id_kategori) VALUES ('MESIN PERALATAN NON TIK', '3070106150', 'X-Ray Viewer', 2);