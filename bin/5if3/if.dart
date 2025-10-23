// void main() {
//   int nilaiMahasishwa = 80;
//   if (nilaiMahasishwa > 90) {
//     print("A");
//   } else if (nilaiMahasishwa > 80) {
//     print("B");
//   } else if (nilaiMahasishwa > 70) {
//     print("C");
//   } else if (nilaiMahasishwa > 60) {
//     print("D");
//   } else {
//     print("E");
//   }
// }

import 'dart:io';

void main() {
  stdout.write("cek nilai mahasiswa :");
  int nilai = int.parse(stdin.readLineSync()!);
  if (nilai >= 90) {
    print("Lulus dengan nilai A");
  }
}
