import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/laporanModel.dart';

class LaporanService {
  final String baseUrl = 'https://academix.risetmaster.my.id/public/api';

  Future<List<LaporanModels>> fetchLaporan(int idKelas) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/laporanmhsdosen/?id_kls=$idKelas'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['data'];
        return jsonResponse.map((laporan) => LaporanModels.fromJson(laporan)).toList();
      } else {
        throw Exception('Failed to load laporan data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchLaporan: $e');
      throw Exception('Failed to load laporan data: $e');
    }
  }

  Future<LaporanModels> fetchLaporanByNim(String nim) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/laporanmhs?nim=$nim'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return LaporanModels.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to load laporan data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchLaporanByNim: $e');
      throw Exception('Failed to load laporan data: $e');
    }
  }
}
