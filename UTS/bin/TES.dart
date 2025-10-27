import 'dart:io';
import 'dart:math';

class Peserta {
  String nim;
  String nama;

  Peserta(this.nim, this.nama);

  @override
  String toString() => '$nim - $nama';
}

class Kelompok {
  int id;
  List<Peserta> anggota = [];

  Kelompok(this.id);

  void tambahAnggota(Peserta peserta) {
    anggota.add(peserta);
  }

  void tampilkanAnggota() {
    print('Kelompok $id (${anggota.length} orang):');
    for (var p in anggota) {
      print(' - ${p.nim} | ${p.nama}');
    }
    print('');
  }
}

class PembagianKelompok {
  List<Peserta> pesertaList;
  int jumlahKelompok;
  Random random = Random();

  PembagianKelompok(this.pesertaList, this.jumlahKelompok);

  void acakPeserta() {
    pesertaList.shuffle(random);
  }

  List<Kelompok> bagiKelompok() {
    acakPeserta();
    List<Kelompok> kelompokList =
        List.generate(jumlahKelompok, (i) => Kelompok(i + 1));

    for (int i = 0; i < pesertaList.length; i++) {
      int indexKelompok = i % jumlahKelompok;
      kelompokList[indexKelompok].tambahAnggota(pesertaList[i]);
    }
    return kelompokList;
  }
}

Future<List<Peserta>> bacaDataPeserta(String filePath) async {
  try {
    final file = File(filePath);
    final lines = await file.readAsLines();

    // Setiap baris memiliki format: NIM,Nama
    return lines
        .where((line) => line.trim().isNotEmpty)
        .map((line) {
          var parts = line.split(',');
          if (parts.length >= 2) {
            return Peserta(parts[0].trim(), parts[1].trim());
          } else {
            throw FormatException('Format tidak valid pada baris: $line');
          }
        })
        .toList();
  } catch (e) {
    print('❌ Gagal membaca file: $e');
    return [];
  }
}

void main() async {
  const filePath = 'peserta_nim.txt'; // 🔹 nama file data peserta

  // 🔹 Baca data peserta dari file
  List<Peserta> pesertaList = await bacaDataPeserta(filePath);

  if (pesertaList.isEmpty) {
    print('❌ Tidak ada data peserta ditemukan di "$filePath"');
    return;
  }

  // 🔹 Tentukan jumlah kelompok
  int jumlahKelompok = 10;

  // 🔹 Lakukan pembagian acak
  PembagianKelompok pembagian =
      PembagianKelompok(pesertaList, jumlahKelompok);
  List<Kelompok> hasil = pembagian.bagiKelompok();

  // 🔹 Tampilkan hasil pembagian
  for (var k in hasil) {
    k.tampilkanAnggota();
  }
}
