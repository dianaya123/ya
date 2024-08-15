import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'models/user.dart';
import 'models/detail.dart'; //

class UserService {
  final String baseUrl;
  UserService(this.baseUrl);

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
  }// Ganti dengan URL API Anda

  // Fungsi untuk mengambil data users dari API
  Future<List<DataMhs>> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-sp'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Pastikan Anda mengakses key "data" yang berisi List
      final List<dynamic> data = jsonResponse['data'];

      // Konversi setiap item dalam List ke DataMhs
      return data.map((item) => DataMhs.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// class DetailService {
//   final String baseUrl;

//   DetailService(this.baseUrl);

//   // Fetch detail data
//   Future<DetailData> fetchDetail(String nim) async {
//     final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Detail-sp/$nim'));

//     if (response.statusCode == 200) {
//       return json.decode(response.body); // Return the decoded JSON directly
//     } else {
//       throw Exception('Failed to load details');
//     }
//   }
// }