import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LaporanKompensasi extends StatefulWidget {
  @override
  _LaporanKompensasiState createState() => _LaporanKompensasiState();
}

class _LaporanKompensasiState extends State<LaporanKompensasi> {
  String selectedTahun = '-';
  String selectedKelas = '-';
  String selectedAngkatan = '-';
  String selectedSemester = '-';
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> data = [];
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Panggil fetchData di sini
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/Laporan-cicil'));

      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); // Log respons body
        final Map<String, dynamic> jsonData = json.decode(response.body);

        if (jsonData.containsKey('LaporanCicil')) {
          final List<dynamic> items = jsonData['LaporanCicil'];

          List<Map<String, String>> fetchedData = items.map((item) {
            return {
              'NO': item['id_mahasiswa']?.toString() ?? '',
              'Nama': item['Nama_Mahasiswa']?.toString() ?? '',
              'NIM': item['NIM']?.toString() ?? '',
              'Kelas': item['Kelas']?.toString() ?? '',
              'Semester': item['Semester']?.toString() ?? '',
              'Angkatan': item['angkatan']?.toString() ?? '',
              'Tahun': item['Tahun']?.toString() ?? '',
              'Total': item['totalKompen']?.toString() ?? '',
            };
          }).toList();

          setState(() {
            data = fetchedData;
            filteredData = fetchedData;
          });
        } else {
          throw Exception('Key "LaporanCicil" not found in response');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  void filterData() {
    setState(() {
      filteredData = data.where((item) {
        bool matchTahun =
            selectedTahun == '-' || item['Tahun'] == selectedTahun;
        bool matchKelas =
            selectedKelas == '-' || item['Kelas'] == selectedKelas;
        bool matchAngkatan =
            selectedAngkatan == '-' || item['Angkatan'] == selectedAngkatan;
        bool matchSemester =
            selectedSemester == '-' || item['Semester'] == selectedSemester;
        bool matchSearch = searchController.text.isEmpty ||
            item['Nama']!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            item['NIM']!
                .toLowerCase()
                .contains(searchController.text.toLowerCase());

        return matchTahun &&
            matchKelas &&
            matchAngkatan &&
            matchSemester &&
            matchSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Laporan Kompensasi',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tahun'),
                  DropdownButton<String>(
                    value: selectedTahun,
                    items: <String>['-', '2023', '2022', '2021']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTahun = value!;
                        filterData();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kelas'),
                  DropdownButton<String>(
                    value: selectedKelas,
                    items: <String>['-', 'A', 'B', 'C', 'D', 'E']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedKelas = value!;
                        filterData();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Angkatan'),
                  DropdownButton<String>(
                    value: selectedAngkatan,
                    items: <String>['-', '21', '22', '23'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedAngkatan = value!;
                        filterData();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Semester'),
                  DropdownButton<String>(
                    value: selectedSemester,
                    items:
                        <String>['-', '1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSemester = value!;
                        filterData();
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari nama atau nim',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    filterData();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('NO')),
                      DataColumn(label: Text('Nama Mahasiswa')),
                      DataColumn(label: Text('NIM')),
                      DataColumn(label: Text('Kelas')),
                      DataColumn(label: Text('Semester')),
                      DataColumn(label: Text('Angkatan')),
                      DataColumn(label: Text('Tahun')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: filteredData.map((item) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(item['NO']!)),
                          DataCell(Text(item['Nama']!)),
                          DataCell(Text(item['NIM']!)),
                          DataCell(Text(item['Kelas']!)),
                          DataCell(Text(item['Semester']!)),
                          DataCell(Text(item['Angkatan']!)),
                          DataCell(Text(item['Tahun']!)),
                          DataCell(Text(item['Total']!)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
