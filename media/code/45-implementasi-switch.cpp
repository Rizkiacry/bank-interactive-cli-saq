#include <cstdlib>
#include <iostream>

using namespace std;

const int MAX_ACCOUNTS = 5;

struct BankAccount {
  int accno;
  string name;
  string address;
  char actype;
  float amount;
};

void create_new_account(
    BankAccount &acc) { /* dummy function */ }
int find_available_slot(
    const BankAccount accounts[], int size) {
  return 0; /* dummy */
}

int main() {
  int choice = 1;
  int acc_idx;
  BankAccount accounts[MAX_ACCOUNTS];

  switch (choice) {
  case 1:
    acc_idx = find_available_slot(accounts,
                                  MAX_ACCOUNTS);
    if (acc_idx != -1) {
      create_new_account(accounts[acc_idx]);
      cout << "Akun Berhasil Dibuat..." << endl;
    } else {
      cout << "Batas akun terlampaui. Tidak dapat "
              "membuat akun baru."
           << endl;
    }
    break;
  case 2:
    // Logika setoran
    break;
  case 8:
    exit(0);
  default:
    cout << "Pilihan tidak valid. Silakan coba "
            "lagi."
         << endl;
  }

  return 0;
}
