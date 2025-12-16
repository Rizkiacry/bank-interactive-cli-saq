#import "@preview/codly:0.2.0": *
#show: codly-init.with()

#set document(
  title: "Sistem Manajemen Akun Bank",
  author: "Mahasiswa Algoritma dan Pemrograman I"
)

#set text(font: "Times New Roman", size: 12pt)
#set page(numbering: "1")

// Title Page
#align(center)[
  #text(size: 18pt, weight: "bold")[SISTEM MANAJEMEN AKUN BANK]
  
  #v(0.5cm)
  
  #text(size: 14pt)[Program Komputer dalam C++]
  
  #v(1cm)
  
  #text(size: 12pt)[Laporan Proyek Akhir]
  
  #text(size: 12pt)[Mata Kuliah Algoritma dan Pemrograman I]
  
  #v(2cm)
  
  #text(size: 12pt)[
    Disusun oleh: \
    Mahasiswa Program Studi Teknik Informatika
  ]
  
  #v(1cm)
  
  #text(size: 12pt)[
    Tahun Akademik 2025
  ]
]

#pagebreak()

// Table of Contents
#outline(
  title: "DAFTAR ISI",
  indent: 1em
)

#pagebreak()

// List of Figures
#heading(level: 1, numbering: none)[DAFTAR GAMBAR]

1. Diagram Alur Sistem Manajemen Akun Bank (Flowchart)
2. Struktur Data BankAccount dalam Memori

#pagebreak()

// Chapter I: Introduction
#heading(level: 1)[BAB I PENDAHULUAN]

#heading(level: 2)[1.1. Latar Belakang]

Sistem manajemen akun bank merupakan aplikasi fundamental dalam dunia perbankan digital. Aplikasi ini dirancang untuk mengelola informasi akun pelanggan, melakukan transaksi setoran dan penarikan dana, serta menampilkan data akun yang tersimpan dalam sistem. 

Pengembangan sistem manajemen akun bank menggunakan bahasa pemrograman C++ dengan paradigma pemrograman procedural memberikan fondasi yang kuat dalam memahami konsep pemrograman tingkat pemula. Melalui proyek ini, pembaca akan mempelajari penggunaan struktur data (struct), array, fungsi, sistem input-output berbasis stream, dan kontrol alur program menggunakan switch-case.

Dengan membatasi penggunaan library hanya pada `iostream` dan `cstdlib`, proyek ini menekankan pemahaman mendalam terhadap mekanisme dasar C++ tanpa bergantung pada fitur-fitur advanced atau template library. Hal ini memastikan bahwa setiap aspek program dapat dipahami secara menyeluruh dari perspektif algoritma dan logika pemrograman.

#heading(level: 2)[1.2. Tujuan]

Tujuan pengembangan sistem manajemen akun bank adalah:

1. Memahami dan menerapkan struktur data `struct` dalam C++ untuk menyimpan informasi akun bank yang terdiri dari nomor akun, nama pemegang, alamat, jenis akun, dan saldo.

2. Menerapkan array sebagai kontainer untuk menyimpan hingga lima akun bank secara simultan.

3. Mengimplementasikan operasi dasar perbankan meliputi pembuatan akun baru, setoran, penarikan, pencarian, modifikasi, dan penghapusan akun.

4. Menerapkan fungsi dengan parameter referensi untuk memanipulasi data akun secara efisien.

5. Mengembangkan menu interaktif berbasis command-line interface (CLI) dengan sistem pilihan menggunakan `switch-case`.

#heading(level: 2)[1.3. Manfaat]

Manfaat dari proyek ini mencakup:

1. Pemahaman konseptual tentang abstraksi data melalui struktur dan cara data diorganisir dalam memori.

2. Praktik penulisan fungsi yang reusable dan terstruktur untuk operasi spesifik.

3. Pengalaman dalam menangani input user dengan validasi dan penanganan kondisi error.

4. Kemampuan untuk merancang algoritma pencarian linear untuk menemukan akun dalam array.

5. Fondasi dasar untuk pengembangan aplikasi berbasis data yang lebih kompleks.

#heading(level: 2)[1.4. Batasan Masalah]

Batasan-batasan dalam proyek ini adalah:

1. Kapasitas maksimal sistem hanya dapat menampung lima akun bank, didefinisikan oleh konstanta `MAX_ACCOUNTS`.

2. Data akun hanya tersimpan dalam memori RAM selama program berjalan; tidak ada mekanisme penyimpanan data permanen ke file.

