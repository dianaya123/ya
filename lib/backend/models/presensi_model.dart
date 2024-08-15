class Presensi {
  final String nomorInduk;
  final String nama;     
  final String deskripsi;

  Presensi({required this.nomorInduk, required this.nama, required this.deskripsi});

  factory Presensi.fromJson(Map<String, dynamic> json) {
    return Presensi(
      nomorInduk: json['nomor_induk'],
      nama: json['nama'],          // Ensure this matches the JSON key
      deskripsi: json['deskripsi'] // Ensure this matches the JSON key
    );
  }
}