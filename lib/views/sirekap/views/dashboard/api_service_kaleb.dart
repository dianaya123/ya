import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Fungsi untuk mengambil data summary dari API
  Future<Map<String, int>> fetchSummary() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-sp'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final summary = data['summary'] as Map<String, dynamic>;

      // Mengonversi data summary menjadi Map<String, int>
      return summary.map((key, value) => MapEntry(key, value as int));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Fungsi untuk mengambil data pengumuman dari API
  Future<List<dynamic>> fetchAnnouncements() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-cicil'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['CicilAll'] as List<dynamic>;
    } else {
      throw Exception('Gagal memuat pengumuman');
    }
  }

  Future<Map<String, dynamic>> fetchKompen() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/Laporan-cicil'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data; // Mengembalikan Map dengan kunci 'LaporanCicil'
    } else {
      throw Exception('Gagal memuat jumlah mahasiswa kompensasi');
    }
  }
}
