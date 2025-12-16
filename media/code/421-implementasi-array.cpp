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
  cout << "Array of " << MAX_ACCOUNTS
       << " bank accounts declared." << endl;
  return 0;
}
