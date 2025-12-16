#include <iostream>

using namespace std;

int main() {
  string name;
  cout << "Masukkan nama lengkap: ";
  cin.ignore();
  getline(cin, name);
  cout << "Nama Anda: " << name << endl;
  return 0;
}
