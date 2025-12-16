#include <iostream>

using namespace std;

const int MAX_ACCOUNTS = 5;

struct BankAccount {
  int accno;
  float amount;
};

void deposit(BankAccount &acc) {
  cout << "Deposit function called for account "
       << acc.accno << endl;
}
int find_account_idx(int acc_num,
                     const BankAccount accounts[],
                     int size) {
  for (int i = 0; i < size; ++i)
    if (accounts[i].accno == acc_num)
      return i;
  return -1;
}

int main() {
  BankAccount accounts[MAX_ACCOUNTS] = {
      {101}, {102}, {103}};
  int acc_num = 102;
  int acc_idx;

  acc_idx = find_account_idx(acc_num, accounts,
                             MAX_ACCOUNTS);
  if (acc_idx != -1) {
    deposit(accounts[acc_idx]);
  } else {
    cout << "Akun tidak ditemukan." << endl;
  }
  return 0;
}
