<img width="388" height="388" alt="Picture11" src="https://github.com/user-attachments/assets/b0265299-5c4f-4241-8d19-0df5a11f5370" />

# 📚 Pustaka Kiosk — Sistem Peminjaman Buku Perpustakaan Berbasis Raspberry Pi, RFID, dan QR Code

Sistem peminjaman dan pengembalian buku perpustakaan **mandiri (kiosk)** yang berjalan **sepenuhnya secara lokal di Raspberry Pi tanpa membutuhkan koneksi internet**. Anggota cukup menempelkan kartu RFID, lalu memindai QR Code pada buku, dan transaksi tercatat otomatis.

> Proyek Tugas Akhir — Program Studi D3 Teknik Telekomunikasi, Jurusan Teknik Elektro, Politeknik Negeri Semarang (2026).

---

## 📖 Latar Belakang

Banyak perpustakaan sekolah dasar masih mengelola peminjaman secara manual karena tidak adanya staf perpustakaan tetap dan minimnya dukungan teknologi. Akibatnya, sirkulasi buku sulit dikontrol dan siswa sering hanya boleh membaca di tempat tanpa bisa membawa buku pulang.

Proyek ini dikembangkan dengan studi kasus **SDN Mranggen 1** untuk menghadirkan solusi digitalisasi perpustakaan yang **terjangkau, mudah dipakai siswa SD, dan tetap berjalan tanpa internet**.

## ✨ Fitur Utama

- 🪪 **Identifikasi anggota dengan kartu RFID** (modul RC522, 13,56 MHz) — cukup *tap* kartu.
- 📷 **Identifikasi buku dengan QR Code** — dipindai melalui webcam langsung di browser (client-side, library jsQR).
- 🔄 **Peminjaman & pengembalian otomatis**, status buku berubah otomatis (*dipinjam* / *tersedia*).
- 💰 **Perhitungan denda keterlambatan otomatis.**
- 👤 **Manajemen anggota** — tambah, ubah, hapus, cari, dan pendaftaran kartu RFID.
- 📕 **Manajemen koleksi buku** — tambah, ubah, hapus, cari.
- 🏷️ **Pembangkitan QR Code otomatis** untuk setiap buku baru.
- 🧾 **Riwayat transaksi** peminjaman dan pengembalian.
- 🔐 **Login petugas** untuk mengakses dashboard manajemen.
- 🖥️ **Antarmuka mode kiosk** pada LCD touchscreen 7 inci yang sederhana untuk siswa SD.
- 📴 **Offline-first** — web server dan database berjalan langsung di Raspberry Pi.

## 🏗️ Arsitektur Sistem

Raspberry Pi berfungsi sekaligus sebagai **server lokal** dan **client**:

```
 Kartu RFID ──► RFID RC522 ──(SPI/GPIO)──┐
                                          ▼
 Buku (QR) ──► Webcam ──(USB)──►   Raspberry Pi 4 B
                                   ├─ Web Server (Apache)
 LCD Touchscreen 7" ◄─(HDMI)────── ├─ Database MySQL (pustaka_kiosk)
   (UI Kiosk / Browser)            ├─ Antarmuka web (React)
                                   └─ Program pembaca RFID (Python)
```

Alur singkat: program Python membaca UID kartu RFID lalu mengirimkannya ke server lokal melalui HTTP POST (JSON), sementara pemindaian QR Code dilakukan di browser menggunakan webcam. Seluruh data disimpan di database MySQL lokal.

## 🧰 Teknologi & Perangkat

### Perangkat Keras

| Komponen | Spesifikasi |
| --- | --- |
| Raspberry Pi 4 Model B | Quad-core, RAM 2/4 GB |
| MicroSD | 128 GB |
| LCD Touchscreen | 7 inci, 1024×600 |
| Webcam | 1080p, 60 fps (Plug & Play) |
| Modul RFID RC522 | 13,56 MHz (ISO/IEC 14443 A) |
| Kartu RFID | ISO/IEC 14443 A (MIFARE) |
| Casing | 3D print, material PETG |
| Pendukung | Adaptor 5V 3A, kabel micro-HDMI, kabel USB-C, kabel jumper |

### Perangkat Lunak

