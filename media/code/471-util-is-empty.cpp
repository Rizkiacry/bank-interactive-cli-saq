#include <iostream>

using namespace std;

struct BankAccount {
    int accno;
};

bool is_account_empty(const BankAccount& acc)
{
    return acc.accno == 0;
}

int main()
{
    BankAccount acc1 = { 0 };
    BankAccount acc2 = { 101 };
    cout << "Account 1 is empty: " << boolalpha
         << is_account_empty(acc1) << endl;
    cout << "Account 2 is empty: " << boolalpha
         << is_account_empty(acc2) << endl;
    return 0;
}
