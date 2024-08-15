import 'package:intl/intl.dart';

class Jadwal {
  final int idJdwl;
  final int idKls;
  final int idMk;
  final String ruang;
  final String hari;
  final String start;
  final String finish;
  final int jumlahJam;
  final String token;
  final DateTime expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Jadwal({
    required this.idJdwl,
    required this.idKls,
    required this.idMk,
    required this.ruang,
    required this.hari,
    required this.start,
    required this.finish,
    required this.jumlahJam,
    required this.token,
    required this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    // Define the date format
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    DateTime parseDate(String? dateString) {
      if (dateString == null || dateString.isEmpty) {
        return DateTime.now(); // Return current time if null or empty
      }
      try {
        return dateFormat.parse(dateString);
      } catch (e) {
        print('Error parsing date: $dateString'); // Log parsing errors
        return DateTime.now(); // Return current time on error
      }
    }

    return Jadwal(
      idJdwl: json['id_jdwl'] ?? 0,
      idKls: json['id_kls'] ?? 0,
      idMk: json['id_mk'] ?? 0,
      ruang: json['ruang'] ?? '',
      hari: json['hari'] ?? '',
      start: json['start'] ?? '',
      finish: json['finish'] ?? '',
      jumlahJam: json['jumlah_jam'] ?? 0,
      token: json['token'] ?? '',
      expiresAt: parseDate(json['expires_at']),
      createdAt: parseDate(json['created_at']),
      updatedAt: parseDate(json['updated_at']),
    );
  }
}

class Kelas {
  final int idKls;
  final String abjadKls;
  final int smt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Kelas({
    required this.idKls,
    required this.abjadKls,
    required this.smt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) {
    return Kelas(
      idKls: json['id_kls'] ?? 0,
      abjadKls: json['abjad_kls'] ?? '',
      smt: json['smt'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kls': idKls,
      'abjad_kls': abjadKls,
      'smt': smt,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
