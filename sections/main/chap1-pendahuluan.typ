= PENDAHULUAN

== Latar Belakang

Sistem manajemen akun bank merupakan aplikasi fundamental dalam dunia perbankan digital. Aplikasi ini dirancang untuk mengelola informasi akun pelanggan, melakukan transaksi setoran dan penarikan dana, serta menampilkan data akun yang tersimpan dalam sistem. 

Pengembangan sistem manajemen akun bank menggunakan bahasa pemrograman C++ dengan paradigma pemrograman procedural memberikan fondasi yang kuat dalam memahami konsep pemrograman tingkat pemula. Melalui proyek ini, pembaca akan mempelajari penggunaan struktur data (struct), array, fungsi, sistem input-output berbasis stream, dan kontrol alur program menggunakan switch-case.

Dengan membatasi penggunaan library hanya pada `iostream` dan `cstdlib`, proyek ini menekankan pemahaman mendalam terhadap mekanisme dasar C++ tanpa bergantung pada fitur-fitur advanced atau template library. Hal ini memastikan bahwa setiap aspek program dapat dipahami secara menyeluruh dari perspektif algoritma dan logika pemrograman.

== Tujuan

+ Memahami dan menerapkan struktur data `struct` dalam C++ untuk menyimpan informasi akun bank yang terdiri dari nomor akun, nama pemegang, alamat, jenis akun, dan saldo.

+ Menerapkan array sebagai kontainer untuk menyimpan hingga lima akun bank secara simultan.

+ Mengimplementasikan operasi dasar perbankan meliputi pembuatan akun baru, setoran, penarikan, pencarian, modifikasi, dan penghapusan akun.

+ Menerapkan fungsi dengan parameter referensi untuk memanipulasi data akun secara efisien.

+ Mengembangkan menu interaktif berbasis command-line interface (CLI) dengan sistem pilihan menggunakan `switch-case`.

== Manfaat

+ Pemahaman konseptual tentang abstraksi data melalui struktur dan cara data diorganisir dalam memori.

+ Praktik penulisan fungsi yang reusable dan terstruktur untuk operasi spesifik.

+ Pengalaman dalam menangani input user dengan validasi dan penanganan kondisi error.

+ Kemampuan untuk merancang algoritma pencarian linear untuk menemukan akun dalam array.

+ Fondasi dasar untuk pengembangan aplikasi berbasis data yang lebih kompleks.

== Batasan Masalah

+ Kapasitas maksimal sistem hanya dapat menampung lima akun bank, didefinisikan oleh konstanta `MAX_ACCOUNTS`.

+ Data akun hanya tersimpan dalam memori RAM selama program berjalan; tidak ada mekanisme penyimpanan data permanen ke file.

+ Sistem menggunakan array statis, bukan struktur data dinamis seperti linked list atau vector.

+ Nomor akun harus bernilai unik; sistem tidak menerapkan mekanisme otomatis untuk menghasilkan nomor akun.

+ Jenis akun dibatasi pada dua pilihan: 's' untuk tabungan (savings) dan 'c' untuk giro (current).

+ Library yang digunakan terbatas pada `iostream` dan `cstdlib`; tidak menggunakan library tambahan seperti `string` dalam definisi struct.

+ Sistem tidak menerapkan enkripsi atau keamanan data; hanya validasi dasar pada nilai masukan.