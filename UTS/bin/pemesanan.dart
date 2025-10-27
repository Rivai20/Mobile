import 'transportasi.dart';

// Kelas Pemesanan
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

  // Method untuk cetak struk
  void cetakStruk() {
    print('--- Struk Pemesanan ---');
    print('ID Pemesanan: $idPemesanan');
    print('Nama Pelanggan: $namaPelanggan');
    print('Jumlah Penumpang: $jumlahPenumpang');
    print('Total Tarif: Rp $totalTarif');
    transportasi.tampilInfo();
    print('-----------------------');
  }
  // Method toMap
  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': {
        'id': transportasi.id,
        'nama': transportasi.nama,
        'tarifDasar': transportasi.tarifDasar,
        'kapasitas': transportasi.kapasitas,
      },
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}