3. Sistem menggunakan array statis, bukan struktur data dinamis seperti linked list atau vector.

4. Nomor akun harus bernilai unik; sistem tidak menerapkan mekanisme otomatis untuk menghasilkan nomor akun.

5. Jenis akun dibatasi pada dua pilihan: 's' untuk tabungan (savings) dan 'c' untuk giro (current).

6. Library yang digunakan terbatas pada `iostream` dan `cstdlib`; tidak menggunakan library tambahan seperti `string` dalam definisi struct.

7. Sistem tidak menerapkan enkripsi atau keamanan data; hanya validasi dasar pada nilai masukan.

---

#heading(level: 1)[BAB II LANDASAN TEORI]

#heading(level: 2)[2.1. Struktur Data]

Struktur data dalam C++ didefinisikan menggunakan keyword `struct` untuk mengelompokkan beberapa variabel dari tipe data yang berbeda menjadi satu kesatuan logis. Menurut dokumentasi cppreference, struct dalam C++ merupakan user-defined type yang mengkombinasikan multiple members dengan tipe berbeda dalam suatu composite type. Ketika struct dideklarasikan dengan body, pernyataan tersebut sekaligus merupakan definisi yang mengalokasikan template tipe dalam sistem type C++.

Dalam proyek ini, struktur `BankAccount` digunakan untuk merepresentasikan data tunggal akun:

```cpp
struct BankAccount {
    int accno;           // Nomor akun, tipe integer
    string name;         // Nama pemegang akun
    string address;      // Alamat pemegang akun
    char actype;         // Jenis akun: 's' atau 'c'
    float amount;        // Saldo akun dalam rupiah
};
```

Setiap anggota struct memiliki offset tetap dari awal struktur di memori. Dalam bahasa C++, akses terhadap member struktur dilakukan dengan operator dot (.) ketika menggunakan variabel struct langsung, dan operator arrow (->) ketika menggunakan pointer ke struct.

#heading(level: 2)[2.2. Array dan Indeksasi]

Array merupakan koleksi elemen tipe data yang sama, tersimpan dalam lokasi memori yang berdampingan (contiguous). Dalam C++, deklarasi array menggunakan notasi `type name[size]`, di mana `size` merupakan konstanta yang menentukan jumlah maksimal elemen.

Menurut cppreference, subscript operator `[]` digunakan untuk mengakses elemen array pada indeks tertentu. Operator ini didefinisikan secara identik dengan ekspresi pointer arithmetic: `E1[E2]` secara fundamental equivalent dengan `*((E1)+(E2))`. Indeksasi array dalam C++ dimulai dari 0, sehingga array dengan size `n` memiliki indeks valid dari 0 hingga `n-1`.

Dalam proyek, array `BankAccount accounts[MAX_ACCOUNTS]` menyimpan hingga lima akun:

```cpp
const int MAX_ACCOUNTS = 5;
BankAccount accounts[MAX_ACCOUNTS];

// Akses elemen pertama
accounts[0].accno = 1001;

// Iterasi seluruh array
for (int i = 0; i < MAX_ACCOUNTS; ++i) {
    cout << accounts[i].accno << endl;
}
```

Subscript operator pada array mengembalikan lvalue apabila array adalah lvalue, memungkinkan baik pembacaan maupun penulisan nilai pada posisi tersebut.

#heading(level: 2)[2.3. Fungsi dan Parameter Referensi]

Fungsi dalam C++ merupakan blok kode yang dapat dipanggil berulang dengan identitas dan tipe parameter tertentu. Dokumentasi cppreference menyatakan bahwa function declaration memperkenalkan nama fungsi dan tipe fungsi, sedangkan function definition mengasosiasikan nama/tipe dengan body fungsi.

Parameter referensi dalam C++ (reference parameter) memungkinkan fungsi memodifikasi argumen asli tanpa membuat salinan. Notasi parameter referensi menggunakan symbol ampersand (&):

```cpp
void deposit(BankAccount& acc) {
    float d;
    cout << "\nMasukkan jumlah untuk disetor = ";
    cin >> d;
    if (d > 0) {
        acc.amount += d;  // Modifikasi saldo langsung
        cout << "Setoran berhasil. Saldo Baru = " << acc.amount << endl;
    } else {
        cout << "Jumlah setoran harus positif." << endl;
    }
}
```

Parameter referensi berbeda dengan parameter pointer, karena referensi tidak memerlukan dereference dan tidak dapat bernilai null. Fungsi yang menerima referensi dapat secara langsung mengakses dan memodifikasi object asli melalui reference tersebut tanpa overhead pembuatan salinan (copy).

