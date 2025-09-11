void main() {
  // 1. Ambil waktu saat ini
  DateTime waktuSekarang = DateTime.now();

  // 2. Tentukan rentang waktu yang diizinkan (jam 9 pagi sampai jam 5 sore)
  // Untuk menyederhanakan, kita asumsikan ini berlaku untuk hari yang sama.
  DateTime waktuMulai = DateTime(waktuSekarang.year, waktuSekarang.month, waktuSekarang.day, 7, 0, 0);
  DateTime waktuSelesai = DateTime(waktuSekarang.year, waktuSekarang.month, waktuSekarang.day, 8, 0, 0);

  // 3. Lakukan perbandingan
  if (waktuSekarang.isAfter(waktuMulai) && waktuSekarang.isBefore(waktuSelesai)) {
    // Aksi yang hanya bisa dilakukan dalam rentang waktu ini
    print('Aplikasi dapat diakses. Selamat datang!');
    // Tambahkan kode lain di sini, seperti menampilkan tombol, mengizinkan input, dll.
  } else {
    // Aksi yang dilakukan di luar rentang waktu
    print('Maaf, aplikasi hanya bisa diakses antara pukul 07:00 dan 8:00.');
    // Tambahkan kode lain di sini, seperti menampilkan pesan error, menonaktifkan fitur, dll.
  }
}