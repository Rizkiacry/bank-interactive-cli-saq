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

BankAccount accounts[MAX_ACCOUNTS];

int main() {
  accounts[0].accno = 1001; // Akses elemen pertama
  accounts[4].amount =
      500000.0; // Akses elemen terakhir

  cout << "Accessed and modified array elements."
       << endl;
  cout << "accounts[0].accno = "
       << accounts[0].accno << endl;
  cout << "accounts[4].amount = "
       << accounts[4].amount << endl;

  return 0;
}
