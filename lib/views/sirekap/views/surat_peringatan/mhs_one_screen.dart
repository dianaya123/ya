import 'package:academix_polnep/views/sirekap/views/surat_peringatan/mhs_detail_acara.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mhs_detail_acara.dart';
import 'mhs_berita_acara.dart';
import 'mhs_two_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: MhsUtamaOneScreen(),
    ),
  );
}

class MhsUtamaOneScreen extends StatefulWidget {
  const MhsUtamaOneScreen({Key? key}) : super(key: key);

  @override
  State<MhsUtamaOneScreen> createState() => _MhsUtamaOneScreenState();
}

class _MhsUtamaOneScreenState extends State<MhsUtamaOneScreen> {
  List<SuratPeringatan> suratPeringatanList = [];

  @override
  void initState() {
    super.initState();
    fetchSuratPeringatan(); // Memanggil fungsi untuk mengambil data dari API
  }

  // Fungsi asynchronous untuk mengambil data SuratPeringatan dari API
  Future<void> fetchSuratPeringatan() async {
    // Melakukan HTTP GET request ke API
    final response =
        await http.get(Uri.parse('https://api.example.com/surat-peringatan'));

    // Jika response berhasil (status code 200), data di-decode dan diubah menjadi list of SuratPeringatan
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        // Mengubah state dengan data yang sudah diambil dari API
        suratPeringatanList =
            data.map((json) => SuratPeringatan.fromJson(json)).toList();
      });
    } else {
      // Jika gagal mengambil data, lemparkan exception
      throw Exception('Failed to load Surat Peringatan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: [
                    Color(0xFF158AD4),
                    Color(0xFF39EADD),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20), // Memberi jarak vertikal 20px

                    // Bagian untuk menampilkan judul dan tombol kembali
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            // GestureDetector untuk mendeteksi tap pada icon
                            onTap: () {
                              Navigator.pop(
                                  context); // Kembali ke layar sebelumnya
                            },
                            child: const Icon(Icons.arrow_back,
                                size: 30, color: Colors.white),
                          ),
                          const Spacer(), // Spacer untuk menyeimbangkan jarak
                          Text(
                            "SURAT\nPERINGATAN",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(
                              flex: 1), // Spacer untuk memberikan ruang
                        ],
                      ),
                    ),
                    const SizedBox(height: 40), // Memberi jarak vertikal 20px

                    // Bagian kotak peringatan
                    Container(
                      padding:
                          const EdgeInsets.all(20), // Padding di dalam kotak
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16), // Margin dari pinggir layar
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Warna latar belakang abu-abu
                        borderRadius:
                            BorderRadius.circular(15), // Sudut melengkung
                      ),
                      child: RichText(
                        // RichText memungkinkan teks dengan gaya berbeda dalam satu widget
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Peringatan\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Dengan ini kami memberitahukan bahwa Anda mendapatkan Surat Peringatan (SP) karena absen tanpa keterangan. Mohon perhatikan kehadiran anda kedepannya.",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left, // Teks rata kiri
                      ),
                    ),
                    const SizedBox(height: 30), // Memberi jarak vertikal 20px

                    // Bagian tabel data surat peringatan
                    Container(
                      // width: width * 0.9, // Lebar kotak 90% dari layar
                      padding:
                          const EdgeInsets.all(15), // Padding di dalam kotak
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15), // Margin dari pinggir layar
                      decoration: const BoxDecoration(
                        color: Colors.white, // Warna latar belakang putih
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // DataTable untuk menampilkan data dalam bentuk tabel
                          DataTable(
                            columns: const [
                              DataColumn(
                                label: Expanded(
                                  flex: 2,
                                  child: Text(
                                    'SURAT\nPERINGATAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  flex: 2,
                                  child: Text(
                                    'TANGGAL\nSURAT',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  flex: 0,
                                  child: Text(
                                    'STATUS\nPERINGATAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            // Menampilkan setiap surat dalam tabel
                            rows: suratPeringatanList.map((surat) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                      Center(child: Text(surat.jenisSurat))),
                                  DataCell(
                                      Center(child: Text(surat.tanggalSurat))),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        surat.status,
                                        style: TextStyle(
                                          color: surat.status == 'Selesai'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      // Jika statusnya SP2, navigasi ke layar MhsTwoScreen
                                      if (surat.status == 'SP2') {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MhsTwoScreen(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              );
                            }).toList(), // Mengubah list SuratPeringatan menjadi list DataRow
                          ),
                          const SizedBox(
                              height: 160), // Memberi jarak vertikal 24px

                          // Kotak keterangan tambahan
                          Container(
                            padding: const EdgeInsets.all(
                                30), // Padding di dalam kotak
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[200], // Warna latar belakang abu-abu
                              borderRadius:
                                  BorderRadius.circular(15), // Sudut melengkung
                            ),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Keterangan\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Anda tidak diwajibkan untuk mengunggah surat pernyataan bermaterai sebagai bukti agar status peringatan anda dapat terselesaikan.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign:
                                  TextAlign.justify, // Teks rata kiri-kanan
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Memberi jarak vertikal 20px

                          // Tombol untuk melihat detail surat peringatan
                          SizedBox(
                            width: width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigasi ke layar detail surat peringatan
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MhsDetailSurat(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Warna tombol biru
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Sudut melengkung
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15), // Padding dalam tombol
                              ),
                              child: const Text(
                                "Detail Surat Peringatan",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Memberi jarak vertikal 20px

                          // Tombol untuk melihat berita acara
                          SizedBox(
                            width: width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigasi ke layar berita acara
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MhsBeritaAcara(
                                      title: 'Berita Acara',
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Warna tombol biru
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Sudut melengkung
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15), // Padding dalam tombol
                              ),
                              child: const Text(
                                "Berita Acara",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Memberi jarak vertikal 20px
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SuratPeringatan {
  final String jenisSurat;
  final String tanggalSurat;
  final String status;

  SuratPeringatan(
      {required this.jenisSurat,
      required this.tanggalSurat,
      required this.status});

  factory SuratPeringatan.fromJson(Map<String, dynamic> json) {
    return SuratPeringatan(
      jenisSurat: json['jenisSurat'],
      tanggalSurat: json['tanggalSurat'],
      status: json['status'],
    );
  }
}
