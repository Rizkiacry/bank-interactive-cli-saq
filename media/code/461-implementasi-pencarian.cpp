#include <iostream>

using namespace std;

struct BankAccount {
  int accno;
};

int find_account_idx(int acc_num,
                     const BankAccount accounts[],
                     int size) {
  for (int i = 0; i < size; ++i) {
    if (accounts[i].accno == acc_num) {
      return i;
    }
  }
  return -1;
}

int main() {
  BankAccount accounts[] = {{1}, {2}, {3}};
  int idx = find_account_idx(2, accounts, 3);
  cout << "Index found: " << idx << endl;
  return 0;
}
