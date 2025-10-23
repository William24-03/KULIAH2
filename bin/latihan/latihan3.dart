import 'dart:io';

void main() {
  int panjang = int.parse(stdin.readLineSync()!);
  stdout.write("Masukan Panjang:");
  int lebar = int.parse(stdin.readLineSync()!);
  stdout.write("Masukan Levar:");
  print(panjang * lebar);
}
