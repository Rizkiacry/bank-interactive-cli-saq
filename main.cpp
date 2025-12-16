#include <cstdlib>
#include <iostream>

using namespace std;

const int MAX_ACCOUNTS = 5;

struct BankAccount {
  int accno;
  string name;
  string address;
  char actype; // 's' tabungan (savings), 'c'
               // giro (current)
  float amount;
};

void create_new_account(BankAccount &acc);
void deposit(BankAccount &acc);
void withdraw(BankAccount &acc);
void display_account(const BankAccount &acc);
void modify_account(BankAccount &acc);
void delete_account(BankAccount &acc);
void initialize_account(BankAccount &acc);

bool is_account_empty(const BankAccount &acc);
int find_account_idx(int acc_num,
                     const BankAccount accounts[],
                     int size);
int find_available_slot(
    const BankAccount accounts[], int size);
void display_menu();

int main() {
  BankAccount accounts[MAX_ACCOUNTS];
  for (int i = 0; i < MAX_ACCOUNTS; ++i) {
    initialize_account(accounts[i]);
  }

  int choice;
  int acc_num;
  int acc_idx;

  while (true) {
    system("clear");
    display_menu();
    cout << "Masukkan nomor pilihan: ";
    cin >> choice;

    switch (choice) {
    case 1: // new account
      acc_idx = find_available_slot(accounts,
                                    MAX_ACCOUNTS);
      if (acc_idx != -1) {
        create_new_account(accounts[acc_idx]);
        cout << "Akun Berhasil Dibuat..." << endl;
      } else {
        cout << "Batas akun terlampaui. "
                "Tidak dapat membuat akun "
                "baru."
             << endl;
      }
      break;
    case 2: // deposit
      cout << "Masukkan no. akun: ";
      cin >> acc_num;
      acc_idx = find_account_idx(acc_num, accounts,
                                 MAX_ACCOUNTS);
      if (acc_idx != -1) {
        deposit(accounts[acc_idx]);
      } else {
        cout << "Akun tidak ditemukan." << endl;
      }
      break;
    case 3: // withdraw
      cout << "Masukkan no. akun: ";
      cin >> acc_num;
      acc_idx = find_account_idx(acc_num, accounts,
                                 MAX_ACCOUNTS);
      if (acc_idx != -1) {
        withdraw(accounts[acc_idx]);
      } else {
        cout << "Akun tidak ditemukan." << endl;
      }
      break;
    case 4: // check account
      cout << "Masukkan no. akun: ";
      cin >> acc_num;
      acc_idx = find_account_idx(acc_num, accounts,
                                 MAX_ACCOUNTS);
      if (acc_idx != -1) {
        display_account(accounts[acc_idx]);
      } else {
        cout << "Akun tidak ditemukan." << endl;
      }
      break;
    case 5: // modify account
      cout << "Masukkan no. akun: ";
      cin >> acc_num;
      acc_idx = find_account_idx(acc_num, accounts,
                                 MAX_ACCOUNTS);
      if (acc_idx != -1) {
        modify_account(accounts[acc_idx]);
      } else {
        cout << "Akun tidak ditemukan." << endl;
      }
      break;
    case 6: // delete account
      cout << "Masukkan no. akun: ";
      cin >> acc_num;
      acc_idx = find_account_idx(acc_num, accounts,
                                 MAX_ACCOUNTS);
      if (acc_idx != -1) {
        delete_account(accounts[acc_idx]);
      } else {
        cout << "Akun tidak ditemukan." << endl;
      }
      break;
    case 7: // show all accounts
    {
      bool found = false;
      cout << "\n--- Semua Akun ---" << endl;
      for (int i = 0; i < MAX_ACCOUNTS; ++i) {
        if (!is_account_empty(accounts[i])) {
          display_account(accounts[i]);
          cout << "--------------------" << endl;
          found = true;
        }
      }
      if (!found) {
        cout << "Tidak ada akun yang "
                "ditemukan."
             << endl;
      }
    } break;
    case 8: // exit
      exit(0);
    default:
      cout << "Pilihan tidak valid. Silakan "
              "coba lagi."
           << endl;
    }
    cout << "\nTekan Enter untuk "
            "melanjutkan...";
    cin.ignore();
    cin.get();
  }

  return 0;
}

