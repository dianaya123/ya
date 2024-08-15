import 'package:academix_polnep/views/sirekap/views/surat_peringatan/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_service.dart';
import 'models/user.dart';

class AdminTiPage extends StatefulWidget {
  final UserService apiService =
      UserService('http://127.0.0.1:8000/api/Dashboard-sp');

  @override
  _AdminTiPageState createState() => _AdminTiPageState();
}

class _AdminTiPageState extends State<AdminTiPage> {
  late Future<Map<String, int>> futureSummary;
  late Future<List<DataMhs>> futureUsers;
  List<DataMhs> filteredUsers = [];
  TextEditingController searchController = TextEditingController();

  String? tahunValue = '2022/2023';
  String? kelasValue = 'A';
  String? smtValue = '1';

  final List<String> tahunItems = ['2022/2023', '2023/2024', '2024/2025'];
  final List<String> kelasItems = ['A', 'B', 'C', 'D', 'E'];
  final List<String> smtItems = ['1', '2', '3', '4', '5', '6'];

  @override
  void initState() {
    super.initState();
    futureSummary = widget.apiService.fetchSummary();
    futureUsers = widget.apiService.fetchData();
    searchController.addListener(_filterData);
  }

  void dispose() {
    searchController.removeListener(_filterData);
    searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    final query = searchController.text.toLowerCase();
    futureUsers.then((users) {
      setState(() {
        filteredUsers = users.where((user) {
          return user.nama.toLowerCase().contains(query) ||
              user.nim.toLowerCase().contains(query);
        }).toList();
      });
    });
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
              padding: const EdgeInsets.only(
                  left: 35, right: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child:
                        Image.asset('images/SIREKAP.png', fit: BoxFit.contain),
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
                    child: const Text('Admin',
                        style: TextStyle(color: Colors.black)),
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
              const DrawerHeader(child: Text('Menu')),
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
      padding: EdgeInsets.all(20),
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
      child: FutureBuilder<Map<String, int>>(
        future: futureSummary,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            print('Summary data: $data'); // Debug statement
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSummaryBox('SP 1', '${data['SP1']}', Color(0xFFFFE603)),
                buildSummaryBox('SP 2', '${data['SP2']}', Color(0xFFF77700)),
                buildSummaryBox('SP 3', '${data['SP3']}', Color(0xFFF70000)),
                buildSummaryBox('DO', '${data['DO']}', Color(0xFF575757)),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget buildSummaryBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10), // Adjust margin as needed
        child: Row(
          children: [
            Expanded(
              child: Container(
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
              child: Container(
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
                child: buildDropdown('Tahun', tahunValue, tahunItems,
                    (String? newValue) {
                  setState(() {
                    tahunValue = newValue;
                  });
                }),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: buildDropdown('Kelas', kelasValue, kelasItems,
                    (String? newValue) {
                  setState(() {
                    kelasValue = newValue;
                  });
                }),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: buildDropdown('Semester', smtValue, smtItems,
                    (String? newValue) {
                  setState(() {
                    smtValue = newValue;
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
          buildButtonAndInfo(),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
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
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ))
                    .toList(),
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
      controller: searchController,
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
          constraints: BoxConstraints(maxWidth: 250),
          child: Text(
            label,
            style: columnTextStyle,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      );
    }

    DataCell _buildDataCell(String content, {Widget? widget}) {
      return DataCell(
        widget ??
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                content,
                style: GoogleFonts.poppins(fontSize: 12),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
      );
    }

    DataCell _buildDetailButtonCell() {
      return DataCell(
        SizedBox(
          width: double
              .infinity, // Ensure the button takes the full width of the cell
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Info'),
                    content: Text('Tombol berhasil ditekan'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set the button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Less rounded corners
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 8), // Adjust padding for height
            ),
            child: Text('Edit', style: TextStyle(color: Colors.white)),
          ),
        ),
      );
    }

    DataCell _buildVerificationStatusCell(bool isVerified) {
      return DataCell(
        Text(
          isVerified ? 'Sudah diverifikasi' : 'Belum diverifikasi',
          style: TextStyle(
            color: isVerified ? Colors.green : Colors.red,
          ),
        ),
      );
    }

    return FutureBuilder<List<DataMhs>>(
      future: futureUsers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          final users = filteredUsers.isNotEmpty ? filteredUsers : snapshot.data!;
          return SingleChildScrollView(
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
                _buildDataColumn('STATUS VERIFIKASI'),
              ],
              rows: List<DataRow>.generate(
                users.length,
                (index) {
                  final user = users[index];
                  //'${index + 1}'

                  return DataRow(
                    cells: <DataCell>[
                      _buildDataCell('${user.no}'), // Nomor urut
                      _buildDataCell(user.nama), // Nama mahasiswa
                      _buildDataCell(user.nim), // NIM mahasiswa
                      _buildDataCell('${user.smt}/${user.kelas}'), // Menampilkan SMT/KELAS
                      _buildDataCell('${user.ketidakhadiran}'), // Ketidakhadiran
                      _buildDataCell(user.sp), // Surat peringatan
                      _buildDetailButtonCell(),
                      _buildDataCell(user.sp), // Tombol Lihat
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildButtonAndInfo() {
    int proses = 1;
    int pengajuan = 4;
    int terverifikasi = 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container with width based on its content
        IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'PROSES: $proses    ',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'PENGAJUAN: $pengajuan    ',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'TERVERIFIKASI: $terverifikasi',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Adjust spacing between text info and buttons
        // Container for Buttons on the right
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement edit letter logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Edit Surat', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 10), // Adjust spacing between buttons
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Konfirmasi Verifikasi',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                            style: GoogleFonts.poppins(
                                color: Colors.red, fontSize: 16),
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
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Verifikasi Surat',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 10), // Adjust spacing between buttons
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Konfirmasi Publikasi',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                            style: GoogleFonts.poppins(
                                color: Colors.red, fontSize: 16),
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
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 92, 92, 92),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Publikasi', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}

//Final