- **Raspberry Pi OS** (64-bit)
- **Python** (`mfrc522`, `requests`) — pembaca RFID
- **React / JavaScript** + **jsQR** — antarmuka web & pemindai QR Code
- **PHP + Apache** — web server dan API
- **MySQL** — basis data (`pustaka_kiosk`, tabel: `members`, `books`, `transactions`)
- **XAMPP** — lingkungan pengembangan di Windows 11

### Wiring RFID RC522 ke Raspberry Pi

| RC522 | Pin Raspberry Pi |
| --- | --- |
| SDA | Pin 24 |
| SCK | Pin 23 |
| MOSI | Pin 19 |
| MISO | Pin 21 |
| RST | Pin 22 |
| GND | Pin 6 |
| 3.3V | Pin 1 |

> Aktifkan SPI terlebih dahulu: `sudo raspi-config` → *Interface Options* → *SPI* → *Yes*, lalu reboot.

## 🚀 Instalasi Singkat

> Sesuaikan langkah di bawah dengan struktur repositori Anda.

1. **Siapkan Raspberry Pi OS 64-bit** dan aktifkan SPI.
2. **Instal web server & database** (Apache, PHP, MySQL).
3. **Import database:**
   ```bash
   mysql -u <user> -p -e "CREATE DATABASE pustaka_kiosk;"
   mysql -u <user> -p pustaka_kiosk < pustaka_kiosk.sql
   ```
4. **Salin file website** ke `/var/www/html/` dan atur koneksi database (user, password, nama DB).
5. **Instal dependensi Python untuk RFID:**
   ```bash
   pip install mfrc522 requests
   ```
6. **Jalankan program pembaca RFID** (default mengirim ke `http://localhost:3000/api/rfid/scan`).
7. **Buka browser dalam mode kiosk** pada LCD touchscreen dan akses alamat aplikasi.

## 🔁 Cara Penggunaan

**Peminjaman:** tap kartu RFID anggota → pindai QR Code buku → transaksi tercatat.
**Pengembalian:** tap kartu RFID anggota → pindai QR Code buku → status kembali *tersedia*, denda dihitung otomatis bila terlambat.
**Petugas:** login ke dashboard untuk mengelola data buku, anggota, dan melihat riwayat transaksi.

## 🧪 Hasil Pengujian

| Pengujian | Hasil |
| --- | --- |
| QR Code Scanner | Terbaca pada jarak **10–45 cm**, berhasil **100%**, tetap berfungsi pada cahaya redup (30 lux) |
| RFID — stress test | **100/100** pembacaan berhasil |
| RFID — jarak baca | Efektif hingga **1,5 cm** (gagal pada 2 cm) |
| RFID — penghalang | Kertas terbaca, aluminium tidak terbaca |
| Black Box Testing | **8/8 skenario valid (100%)** setelah perbaikan bug |
| Uji lapangan (SDN Mranggen 1) | 7 hari, 10 siswa & guru, 100 judul buku sampel |
| Kepuasan pengguna (kuesioner) | Rata-rata **4,75 / 5 (95%)** |

## 🛣️ Rencana Pengembangan

- Notifikasi pengingat batas pengembalian (SMS/email)
- Laporan statistik (buku terpopuler, tren peminjaman)
- Ukuran huruf dan tombol UI yang lebih besar
- Indikator visual keberhasilan pemindaian QR Code
- Backup data otomatis dan logging transaksi lebih detail
- Dukungan barcode sebagai alternatif identifikasi

## 👥 Tim Pengembang

| Nama | NIM |
| --- | --- |
| Dzaki Syafiq Hafizh Setiyono | 3.33.23.1.05 |
| Zaidan Arrifqi | 3.33.23.1.24 |
| Rifky Achmad Raditya | 3.33.23.1.20 |
| Muhammad Noor Aziz | 3.33.23.1.14 |

**Dosen Pembimbing:**
- Sindung H. W. S., BSEE., M.Eng.Sc.
- Muhammad Anif, S.T., M.Eng.

**Institusi:** Program Studi D3 Teknik Telekomunikasi, Jurusan Teknik Elektro, Politeknik Negeri Semarang.

## 🙏 Ucapan Terima Kasih

Terima kasih kepada Kepala Sekolah dan para guru **SDN Mranggen 1** yang telah berpartisipasi dalam uji coba lapangan.

## 📄 Lisensi

Tambahkan lisensi sesuai kebutuhan (misalnya MIT) pada file `LICENSE`.