void display_menu() {
  cout << "             =================   "
          "           "
       << endl;
  cout << "             |   Menu Bank   |   "
          "           "
       << endl;
  cout << "================================="
          "========="
       << endl;
  cout << " 1. Buat akun baru" << endl;
  cout << " 2. Setoran" << endl;
  cout << " 3. Penarikan" << endl;
  cout << " 4. Cek akun" << endl;
  cout << " 5. Ubah akun" << endl;
  cout << " 6. Hapus akun" << endl;
  cout << " 7. Tampilkan semua akun" << endl;
  cout << " 8. Keluar" << endl;
  cout << "================================="
          "========="
       << endl;
}

void initialize_account(BankAccount &acc) {
  acc.accno = 0;
  acc.name = "";
  acc.address = "";
  acc.actype = '\0';
  acc.amount = 0.0;
}

bool is_account_empty(const BankAccount &acc) {
  return acc.accno == 0;
}

int find_available_slot(
    const BankAccount accounts[], int size) {
  for (int i = 0; i < size; ++i) {
    if (is_account_empty(accounts[i])) {
      return i;
    }
  }
  return -1; // account slot full
}

int find_account_idx(int acc_num,
                     const BankAccount accounts[],
                     int size) {
  for (int i = 0; i < size; ++i) {
    if (accounts[i].accno == acc_num) {
      return i;
    }
  }
  return -1; // account not found
}

void create_new_account(BankAccount &acc) {
  cout << "Masukkan no. akun baru: ";
  cin >> acc.accno;
  cout << "Masukkan nama lengkap: ";
  cin.ignore();
  getline(cin, acc.name);
  cout << "Masukkan alamat: ";
  getline(cin, acc.address);
  cout << "Masukkan jenis akun (s untuk "
          "tabungan, c untuk giro): ";
  cin >> acc.actype;
  cout << "Masukkan jumlah setoran awal: "
          "Rp. ";
  cin >> acc.amount;
}

void deposit(BankAccount &acc) {
  float d;
  cout << "\nMasukkan jumlah untuk disetor "
          "= Rp. ";
  cin >> d;
  if (d > 0) {
    acc.amount += d;
    cout << "Setoran berhasil. Saldo Baru = "
            "Rp. "
         << acc.amount << endl;
  } else {
    cout << "Jumlah setoran harus positif."
         << endl;
  }
}

void withdraw(BankAccount &acc) {
  float wd;
  cout << "\nMasukkan jumlah untuk ditarik "
          "= Rp. ";
  cin >> wd;
  if (wd > acc.amount) {
    cout << "\nSaldo tidak mencukupi." << endl;
  } else if (wd <= 0) {
    cout << "\nJumlah penarikan harus "
            "positif."
         << endl;
  } else {
    acc.amount -= wd;
    cout << "\nPenarikan berhasil." << endl;
  }
  cout << "Sisa saldo: Rp. " << acc.amount << endl;
}

void display_account(const BankAccount &acc) {
  cout << "--------------------" << endl;
  cout << "No. Akun: " << acc.accno << endl;
  cout << "Nama: " << acc.name << endl;
  cout << "Alamat: " << acc.address << endl;
  cout << "Tipe Akun: " << acc.actype << endl;
  cout << "Saldo: Rp. " << acc.amount << endl;
}

void modify_account(BankAccount &acc) {
  cout << "\nMengubah No. Akun: " << acc.accno
       << endl;
  cout << "Masukkan nama baru: ";
  cin.ignore();
  getline(cin, acc.name);
  cout << "Masukkan alamat baru: ";
  getline(cin, acc.address);
  cout << "Masukkan tipe akun baru (s/c): ";
  cin >> acc.actype;
  cout << "\nAkun berhasil diubah." << endl;
}

void delete_account(BankAccount &acc) {
  initialize_account(acc);
  cout << "\nAkun berhasil dihapus." << endl;
}
