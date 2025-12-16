#include <iostream>

using namespace std;

struct BankAccount {
  int accno;
  string name;
  string address;
  char actype;
  float amount;
};

void deposit(BankAccount &acc) {
  float d;
  cout << "\nMasukkan jumlah untuk disetor = ";
  cin >> d;
  if (d > 0) {
    acc.amount += d; // Modifikasi saldo langsung
    cout << "Setoran berhasil. Saldo Baru = "
         << acc.amount << endl;
  } else {
    cout << "Jumlah setoran harus positif."
         << endl;
  }
}

int main() {
  BankAccount myAccount;
  myAccount.amount = 1000.00;
  deposit(myAccount);
  return 0;
}