#heading(level: 2)[2.4. Stream Input-Output]

Stream dalam C++ merupakan abstraksi untuk komunikasi data antara program dan external device. Menurut dokumentasi cppreference, iostream header mendefinisikan object global `cin` dengan tipe `istream` untuk membaca input dari keyboard, dan `cout` dengan tipe `ostream` untuk menampilkan output ke layar.

Ekstraksi data dari stream menggunakan operator `>>`:

```cpp
int accno;
cout << "Masukkan nomor akun: ";
cin >> accno;  // Baca integer dari input stream
```

Insersi data ke stream menggunakan operator `<<`:

```cpp
cout << "Saldo: " << amount << endl;
```

Ketika menggunakan `cin >>` diikuti `getline()`, diperlukan `cin.ignore()` untuk membersihkan karakter newline yang tertinggal di input buffer:

```cpp
int age;
cin >> age;
cin.ignore(10000, '\n');  // Bersihkan buffer
string name;
getline(cin, name);       // Baca string dengan spasi
```

#heading(level: 2)[2.5. Kontrol Alur Program]

Kontrol alur program menggunakan `switch-case` memungkinkan eksekusi kode berbeda berdasarkan nilai satu expression. Struktur switch-case dalam proyek ini merespons pilihan menu user:

```cpp
int choice;
cin >> choice;

switch (choice) {
    case 1:
        // Logika pembuatan akun baru
        break;
    case 2:
        // Logika setoran
        break;
    default:
        cout << "Pilihan tidak valid." << endl;
}
```

Statement `break` penting untuk menghentikan eksekusi dan keluar dari switch-case. Tanpa `break`, eksekusi akan berlanjut ke case berikutnya (fall-through behavior).

#heading(level: 2)[2.6. Algoritma Pencarian Linear]

Pencarian linear merupakan algoritma dasar yang memeriksa setiap elemen dalam array secara berurutan sampai menemukan elemen target atau mencapai akhir array. Dalam proyek, fungsi `find_account_idx()` mengimplementasikan algoritma ini untuk mencari akun berdasarkan nomor akun:

```cpp
int find_account_idx(int acc_num, const BankAccount accounts[], int size) {
    for (int i = 0; i < size; ++i) {
        if (accounts[i].accno == acc_num) {
            return i;  // Ditemukan pada indeks i
        }
    }
    return -1;  // Tidak ditemukan
}
```

Kompleksitas waktu pencarian linear adalah O(n), di mana n adalah jumlah elemen yang diperiksa. Algoritma ini cukup efisien untuk dataset berukuran kecil seperti lima akun, namun untuk dataset lebih besar diperlukan struktur data dan algoritma yang lebih sophisticated.

---

#heading(level: 1)[BAB III PERANCANGAN]

#heading(level: 2)[3.1. Analisis Masalah]

#heading(level: 3)[Data yang Dibutuhkan]

Sistem manajemen akun bank memerlukan data berikut untuk setiap akun:

1. Nomor akun (integer): identifier unik untuk setiap akun, dipilih user saat pembuatan akun.

2. Nama pemegang (string): nama lengkap pemegang akun, dapat mengandung spasi dan karakter alphabetic.

3. Alamat (string): lokasi tempat tinggal pemegang akun, dapat mengandung spasi, karakter numerik, dan punctuation.

4. Jenis akun (char): klasifikasi akun sebagai 's' untuk tabungan atau 'c' untuk giro.

5. Saldo (float): jumlah dana yang tersimpan dalam akun, dinyatakan dalam rupiah dengan dua desimal.

Data-data tersebut dienkapsulasi dalam struktur `BankAccount` dan disimpan dalam array dengan kapasitas maksimal lima akun.

#heading(level: 3)[Output yang Diinginkan]

Sistem dirancang untuk menghasilkan output berikut:

1. Menu interaktif yang menampilkan delapan pilihan operasi kepada user.

2. Konfirmasi keberhasilan operasi dengan pesan yang jelas dan informatif.

3. Pesan error ketika operasi gagal, misalnya saldo tidak mencukupi atau akun tidak ditemukan.

4. Display detail akun yang menampilkan semua data akun dalam format terstruktur.

5. Informasi saldo setelah setiap transaksi setoran atau penarikan.

#heading(level: 3)[Proses Data]

Proses dalam sistem terdiri dari:

1. Inisialisasi: Semua akun diinisialisasi dengan nilai default (nomor akun 0 menandakan slot kosong).

