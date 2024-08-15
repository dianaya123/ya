class LaporanModels {
  final int? id_kelas;
  final String? abjad_kelas;
  final int? smt;
  final int id_mahasiswa;
  final String nim;
  final String nama;
  final String? status;
  final int ketidakhadiran;
  final int? jumlah_kompen;

  LaporanModels({
    this.id_kelas,
    this.abjad_kelas,
    this.smt,
    required this.id_mahasiswa,
    required this.nim,
    required this.nama,
    this.status,
    required this.ketidakhadiran,
    this.jumlah_kompen,
  });

  factory LaporanModels.fromJson(Map<String, dynamic> json) {
    return LaporanModels(
      id_kelas: json['id_kls'],
      abjad_kelas: json['abjad_kls'],
      smt: json['smt'],
      id_mahasiswa: json['id_mhs'],
      nim: json['nim'],
      nama: json['nama'],
      status: json['status'],
      ketidakhadiran: json['ketidakhadiran'],
      jumlah_kompen: json['jumlah_kompen'],
    );
  }
}