// lib/services/api_services_jadwal.dart
import 'dart:convert';
import 'package:academix_polnep/backend/models/Kelas.dart';
import 'package:http/http.dart' as http;

class ApiServicesJadwal {
  static Future<List<Jadwal>> fetchJadwal() async {
    final response = await http.get(Uri.parse('http://academix.risetmaster.my.id/api/Dashboard-Jadwal')); // Ganti dengan URL yang sesuai

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData); // Logging JSON response untuk debugging
      final List<dynamic> jsonList = jsonData['jadwal_all']; // Pastikan ini sesuai dengan respons JSON Anda
      return jsonList.map((json) => Jadwal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jadwal');
    }
  }
}

class ApiServicesKelas {
  static Future<List<Kelas>> fetchKelas() async {
    final response = await http.get(Uri.parse('http://academix.risetmaster.my.id/api/Dashboard-Kelas')); // Ganti dengan URL API yang sesuai

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("API Response: $jsonData"); // Logging JSON response untuk debugging

      // Asumsikan data kelas ada di dalam key 'kelas_all' di JSON response
      final List<dynamic> jsonList = jsonData['kelas_all'];

      // Konversi dari JSON ke List<Kelas>
      return jsonList.map((json) => Kelas.fromJson(json)).toList();
    } else {
      // Lempar exception jika request gagal
      throw Exception('Failed to load kelas');
    }
  }

  static Future<void> addKelas(Kelas newKelas) async {
    final response = await http.post(
      Uri.parse('http://academix.risetmaster.my.id/api/Dashboard-Kelas'), // Ganti dengan URL API yang sesuai
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id_kls': newKelas.idKls,
        'abjad_kls': newKelas.abjadKls,
        'smt': newKelas.smt,
        'created_at': newKelas.createdAt.toIso8601String(),
        'updated_at': newKelas.updatedAt.toIso8601String(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add kelas');
    }
  }
}
