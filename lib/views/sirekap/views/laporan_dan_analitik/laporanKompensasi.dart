import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  List<Map<String, String>> dataMahasiswa = [
    {
      'NO': '1',
      'Nama': 'Siti Sabrina Oktavia',
      'NIM': '3202216002',
      'Kelas': 'A',
      'Semester': '4',
      'Angkatan': '22',
      'Tahun': '2022-2023',
      'Total': '40',
    },
    {
      'NO': '2',
      'Nama': 'Rizwanda',
      'NIM': '3202216001',
      'Kelas': 'C',
      'Semester': '2',
      'Angkatan': '22',
      'Tahun': '2023-2024',
      'Total': '40',
    },
    {
      'NO': '3',
      'Nama': 'Yajid',
      'NIM': '3202216004',
      'Kelas': 'C',
      'Semester': '4',
      'Angkatan': '22',
      'Tahun': '2023-2024',
      'Total': '40',
    },
    {
      'NO': '4',
      'Nama': 'Haykal',
      'NIM': '3202216006',
      'Kelas': 'C',
      'Semester': '4',
      'Angkatan': '22',
      'Tahun': '2023-2024',
      'Total': '40',
    },
    {
      'NO': '5',
      'Nama': 'Lalu Nicholas',
      'NIM': '3202216007',
      'Kelas': 'C',
      'Semester': '4',
      'Angkatan': '22',
      'Tahun': '2023-2024',
      'Total': '40',
    },
  ];

  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    // Tampilkan semua data terlebih dahulu
    filteredData = dataMahasiswa;
  }

  void filterData() {
    setState(() {
      filteredData = dataMahasiswa.where((data) {
        bool matchTahun = selectedTahun == '-' || data['Tahun'] == selectedTahun;
        bool matchKelas = selectedKelas == '-' || data['Kelas'] == selectedKelas;
        bool matchAngkatan = selectedAngkatan == '-' || data['Angkatan'] == selectedAngkatan;
        bool matchSemester = selectedSemester == '-' || data['Semester'] == selectedSemester;
        bool matchSearch = searchController.text.isEmpty || data['Nama']!.toLowerCase().contains(searchController.text.toLowerCase()) || data['NIM']!.toLowerCase().contains(searchController.text.toLowerCase());

        return matchTahun && matchKelas && matchAngkatan && matchSemester && matchSearch;
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
                    value: selectedTahun,
                    items: <String>['-', '2023-2024', '2022-2023', '2021-2022']
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
                    items: <String>['-', 'A', 'B', 'C'].map((String value) {
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
                    items: <String>['-', '1', '2', '3', '4'].map((String value) {
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
                    rows: filteredData.map((data) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(data['NO']!)),
                          DataCell(Text(data['Nama']!)),
                          DataCell(Text(data['NIM']!)),
                          DataCell(Text(data['Kelas']!)),
                          DataCell(Text(data['Semester']!)),
                          DataCell(Text(data['Angkatan']!)),
                          DataCell(Text(data['Tahun']!)),
                          DataCell(Text(data['Total']!)),
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
