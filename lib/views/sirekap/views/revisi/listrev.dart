import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academix_polnep/views/sirekap/views/revisi/revisiNav.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
          child: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF00A8E8), Color(0xFF00C853)],
          ),
        ),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Allow horizontal scrolling
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DataTable(
                  columnSpacing: 10, // Adjust column spacing to fit content
                  columns: [
                    DataColumn(
                        label: Text("No.",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Tanggal Presensi",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Mata Kuliah",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Status",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    _buildDataRow(context, 1, "28 Agustus 2024",
                        "Grafika Komputer", "Revisi", Colors.grey,
                        isButtonEnabled: true),
                    _buildDataRow(context, 2, "18 Agustus 2024", "Desain Web",
                        "Dalam Proses", Colors.blue,
                        isButtonEnabled: false),
                    _buildDataRow(context, 3, "8 Agustus 2024",
                        "Pemrograman Mobile", "Diterima", Colors.green,
                        isButtonEnabled: false),
                    _buildDataRow(context, 4, "1 Agustus 2024",
                        "Pemrograman Mobile", "Ditolak", Colors.red,
                        isButtonEnabled: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, int no, String tanggal,
      String mataKuliah, String status, Color statusColor,
      {bool isButtonEnabled = true}) {
    return DataRow(cells: [
      DataCell(Text(no.toString(), style: GoogleFonts.poppins())),
      DataCell(Text(tanggal, style: GoogleFonts.poppins())),
      DataCell(Text(mataKuliah, style: GoogleFonts.poppins())),
      DataCell(isButtonEnabled
          ? ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const RevisiPages()), // Navigate to RevisiPages
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: statusColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                status,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                status,
                style: GoogleFonts.poppins(
                    color: statusColor, fontWeight: FontWeight.bold),
              ),
            )),
    ]);
  }
}
