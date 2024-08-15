class Kompendata {
  final String mataKuliah;
  final int jamKompen;
  final int totaljamkompen;
  final String tanggal;

  Kompendata(
      {required this.mataKuliah,
      required this.jamKompen,
      required this.tanggal,
      required this.totaljamkompen});

  factory Kompendata.fromJson(Map<String, dynamic> json) {
    return Kompendata(
      mataKuliah: json['Mata kuliah'] ?? '',
      jamKompen: json['jumlah_kompen'] != null
          ? int.tryParse(json['jumlah_kompen'].toString()) ?? 0
          : 0,
      tanggal: json['tgl_alpha'] ?? '',
      totaljamkompen: json['Total Kompen'] != null
          ? int.tryParse(json['Total Kompen'].toString()) ?? 0
          : 0,
    );
  }
}
