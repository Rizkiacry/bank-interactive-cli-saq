= LANDASAN TEORI

== Struktur Data

Struktur data dalam C++ didefinisikan menggunakan keyword `struct` untuk mengelompokkan beberapa variabel dari tipe data yang berbeda menjadi satu kesatuan logis. Menurut dokumentasi cppreference, struct dalam C++ merupakan user-defined type yang mengkombinasikan multiple members dengan tipe berbeda dalam suatu composite type. Ketika struct dideklarasikan dengan body, pernyataan tersebut sekaligus merupakan definisi yang mengalokasikan template tipe dalam sistem type C++.

Dalam proyek ini, struktur `BankAccount` digunakan untuk merepresentasikan data tunggal akun:

#figure(
  image("../media/21-struct-data.png")
)

Setiap anggota struct memiliki offset tetap dari awal struktur di memori. Dalam bahasa C++, akses terhadap member struktur dilakukan dengan operator dot (.) ketika menggunakan variabel struct langsung, dan operator arrow (->) ketika menggunakan pointer ke struct.

== Array dan Indeksasi

Array merupakan koleksi elemen tipe data yang sama, tersimpan dalam lokasi memori yang berdampingan (contiguous). Dalam C++, deklarasi array menggunakan notasi `type name[size]`, di mana `size` merupakan konstanta yang menentukan jumlah maksimal elemen.

Menurut cppreference, subscript operator `[]` digunakan untuk mengakses elemen array pada indeks tertentu. Operator ini didefinisikan secara identik dengan ekspresi pointer arithmetic: `E1[E2]` secara fundamental equivalent dengan `*((E1)+(E2))`. Indeksasi array dalam C++ dimulai dari 0, sehingga array dengan size `n` memiliki indeks valid dari 0 hingga `n-1`.

Dalam proyek, array `BankAccount accounts[MAX_ACCOUNTS]` menyimpan hingga lima akun:

#figure(
  image("../media/22-array-index.png")
)

Subscript operator pada array mengembalikan lvalue apabila array adalah lvalue, memungkinkan baik pembacaan maupun penulisan nilai pada posisi tersebut.

== Fungsi dan Parameter Referensi

Fungsi dalam C++ merupakan blok kode yang dapat dipanggil berulang dengan identitas dan tipe parameter tertentu. Dokumentasi cppreference menyatakan bahwa function declaration memperkenalkan nama fungsi dan tipe fungsi, sedangkan function definition mengasosiasikan nama/tipe dengan body fungsi.

Parameter referensi dalam C++ (reference parameter) memungkinkan fungsi memodifikasi argumen asli tanpa membuat salinan. Notasi parameter referensi menggunakan symbol ampersand (&):

#figure(
  image("../media/23-fungsi-referensi.png")
)

Parameter referensi berbeda dengan parameter pointer, karena referensi tidak memerlukan dereference dan tidak dapat bernilai null. Fungsi yang menerima referensi dapat secara langsung mengakses dan memodifikasi object asli melalui reference tersebut tanpa overhead pembuatan salinan (copy).

== Stream Input-Output

Stream dalam C++ merupakan abstraksi untuk komunikasi data antara program dan external device. Menurut dokumentasi cppreference, iostream header mendefinisikan object global `cin` dengan tipe `istream` untuk membaca input dari keyboard, dan `cout` dengan tipe `ostream` untuk menampilkan output ke layar.

Ekstraksi data dari stream menggunakan operator `>>`:

#figure(
  image("../media/241-cin.png")
)

Insersi data ke stream menggunakan operator `<<`:

#figure(
  image("../media/242-cout.png")
)

Ketika menggunakan `cin >>` diikuti `getline()`, diperlukan `cin.ignore()` untuk membersihkan karakter newline yang tertinggal di input buffer:

#figure(
  image("../media/243-getline.png")
)

== Kontrol Alur Program

Kontrol alur program menggunakan `switch-case` memungkinkan eksekusi kode berbeda berdasarkan nilai satu expression. Struktur switch-case dalam proyek ini merespons pilihan menu user:

#figure(
  image("../media/25-switch-case.png")
)

Statement `break` penting untuk menghentikan eksekusi dan keluar dari switch-case. Tanpa `break`, eksekusi akan berlanjut ke case berikutnya (fall-through behavior).

== Algoritma Pencarian Linear

Pencarian linear merupakan algoritma dasar yang memeriksa setiap elemen dalam array secara berurutan sampai menemukan elemen target atau mencapai akhir array. Dalam proyek, fungsi `find_account_idx()` mengimplementasikan algoritma ini untuk mencari akun berdasarkan nomor akun:

#figure(
  image("../media/26-pencarian-linear.png")
)

Kompleksitas waktu pencarian linear adalah O(n), di mana n adalah jumlah elemen yang diperiksa. Algoritma ini cukup efisien untuk dataset berukuran kecil seperti lima akun, namun untuk dataset lebih besar diperlukan struktur data dan algoritma yang lebih sophisticated.
