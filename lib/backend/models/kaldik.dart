class Kaldik {
  final int id;
  final int tahun;
  final String semester;
  final String kegiatan;
  final String waktuMulai;
  final String waktuSelesai;
  final String status;
  final String lampiran;
  final String keterangan;
  final String createdAt;
  final String updatedAt;

  Kaldik({
    required this.id,
    required this.tahun,
    required this.semester,
    required this.kegiatan,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.status,
    required this.lampiran,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kaldik.fromJson(Map<String, dynamic> json) {
    return Kaldik(
      id: json['id'],
      tahun: json['tahun'],
      semester: json['semester'],
      kegiatan: json['kegiatan'],
      waktuMulai: json['waktu_mulai'],
      waktuSelesai: json['waktu_selesai'],
      status: json['status'],
      lampiran: json['lampiran'],
      keterangan: json['keterangan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
