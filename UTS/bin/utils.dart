import 'dart:math';
import 'transportasi.dart';
import 'pemesanan.dart';

// Fungsi Global buatPemesanan
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  double total = t.hitungTarif(jumlahPenumpang);
  // Generate ID sederhana menggunakan random
  String idPemesanan = 'PES-${Random().nextInt(10000)}';
  return Pemesanan(idPemesanan, nama, t, jumlahPenumpang, total);
}

// Fungsi Global tampilSemuaPemesanan
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print('--- Daftar Semua Pemesanan ---');
  for (var p in daftar) {
    p.cetakStruk();
  }
  print('-----------------------------');
}