2. Pembuatan akun: User memasukkan data akun baru, sistem menyimpan pada slot pertama yang kosong.

3. Pencarian akun: Sistem melakukan pencarian linear untuk menemukan akun berdasarkan nomor akun.

4. Transaksi setoran: Saldo ditambahkan dengan jumlah yang disetorkan, dengan validasi jumlah positif.

5. Transaksi penarikan: Saldo dikurangi dengan jumlah yang ditarik, dengan validasi saldo cukup dan jumlah positif.

6. Modifikasi akun: User dapat mengubah nama, alamat, dan jenis akun (tidak termasuk nomor akun dan saldo).

7. Penghapusan akun: Slot akun dikosongkan dengan reinisialisasi nilai-nilainya.

8. Tampilan semua akun: Sistem mengiterasi seluruh array dan menampilkan akun yang valid (nomor akun bukan 0).

#heading(level: 2)[3.2. Flowchart]

```mermaid
graph TD
    A["Start"] --> B["Inisialisasi 5 akun kosong"]
    B --> C["Tampilkan Menu"]
    C --> D["Input pilihan"]
    D --> E{Pilihan?}
    
    E -->|1| F["Input data akun baru"]
    F --> G{Slot kosong?}
    G -->|Ya| H["Simpan akun"]
    G -->|Tidak| I["Tampil: Batas terlampaui"]
    H --> J["Tampil: Akun Berhasil Dibuat"]
    
    E -->|2| K["Input nomor akun"]
    K --> L{Akun ditemukan?}
    L -->|Ya| M["Input jumlah setoran"]
    M --> N["Tambah saldo"]
    N --> O["Tampil: Setoran berhasil"]
    L -->|Tidak| P["Tampil: Akun tidak ditemukan"]
    
    E -->|3| Q["Input nomor akun"]
    Q --> R{Akun ditemukan?}
    R -->|Ya| S["Input jumlah penarikan"]
    S --> T{Saldo cukup?}
    T -->|Ya| U["Kurangi saldo"]
    U --> V["Tampil: Penarikan berhasil"]
    T -->|Tidak| W["Tampil: Saldo tidak mencukupi"]
    R -->|Tidak| X["Tampil: Akun tidak ditemukan"]
    
    E -->|4| Y["Input nomor akun"]
    Y --> Z{Akun ditemukan?}
    Z -->|Ya| AA["Tampil detail akun"]
    Z -->|Tidak| AB["Tampil: Akun tidak ditemukan"]
    
    E -->|5| AC["Input nomor akun"]
    AC --> AD{Akun ditemukan?}
    AD -->|Ya| AE["Input data akun baru"]
    AE --> AF["Update akun"]
    AF --> AG["Tampil: Akun berhasil diubah"]
    AD -->|Tidak| AH["Tampil: Akun tidak ditemukan"]
    
    E -->|6| AI["Input nomor akun"]
    AI --> AJ{Akun ditemukan?}
    AJ -->|Ya| AK["Hapus akun"]
    AK --> AL["Tampil: Akun berhasil dihapus"]
    AJ -->|Tidak| AM["Tampil: Akun tidak ditemukan"]
    
    E -->|7| AN["Iterasi seluruh akun"]
    AN --> AO{Ada akun valid?}
    AO -->|Ya| AP["Tampil semua akun"]
    AO -->|Tidak| AQ["Tampil: Tidak ada akun"]
    
    E -->|8| AR["Exit"]
    
    E -->|Lain| AS["Tampil: Pilihan tidak valid"]
    
    J --> AT["Tekan Enter untuk melanjutkan"]
    I --> AT
    O --> AT
    P --> AT
    V --> AT
    W --> AT
    X --> AT
    AA --> AT
    AB --> AT
    AG --> AT
    AH --> AT
    AL --> AT
    AM --> AT
    AP --> AT
    AQ --> AT
    AS --> AT
    AT --> AU["Clear screen"]
    AU --> C
    AR --> AV["End"]
```

#heading(level: 2)[3.3. Algoritma]

#heading(level: 3)[3.3.1 Pseudocode Utama Program]

