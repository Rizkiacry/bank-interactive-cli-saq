#include <iostream>

using namespace std;

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

int main() {
  BankAccount acc = {1, "A", "B", 'c', 1.0f};
  initialize_account(acc);
  cout << "Account initialized. accno is "
       << acc.accno << endl;
  return 0;
}
