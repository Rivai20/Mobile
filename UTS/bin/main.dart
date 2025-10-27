import 'taksi.dart';
import 'bus.dart';
import 'pesawat.dart';
import 'pemesanan.dart';
import 'utils.dart';

void main() {
  // Buat objek transportasi
  Taksi taksi = Taksi('T001', 'Taksi Bluebird', 5000.0, 4, 10.0); // jarak 10 km
  Bus bus = Bus('B001', 'Bus TransJakarta', 3500.0, 50, true); // ada WiFi
  Pesawat pesawat = Pesawat('P001', 'Garuda Indonesia', 1000000.0, 200, 'Bisnis');

  // Buat list pemesanan
  List<Pemesanan> daftarPemesanan = [];

  // Buat pemesanan
  Pemesanan p1 = buatPemesanan(taksi, 'John Doe', 2);
  Pemesanan p2 = buatPemesanan(bus, 'Jane Smith', 30);
  Pemesanan p3 = buatPemesanan(pesawat, 'Alice Johnson', 1);
  Pemesanan p4 = buatPemesanan(bus, 'Bob Brown', 10); // Pemesanan tambahan

  // Tambahkan ke list
  daftarPemesanan.add(p1);
  daftarPemesanan.add(p2);
  daftarPemesanan.add(p3);
  daftarPemesanan.add(p4);

  // Tampilkan semua
  tampilSemuaPemesanan(daftarPemesanan);
}