class DetailData {
  final String nim;
  final String nama;
  final int totalKetidakhadiran;
  final String nomorSurat;
  final List<SuratPeringatan> riwayatSurat;

  DetailData({
    required this.nim,
    required this.nama,
    required this.totalKetidakhadiran,
    required this.nomorSurat,
    required this.riwayatSurat,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    var list = json['riwayat_surat'] as List;
    List<SuratPeringatan> riwayatSuratList = list.map((i) => SuratPeringatan.fromJson(i)).toList();

    return DetailData(
      nim: json['nim'] ?? '',
      nama: json['nama'] ?? '',
      totalKetidakhadiran: json['total_ketidakhadiran'] != null
          ? int.tryParse(json['total_ketidakhadiran'].toString()) ?? 0
          : 0,
      nomorSurat: json['nomor_surat'] ?? '',
      riwayatSurat: riwayatSuratList,
    );
  }
}

class SuratPeringatan {
  final String sp;
  final String semesterKelas;
  final String tanggalPengajuan;
  final String suratPernyataan;
  final String statusPeringatan;

  SuratPeringatan({
    required this.sp,
    required this.semesterKelas,
    required this.tanggalPengajuan,
    required this.suratPernyataan,
    required this.statusPeringatan,
  });

  factory SuratPeringatan.fromJson(Map<String, dynamic> json) {
    return SuratPeringatan(
      sp: json['sp'] ?? '',
      semesterKelas: json['semester_kelas'] ?? '',
      tanggalPengajuan: json['tanggal_pengajuan'] ?? '',
      suratPernyataan: json['surat_pernyataan'] ?? '',
      statusPeringatan: json['status_peringatan'] ?? '',
    );
  }
}