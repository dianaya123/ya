import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:academix_polnep/backend/providers/laporanProvider.dart';
import '../../../backend/providers/userProvider.dart';

class LaporanMahasiswa extends StatefulWidget {
  const LaporanMahasiswa({super.key});

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Laporan Mahasiswa', style: GoogleFonts.poppins()),
          centerTitle: true,
        ),
        body: Consumer<LaporanProvider>(
          builder: (context, laporanProvider, child) {
            if (laporanProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (laporanProvider.errorMessage.isNotEmpty) {
              return Center(child: Text(laporanProvider.errorMessage));
            } else if (laporanProvider.singleLaporan == null) {
              return const Center(child: Text('Tidak ada data laporan'));
            } else {
              final laporan = laporanProvider.singleLaporan!;
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
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text(laporan.nim)),
                        DataCell(Text(laporan.nama)),
                        DataCell(Text(laporan.status ?? 'N/A')),
                        DataCell(Text(laporan.ketidakhadiran.toString())),
                        DataCell(Text(laporan.jumlah_kompen?.toString() ?? 'N/A')),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
