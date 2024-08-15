import 'package:academix_polnep/views/sirekap/views/dashboard/halaman.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academix_polnep/views/sirekap/views/dashboard/kaleb.dart';
import 'api_service_kaleb.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaleb Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalebPage(),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Text('This is the logout page'),
      ),
    );
  }
}

class KalebPage extends StatefulWidget {
  final ApiService apiSummary;
  final ApiService apiAnnouncements;
  final ApiService apiKompen;

  KalebPage({Key? key})
      : apiSummary = ApiService('http://127.0.0.1:8000/api/Dashboard-sp'),
        apiAnnouncements =
            ApiService('http://127.0.0.1:8000/api/Dashboard-cicil'),
        apiKompen = ApiService('http://127.0.0.1:8000/api/Laporan-cicil'),
        super(key: key);

  @override
  State<KalebPage> createState() => _KalebPageState();
}

class _KalebPageState extends State<KalebPage> {
  DateTime selectedDate = DateTime.now();
  late Future<Map<String, int>> futureSummary;
  late Future<List<dynamic>> futureAnnouncements;
  late Future<Map<String, dynamic>> futureKompen;

  @override
  void initState() {
    super.initState();
    futureSummary = widget.apiSummary.fetchSummary();
    futureAnnouncements = widget.apiAnnouncements.fetchAnnouncements();
    futureKompen = widget.apiKompen.fetchKompen();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              child: Image.asset(
                'assets/logo_sirekap.png',
                fit: BoxFit.cover,
                height: 90, // Sesuaikan dengan kebutuhan
              ),
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                text: "Hi, ",
                style: GoogleFonts.poppins(
                  fontSize: 30, // Sesuaikan ukuran font jika perlu
                  color: Color(0xFFFCE513),
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Siti Sarah",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget()),
                );
              },
              child: Icon(
                Icons.notifications,
                color: Color(0xffffffff),
                size: 50,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 58,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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
        ),
        toolbarHeight: 128, // Sesuaikan tinggi AppBar
        iconTheme: IconThemeData(
          color: Colors.white, // Mengubah warna ikon hamburger menjadi putih
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Menghapus padding default
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF33DCDB),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  'assets/monitor.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  'assets/laporan.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Laporan dan Analitik'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget()),
                );
              },
            ),
            ListTile(
              leading: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  'assets/kompensasi.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Kompensasi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget()),
                );
              },
            ),
            ListTile(
              leading: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  'assets/logout.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 51, left: 60),
                    width: 530,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF33DCDB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text.rich(
                      TextSpan(
                          text: "Selamat datang,di ",
                          style: GoogleFonts.poppins(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Si REKAP",
                              style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF158AD4)),
                            )
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    width: 1250,
                    height: 156,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 60),
                          width: 1190,
                          height: 156,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: FutureBuilder<Map<String, int>>(
                            future: futureSummary,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (snapshot.hasData) {
                                final data = snapshot.data!;
                                return Row(
                                  children: [
                                    _buildStatusContainer('SP 1',
                                        '${data['SP1']}', Color(0xFFFFE603)),
                                    _buildCountContainer(
                                        '${data['SP1']}', Color(0xFFD9D9D9)),
                                    _buildStatusContainer('SP 2',
                                        '${data['SP2']}', Color(0xFFF77700)),
                                    _buildCountContainer(
                                        '${data['SP2']}', Color(0xFFD9D9D9)),
                                    _buildStatusContainer('SP 3',
                                        '${data['SP3']}', Color(0xFFF70000)),
                                    _buildCountContainer(
                                        '${data['SP3']}', Color(0xFFD9D9D9)),
                                    _buildStatusContainer('DO', '${data['DO']}',
                                        Color(0xFF575757)),
                                    _buildCountContainer(
                                        '${data['DO']}', Color(0xFFD9D9D9)),
                                  ],
                                );
                              } else {
                                return Center(child: Text('No data available'));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 60),
                    width: 1250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Pengumuman",
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                color: Color(0xFF121111),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color(0xFF39EADD),
                          thickness: 5,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: FutureBuilder<List<dynamic>>(
                            future: futureAnnouncements,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (snapshot.hasData) {
                                final announcements = snapshot.data!;

                                if (announcements.isEmpty) {
                                  return Center(
                                      child:
                                          Text('No announcements available'));
                                }

                                return CarouselSlider(
                                  options: CarouselOptions(
                                    height: 150.0,
                                    autoPlay: true,
                                    enlargeCenterPage: false,
                                    aspectRatio: 1.0,
                                    viewportFraction: 0.20,
                                  ),
                                  items: announcements.map((item) {
                                    final date = item['tgl_cicil'] ?? 'No date';
                                    final content =
                                        item['jenis_kompen'] ?? 'No content';
                                    final int convertedHours =
                                        item['jlh_jam_konversi'] ?? 0;

                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: buildAnnouncementSlide(
                                            date: date,
                                            content: content,
                                            jml_jam: '$convertedHours Jam',
                                            status: '',
                                            statusColor: Colors.transparent,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                );
                              } else {
                                return Center(
                                    child: Text('No announcements available'));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 50, left: 60),
                    width: 1250,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF39EADD),
                    ),
                    child: Text(
                      "Jumlah mahasiswa yang kompensasi",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                    future: futureKompen,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final data = snapshot.data!;
                        final laporanCicil =
                            data['LaporanCicil'] as List<dynamic>? ?? [];

                        // Menghitung jumlah mahasiswa yang melakukan kompensasi
                        final totalMahasiswa = laporanCicil.length;

                        return Container(
                          margin: EdgeInsets.only(left: 60, bottom: 30),
                          width: 1250,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "$totalMahasiswa",
                                    style: GoogleFonts.poppins(
                                      fontSize: 48,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Jumlah Mahasiswa",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 30, bottom: 40),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 20.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        DateFormat('MMMM dd, yyyy')
                                            .format(selectedDate),
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(child: Text('No data available'));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountContainer(String count, Color color) {
    return Container(
      width: 125,
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Text(
        count,
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusContainer(String status, String value, Color color) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      width: 100,
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Text(
        status,
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildAnnouncementSlide({
    required String date,
    required String content,
    required String jml_jam,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 90,
            height: 30,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            jml_jam,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 17,
            color: statusColor,
            alignment: Alignment.center,
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
