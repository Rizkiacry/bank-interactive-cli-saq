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
  image("/media/321-flowchart-main.jpeg", width: 80%),
  caption: "Diagram Alur Utama"
)

=== Flowchart Pembuatan Akun

#figure(
  image("/media/322-flowchart-buat-akun.jpeg", width: 80%),
  caption: "Diagram Alur Pembuatan Akun"
)

=== Flowchart Setor Tunai

#figure(
  image("/media/323-flowchart-setor-tunai.jpeg", width: 80%),
  caption: "Diagram Alur Setor Tunai"
)

=== Flowchart Tarik Tunai

#figure(
  image("/media/324-flowchart-tarik-tunai.jpeg", width: 80%),
  caption: "Diagram Alur Tarik Tunai"
)

=== Flowchart Tampil Akun

#figure(
  image("/media/325-flowchart-tampil-akun.jpeg", width: 80%),
  caption: "Diagram Alur Tampil Akun"
)

=== Flowchart Ubah Akun

#figure(
  image("/media/326-flowchart-ubah-akun.jpeg", width: 80%),
  caption: "Diagram Alur Ubah Akun"
)

=== Flowchart Hapus Akun

#figure(
  image("/media/327-flowchart-hapus-akun.jpeg", width: 80%),
  caption: "Diagram Alur Hapus Akun"
)

=== Flowchart Tampil Semua Akun

#figure(
  image("/media/328-flowchart-tampil-semua.jpeg", width: 80%),
  caption: "Diagram Alur Tampil Semua Akun"
)

== Algoritma

=== Pseudocode Utama Program

#figure(
  image("/media/331-pseudocode-utama.png", width: 80%),
  caption: [Pseudocode Utama Program.]
)

=== Pseudocode Fungsi-Fungsi Pendukung

==== Pseudocode initialize_account

#figure(
  image("/media/3321-pseudocode-initialize.png", width: 80%),
  caption: [Pseudocode Fungsi `initialize_account`.]
)

==== Pseudocode find_available_slot

#figure(
  image("/media/3322-pseudocode-find-slot.png", width: 80%),
  caption: [Pseudocode Fungsi `find_available_slot`.]
)

==== Pseudocode find_account_idx

#figure(
  image("/media/3323-pseudocode-find-idx.png", width: 80%),
  caption: [Pseudocode Fungsi `find_account_idx`.]
)

==== Pseudocode deposit

#figure(
  image("/media/3324-pseudocode-deposit.png", width: 80%),
  caption: [Pseudocode Fungsi `deposit`.]
)

==== Pseudocode withdraw

#figure(
  image("/media/3325-pseudocode-withdraw.png", width: 80%),
  caption: [Pseudocode Fungsi `withdraw`.]
)