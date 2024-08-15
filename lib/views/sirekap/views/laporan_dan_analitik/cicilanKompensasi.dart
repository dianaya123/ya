import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CicilanKompensasi extends StatefulWidget {
  @override
  _CicilanKompensasiState createState() => _CicilanKompensasiState();
}

class _CicilanKompensasiState extends State<CicilanKompensasi> {
  String selectedBulan = '-';
  String selectedKelas = '-';
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
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Laporan-cicil'));

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
              'Tanggal': item['bulan']?.toString() ?? '',
              'Kompen': item['totalKompen']?.toString() ?? '',
              'Cicilan': item['cicilan']?.toString() ?? '',
              'Sisa': item['total_kompen_dikurangi']?.toString() ?? '',
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
    print('Filtering data with:');
    print('Bulan: $selectedBulan');
    print('Kelas: $selectedKelas');
    print('Semester: $selectedSemester');
    print('Search: ${searchController.text}');

    setState(() {
      filteredData = data.where((item) {
        bool matchBulan = selectedBulan == '-' || item['bulan'] == selectedBulan;
        bool matchKelas = selectedKelas == '-' || item['Kelas'] == selectedKelas;
        bool matchSemester = selectedSemester == '-' || item['Semester'] == selectedSemester;
        bool matchSearch = searchController.text.isEmpty ||
            item['Nama']!.toLowerCase().contains(searchController.text.toLowerCase()) ||
            item['NIM']!.toLowerCase().contains(searchController.text.toLowerCase());

        return matchBulan && matchKelas && matchSemester && matchSearch;
      }).toList();

      print('Filtered data:');
      print(filteredData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Cicilan Kompensasi',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           Stack(
          //             alignment: Alignment.center,
          //             children: [
          //               SizedBox(
          //                 width: 100,
          //                 height: 100,
          //                 child: CircularProgressIndicator(
          //                   value: 46 / (46 + 19), //ccc 
          //                   backgroundColor: Colors.red,
          //                   valueColor: AlwaysStoppedAnimation(Colors.green),
          //                   strokeWidth: 25,
          //                 ),
          //               ),
          //               Text(
          //                 '46', //ccc
          //                 style: TextStyle(
          //                   fontSize: 24,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(height: 30),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Row(
          //                 children: [
          //                   CircleAvatar(
          //                     radius: 5,
          //                     backgroundColor: Colors.green,
          //                   ),
          //                   const SizedBox(width: 5),
          //                   Text('Selesai'),
          //                 ],
          //               ),
          //               const SizedBox(width: 10),
          //               Row(
          //                 children: [
          //                   CircleAvatar(
          //                     radius: 5,
          //                     backgroundColor: Colors.red,
          //                   ),
          //                   const SizedBox(width: 5),
          //                   Text('Belum'),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Expanded(
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text('Bulan'),
                      //     const SizedBox(height: 8),
                      //     DropdownButton<String>(
                      //       value: selectedBulan,
                      //       items: <String>['-', 'Januari', 'Februari', 'Maret']
                      //           .map((String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(value),
                      //         );
                      //       }).toList(),
                      //       onChanged: (value) {
                      //         setState(() {
                      //           selectedBulan = value ?? '-';
                      //           filterData();
                      //         });
                      //       },
                      //     ),
                      //   ],
                    //   // ),
                    // ),
                  
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kelas'),
                          const SizedBox(height: 8),
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
                                selectedKelas = value ?? '-';
                                filterData();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                 
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Semester'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: selectedSemester,
                            items: <String>['-', '1', '2', '3', '4', '5', '6']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSemester = value ?? '-';
                                filterData();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 10,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 300, // Adjust this value to your preference
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari nama atau NIM',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (_) => filterData(), // Call filterData on text change
                    ),
                  ),
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
                  DataColumn(label: Text('Tanggal')),
                  DataColumn(label: Text('Kompen')),
                  DataColumn(label: Text('Cicilan')),
                  DataColumn(label: Text('Sisa')),
                ],
                rows: filteredData.map((item) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(item['NO']!)),
                      DataCell(Text(item['Nama']!)),
                      DataCell(Text(item['NIM']!)),
                      DataCell(Text(item['Kelas']!)),
                      DataCell(Text(item['Semester']!)),
                      DataCell(Text(item['Tanggal']!)),
                      DataCell(Text(item['Kompen']!)),
                      DataCell(Text(item['Cicilan']!)),
                      DataCell(Text(item['Sisa']!)),
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