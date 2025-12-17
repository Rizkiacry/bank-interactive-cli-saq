#include <iostream>

using namespace std;

struct BankAccount {
    float amount;
};

int main()
{
    BankAccount acc = { 5000.0f };
    cout << "Saldo Baru = " << acc.amount << endl;
    return 0;
}