```
ALGORITHM MainProgram
INPUT: User menu selection
OUTPUT: Menu-driven interface for bank account management

BEGIN
    DECLARE accounts AS ARRAY[5] OF BankAccount
    DECLARE choice AS INTEGER
    DECLARE acc_num AS INTEGER
    DECLARE acc_idx AS INTEGER
    
    FOR i = 0 TO 4 DO
        CALL initialize_account(accounts[i])
    END FOR
    
    WHILE true DO
        CALL system("clear")
        CALL display_menu()
        READ choice FROM user
        
        SWITCH choice
            CASE 1:
                acc_idx = CALL find_available_slot(accounts, 5)
                IF acc_idx != -1 THEN
                    CALL create_new_account(accounts[acc_idx])
                    PRINT "Akun Berhasil Dibuat..."
                ELSE
                    PRINT "Batas akun terlampaui"
                END IF
                
            CASE 2:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL deposit(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 3:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL withdraw(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 4:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL display_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 5:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL modify_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 6:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL delete_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 7:
                DECLARE found AS BOOLEAN = FALSE
                FOR i = 0 TO 4 DO
                    IF NOT is_account_empty(accounts[i]) THEN
                        CALL display_account(accounts[i])
                        found = TRUE
                    END IF
                END FOR
                IF NOT found THEN
                    PRINT "Tidak ada akun yang ditemukan"
                END IF
                
            CASE 8:
                CALL exit(0)
                
            DEFAULT:
                PRINT "Pilihan tidak valid"
        END SWITCH
        
        PRINT "Tekan Enter untuk melanjutkan..."
        WAIT FOR user input
    END WHILE
END
```

#heading(level: 3)[3.3.2 Pseudocode Fungsi-Fungsi Pendukung]

#heading(level: 4)[Pseudocode initialize_account]

```
ALGORITHM initialize_account
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Initialized account with default values

BEGIN
    acc.accno = 0
    acc.name = ""
    acc.address = ""
    acc.actype = '\0'
    acc.amount = 0.0
END
```

#heading(level: 4)[Pseudocode find_available_slot]

```
ALGORITHM find_available_slot
INPUT: accounts AS ARRAY OF BankAccount, size AS INTEGER
OUTPUT: Index of first empty slot, or -1 if full

BEGIN
    FOR i = 0 TO size - 1 DO
        IF is_account_empty(accounts[i]) THEN
            RETURN i
        END IF
    END FOR
    RETURN -1
END
```

#heading(level: 4)[Pseudocode find_account_idx]

```
ALGORITHM find_account_idx
INPUT: acc_num AS INTEGER, accounts AS ARRAY OF BankAccount, size AS INTEGER
OUTPUT: Index of account with acc_num, or -1 if not found

BEGIN
    FOR i = 0 TO size - 1 DO
        IF accounts[i].accno == acc_num THEN
            RETURN i
        END IF
    END FOR
    RETURN -1
END
```

#heading(level: 4)[Pseudocode deposit]

```
ALGORITHM deposit
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Updated account balance

BEGIN
    DECLARE d AS FLOAT
    PRINT "Masukkan jumlah untuk disetor = "
    READ d FROM user
    
    IF d > 0 THEN
        acc.amount = acc.amount + d
        PRINT "Setoran berhasil. Saldo Baru = " + acc.amount
    ELSE
        PRINT "Jumlah setoran harus positif"
    END IF
END
```

#heading(level: 4)[Pseudocode withdraw]

```
ALGORITHM withdraw
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Updated account balance

BEGIN
    DECLARE wd AS FLOAT
    PRINT "Masukkan jumlah untuk ditarik = "
    READ wd FROM user
    
    IF wd > acc.amount THEN
        PRINT "Saldo tidak mencukupi"
    ELSE IF wd <= 0 THEN
        PRINT "Jumlah penarikan harus positif"
    ELSE
        acc.amount = acc.amount - wd
        PRINT "Penarikan berhasil"
    END IF
    
    PRINT "Sisa saldo: " + acc.amount
END
```

---

#heading(level: 1)[BAB IV HASIL DAN PEMBAHASAN]

#heading(level: 2)[4.1. Implementasi Struktur Data BankAccount]

Struktur `BankAccount` merupakan inti dari sistem penyimpanan data. Definisi struktur ini mengelompokkan lima anggota yang mewakili atribut-atribut lengkap satu akun bank:

```cpp
struct BankAccount {
    int accno;      // Tipe int untuk nomor akun numerik
    string name;    // Tipe string untuk nama pemegang
    string address; // Tipe string untuk alamat pemegang
    char actype;    // Tipe char untuk jenis akun (s atau c)
    float amount;   // Tipe float untuk saldo dalam rupiah
};
```

Penggunaan `int` untuk nomor akun memastikan identifikasi numerik yang efisien. Tipe `float` untuk saldo memungkinkan representasi nilai dengan presisi desimal, meskipun untuk aplikasi finansial production-grade biasanya menggunakan tipe integer dengan unit cent untuk menghindari floating-point precision issues. Tipe `char` untuk jenis akun menghemat memori dibandingkan menggunakan string.

