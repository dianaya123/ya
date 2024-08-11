class Kelas {
  final int id;
  final String nama;       // Ensure this field name matches the JSON response
  final String deskripsi;  // Ensure this field name matches the JSON response

  Kelas({required this.id, required this.nama, required this.deskripsi});

  factory Kelas.fromJson(Map<String, dynamic> json) {
    return Kelas(
      id: json['id'],
      nama: json['nama'],          // Ensure this matches the JSON key
      deskripsi: json['deskripsi'] // Ensure this matches the JSON key
    );
  }
}
