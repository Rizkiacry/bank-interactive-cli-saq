#include <iostream>

using namespace std;

struct BankAccount {
  int accno;
  string name;
};

int find_account_idx(int acc_num,
                     const BankAccount accounts[],
                     int size) {
  for (int i = 0; i < size; ++i) {
    if (accounts[i].accno == acc_num) {
      return i; // Ditemukan pada indeks i
    }
  }
  return -1; // Tidak ditemukan
}

int main() {
  BankAccount accounts[] = {{101, "Alice"},
                            {102, "Bob"},
                            {103, "Charlie"}};
  int index = find_account_idx(102, accounts, 3);
  if (index != -1) {
    cout << "Account found at index: " << index
         << endl;
  } else {
    cout << "Account not found." << endl;
  }
  return 0;
}
