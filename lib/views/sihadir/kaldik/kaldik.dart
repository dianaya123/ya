import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academix_polnep/backend/providers/kaldik_providers.dart';

class KaldikMahasiswa extends StatefulWidget {
  const KaldikMahasiswa({super.key});

  @override
  State<KaldikMahasiswa> createState() => _KaldikMahasiswaState();
}

class _KaldikMahasiswaState extends State<KaldikMahasiswa> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    // Fetch kaldiks data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<KaldikProvider>(context, listen: false).fetchKaldiks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 404,
        height: 466,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Periode Akademik',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedValue,
                hint: const Text('Pilih Periode'),
                items: <String>[
                  'Tahun 2023/2024',
                  'Tahun 2024/2025',
                  'Tahun 2024/2025'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              Consumer<KaldikProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.error != null) {
                    return Center(child: Text('Error: ${provider.error}'));
                  } else if (provider.kaldiks.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final kaldiks = provider.kaldiks;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Kegiatan')),
                          DataColumn(label: Text('Waktu Mulai')),
                          DataColumn(label: Text('Waktu Selesai')),
                          DataColumn(label: Text('Keterangan')),
                        ],
                        rows: kaldiks.map((kaldik) {
                          return DataRow(
                            cells: [
                              DataCell(Text(kaldik.kegiatan)),
                              DataCell(Text(kaldik.waktuMulai)),
                              DataCell(Text(kaldik.waktuSelesai)),
                              DataCell(Text(kaldik.keterangan)),
                            ],
                            onSelectChanged: null, // Non-selectable rows
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
