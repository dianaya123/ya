import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaporanKompensasi extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.yellow,
                        child: Text('SP1'),
                      ),
                      SizedBox(width: 10),
                      Text('2')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange,
                        child: Text('SP2'),
                      ),
                      SizedBox(width: 10),
                      Text('3')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                        child: Text('SP3'),
                      ),
                      SizedBox(width: 10),
                      Text('2')
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: 1000,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tahun'),
                  DropdownButton<String>(
                    value: '2023-2024',
                    items: <String>['2023-2024', '2022-2023', '2021-2022']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kelas'),
                  DropdownButton<String>(
                    value: 'C',
                    items: <String>['A', 'B', 'C'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Angkatan'),
                  DropdownButton<String>(
                    value: '22',
                    items: <String>['21', '22', '23'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Semester'),
                  DropdownButton<String>(
                    value: '4',
                    items: <String>['1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nama atau nim',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
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
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('Siti Sabrina Oktavia')),
                          DataCell(Text('3202216002')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('2')),
                          DataCell(Text('Rizwanda')),
                          DataCell(Text('3202216001')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('3')),
                          DataCell(Text('Yajid')),
                          DataCell(Text('3202216004')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('4')),
                          DataCell(Text('Haykal')),
                          DataCell(Text('3202216006')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('5')),
                          DataCell(Text('Lalu Nicholas')),
                          DataCell(Text('3202216007')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                    ],
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

