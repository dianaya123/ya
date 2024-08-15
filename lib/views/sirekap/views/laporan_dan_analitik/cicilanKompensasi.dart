import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CicilanKompensasi extends StatelessWidget {
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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: 46 / (46 + 19),
                            backgroundColor: Colors.red,
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                            strokeWidth: 25,
                          ),
                        ),
                        Text(
                          '46',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            const SizedBox(width: 5),
                            Text('Selesai'),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text('Belum'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bulan'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: 'Januari',
                            items: <String>['Januari', 'Februari', 'Maret']
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
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kelas'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: 'C',
                            items: <String>['A', 'B', 'C', 'D', 'E']
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
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Semester'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: '4',
                            items: <String>['1', '2', '3', '4', '5', '6']
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 300, // Adjust this value to your preference
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari nama atau nim',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
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
                      DataColumn(label: Text('Angkatan')),
                      DataColumn(label: Text('Bulan')),
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
