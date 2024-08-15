import 'package:academix_polnep/views/sirekap/views/revisi/preview.dart';
import 'package:flutter/material.dart';

class Dosen extends StatefulWidget {
  const Dosen({super.key});

  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
  String selectedKelas = 'Kelas';
  String selectedSemester = 'Semester';

  // List of data to be displayed in the table
  List<Map<String, String>> data = [
    {
      'nim': '3202216001',
      'nama': 'John Doe',
      'tanggal': '10 Agustus 2024',
    },
    {
      'nim': '3202216002',
      'nama': 'Jane Smith',
      'tanggal': '11 Agustus 2024',
    },
    // Tambahkan data lain di sini
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff158AD4), Color(0xFF39EADD)],
            ),
          ),
          child: Column(
            children: [
              // Custom AppBar Container
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Dropdown Menus
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedKelas,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedKelas = newValue!;
                          });
                        },
                        items: <String>['Kelas', 'A', 'B', 'C', 'D', 'E']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: SizedBox(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedSemester,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSemester = newValue!;
                          });
                        },
                        items: <String>[
                          'Semester',
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Data Table or Empty Message
              Container(
                height: 400, // Ubah sesuai kebutuhan
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: data.isEmpty
                    ? Center(
                        child: Text(
                          'Tidak ada pengajuan presensi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 12.0,
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'NIM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nama',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tanggal Presensi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Detail',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              data.length,
                              (index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    data[index]['nim'] ?? '',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  DataCell(Text(
                                    data[index]['nama'] ?? '',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  DataCell(Text(
                                    data[index]['tanggal'] ?? '',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  DataCell(
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff158AD4),
                                            Color(0xFF39EADD),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        width: 50,
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Preview()));
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
