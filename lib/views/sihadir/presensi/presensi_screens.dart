import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:academix_polnep/views/sihadir/presensi/pengajuan_izin.dart';
import 'package:academix_polnep/backend/services/api_service_presensi.dart'; // Import your API service

class PresensiScreens extends StatefulWidget {
  const PresensiScreens({super.key});

  @override
  State<PresensiScreens> createState() => _PresensiScreensState();
}

class _PresensiScreensState extends State<PresensiScreens> {
  final TextEditingController _tokenController = TextEditingController();
  bool _isTokenValid = false;
  final List<DataRow> _dataRows = [];

  Future<void> _validateToken() async {
    final token = _tokenController.text.trim();
    const nomorInduk = '3202216112'; // Hardcoded, will be handled by authentication
    const idJdwl = '6'; // This could be dynamic based on your app logic
    if (token.isEmpty) {
      _showAlert('Token tidak boleh kosong!');
      return;
    }
    try {
      final response = await ApiService.postPresensi(nomorInduk, idJdwl, token);
      final responseofJadwal = await ApiService.fetchJadwal(nomorInduk);

      setState(() {
        _isTokenValid = response['message'] == "Token Valid";
        if (_isTokenValid) {
          _updateTableData(responseofJadwal['jadwalHariIni'][0]);
        } else {
          _showAlert('Token tidak valid atau sudah kedaluwarsa!');
        }
      });
    } catch (e) {
      _showAlert('Terjadi kesalahan: $e');
    }
  }

  void _updateTableData(Map<String, dynamic>? jadwalData) {
    if (jadwalData == null) return;

    final String className = jadwalData['Mata Kuliah'];
    final String waktu = jadwalData['Waktu'];
    final String ruang = jadwalData['ruang'];

    final isTokenAlreadyUsed = _dataRows.any(
      (row) => (row.cells[1].child as Text).data == className,
    );

    if (isTokenAlreadyUsed) {
      _showAlert('Data sudah ada!');
      return;
    }

    if (_dataRows.length >= 6) {
      _showAlert('Jumlah data sudah mencapai batas maksimum!');
      return;
    }

    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    setState(() {
      _dataRows.add(
        DataRow(
          cells: [
            DataCell(Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Hadir',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )),
            DataCell(Text(
              className,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF424242),
              ),
            )),
          ],
          onSelectChanged: (selected) {
            if (selected == true) {
              _showDetailsDialog({
                'className': className,
                'waktu': waktu,
                'ruang': ruang,
              }, currentTime);
            }
          },
        ),
      );
    });
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Peringatan', style: GoogleFonts.poppins()),
        content: Text(message, style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  void _showDetailsDialog(Map<String, String> tokenInfo, String currentTime) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detail Presensi', style: GoogleFonts.poppins()),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mata Kuliah: ${tokenInfo['Mata Kuliah']}', style: GoogleFonts.poppins(fontSize: 16)),
            Text('Waktu Kuliah: ${tokenInfo['Waktu']}', style: GoogleFonts.poppins(fontSize: 14)),
            Text('Waktu Presensi: $currentTime', style: GoogleFonts.poppins(fontSize: 14)),
            Text('Ruangan: ${tokenInfo['ruang']}', style: GoogleFonts.poppins(fontSize: 14)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildShadowedContainer(screenWidth, screenHeight),
          _buildTokenInputWithLabel(),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAbsenButton(),
              SizedBox(width: screenWidth * 0.02), // Padding between buttons
              _buildAjukanIzinButton(),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildTextWithPadding("Tabel Presensi Mingguan Anda", EdgeInsets.zero),
          _buildAbsensiTable(),
        ],
      ),
    );
  }

  Widget _buildShadowedContainer(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidth * 0.03,
        0,
        screenWidth * 0.05,
        screenHeight * 0.04,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4)
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: screenWidth * 0.8,
          height: screenHeight * 0.2,
          color: const Color.fromARGB(255, 246, 246, 246),
          child: _isTokenValid
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Class Name: ${_dataRows.isNotEmpty ? (_dataRows.last.cells[1].child as Text).data : 'N/A'}', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PengajuanIzin())),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color(0xFF158AD4),
                            Color(0xFF39EADD)
                          ]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text('Kelas tidak ditemukan!', style: GoogleFonts.poppins(fontSize: 18)),
                ),
        ),
      ),
    );
  }

  Widget _buildTextWithPadding(String text, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
    );
  }

  Widget _buildTokenInputWithLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('Token Kelas', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white)),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color(0x40000000), offset: Offset(0, 2), blurRadius: 2)
            ],
          ),
          child: TextField(
            controller: _tokenController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Masukkan token',
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(5),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAbsenButton() {
    return ElevatedButton(
      onPressed: _validateToken,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: const Color(0xFF39EADD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Absen',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget _buildAjukanIzinButton() {
    return ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PengajuanIzin())),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: const Color(0xFF39EADD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Ajukan Izin',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget _buildAbsensiTable() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF158AD4),
                  Color(0xFF39EADD)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300), // Limit table height
                  child: DataTable(
                    showCheckboxColumn: false, // Hide the checkbox column
                    headingRowColor: WidgetStateProperty.all(Colors.transparent),
                    headingTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    columns: const [
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Mata Kuliah')),
                    ],
                    rows: _dataRows, // Use dynamic rows
                    dataRowColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xFFE8EAF6); // Lighter indigo for selected rows
                        }
                        return const Color(0xFFFFFFFF); // White for unselected rows
                      },
                    ),
                    dataTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF424242),
                    ),
                    dividerThickness: 1, // Thinner divider
                    columnSpacing: 12, // Reduce spacing between columns
                    dataRowHeight: 35, // Reduce height to fit content
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
