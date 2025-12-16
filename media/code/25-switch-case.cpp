#include <iostream>

using namespace std;

int main() {
  int choice;
  cout << "Enter a choice (1 or 2): ";
  cin >> choice;

  switch (choice) {
  case 1:
    cout << "You chose 1." << endl;
    break;
  case 2:
    cout << "You chose 2." << endl;
    break;
  default:
    cout << "Pilihan tidak valid." << endl;
  }
  return 0;
}
