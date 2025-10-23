import 'dart:io';

double tambah(double a, double b) => a + b;
double kurang(double a, double b) => a - b;
double kali(double a, double b) => a * b;
double bagi(double a, double b) => a / b;

void main() {
  print("Masukkan angka pertama: ");
  double a = double.parse(stdin.readLineSync()!);

  print("Masukkan angka kedua: ");
  double b = double.parse(stdin.readLineSync()!);

  print("\nPilih operasi:");
  print("1. Penjumlahan");
  print("2. Pengurangan");
  print("3. Perkalian");
  print("4. Pembagian");
  String pilihan = stdin.readLineSync()!;

  switch (pilihan) {
    case '1':
      print("Hasil = ${tambah(a, b)}");
      break;
    case '2':
      print("Hasil = ${kurang(a, b)}");
      break;
    case '3':
      print("Hasil = ${kali(a, b)}");
      break;
    case '4':
      if (b != 0) {
        print("Hasil = ${bagi(a, b)}");
      } else {
        print("Error: Tidak bisa dibagi nol");
      }
      break;
    default:
      print("Pilihan tidak valid!");
  }
}
