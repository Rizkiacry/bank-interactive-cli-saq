#include <iostream>

using namespace std;

struct BankAccount {
    int accno;
};

bool is_account_empty(const BankAccount& acc)
{
    return acc.accno == 0;
}

int find_available_slot(
    const BankAccount accounts[], int size)
{
    for (int i = 0; i < size; ++i) {
        if (is_account_empty(accounts[i])) {
            return i;
        }
    }
    return -1;
}

int main()
{
    BankAccount accounts[]
        = { { 101 }, { 102 }, { 0 }, { 104 } };
    int slot = find_available_slot(accounts, 4);
    cout << "Available slot found at index: "
         << slot << endl;
    return 0;
}
