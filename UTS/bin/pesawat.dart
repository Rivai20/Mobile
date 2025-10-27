import 'transportasi.dart';

// Kelas Pesawat turunan dari Transportasi
class Pesawat extends Transportasi {
  String kelas;

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
      : super(id, nama, tarifDasar, kapasitas) {
    if (kelas != 'Ekonomi' && kelas != 'Bisnis') {
      throw Exception('Kelas harus Ekonomi atau Bisnis');
    }
  }

  @override
  double hitungTarif(int jumlahPenumpang) {
    if (jumlahPenumpang > kapasitas) {
      throw Exception('Jumlah penumpang melebihi kapasitas');
    }
    return tarifDasar * jumlahPenumpang * (kelas == 'Bisnis' ? 1.5 : 1.0);
  }

  @override
  void tampilInfo() {
    print('Pesawat - ID: $id, Nama: $nama, Tarif Dasar: $tarifDasar, Kapasitas: $kapasitas, Kelas: $kelas');
  }
}