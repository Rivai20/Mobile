// Kelas Abstrak Transportasi
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  // Method abstrak
  double hitungTarif(int jumlahPenumpang);

  // Method untuk menampilkan info
  void tampilInfo();

  // Getter untuk _tarifDasar
  double get tarifDasar => _tarifDasar;
}