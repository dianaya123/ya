import 'package:academix_polnep/views/sirekap/views/surat_peringatan/verif_ori.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifPage extends StatefulWidget {
  const VerifPage({Key? key}) : super(key: key);

  @override
  State<VerifPage> createState() => _VerifPageState();
}

class _VerifPageState extends State<VerifPage> {
  String? tahunValue = '2022/2023';
  String? kelasValue = 'A';
  String? smtValue = '1';

  final List<String> tahunItems = ['2022/2023', '2023/2024', '2024/2025'];
  final List<String> kelasItems = ['A', 'B', 'C', 'D', 'E'];
  final List<String> smtItems = ['1', '2', '3', '4', '5', '6'];

  // List untuk menyimpan status verifikasi
  final List<bool> _selected = List<bool>.generate(4, (int index) => false);

  void _onViewPressed(int index) {
    // Implementasikan aksi yang akan dijalankan ketika tombol "Lihat" diklik
    print('Tombol Lihat diklik untuk baris $index');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF158AD4),
                  Color(0xFF39EADD),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Image.asset('images/SIREKAP.png',
                        fit: BoxFit.contain),
                  ),
                  const Spacer(),
                  const Text(
                    'Hi, Siti Sarah',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications, color: Colors.white),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Text('Admin', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Menu'),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text('Laporan dan analitik'),
                selected: true,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Kompensasi'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              return buildWideLayout();
            } else if (constraints.maxWidth > 800) {
              return buildMediumLayout();
            } else {
              return buildNarrowLayout();
            }
          },
        ),
      ),
    );
  }

  Widget buildWideLayout() {
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSummarySection(),
                  buildTableSection(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMediumLayout() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSummarySection(),
            buildTableSection(),
          ],
        ),
      ],
    );
  }

  Widget buildNarrowLayout() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSummarySection(),
            buildTableSection(),
          ],
        ),
      ],
    );
  }

  Widget buildSummarySection() {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.all(50),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 70,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: buildSummaryBox('SP I', '10', const Color(0xFFFFE603)),
          ),
          Expanded(
            child: buildSummaryBox('SP II', '21', const Color(0xFFF77700)),
          ),
          Expanded(
            child: buildSummaryBox('SP III', '5', const Color(0xFFF70000)),
          ),
          Expanded(
            child: buildSummaryBox('DO', '0', const Color(0xFF575757)),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryBox(String label, String value, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 85,
              color: color,
              child: Center(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 85,
              color: const Color(0xFFD9D9D9),
              child: Center(
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTableSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 50),
      padding: const EdgeInsets.fromLTRB(35, 50, 35, 50),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 70,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildDropdown('Tahun', tahunValue, tahunItems, (String? newValue) {
                  setState(() {
                    tahunValue = newValue!;
                  });
                }),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: buildDropdown('Kelas', kelasValue, kelasItems, (String? newValue) {
                  setState(() {
                    kelasValue = newValue!;
                  });
                }),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: buildDropdown('Semester', smtValue, smtItems, (String? newValue) {
                  setState(() {
                    smtValue = newValue!;
                  });
                }),
              ),
              const SizedBox(width: 60),
              Expanded(
                flex: 2,
                child: buildSearchBox(),
              ),
            ],
          ),
          const SizedBox(height: 40),
          buildDataTable(),
          const SizedBox(height: 40),
          buildButtonAndInfo()
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF5F5F5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                items: items.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: GoogleFonts.poppins(fontSize: 14)),
                )).toList(),
                onChanged: onChanged,
                isExpanded: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSearchBox() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 16),
    );
  }

 Widget buildDataTable() {
    TextStyle columnTextStyle = GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    DataColumn _buildDataColumn(String label) {
      return DataColumn(
        label: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 100,
          ),
          child: Text(
            label,
            style: columnTextStyle,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            _buildDataColumn('NO'),
            _buildDataColumn('NAMA MAHASISWA'),
            _buildDataColumn('NIM'),
            _buildDataColumn('SMT/KELAS'),
            _buildDataColumn('KETIDAKHADIRAN'),
            _buildDataColumn('SURAT PERINGATAN'),
            _buildDataColumn('DETAIL SURAT'),
            _buildDataColumn('VERIFIKASI'),
            _buildDataColumn('STAUS VERIFIKASI'),
          ],
         rows: List.generate(4, (index) {
            return DataRow(
              cells: [
                _buildDataCell('${index + 1}'),
                _buildDataCell(index == 0 ? 'Anggi Nabila Sulistianingsih' : index == 1 ? 'Oliver Dillon' : index == 2 ? 'Muhammad Sapri Syaiful' : 'Rizwanda'),
                _buildDataCell(index == 0 ? '3202216086' : index == 1 ? '32022160125' : index == 2 ? '32022160139' : '3202216081'),
                _buildDataCell('4/C'),
                _buildDataCell(index == 0 ? '15' : index == 1 ? '39' : index == 2 ? '16' : '35'),
                _buildDataCell(index == 0 ? 'SP 1' : index == 1 ? 'SP 3' : index == 2 ? 'SP 2' : 'SP 3'),
                _buildDataCell('Lihat', isButton: true, index: index),
                DataCell(Checkbox(
                  value: _selected[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _selected[index] = value!;
                    });
                  },
                )),
                DataCell(Text(
                  _selected[index] ? 'Sudah diverifikasi' : 'Belum diverifikasi',
                  style: TextStyle(
                      color: _selected[index] ? Colors.green : Colors.red),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }

  DataCell _buildDataCell(String text, {bool isButton = false, int? index}) {
  if (isButton) {
    return DataCell(
      ElevatedButton(
        onPressed: () {
          if (index != null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: SizedBox(
                    width: 600,
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Surat Peringatan',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'NIM: 3202210000',
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                              Text(
                                'Total Ketidakhadiran: 15 Jam',
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nama: Anggi Nabila Sulistianingsih',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nomor Surat: SP3 / P1.B/3/6/2024',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          Table(
                            border: TableBorder.all(), // Added border for better visibility
                            children: [
                              TableRow(
                                decoration: BoxDecoration(color: Colors.grey[300]), // Header background
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SURAT PERINGATAN', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SEMESTER/KELAS', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('TANGGAL PENGAJUAN', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SURAT PERNYATAAN', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('STATUS PERINGATAN', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SP1', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1A', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('21/03/2022', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('-', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Selesai', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(color: Colors.grey[200]), // Alternate row color
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SP2', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('3A', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('10/11/2023', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('surat_pernyataan.pdf', style: GoogleFonts.poppins(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Selesai', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('SP3', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('4A', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('06/07/2024', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('-', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Proses', style: GoogleFonts.poppins(fontSize: 16)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
                    ),
                  ],
                );
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
        ),
        child: Text('Lihat', style: GoogleFonts.poppins(color: Colors.white)),
      ),
    );
  } else {
    return DataCell(
      Container(
        constraints: BoxConstraints(maxWidth: 200),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}



  Widget buildButtonAndInfo() {
  int belumTerverifikasi = 2;
  int sudahTerverifikasi = 3;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'BELUM TERVERIFIKASI: $belumTerverifikasi    SUDAH TERVERIFIKASI: $sudahTerverifikasi',
        style: TextStyle(color: Colors.green),
      ),
      Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // Show confirmation dialog for verification
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      'Konfirmasi Verifikasi',
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Apakah Anda yakin ingin memverifikasi seluruh surat?',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(
                          'Batal',
                          style: GoogleFonts.poppins(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Close the confirmation dialog
                          Navigator.of(context).pop();

                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: Text(
                                  'Verifikasi Berhasil',
                                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  'Seluruh surat telah berhasil diverifikasi.',
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Button color
                        ),
                        child: Text(
                          'Verifikasi',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Background color
            ),
            child: Text('Verifikasi Semua', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              // Show confirmation dialog for publication
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      'Konfirmasi Publikasi',
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Apakah Anda yakin ingin mempublikasikan seluruh surat peringatan?',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(
                          'Batal',
                          style: GoogleFonts.poppins(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Close the confirmation dialog
                          Navigator.of(context).pop();

                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: Text(
                                  'Publikasi Berhasil',
                                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  'Seluruh surat peringatan telah berhasil dipublikasikan.',
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Button color
                        ),
                        child: Text(
                          'Kirim',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child: Text('Publikasi', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ],
  );
}
}