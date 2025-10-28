// =====================================================
// Program : SmartRide - Sistem Pemesanan Transportasi
// Bahasa  : Dart (OOP Implementation)
// Fitur   : Inheritance, Encapsulation, Polymorphism, Function
// =====================================================

import 'dart:math';

// ====================
// KELAS ABSTRAK
// ====================

abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);
  double hitungTarif(int jmlPenumpang);
  void tampilInfo() {
    print('---Info Tranportasi---');
    print('ID           : $id');
    print('Nama         : $nama');
    print('Tarif Harga  : Rp${_tarifDasar.toStringAsFixed(2)}');
    print('Kapasitas    : $kapasitas penumpang');
  }
}

// ====================
// KELAS TAKSI
// ====================
class Taksi extends Transportasi {
  double jarak;
  Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);
  @override
  double hitungTarif(int jmlPenumpang) => _tarifDasar * jarak;
  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis       : Taksi');
    print('Jarak       : $jarak km');
  }
}

// ====================
// KELAS BUS
// ====================
class Bus extends Transportasi {
  bool adaWifi;
  Bus(super.id, super.nama, super.tarifDasar, super.kapasitas, this.adaWifi);
  @override
  double hitungTarif(int jmlPenumpang) =>
      (_tarifDasar * jmlPenumpang) + (adaWifi ? 5000 : 0);
  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis     : Bus');
    print('Ada Wifi  : ${adaWifi ? "Ya" : "Tidak"}');
  }
}

// ====================
// KELAS PESAWAT
// ====================
class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.id, super.nama, super.tarifDasar, super.kapasitas, this.kelas);
  @override
  double hitungTarif(int jmlPenumpang) =>
      _tarifDasar * jmlPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis   : Pesawat');
    print('Kelas   : $kelas');
  }
}

// ====================
// KELAS PEMESANAN
// ====================
class Pemesanan {
  String id, nama;
  Transportasi t;
  int jml;
  double total;
  Pemesanan(this.id, this.nama, this.t, this.jml, this.total);
  void cetakStruk() {
    print('\n========STRUK PEMESANAN=========');
    print('Kode Pemesanan     :$id');
    print('Nama Pelanggan     : $nama');
    print('Transportasi       : ${t.nama}');
    print('Jumlah Penumpang   : $jml');
    print('Total Tarif        : Rp${total.toStringAsFixed(2)}');
    print('====================================');
  }
}

// ====================
// FUNGSI GLOBAL
// ====================
Pemesanan buatPemesanan(Transportasi t, String nama, int jml) {
  var id = 'PSN-${Random().nextInt(9000) + 1000}';
  return Pemesanan(id, nama, t, jml, t.hitungTarif(jml));
}

void tampilSemua(List<Pemesanan> d) {
  print('\n====DAFTAR SEMUA PESANAN=====');
  for (var p in d) p.cetakStruk();
  print('Total Pemesanan : ${d.length}');
}

// ====================
// MAIN PROGRAM
// ====================
void main() {
  var t1 = Taksi("T001", "Taksi Kuning", 7000, 4, 15);
  var b1 = Bus("B001", "Taksi Kuning", 7000, 40, true);
  var p1 = Pesawat("P001", "Taksi Kuning", 150000000, 180, "Bisnis");
  t1.tampilInfo();
  print('');
  b1.tampilInfo();
  print('');
  p1.tampilInfo();

  var daftar = [
    buatPemesanan(t1, "William", 2),
    buatPemesanan(b1, "William", 10),
    buatPemesanan(p1, "William", 3),
  ];

  tampilSemua(daftar);
}
