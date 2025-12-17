#include <iostream>

using namespace std;

int main() {
  int age;
  cout << "Enter your age: ";
  cin >> age;
  cin.ignore(10000, '\n'); // Bersihkan buffer
  string name;
  cout << "Enter your name: ";
  getline(cin, name); // Baca string dengan spasi
  cout << "Name: " << name << ", Age: " << age << endl;
  return 0;
}
