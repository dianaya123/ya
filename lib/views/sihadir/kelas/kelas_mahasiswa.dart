// lib/views/jadwal_page.dart
import 'package:academix_polnep/backend/providers/providerKelas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Path ke JadwalProvider

class KelasMahasiswa extends StatefulWidget {
  const KelasMahasiswa({super.key});

  @override
  _KelasMahasiswaState createState() => _KelasMahasiswaState();
}

class _KelasMahasiswaState extends State<KelasMahasiswa> {
  @override
  void initState() {
    super.initState();
    // Fetch jadwals data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JadwalProvider>(context, listen: false).fetchJadwals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal')),
      body: Consumer<JadwalProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          } else if (provider.jadwals.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final jadwals = provider.jadwals;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID Jadwal')),
                  DataColumn(label: Text('Ruang')),
                  DataColumn(label: Text('Hari')),
                  DataColumn(label: Text('Start')),
                  DataColumn(label: Text('Finish')),
                  DataColumn(label: Text('Jumlah Jam')),
                  DataColumn(label: Text('Token')),
                  DataColumn(label: Text('Expires At')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Updated At')),
                ],
                rows: jadwals.map((jadwal) {
                  return DataRow(
                    cells: [
                      DataCell(Text(jadwal.idJdwl.toString())),
                      DataCell(Text(jadwal.ruang)),
                      DataCell(Text(jadwal.hari)),
                      DataCell(Text(jadwal.start)),
                      DataCell(Text(jadwal.finish)),
                      DataCell(Text(jadwal.jumlahJam.toString())),
                      DataCell(Text(jadwal.token)),
                      DataCell(Text(jadwal.expiresAt.toIso8601String())),
                      DataCell(Text(jadwal.createdAt.toIso8601String())),
                      DataCell(Text(jadwal.updatedAt.toIso8601String())),
                    ],
                    onSelectChanged: null, // Non-selectable rows
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
