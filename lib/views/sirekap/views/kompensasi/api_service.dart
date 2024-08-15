import 'dart:convert';
import 'package:academix_polnep/views/sirekap/views/kompensasi/model/profiledata.dart';
import 'package:academix_polnep/views/sirekap/views/kompensasi/model/tablecicil.dart';
import 'package:academix_polnep/views/sirekap/views/kompensasi/model/tabledatakompen.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<CicilKompen>> fetchdatacicilan() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Dashboard-cicil"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData['status'] == 200) {
        List<dynamic> cicilAll = jsonData['CicilAll'];
        return cicilAll.map((item) => CicilKompen.fromJson(item)).toList();
      } else {
        throw Exception('failed to load items');
      }
    } else {
      throw Exception('failed to load items');
    }
  }

  static Future<int> fetchTotalJamKompensasi() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Dashboard-cicil"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['status'] == 200) {
        return int.parse(jsonData['TotalJamKonversi']);
      } else {
        throw Exception('Failed to load total jam data');
      }
    } else {
      throw Exception('Failed to fetch total jam kompensasi');
    }
  }

  static Future<List<Kompendata>> fetchdatakompen() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Dashboard-Kompen"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData['status'] == 200) {
        List<dynamic> kompendata = jsonData['data'];
        return kompendata.map((item) => Kompendata.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<int> fetchjamkompen() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Dashboard-Kompen"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['status'] == 200) {
        return int.tryParse(jsonData['jumlah_kompen']?.toString() ?? '0') ?? 0;
      } else {
        throw Exception('Failed to load total jam data');
      }
    } else {
      throw Exception('Failed to fetch total jam kompensasi');
    }
  }

  static Future<int> fetchtotaljamkompen() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Dashboard-Kompen"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['status'] == 200) {
        return int.tryParse(jsonData['Total Kompen']?.toString() ?? '0') ?? 0;
      } else {
        throw Exception('Failed to load total jam data');
      }
    } else {
      throw Exception('Failed to fetch total jam kompensasi');
    }
  }

  static Future<Profiledata> fetchnamamhs() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Profil-Kompen/1"));
    print(response);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData['status'] == 200) {
        // Assuming 'profil_mahasiswa' is a single object, not a list
        final dynamic profileData = jsonData['profil_mahasiswa'];
        return Profiledata.fromJson(profileData);
      } else {
        throw Exception('Failed to load items');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<String> fetchpresensi() async {
    final response = await http
        .get(Uri.parse("http://192.168.100.169:8000/api/Profil-Kompen/1"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['status'] == 200) {
        return jsonData['jumlah_kompensasi'];
      } else {
        throw Exception('Failed to load total jam data');
      }
    } else {
      throw Exception('Failed to fetch total jam kompensasi');
    }
  }
}
