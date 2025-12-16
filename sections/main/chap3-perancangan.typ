= PERANCANGAN

== Analisis Masalah

=== Data yang Dibutuhkan

Sistem manajemen akun bank memerlukan data berikut untuk setiap akun:

+ Nomor akun (integer): identifier unik untuk setiap akun, dipilih user saat pembuatan akun.

+ Nama pemegang (string): nama lengkap pemegang akun, dapat mengandung spasi dan karakter alphabetic.

+ Alamat (string): lokasi tempat tinggal pemegang akun, dapat mengandung spasi, karakter numerik, dan punctuation.

+ Jenis akun (char): klasifikasi akun sebagai 's' untuk tabungan atau 'c' untuk giro.

+ Saldo (float): jumlah dana yang tersimpan dalam akun, dinyatakan dalam rupiah dengan dua desimal.

Data-data tersebut dienkapsulasi dalam struktur `BankAccount` dan disimpan dalam array dengan kapasitas maksimal lima akun.

=== Output yang Diinginkan

Sistem dirancang untuk menghasilkan output berikut:

+ Menu interaktif yang menampilkan delapan pilihan operasi kepada user.

+ Konfirmasi keberhasilan operasi dengan pesan yang jelas dan informatif.

+ Pesan error ketika operasi gagal, misalnya saldo tidak mencukupi atau akun tidak ditemukan.

+ Display detail akun yang menampilkan semua data akun dalam format terstruktur.

+ Informasi saldo setelah setiap transaksi setoran atau penarikan.

=== Proses Data

Proses dalam sistem terdiri dari:

+ Inisialisasi: Semua akun diinisialisasi dengan nilai default (nomor akun 0 menandakan slot kosong).

+ Pembuatan akun: User memasukkan data akun baru, sistem menyimpan pada slot pertama yang kosong.

+ Pencarian akun: Sistem melakukan pencarian linear untuk menemukan akun berdasarkan nomor akun.

+ Transaksi setoran: Saldo ditambahkan dengan jumlah yang disetorkan, dengan validasi jumlah positif.

+ Transaksi penarikan: Saldo dikurangi dengan jumlah yang ditarik, dengan validasi saldo cukup dan jumlah positif.

+ Modifikasi akun: User dapat mengubah nama, alamat, dan jenis akun (tidak termasuk nomor akun dan saldo).

+ Penghapusan akun: Slot akun dikosongkan dengan reinisialisasi nilai-nilai-nya.

+ Tampilan semua akun: Sistem mengiterasi seluruh array dan menampilkan akun yang valid (nomor akun bukan 0).

== Flowchart

#figure(
  image("../media/32-flowchart.png")
)

== Algoritma

=== Pseudocode Utama Program

#figure(
  image("../media/331-pseudocode-utama.png")
)

=== Pseudocode Fungsi-Fungsi Pendukung

==== Pseudocode initialize_account

#figure(
  image("../media/3321-pseudocode-initialize.png")
)

==== Pseudocode find_available_slot

#figure(
  image("../media/3322-pseudocode-find-slot.png")
)

==== Pseudocode find_account_idx

#figure(
  image("../media/3323-pseudocode-find-idx.png")
)

==== Pseudocode deposit

#figure(
  image("../media/3324-pseudocode-deposit.png")
)

==== Pseudocode withdraw

#figure(
  image("../media/3325-pseudocode-withdraw.png")
)