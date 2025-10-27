import 'transportasi.dart';

// Kelas Taksi turunan dari Transportasi
class Taksi extends Transportasi {
  double jarak;

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    if (jumlahPenumpang > kapasitas) {
      throw Exception('Jumlah penumpang melebihi kapasitas');
    }
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    print('Taksi - ID: $id, Nama: $nama, Tarif Dasar: $tarifDasar, Kapasitas: $kapasitas, Jarak: $jarak km');
  }
}