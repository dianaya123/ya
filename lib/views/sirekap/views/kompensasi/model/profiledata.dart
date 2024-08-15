class Profiledata {
  final String namamhs;
  // final String jumlahkompen;
  // final int jumlahizin;
  // final int jumlahsakit;
  // final int jumlahalpha;

  Profiledata({
    required this.namamhs,
    // required this.jumlahkompen,
    // required this.jumlahizin,
    // required this.jumlahsakit,
    // required this.jumlahalpha,
  });

  factory Profiledata.fromJson(Map<String, dynamic> json) {
    return Profiledata(
      namamhs: json["nama_mahasiswa"],
      // jumlahkompen: json['jumlah_kompensasi'],
      // jumlahizin: json['jumlah_absensi_izin'],
      // jumlahsakit: json['jumlah_absensi_sakit'],
      // jumlahalpha: json['jumlah_absensi_alpha'],
    );
  }
}
