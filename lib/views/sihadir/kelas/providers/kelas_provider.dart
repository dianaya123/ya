import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:academix_polnep/views/sihadir/kelas/models/kelas_model.dart'; // sesuaikan dengan path model Kelas yang sudah dibuat

Future<List<Kelas>> fetchKelas() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Kelas'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((kelas) => Kelas.fromJson(kelas)).toList();
  } else {
    throw Exception('Failed to load kelas');
  }
}
