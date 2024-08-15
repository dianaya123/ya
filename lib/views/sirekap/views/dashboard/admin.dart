import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_service_admin.dart';

class AdminPage extends StatefulWidget {
  final ApiService apiService;

  AdminPage({Key? key})
      : apiService = ApiService('http://127.0.0.1:8000/api/Dashboard-sp'),
        super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Future<Map<String, int>> futureSummary;
  late Future<List<dynamic>> futureAnnouncements;

  @override
  void initState() {
    super.initState();
    futureSummary = widget.apiService.fetchSummary();
    futureAnnouncements = widget.apiService.fetchAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                height: 50,
              ),
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                text: "Hi, ",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color(0xFFFCE513),
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Siti Sarah",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Add navigation to notification page if needed
              },
              child: Icon(
                Icons.notifications,
                color: Color(0xffffffff),
                size: 30,
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 14,
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
        toolbarHeight: 100,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Laporan Absensi'),
              onTap: () {
                // Add navigation to report page if needed
              },
            ),
            ListTile(
              title: Text('Kompensasi'),
              onTap: () {
                // Add navigation to compensation page if needed
              },
            ),
            ListTile(
              title: Text('Surat Peringatan'),
              onTap: () {
                // Add navigation to warning letter page if needed
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Add navigation to logout page if needed
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
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
                          text: "Selamat datang, di ",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Si REKAP",
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF158AD4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 20),
                      width: 916,
                      height: 156,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
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
                            return Row(
                              children: [
                                _buildStatusContainer('SP 1', '${data['SP1']}', Color(0xFFFFE603)),
                                _buildStatusContainer('SP 2', '${data['SP2']}', Color(0xFFF77700)),
                                _buildStatusContainer('SP 3', '${data['SP3']}', Color(0xFFF70000)),
                                _buildStatusContainer('DO', '${data['DO']}', Color(0xFF575757)),
                              ],
                            );
                          } else {
                            return Center(child: Text('No data available'));
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      width: 1000,
                      height: 218,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 360)),
                              Text(
                                "Pengumuman",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  color: Color(0xFF121111),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Divider(
                            color: Color(0xFF39EADD),
                            thickness: 5,
                          ),
                          SizedBox(height: 18),
                          Expanded(
  child: FutureBuilder<List<dynamic>>(
    future: futureAnnouncements,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        final cicilAll = snapshot.data!;
        return ListView(
          scrollDirection: Axis.horizontal,
          children: cicilAll.map((item) {
            return _buildAnnouncementContainer(
              item['tgl_cicil'],  // Menggunakan 'tgl_cicil' sebagai tanggal
              item['jenis_kompen'],  // Menggunakan 'jenis_kompen' sebagai judul
              'Jumlah Jam: ${item['jlh_jam_konversi']}',  // Menggunakan 'jlh_jam_konversi' sebagai durasi
              '',  // Status mungkin tidak relevan, bisa diabaikan atau tambahkan status jika diperlukan
              Colors.blue,  // Pilih warna yang sesuai atau default
            );
          }).toList(),
        );
      } else {
        return Center(child: Text('No data available'));
      }
    },
  ),
),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusContainer(String title, String count, Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              count,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementContainer(String date, String title, String duration, String status, Color statusColor) {
    return Container(
      width: 229,
      height: 120,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: statusColor, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Color(0xFF121111),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color(0xFF121111),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xFF121111),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 60,
              height: 25,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}