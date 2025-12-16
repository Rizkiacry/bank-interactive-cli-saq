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

void initialize_account(BankAccount &acc) {
  acc.accno = 0;
  acc.name = "";
  acc.address = "";
  acc.actype = '\0';
  acc.amount = 0.0;
}

BankAccount accounts[MAX_ACCOUNTS];

int main() {
  for (int i = 0; i < MAX_ACCOUNTS; ++i) {
    initialize_account(accounts[i]);
  }
  cout << "All accounts initialized." << endl;
  return 0;
}
