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
