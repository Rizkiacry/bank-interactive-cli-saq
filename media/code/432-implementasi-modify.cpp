#include <iostream>

using namespace std;

struct BankAccount {
    int accno;
    string name;
    string address;
    char actype;
    float amount;
};

void modify_account(BankAccount& acc)
{
    cout << "\nMengubah No. Akun: " << acc.accno
         << endl;
    cout << "Masukkan nama baru: ";
    cin.ignore();
    getline(cin, acc.name);
    cout << "Masukkan alamat baru: ";
    getline(cin, acc.address);
    cout << "Masukkan tipe akun baru (s/c): ";
    cin >> acc.actype;
    cout << "\nAkun berhasil diubah." << endl;
}

int main()
{
    BankAccount acc = { 1001, "Old Name",
        "Old Address", 'c', 200.0f };
    modify_account(acc);
    cout << "\n--- Updated Account ---" << endl;
    cout << "Name: " << acc.name << endl;
    cout << "Address: " << acc.address << endl;
    cout << "Type: " << acc.actype << endl;
    return 0;
}