Ketika struct dideklarasikan, compiler mengalokasikan template tipe ini, namun tidak mengalokasikan memori untuk data aktual sampai variabel struct dideklarasikan. Deklarasi array `BankAccount accounts[MAX_ACCOUNTS]` mengalokasikan memori untuk lima instance struktur secara kontinu dalam memori.

#heading(level: 2)[4.2. Implementasi Array dan Sistem Indeksasi]

Array statis digunakan untuk menyimpan akun-akun dengan kapasitas tetap:

```cpp
const int MAX_ACCOUNTS = 5;
BankAccount accounts[MAX_ACCOUNTS];
```

Konstanta `MAX_ACCOUNTS` didefinisikan dengan nilai 5, membentuk batas atas jumlah akun yang dapat disimpan. Array ini dideklarasikan dengan scope global dalam fungsi `main()`, sehingga seluruh fungsi dapat mengaksesnya.

Akses elemen array menggunakan subscript operator `[]`:

```cpp
accounts[0].accno = 1001;      // Akses elemen pertama
accounts[4].amount = 500000.0; // Akses elemen terakhir
```

Subscript operator `[]` dalam C++ secara definitif equivalent dengan pointer arithmetic. Expresi `accounts[i]` sebenarnya diterjemahkan menjadi `*(accounts + i)`, di mana `accounts + i` menghitung address dengan offset sebesar `i * sizeof(BankAccount)` dari base address array.

Inisialisasi array dilakukan melalui looping:

```cpp
for (int i = 0; i < MAX_ACCOUNTS; ++i) {
    initialize_account(accounts[i]);
}
```

Setiap iterasi memanggil fungsi `initialize_account()` dengan parameter referensi, mengakses setiap elemen array secara berurutan. Indeks dimulai dari 0 dan berakhir pada 4, mencakup seluruh kapasitas array.

#heading(level: 2)[4.3. Implementasi Fungsi dengan Parameter Referensi]

Fungsi-fungsi dalam sistem menggunakan parameter referensi untuk memodifikasi data akun secara langsung tanpa membuat salinan:

```cpp
void deposit(BankAccount& acc) {
    float d;
    cout << "\nMasukkan jumlah untuk disetor = ";
    cin >> d;
    if (d > 0) {
        acc.amount += d;
        cout << "Setoran berhasil. Saldo Baru = " << acc.amount << endl;
    } else {
        cout << "Jumlah setoran harus positif." << endl;
    }
}
```

Parameter `BankAccount& acc` mendeklarasikan referensi ke struktur `BankAccount`. Ketika fungsi memodifikasi `acc.amount`, perubahan tersebut mempengaruhi object asli dalam array, bukan salinan. Ini berbeda dengan parameter pass-by-value yang akan membuat salinan dan perubahan tidak akan terlihat di caller.

Referensi dalam C++ bersifat immutable setelah inisialisasi; setelah referensi `acc` terikat pada object tertentu, tidak dapat diubah untuk mereferensikan object lain. Referensi juga tidak dapat bernilai null, berbeda dengan pointer.

Fungsi `modify_account()` memanfaatkan referensi untuk mengubah multiple members:

```cpp
void modify_account(BankAccount& acc) {
    cout << "\nMengubah No. Akun: " << acc.accno << endl;
    cout << "Masukkan nama baru: ";
    cin.ignore();
    getline(cin, acc.name);
    cout << "Masukkan alamat baru: ";
    getline(cin, acc.address);
    cout << "Masukkan tipe akun baru (s/c): ";
    cin >> acc.actype;
    cout << "\nAkun berhasil diubah." << endl;
}
```

Dalam fungsi ini, `cin.ignore()` membersihkan karakter newline dari buffer input setelah `cin >> actype` pada operasi sebelumnya, memastikan `getline()` bekerja dengan benar. Referensi memungkinkan modifikasi langsung terhadap anggota-anggota struktur di dalam array.

#heading(level: 2)[4.4. Implementasi Stream Input-Output]

Stream input-output menggunakan object global `cin` dan `cout` dari header `<iostream>`:

```cpp
#include <iostream>
using namespace std;
```

Operator ekstraksi `>>` membaca data dari input stream:

```cpp
int choice;
cout << "Masukkan nomor pilihan: ";
cin >> choice;
```

