class DataMhs {
  final int no;
  final String nama;
  final String nim;
  final int smt;
  final String kelas;
  final int ketidakhadiran;
  final String sp;

  DataMhs({
    required this.no,
    required this.nama,
    required this.nim,
    required this.smt,
    required this.kelas,
    required this.ketidakhadiran,
    required this.sp,
  });

  factory DataMhs.fromJson(Map<String, dynamic> json) {
    return DataMhs(
      no: json['no'] != null
          ? int.tryParse(json['no'].toString()) ?? 0
          : 0,
      nama: json['nama_mahasiswa'] ?? '',
      nim: json['nim'] ?? '',
      smt: json['smt'] != null ? int.tryParse(json['smt'].toString()) ?? 0 : 0,
      kelas: json['kelas'] ?? '',
      ketidakhadiran: json['ketidakhadiran'] != null
          ? int.tryParse(json['ketidakhadiran'].toString()) ?? 0
          : 0,
      sp: json['surat_peringatan'] ?? '',
    );
  }
}