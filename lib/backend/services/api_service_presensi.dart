import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String presensiTokenEndpoint = 'https://academix.risetmaster.my.id/api/Kelas-Validasi-Token';
  static const String jadwalMahasiswaHariIniEndpoint = 'https://academix.risetmaster.my.id/api/Dashboard-Mahasiswa-Jadwal-Harini';

  static Future<Map<String, dynamic>> postPresensi(String nomorInduk, String idJdwl, String token) async {
    final response = await http.post(
      Uri.parse(presensiTokenEndpoint),
      body: jsonEncode(<String, String>{
        'nomor_induk': nomorInduk,
        'id_jdwl': idJdwl,
        'token': token,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 202) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (responseBody['status'] == 200) {
        return responseBody; // Successfully processed
      } else {
        // Return the message from the response body
        throw Exception('API error: ${responseBody['message']}');
      }
    } else {
      // Throw an error if the HTTP status is not 200 or 202
      throw Exception('Failed to post presensi: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> fetchJadwal(String nomorInduk) async {
    final response = await http.get(Uri.parse('$jadwalMahasiswaHariIniEndpoint?nomor_induk=$nomorInduk'));

    if (response.statusCode == 200 || response.statusCode == 202) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load Jadwal');
    }
  }
}
