class CicilKompen {
  final String jeniskompen;
  final String tglcicil;
  final int jlhjamkompen;
  final int totaljamkompensasi;

  CicilKompen({
    required this.jeniskompen,
    required this.tglcicil,
    required this.jlhjamkompen,
    required this.totaljamkompensasi,
  });

  factory CicilKompen.fromJson(Map<String, dynamic> json) {
    return CicilKompen(
      jeniskompen: json['jenis_kompen'] ?? '',
      tglcicil: json['tgl_cicil'] ?? '',
      jlhjamkompen: json['jlh_jam_konversi'] != null
          ? int.tryParse(json['jlh_jam_konversi'].toString()) ?? 0
          : 0,
      totaljamkompensasi: json['TotalJamKonversi'] != null
          ? int.tryParse(json['TotalJamKonversi'].toString()) ?? 0
          : 0,
    );
  }
}