`cout` menampilkan prompt, kemudian `cin` menunggu user mengetik nilai integer. Operator `>>` secara otomatis mengkonversi input string ke tipe target (dalam hal ini `int`).

Untuk membaca string dengan spasi, digunakan `getline()`:

```cpp
string name;
cout << "Masukkan nama lengkap: ";
cin.ignore();
getline(cin, name);
```

`cin.ignore()` penting untuk membersihkan karakter newline tertinggal dari operasi `cin >>` sebelumnya. Tanpa ini, `getline()` akan membaca string kosong karena newline di buffer dianggap sebagai delimiter.

Operator insersi `<<` menampilkan data ke output stream:

```cpp
cout << "Saldo Baru = " << acc.amount << endl;
```

Operator `<<` dapat di-chain untuk menampilkan multiple expressions dalam satu statement. `endl` menampilkan newline dan flush buffer output.

#heading(level: 2)[4.5. Implementasi Kontrol Alur dengan Switch-Case]

Menu utama program menggunakan `switch-case` untuk mengarahkan eksekusi berdasarkan pilihan user:

```cpp
switch (choice) {
    case 1:
        acc_idx = find_available_slot(accounts, MAX_ACCOUNTS);
        if (acc_idx != -1) {
            create_new_account(accounts[acc_idx]);
            cout << "Akun Berhasil Dibuat..." << endl;
        } else {
            cout << "Batas akun terlampaui. Tidak dapat membuat akun baru." << endl;
        }
        break;
    case 2:
        // Logika setoran
        break;
    case 8:
        exit(0);
    default:
        cout << "Pilihan tidak valid. Silakan coba lagi." << endl;
}
```

Statement `switch` mengevaluasi ekspresi `choice` dan melompat ke case yang cocok. Statement `break` mengakhiri eksekusi case dan melompat ke akhir switch block. Tanpa `break`, eksekusi akan terus ke case berikutnya (fall-through), yang umumnya tidak diinginkan.

Case `8` memanggil `exit(0)` untuk menghentikan program dengan status 0 (normal termination). `cstdlib` header menyediakan fungsi `exit()`.

Case `default` menangani pilihan yang tidak valid. Struktur switch-case ini membuat menu-driven program yang mudah dipahami dan diperluas.

#heading(level: 2)[4.6. Implementasi Algoritma Pencarian Linear]

Fungsi `find_account_idx()` mengimplementasikan pencarian linear untuk menemukan akun berdasarkan nomor akun:

```cpp
int find_account_idx(int acc_num, const BankAccount accounts[], int size) {
    for (int i = 0; i < size; ++i) {
        if (accounts[i].accno == acc_num) {
            return i;
        }
    }
    return -1;
}
```

Fungsi menerima tiga parameter: nomor akun yang dicari (`acc_num`), array akun (`accounts` dengan qualifier `const` karena fungsi hanya membaca), dan ukuran array (`size`).

Loop `for` iterasi dari indeks 0 sampai `size - 1`. Setiap iterasi membandingkan `accounts[i].accno` dengan `acc_num`. Ketika match ditemukan, fungsi segera mengembalikan indeks `i`. Jika seluruh array diperiksa tanpa menemukan match, fungsi mengembalikan -1 sebagai sentinel value yang menunjukkan akun tidak ditemukan.

Caller menggunakan return value ini untuk pemeriksaan:

```cpp
acc_idx = find_account_idx(acc_num, accounts, MAX_ACCOUNTS);
if (acc_idx != -1) {
    deposit(accounts[acc_idx]);
} else {
    cout << "Akun tidak ditemukan." << endl;
}
```

Pemeriksaan `acc_idx != -1` menentukan apakah pencarian berhasil. Jika berhasil, akun pada indeks `acc_idx` dapat diakses untuk operasi lebih lanjut.

#heading(level: 2)[4.7. Implementasi Fungsi Validasi dan Utilitas]

Fungsi `is_account_empty()` digunakan untuk memeriksa apakah slot akun kosong:

```cpp
bool is_account_empty(const BankAccount& acc) {
    return acc.accno == 0;
}
```

Fungsi ini menggunakan konvensi bahwa nomor akun 0 menunjukkan slot kosong (tidak valid). Return type `bool` memberikan hasil boolean yang dapat langsung digunakan dalam kondisi if.

Fungsi `find_available_slot()` mencari slot kosong pertama:

```cpp
int find_available_slot(const BankAccount accounts[], int size) {
    for (int i = 0; i < size; ++i) {
        if (is_account_empty(accounts[i])) {
            return i;
        }
    }
    return -1;
}
```

