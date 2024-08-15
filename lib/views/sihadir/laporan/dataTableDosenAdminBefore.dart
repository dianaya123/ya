import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:academix_polnep/backend/providers/laporanProvider.dart';
import 'package:academix_polnep/backend/models/laporanModel.dart';

class DataTableDosenAdmin extends StatelessWidget {
  final int idKelas;
  final String selectedClass;

  const DataTableDosenAdmin({
    super.key,
    required this.idKelas,
    required this.selectedClass,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Kelas $selectedClass', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Consumer<LaporanProvider>(
        builder: (context, laporanProvider, child) {
          if (laporanProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (laporanProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(laporanProvider.errorMessage));
          } else {
            List<LaporanModels> filteredLaporans = laporanProvider.laporans.where((laporan) => laporan.id_kelas == idKelas).toList();

            if (filteredLaporans.isEmpty) {
              return Center(child: Text('Tidak ada data untuk kelas $selectedClass'));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('NIM')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Ketidakhadiran')),
                    DataColumn(label: Text('Jumlah Kompen')),
                  ],
                  rows: filteredLaporans.map((laporan) {
                    return DataRow(
                      cells: [
                        DataCell(Text(laporan.nim)),
                        DataCell(Text(laporan.nama)),
                        DataCell(Text(laporan.status ?? 'N/A')),
                        DataCell(Text(laporan.ketidakhadiran.toString())),
                        DataCell(Text(laporan.jumlah_kompen?.toString() ?? 'N/A')),
                      ],
                    );
                  }).toList(),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
