import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academix_polnep/views/sirekap/views/revisi/preview.dart'; // Ensure the path is correct

class Dosen1 extends StatefulWidget {
  const Dosen1({super.key});

  @override
  State<Dosen1> createState() => _Dosen1State();
}

class _Dosen1State extends State<Dosen1> {
  final List<List<String>> mahasiswaData = [
    ["1", "320222", "Ahmad", "Alpha", "Edit"],
    ["2", "320223", "Budi", "Sakit", "Edit"],
    ["3", "320224", "Citra", "Izin", "Edit"],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff158AD4),
              Color(0xFF39EADD),
            ],
          ),
        ),
        child: Scaffold(
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(20),
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dosen ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 100),
                        Text(
                          ": Safri Adam",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mata Kuliah",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 58),
                        Text(
                          ": PBL",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Waktu ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 98),
                        Text(
                          ": 08.00 - 13.00",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Semester / Kelas ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          ": 4/C",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                height: 420,
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: mahasiswaData.isEmpty
                    ? Center(
                        child: Text(
                          "Tidak ada pengajuan revisi",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(35.0),
                            1: FixedColumnWidth(70.0),
                            2: FlexColumnWidth(),
                            3: FlexColumnWidth(),
                            4: FixedColumnWidth(60.0),
                          },
                          children: [
                            _buildTableHeader(),
                            ...mahasiswaData
                                .map((data) => _buildTableRow(data))
                                .toList(),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildTableCell("No", backgroundColor: Colors.grey.shade300),
        _buildTableCell("NIM", backgroundColor: Colors.grey.shade300),
        _buildTableCell("Nama", backgroundColor: Colors.grey.shade300),
        _buildTableCell("Status",
            backgroundColor: Colors.grey.shade300, isButton: false),
        _buildTableCell("Detail",
            backgroundColor: Colors.grey.shade300, isButton: false),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.asMap().entries.map((entry) {
        int idx = entry.key;
        String cell = entry.value;

        if (idx == 3) {
          return _buildTableCell(cell, status: cell);
        } else if (idx == 4) {
          return _buildTableCell(
            cell,
            isButton: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuratPreview(
                    pdfUrl:
                        'https://example.com/path-to-your-pdf-file.pdf', // Replace with actual PDF URL
                  ),
                ),
              );
            },
          );
        } else {
          return _buildTableCell(cell, backgroundColor: Colors.white);
        }
      }).toList(),
    );
  }

  Widget _buildTableCell(String text,
      {bool isButton = false,
      String status = "",
      Color? backgroundColor,
      VoidCallback? onTap}) {
    Color textColor = Colors.black;

    if (status == "Alpha") {
      backgroundColor = Colors.red;
      textColor = Colors.black;
    } else if (status == "Izin") {
      backgroundColor = Colors.blue;
      textColor = Colors.white;
    } else if (status == "Sakit") {
      backgroundColor = Colors.yellow;
      textColor = Colors.black;
    } else if (backgroundColor == null) {
      backgroundColor = Colors.grey.shade200;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: isButton
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff158AD4),
                    Color(0xFF39EADD),
                  ],
                )
              : null,
          color: isButton ? null : backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 13, color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
