= HASIL DAN PEMBAHASAN

== Implementasi Struktur Data BankAccount

Struktur `BankAccount` merupakan inti dari sistem penyimpanan data. Definisi struktur ini mengelompokkan lima anggota yang mewakili atribut-atribut lengkap satu akun bank:

#figure(
  image("../media/41-implementasi-struct.png")
)

Penggunaan `int` untuk nomor akun memastikan identifikasi numerik yang efisien. Tipe `float` untuk saldo memungkinkan representasi nilai dengan presisi desimal, meskipun untuk aplikasi finansial production-grade biasanya menggunakan tipe integer dengan unit cent untuk menghindari floating-point precision issues. Tipe `char` untuk jenis akun menghemat memori dibandingkan menggunakan string.

Ketika struct dideklarasikan, compiler mengalokasikan template tipe ini, namun tidak mengalokasikan memori untuk data aktual sampai variabel struct dideklarasikan. Deklarasi array `BankAccount accounts[MAX_ACCOUNTS]` mengalokasikan memori untuk lima instance struktur secara kontinu dalam memori.

== Implementasi Array dan Sistem Indeksasi

Array statis digunakan untuk menyimpan akun-akun dengan kapasitas tetap:

#figure(
  image("../media/421-implementasi-array.png")
)

Konstanta `MAX_ACCOUNTS` didefinisikan dengan nilai 5, membentuk batas atas jumlah akun yang dapat disimpan. Array ini dideklarasikan dengan scope global dalam fungsi `main()`, sehingga seluruh fungsi dapat mengaksesnya.

Akses elemen array menggunakan subscript operator `[]`:

#figure(
  image("../media/422-akses-array.png")
)

Subscript operator `[]` dalam C++ secara definitif equivalent dengan pointer arithmetic. Expresi `accounts[i]` sebenarnya diterjemahkan menjadi `*(accounts + i)`, di mana `accounts + i` menghitung address dengan offset sebesar `i * sizeof(BankAccount)` dari base address array.

Inisialisasi array dilakukan melalui looping:

#figure(
  image("../media/423-iterasi-array.png")
)

Setiap iterasi memanggil fungsi `initialize_account()` dengan parameter referensi, mengakses setiap elemen array secara berurutan. Indeks dimulai dari 0 dan berakhir pada 4, mencakup seluruh kapasitas array.

== Implementasi Fungsi dengan Parameter Referensi

Fungsi-fungsi dalam sistem menggunakan parameter referensi untuk memodifikasi data akun secara langsung tanpa membuat salinan:

#figure(
  image("../media/431-implementasi-deposit.png")
)

Parameter `BankAccount& acc` mendeklarasikan referensi ke struktur `BankAccount`. Ketika fungsi memodifikasi `acc.amount`, perubahan tersebut mempengaruhi object asli dalam array, bukan salinan. Ini berbeda dengan parameter pass-by-value yang akan membuat salinan dan perubahan tidak akan terlihat di caller.

Referensi dalam C++ bersifat immutable setelah inisialisasi; setelah referensi `acc` terikat pada object tertentu, tidak dapat diubah untuk mereferensikan object lain. Referensi juga tidak dapat bernilai null, berbeda dengan pointer.

Fungsi `modify_account()` memanfaatkan referensi untuk mengubah multiple members:

#figure(
  image("../media/432-implementasi-modify.png")
)

Dalam fungsi ini, `cin.ignore()` membersihkan karakter newline dari buffer input setelah `cin >> actype` pada operasi sebelumnya, memastikan `getline()` bekerja dengan benar. Referensi memungkinkan modifikasi langsung terhadap anggota-anggota struktur di dalam array.

== Implementasi Stream Input-Output

Stream input-output menggunakan object global `cin` dan `cout` dari header `<iostream>`:

#figure(
  image("../media/441-include-iostream.png")
)

Operator ekstraksi `>>` membaca data dari input stream:

#figure(
  image("../media/442-implementasi-cin.png")
)

Untuk membaca string dengan spasi, digunakan `getline()`:

#figure(
  image("../media/443-implementasi-getline.png")
)

Operator insersi `<<` menampilkan data ke output stream:

#figure(
  image("../media/444-implementasi-cout.png")
)

== Implementasi Kontrol Alur dengan Switch-Case

Menu utama program menggunakan `switch-case` untuk mengarahkan eksekusi berdasarkan pilihan user:

#figure(
  image("../media/45-implementasi-switch.png")
)

Statement `break` penting untuk menghentikan eksekusi dan keluar dari switch block. Tanpa `break`, eksekusi akan terus ke case berikutnya (fall-through), yang umumnya tidak diinginkan.

Case `8` memanggil `exit(0)` untuk menghentikan program dengan status 0 (normal termination). `cstdlib` header menyediakan fungsi `exit()`.

Case `default` menangani pilihan yang tidak valid. Struktur switch-case ini membuat menu-driven program yang mudah dipahami dan diperluas.

== Implementasi Algoritma Pencarian Linear

Fungsi `find_account_idx()` mengimplementasikan pencarian linear untuk menemukan akun berdasarkan nomor akun:

#figure(
  image("../media/461-implementasi-pencarian.png")
)

Fungsi menerima tiga parameter: nomor akun yang dicari (`acc_num`), array akun (`accounts` dengan qualifier `const` karena fungsi hanya membaca), dan ukuran array (`size`).

Loop `for` iterasi dari indeks 0 sampai `size - 1`. Setiap iterasi membandingkan `accounts[i].accno` dengan `acc_num`. Ketika match ditemukan, fungsi segera mengembalikan indeks `i`. Jika seluruh array diperiksa tanpa menemukan match, fungsi mengembalikan -1 sebagai sentinel value yang menunjukkan akun tidak ditemukan.

Caller menggunakan return value ini untuk pemeriksaan:

#figure(
  image("../media/462-penggunaan-pencarian.png")
)

Pemeriksaan `acc_idx != -1` menentukan apakah pencarian berhasil. Jika berhasil, akun pada indeks `acc_idx` dapat diakses untuk operasi lebih lanjut.

== Implementasi Fungsi Validasi dan Utilitas

Fungsi `is_account_empty()` digunakan untuk memeriksa apakah slot akun kosong:

#figure(
  image("../media/471-util-is-empty.png")
)

Fungsi ini menggunakan konvensi bahwa nomor akun 0 menunjukkan slot kosong (tidak valid). Return type `bool` memberikan hasil boolean yang dapat langsung digunakan dalam kondisi if.

Fungsi `find_available_slot()` mencari slot kosong pertama:

#figure(
  image("../media/472-util-find-slot.png")
)

Fungsi ini memanfaatkan `is_account_empty()` untuk memeriksa setiap slot. Ketika slot kosong ditemukan, indeks tersebut dikembalikan. Jika semua slot penuh, -1 dikembalikan.

Fungsi `initialize_account()` mereset akun ke state kosong:

#figure(
  image("../media/473-util-initialize.png")
)

Penggunaan parameter referensi memungkinkan modifikasi object asli. Semua anggota diatur ke nilai default: nomor akun 0, string kosong, karakter null, dan saldo 0.0.