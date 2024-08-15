import 'dart:async';
import 'dart:convert';
import 'package:academix_polnep/views/sirekap/views/dashboard/mahasiswa_Page.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Fungsi untuk mengambil data jumlah kehadiran dari API
  Future<int> fetchJumlahKehadiran() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return int.parse(data['jumlah_kehadiran']); // Mengambil data jumlah_kehadiran dari respons
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Fungsi untuk mengambil data sakit dari API
  Future<int> fetchSakit() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['sakit']; // Mengambil data sakit dari respons
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Fungsi untuk mengambil data izin dari API
  Future<int> fetchIzin() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['izin']; // Mengambil data izin dari respons
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Fungsi untuk mengambil data alpha dari API
  Future<int> fetchAlpha() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['alpha']; // Mengambil data alpha dari respons
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Fungsi untuk mengambil data jumlah kompensasi dari API
  Future<int> fetchJumlahKompensasi() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return int.parse(data['jumlah_kompensasi']); // Mengambil data jumlah_kompensasi dari respons
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<List<AnnouncementCard>> fetchAnnouncements() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Dashboard-cicil'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['CicilAll'];
    return data.map((json) {
      return AnnouncementCard( 
        date: json['tgl_cicil'], // Format tanggal perlu disesuaikan sesuai kebutuhan
        topText: json['jenis_kompen'],
        topTutup: 'Tutup', // Atau tentukan nilai ini berdasarkan logika Anda
      );
    }).toList();
  } else {
    throw Exception('Gagal memuat data pengumuman');
  }
  }
}