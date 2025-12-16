#include <iostream>

using namespace std;

struct BankAccount {
  int accno;   // Tipe int untuk nomor akun numerik
  string name; // Tipe string untuk nama pemegang
  string
      address; // Tipe string untuk alamat pemegang
  char actype; // Tipe char untuk jenis akun (s
               // atau c)
  float amount; // Tipe float untuk saldo dalam
                // rupiah
};

int main() {
  BankAccount acc;
  acc.accno = 1001;
  acc.name = "Test User";
  acc.address = "123 Test St";
  acc.actype = 's';
  acc.amount = 100.0f;
  cout << "Account created" << endl;
  return 0;
}
