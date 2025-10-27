import 'transportasi.dart';

// Kelas Bus turunan dari Transportasi
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    if (jumlahPenumpang > kapasitas) {
      throw Exception('Jumlah penumpang melebihi kapasitas');
    }
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    print('Bus - ID: $id, Nama: $nama, Tarif Dasar: $tarifDasar, Kapasitas: $kapasitas, Ada WiFi: ${adaWifi ? 'Ya' : 'Tidak'}');
  }
}