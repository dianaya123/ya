import 'dart:convert';
import 'package:academix_polnep/backend/models/kaldik.dart';
import 'package:http/http.dart' as http;

class KaldikService {
  final String apiUrl = 'http://academix.risetmaster.my.id/api/Dashboard-Kaldik';

  Future<List<Kaldik>> fetchKaldiks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> kaldikList = data['all_kaldik'];
      return kaldikList.map((json) => Kaldik.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load kaldiks');
    }
  }
}
