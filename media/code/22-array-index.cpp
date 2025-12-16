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
  // Akses elemen pertama
  accounts[0].accno = 1001;
  accounts[0].name = "Jane Doe";

  // Iterasi seluruh array
  for (int i = 0; i < MAX_ACCOUNTS; ++i) {
    cout << "Account " << i
         << " No: " << accounts[i].accno << endl;
  }

  return 0;
}
