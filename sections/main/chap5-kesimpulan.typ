= KESIMPULAN

Sistem manajemen akun bank yang dikembangkan dalam proyek ini mendemonstrasikan penerapan konsep-konsep fundamental pemrograman C++ secara komprehensif. Melalui implementasi, pembaca telah mempelajari dan memahami:

+ Penggunaan struktur data `struct` untuk abstraksi dan enkapsulasi atribut-atribut logis ke dalam composite type yang bermakna. Struct `BankAccount` mengelompokkan lima anggota dengan tipe berbeda menjadi kesatuan yang merepresentasikan entitas akun bank.

+ Penerapan array statis sebagai kontainer untuk menyimpan multiple instances dari struktur dengan kapasitas tetap. Array ini memungkinkan akses O(1) ke setiap akun melalui subscript operator, meskipun dengan trade-off kapasitas terbatas.

+ Implementasi fungsi dengan parameter referensi yang memungkinkan fungsi memodifikasi data asli tanpa overhead pembuatan salinan. Referensi memberikan semantik yang lebih intuitif dibandingkan pointer untuk kasus-kasus seperti ini.

+ Penggunaan stream input-output berbasis object `cin` dan `cout` untuk komunikasi interaktif dengan user. Operator ekstraksi dan insersi memudahkan pembacaan dan penulisan data dengan tipe otomatis conversion.

+ Desain menu interaktif berbasis `switch-case` yang memungkinkan user memilih dari operasi yang berbeda-beda. Struktur ini scalable dan mudah untuk menambahkan operasi baru.

+ Implementasi algoritma pencarian linear untuk menemukan akun dalam array. Meskipun kompleksitas O(n), algoritma ini cukup efisien untuk dataset berukuran kecil dan mudah dipahami.

+ Pemahaman tentang convention dan best practices dalam desain program, seperti menggunakan sentinel value (-1) untuk menunjukkan kondisi khusus, dan `const` qualifier untuk parameter yang tidak dimodifikasi.

Proyek ini memberikan fondasi yang solid untuk memahami konsep pemrograman tingkat pemula dan untuk melanjutkan ke topik-topik lebih advanced seperti linked list, dynamic memory allocation, file I/O, dan object-oriented programming. Sistem yang dikembangkan dapat diperluas dengan fitur-fitur tambahan seperti penyimpanan data ke file, enkripsi password, atau analisis transaksi historis.