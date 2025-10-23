// =====================================================
// Program : SmartRide - Sistem Pemesanan Transportasi
// Bahasa  : Dart (OOP Implementation)
// Fitur   : Inheritance, Encapsulation, Polymorphism
// =====================================================

import 'dart:math';

// ====================
// KELAS ABSTRAK
// ====================
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar; // getter (encapsulation)

  // Method abstrak
  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print('--- Info Transportasi ---');
    print('ID           : $id');
    print('Nama         : $nama');
    print('Tarif Dasar  : Rp${_tarifDasar.toStringAsFixed(2)}');
    print('Kapasitas    : $kapasitas penumpang');
  }
}

// ====================
// KELAS TAKSI
// ====================
class Taksi extends Transportasi {
  double jarak; // dalam kilometer

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis        : Taksi');
    print('Jarak        : $jarak km');
  }
}

// ====================
// KELAS BUS
// ====================
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis        : Bus');
    print('Ada Wifi     : ${adaWifi ? "Ya" : "Tidak"}');
  }
}

// ====================
// KELAS PESAWAT
// ====================
class Pesawat extends Transportasi {
  String kelas; // "Ekonomi" atau "Bisnis"

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis        : Pesawat');
    print('Kelas        : $kelas');
  }
}

// ====================
// KELAS PEMESANAN
// ====================
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.transportasi,
    this.jumlahPenumpang,
    this.totalTarif,
  );

  void cetakStruk() {
    print('\n========= STRUK PEMESANAN =========');
    print('Kode Pemesanan : $idPemesanan');
    print('Nama Pelanggan : $namaPelanggan');
    print('Transportasi   : ${transportasi.nama}');
    print('Jumlah Penumpang: $jumlahPenumpang');
    print('Total Tarif    : Rp${totalTarif.toStringAsFixed(2)}');
    print('==================================');
  }

  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': transportasi.nama,
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}

// ====================
// FUNGSI GLOBAL
// ====================
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  var id = 'PSN-${Random().nextInt(10000)}';
  double total = t.hitungTarif(jumlahPenumpang);
  return Pemesanan(id, nama, t, jumlahPenumpang, total);
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print('\n===== DAFTAR SEMUA PEMESANAN =====');
  for (var p in daftar) {
    p.cetakStruk();
  }
  print('Total Pemesanan: ${daftar.length}');
}

// ====================
// MAIN PROGRAM
// ====================
void main() {
  // Membuat beberapa objek transportasi
  Taksi taksi1 = Taksi("T001", "Taksi BlueBird", 7000, 4, 15);
  Bus bus1 = Bus("B001", "Bus TransJakarta", 5000, 40, true);
  Pesawat pesawat1 = Pesawat(
    "P001",
    "Garuda Indonesia",
    1500000,
    180,
    "Bisnis",
  );

  // Menampilkan info transportasi
  taksi1.tampilInfo();
  print('');
  bus1.tampilInfo();
  print('');
  pesawat1.tampilInfo();

  // Membuat beberapa pemesanan
  List<Pemesanan> daftarPemesanan = [];

  daftarPemesanan.add(buatPemesanan(taksi1, "Andi", 2));
  daftarPemesanan.add(buatPemesanan(bus1, "Budi", 10));
  daftarPemesanan.add(buatPemesanan(pesawat1, "Citra", 3));

  // Menampilkan semua pemesanan
  tampilSemuaPemesanan(daftarPemesanan);
}
