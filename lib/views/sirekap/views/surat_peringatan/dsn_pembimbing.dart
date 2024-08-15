import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DsnPembimbing extends StatefulWidget {
  final List<Mahasiswa> mahasiswaList;

  DsnPembimbing({required this.mahasiswaList});

  @override
  _DsnPembimbingState createState() => _DsnPembimbingState();
}

class _DsnPembimbingState extends State<DsnPembimbing> {
  int notificationCount = 0;

  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _kelasController = TextEditingController();
  final _programStudiController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _totalKetidakhadiranController = TextEditingController();
  final _tanggalPertemuanController = TextEditingController();
  final _deskripsiPembahasanController = TextEditingController();

  @override
  void dispose() {
    _nimController.dispose();
    _namaController.dispose();
    _kelasController.dispose();
    _programStudiController.dispose();
    _jurusanController.dispose();
    _totalKetidakhadiranController.dispose();
    _tanggalPertemuanController.dispose();
    _deskripsiPembahasanController.dispose();
    super.dispose();
  }

  void showNotification() {
    setState(() {
      notificationCount++;
    });

    Fluttertoast.showToast(
      msg: "Notifikasi diterima",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _search() {
    final String nim = _nimController.text;

    try {
      final Mahasiswa mahasiswa = widget.mahasiswaList.firstWhere((m) => m.nim == nim);

      setState(() {
        _namaController.text = mahasiswa.nama;
        _kelasController.text = mahasiswa.kelas;
        _programStudiController.text = mahasiswa.programStudi;
        _jurusanController.text = mahasiswa.jurusan;
        _totalKetidakhadiranController.text = mahasiswa.totalKetidakhadiran.toString();
        _tanggalPertemuanController.text = DateFormat('EEEE, dd-MM-yyyy').format(mahasiswa.tanggalPertemuan);
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Data tidak ditemukan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildDetailsSection(),
              SizedBox(height: 16),
              _buildPublishButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        Icon(Icons.notifications, size: 30),
        if (notificationCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                '$notificationCount',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Berita Acara Mahasiswa',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 250,
            height: 35,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 247, 247),
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _nimController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Cari...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 13.0),
                      ),
                      style: TextStyle(fontSize: 14),
                      onSubmitted: (_) => _search(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
   );
  }

Widget _buildDetailsSection() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 250, 
        child: _buildPersonalInfoSection(),
      ),
      SizedBox(width: 16),
      Expanded(
        child: _buildDescriptionSection(),
      ),
    ],
  );
}


Widget _buildPersonalInfoSection() {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 250, 
    ),
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 205, 203, 203),
      borderRadius: BorderRadius.circular(14.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 9),
        _buildText(label: 'Nama:', value: _namaController.text),
        Row(
          children: [
            Expanded(
              child: _buildText(label: 'NIM:', value: _nimController.text),
            ),
            SizedBox(width: 16), 
            Expanded(
              child: _buildText(label: 'Kelas:', value: _kelasController.text),
            
            ),
          ],
        ),
        SizedBox(height: 9),
        _buildText(label: 'Program Studi:', value: _programStudiController.text),
        SizedBox(height: 9),
        _buildText(label: 'Jurusan:', value: _jurusanController.text),
        SizedBox(height: 9),
        _buildText(
          label: 'Total Ketidakhadiran:',
          value: _totalKetidakhadiranController.text,
        ),
        _buildDatePickerField(),
      ],
    ),
  );
}



Widget _buildText({required String label, required String value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1.0), 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, 
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold)
        ),
        SizedBox(height: 3), 
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.bold),
        ),
        Container(
                width: 230, 
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
      ],
    ),
  );
}




  Widget _buildDatePickerField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tanggal Pertemuan:', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        TextField(
          controller: _tanggalPertemuanController,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(border: InputBorder.none),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                _tanggalPertemuanController.text = DateFormat('EEEE, dd-MM-yyyy').format(pickedDate);
              });
            }
          },
        ),
        SizedBox(height: 9),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 205, 203, 203),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Deskripsi Pembahasan',
              style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 13),
          Divider(color: Colors.black, thickness: 0.5),
          TextField(
            controller: _deskripsiPembahasanController,
            maxLines: null,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }

  Widget _buildPublishButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        bottom: 20.0,
                        left: 72.0,
                        right: 20.0,
                      ),
                      
                      constraints: BoxConstraints(
                        maxWidth: 370.0,
                        maxHeight: 245.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 25, 186, 214),
                            radius: 45,
                            child: Icon(Icons.check, size: 65, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Publikasi Berhasil',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,fontFamily: 'Times New Roman'),
                          ),
                          SizedBox(height: 1),
                          Text(
                            DateFormat('EEEE, dd-MM-yyyy - HH:mm WIB').format(DateTime.now()),
                            style: TextStyle(color: Colors.grey, fontSize: 9, fontFamily: 'Times New Roman'),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Color.fromARGB(255, 15, 14, 14), size: 18),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
          child: Text(
            'Publikasi',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Times New Roman', color: Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>('_jurusanController', _jurusanController));
  }
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;
  final String programStudi;
  final String jurusan;
  final int totalKetidakhadiran;
  final DateTime tanggalPertemuan;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
    required this.programStudi,
    required this.jurusan,
    required this.totalKetidakhadiran,
    required this.tanggalPertemuan,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: DsnPembimbing(
        mahasiswaList: [
          Mahasiswa(
            nama: 'John Doe',
            nim: '123456789',
            kelas: 'A',
            programStudi: 'Teknik Informatika',
            jurusan: 'Informatika',
            totalKetidakhadiran: 3,
            tanggalPertemuan: DateTime.now(),
          ),
          // Tambahkan data mahasiswa lainnya di sini
        ],
      ),
    ),
  );
}
