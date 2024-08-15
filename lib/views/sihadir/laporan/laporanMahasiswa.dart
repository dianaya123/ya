import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:academix_polnep/backend/providers/laporanProvider.dart';
import '../../../backend/providers/userProvider.dart';

class LaporanMahasiswa extends StatefulWidget {
  const LaporanMahasiswa({Key? key}) : super(key: key);

  @override
  _LaporanMahasiswaState createState() => _LaporanMahasiswaState();
}

class _LaporanMahasiswaState extends State<LaporanMahasiswa> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final laporanProvider = Provider.of<LaporanProvider>(context, listen: false);
      laporanProvider.fetchLaporanByNim(userProvider.user?.nomorInduk ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Mahasiswa',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Tambahkan ini jika ingin AppBar transparan
        elevation: 0, // Menghilangkan bayangan pada AppBar
      ),
      backgroundColor: Colors.transparent, // Membuat background layar transparan
      body: Consumer<LaporanProvider>(
        builder: (context, laporanProvider, child) {
          if (laporanProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (laporanProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(laporanProvider.errorMessage));
          } else if (laporanProvider.singleLaporan == null) {
            return Center(child: Text('Tidak ada data laporan'));
          } else {
            final laporan = laporanProvider.singleLaporan!;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _buildSectionContainer([
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'NIM',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Nama',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Ketidakhadiran',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Jumlah Kompen',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text(
                              laporan.nim,
                              style: GoogleFonts.poppins(fontSize: 14),
                            )),
                            DataCell(Text(
                              laporan.nama,
                              style: GoogleFonts.poppins(fontSize: 14),
                            )),
                            DataCell(Text(
                              laporan.status ?? 'N/A',
                              style: GoogleFonts.poppins(fontSize: 14),
                            )),
                            DataCell(Text(
                              laporan.ketidakhadiran.toString(),
                              style: GoogleFonts.poppins(fontSize: 14),
                            )),
                            DataCell(Text(
                              laporan.jumlah_kompen?.toString() ?? 'N/A',
                              style: GoogleFonts.poppins(fontSize: 14),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionContainer(List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), // Ubah warna background menjadi transparan
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
