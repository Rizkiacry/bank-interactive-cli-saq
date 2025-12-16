#include <iostream>

using namespace std;

struct BankAccount {
  int accno;      // Nomor akun, tipe integer
  string name;    // Nama pemegang akun
  string address; // Alamat pemegang akun
  char actype;    // Jenis akun: 's' atau 'c'
  float amount;   // Saldo akun dalam rupiah
};

int main() {
  BankAccount myAccount;
  myAccount.accno = 12345;
  myAccount.name = "John Doe";
  myAccount.address = "123 Main St";
  myAccount.actype = 's';
  myAccount.amount = 1000.00;

  cout << "Account No: " << myAccount.accno
       << endl;
  cout << "Name: " << myAccount.name << endl;
  cout << "Address: " << myAccount.address << endl;
  cout << "Account Type: " << myAccount.actype
       << endl;
  cout << "Amount: " << myAccount.amount << endl;

  return 0;
}