Fungsi ini memanfaatkan `is_account_empty()` untuk memeriksa setiap slot. Ketika slot kosong ditemukan, indeks tersebut dikembalikan. Jika semua slot penuh, -1 dikembalikan.

Fungsi `initialize_account()` mereset akun ke state kosong:

```cpp
void initialize_account(BankAccount& acc) {
    acc.accno = 0;
    acc.name = "";
    acc.address = "";
    acc.actype = '\0';
    acc.amount = 0.0;
}
```

Penggunaan parameter referensi memungkinkan modifikasi object asli. Semua anggota diatur ke nilai default: nomor akun 0, string kosong, karakter null, dan saldo 0.0.

---

#heading(level: 1)[BAB V KESIMPULAN]

Sistem manajemen akun bank yang dikembangkan dalam proyek ini mendemonstrasikan penerapan konsep-konsep fundamental pemrograman C++ secara komprehensif. Melalui implementasi, pembaca telah mempelajari dan memahami:

1. Penggunaan struktur data `struct` untuk abstraksi dan enkapsulasi atribut-atribut logis ke dalam composite type yang bermakna. Struct `BankAccount` mengelompokkan lima anggota dengan tipe berbeda menjadi kesatuan yang merepresentasikan entitas akun bank.

2. Penerapan array statis sebagai kontainer untuk menyimpan multiple instances dari struktur dengan kapasitas tetap. Array ini memungkinkan akses O(1) ke setiap akun melalui subscript operator, meskipun dengan trade-off kapasitas terbatas.

3. Implementasi fungsi dengan parameter referensi yang memungkinkan fungsi memodifikasi data asli tanpa overhead pembuatan salinan. Referensi memberikan semantik yang lebih intuitif dibandingkan pointer untuk kasus-kasus seperti ini.

4. Penggunaan stream input-output berbasis object `cin` dan `cout` untuk komunikasi interaktif dengan user. Operator ekstraksi dan insersi memudahkan pembacaan dan penulisan data dengan tipe otomatis conversion.

5. Desain menu interaktif berbasis `switch-case` yang memungkinkan user memilih dari operasi yang berbeda-beda. Struktur ini scalable dan mudah untuk menambahkan operasi baru.

6. Implementasi algoritma pencarian linear untuk menemukan akun dalam array. Meskipun kompleksitas O(n), algoritma ini cukup efisien untuk dataset berukuran kecil dan mudah dipahami.

7. Pemahaman tentang convention dan best practices dalam desain program, seperti menggunakan sentinel value (-1) untuk menunjukkan kondisi khusus, dan `const` qualifier untuk parameter yang tidak dimodifikasi.

Proyek ini memberikan fondasi yang solid untuk memahami konsep pemrograman tingkat pemula dan untuk melanjutkan ke topik-topik lebih advanced seperti linked list, dynamic memory allocation, file I/O, dan object-oriented programming. Sistem yang dikembangkan dapat diperluas dengan fitur-fitur tambahan seperti penyimpanan data ke file, enkripsi password, atau analisis transaksi historis.

---

#heading(level: 1, numbering: none)[DAFTAR PUSTAKA]

[1] cppreference.com. (2025). "Function declaration". Tersedia dari https://en.cppreference.com/w/cpp/language/function

[2] cppreference.com. (2025). "Struct Declaration". Tersedia dari https://en.cppreference.com/w/c/language/struct

[3] cppreference.com. (2025). "Subscript Operator". Tersedia dari https://en.cppreference.com/w/cpp/language/operator_member_access

[4] cppreference.com. (2025). "Input/output library". Tersedia dari https://en.cppreference.com/w/cpp/header/iostream

[5] cppreference.com. (2025). "std::exit". Tersedia dari https://en.cppreference.com/w/cpp/utility/program/exit

[6] GeeksforGeeks. "Structures in C++". Tersedia dari https://www.geeksforgeeks.org/cpp/structures-in-cpp/

[7] GeeksforGeeks. "Arrays in C++". Tersedia dari https://www.geeksforgeeks.org/cpp/cpp-arrays/

[8] GeeksforGeeks. "Basic Input / Output in C++". Tersedia dari https://www.geeksforgeeks.org/cpp/basic-input-output-c/

[9] W3Schools. "C++ cin object". Tersedia dari https://www.w3schools.com/cpp/ref_iostream_cin.asp

[10] Microsoft Learn. "Subscript Operator". Tersedia dari https://learn.microsoft.com/en-us/cpp/cpp/subscript-operator
