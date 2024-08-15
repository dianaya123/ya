//laporanDosenAdmin.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:academix_polnep/backend/providers/laporanProvider.dart';
import 'dataTableDosenAdmin.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LaporanProvider()),
      ],
      child: const DosenAdmin(),
    ),
  );
}

class DosenAdmin extends StatefulWidget {
  const DosenAdmin({super.key});

  @override
  State<DosenAdmin> createState() => _DosenAdminState();
}

class _DosenAdminState extends State<DosenAdmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LaporanDosenAdmin(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

class LaporanDosenAdmin extends StatefulWidget {
  const LaporanDosenAdmin({super.key});

  @override
  _LaporanDosenAdminState createState() => _LaporanDosenAdminState();
}

class _LaporanDosenAdminState extends State<LaporanDosenAdmin> {
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Si Hadir', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1548AD),
              Color(0xFF39EADD)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 16.0),
              _buildSectionContainer([
                Center(
                  child: Text(
                    'Cek Laporan Absensi',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text("Pilih Kelas"),
                _buildDropdown('Kelas', _generateClassList()),
                const SizedBox(height: 10.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedClass != null) {
                        int idKelas = _getIdKelasFromSelectedClass(selectedClass!);

                        // Memanggil fetchLaporan dengan id_kelas
                        Provider.of<LaporanProvider>(context, listen: false).fetchLaporan(idKelas);

                        // Navigasi ke halaman DataTableDosenAdmin
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataTableDosenAdmin(
                              idKelas: idKelas,
                              selectedClass: selectedClass!,
                            ),
                          ),
                        );
                      } else {
                        // Tampilkan pesan error jika kelas belum dipilih
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Silakan pilih kelas terlebih dahulu')),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ]),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _generateClassList() {
    List<String> classList = [];
    for (int i = 1; i <= 6; i++) {
      for (int j = 0; j < 5; j++) {
        String classSuffix = String.fromCharCode(65 + j);
        classList.add('$i$classSuffix');
      }
    }
    return classList;
  }

  int _getIdKelasFromSelectedClass(String selectedClass) {
    Map<String, int> classMap = {
      '1A': 1,
      '2A': 2,
      '3A': 3,
      '4A': 4,
      '5A': 5,
      '6A': 6,
      '1B': 7,
      '2B': 8,
      '3B': 9,
      '4B': 10,
      '5B': 11,
      '6B': 12,
      '1C': 13,
      '2C': 14,
      '3C': 15,
      '4C': 16,
      '5C': 17,
      '6C': 18,
      '1D': 19,
      '2D': 20,
      '3D': 21,
      '4D': 22,
      '5D': 23,
      '6D': 24,
      '1E': 25,
    };
    return classMap[selectedClass] ?? 0;
  }

  Widget _buildSectionContainer(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
        ),
        style: GoogleFonts.poppins(color: Colors.black),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: GoogleFonts.poppins()),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedClass = value;
          });
        },
      ),
    );
  }
}
