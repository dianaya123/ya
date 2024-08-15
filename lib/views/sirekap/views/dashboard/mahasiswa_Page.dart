import 'package:academix_polnep/views/sirekap/views/dashboard/mahasiswa_Page.dart';
import 'package:academix_polnep/views/sirekap/views/dashboard/halaman.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'dart:async';
import 'api_service.dart';
// import 'package:http/http.dart' as http;




class mahasiswa extends StatefulWidget {
   final ApiService apiService = ApiService('http://127.0.0.1:8000/api/Dashboard-Mahasiswa/1');
  
    mahasiswa({Key? key}) : super(key: key);

  @override
  State<mahasiswa> createState() => _mahasiswaState();
}

class _mahasiswaState extends State<mahasiswa> {
  String? selectedValue = '2023/2024'; 
  final List<String> items = ['2022/2023','2023/2024'];
   final PageController _pageController = PageController(viewportFraction: 0.85);
  
 
  @override
  void initState() {
    super.initState();
  }

    @override
  void dispose() {
    _pageController.dispose();
   
    super.dispose();
    
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 172,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF158AD4),
                      Color(0xFF39EADD),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(29),
                    bottomRight: Radius.circular(29),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 70,
                       child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyWidget()),
                            );
                          },
                      child: Icon(
                        Icons.notifications,
                        size: 50,
                        color: Color.fromARGB(255, 245, 242, 242),
                      ),
                       ),
                    ),
                //     Positioned(
                //   top: 20,
                //   // right: 5, 
                //   left: 15,
                //   child: Image.asset(
                //     'assets/images/logo_sirekap.png', 
                //     width: 50,
                //     height: 50,
                //   ),
                // ),
                    Positioned(
                      top: 100,
                      left: 18,
                      right: 18,
                      child: Container(
                      height: MediaQuery.of(context).size.height * 0.12, 
                      width: MediaQuery.of(context).size.width * 0.9, 
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xFF1B9CD5),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(9.79),
                            bottomRight: Radius.circular(9.79),
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Selamat Datang, di SI REKAP',
                            style: TextStyle(
                              fontSize: 22.85,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
           const SizedBox(height: 65.0),
          Container(
            height: 655,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Positioned(
                  top: 50,
                  left: 30,
                  child: Container(
                    height: 21,
                    width: 147,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1791D4),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedValue,
                        items: items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      const Positioned(
                        top: 25,
                        left: 65,
                        child: Text(
                          'Status Kehadiran dan Kompensasi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 30,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 155,
                        left: 65,
                        child: Text(
                          'Jumlah kehadiran',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 78,
                        child: Container(
                          height: 48,
                          width: 74.55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF32CD32),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                          child: FutureBuilder<int>(
                          future: widget.apiService.fetchJumlahKehadiran(), // Misalnya, untuk jumlah kehadiran
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Error');
                                } else {
                                  return Text('${snapshot.data}');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 225,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 155,
                        left: 295,
                        child: Text(
                          'Sakit',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 272,
                        child: Container(
                          height: 48,
                          width: 74.55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E90FF),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: FutureBuilder<int>(
                                 future: widget.apiService.fetchSakit(), // Ganti dengan stream dari backend
                                builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Error');
                                } else {
                                  return Text('${snapshot.data}');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 222,
                        left: 30,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 300,
                        left: 105,
                        child: Text(
                          'Izin',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 245,
                        left: 78,
                        child: Container(
                          height: 48,
                          width: 74.55,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD700),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: FutureBuilder<int>(
                            future: widget.apiService.fetchIzin(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return const Text('Error');
                              } else {
                                return Text('${snapshot.data}');
                              }
                            },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 225,
                        left: 225,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 300,
                        left: 295,
                        child: Text(
                          'Alpha',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 245,
                        left: 270,
                        child: Container(
                          height: 48,
                          width: 74.55,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF4500),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                           child: FutureBuilder<int>(
                              future: widget.apiService.fetchAlpha(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Error');
                                } else {
                                  return Text('${snapshot.data}');
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      
                      Positioned(
                        top: 365,
                        left: 30,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 435,
                        left: 55,
                        child: Center(
                          child: Text(
                            'Jumlah Kompensasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 380,
                        left: 78,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyWidget()),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 74.55,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFA500),
                              // child: NumberBox(futureNumber: _futureNumber),
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: FutureBuilder<int>(
                                future: widget.apiService.fetchJumlahKompensasi(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return const Text('Error');
                                  } else {
                                    return Text('${snapshot.data}');
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 365,
                        left: 224,
                        child: Container(
                          height: 110,
                          width: 168,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 15,
                                left: 50,
                                child: Icon(
                                  Icons.login_outlined, // Ganti dengan ikon yang sesuai
                                  size: 60,
                                  color: Colors.black,
                                ),
                              ),
                              const Positioned(
                                bottom: 15,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 500,
                        left: 28,
                         child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyWidget()),
                            );
                          },
                        child: Container(
                          height: 50,
                          width: 369,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 52, 175, 206),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                          ),
                           child: Center(
                            child: Text(
                            'Surat Peringatan',
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 16, // Ukuran font
                              fontWeight: FontWeight.bold, // Ketebalan font
                            ),
                          ),
                        ),
                        ),
                         ),
                      ),
                      Positioned(
                        top: 575,
                        left: 28,
                         child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyWidget()),
                            );
                          },
                        child: Container(
                          height: 50,
                          width: 369,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 49, 159, 203),
                            borderRadius: BorderRadius.circular(5),
                           boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                          ),
                           child: Center(
                          child: Text(
                            'Kompensasi',
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 16, // Ukuran font
                              fontWeight: FontWeight.bold, // Ketebalan font
                            ),
                          ),
                        ),
                        ),
                         ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          //BAGIAN PENGUMUMAN
          const SizedBox(height: 19.0),
          Container(
            height: 300, // Ubah tinggi Container agar tidak overload
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Pengumuman',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0), // Add spacing
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AnnouncementPage(
                        apiService: widget.apiService,
                        announcements: [
                          AnnouncementCard(
                            date: '12 Jul',
                            topText: 'More updates coming soon.',
                            topTutup: 'Buka',
                          ),
                        ],
                      ),
                      AnnouncementPage(
                        apiService: widget.apiService,
                        announcements: [
                          AnnouncementCard(
                            date: '12 Jul',
                            topText: 'More updates coming soon.',
                            topTutup: 'Buka',
                          ),
                        ],
                      ),
                      AnnouncementPage(
                        apiService: widget.apiService,
                        announcements: [
                          AnnouncementCard(
                            date: '13 Jul',
                            topText: 'Lorem ipsum dolor sit amet.',
                            topTutup: 'Tutup',
                          ),
                        ],
                      ),
                      AnnouncementPage(
                        apiService: widget.apiService,
                        announcements: [
                          AnnouncementCard(
                            date: '14 Jul',
                            topText: 'Lorem ipsum dolor sit amet.',
                            topTutup: 'Buka',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class AnnouncementPage extends StatelessWidget {
  final ApiService apiService;
  final List<AnnouncementCard> announcements;

  AnnouncementPage({required this.apiService, required this.announcements});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnnouncementCard>>(
      future: apiService.fetchAnnouncements(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Gagal memuat data'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada pengumuman'));
        } else {
          List<AnnouncementCard> announcements = snapshot.data!;
          return Container(
            padding: EdgeInsets.all(4.0),
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: announcements
                  .map((card) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        child: card,
                      ))
                  .toList(),
            ),
          );
        }
      },
    );
  }
}


class AnnouncementCard extends StatelessWidget {
  final String date;
  final String topText;
  final String topTutup;

  AnnouncementCard({
    required this.date,
    required this.topText,
    required this.topTutup,
  });

  factory AnnouncementCard.fromJson(Map<String, dynamic> json) {
    return AnnouncementCard(
      date: json['date'],
      topText: json['topText'],
      topTutup: json['topTutup'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(right: 16.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 45.0,
              width: 44.65,
              color: Color(0xFFD9D9D9),
              child: Center(
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 70,
            right: 10, // Tambahkan batasan kanan agar teks tidak melebihi batas
            child: Text(
              topText,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
              maxLines: 2, // Maksimal dua baris
              overflow: TextOverflow.ellipsis, // Tampilkan ellipsis jika teks terlalu panjang
            ),
          ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: LayoutBuilder(
          //     builder: (context, constraints) {
          //       double offsetX = constraints.maxWidth * 0.1;

          //       return Padding(
          //         padding: EdgeInsets.only(
          //           right: offsetX,
          //           top: 20,
          //         ),
          //         child: Container(
          //           height: 20.0,
          //           width: 60.0,
          //           color: Color(0xFFC81212),
          //           child: Center(
          //             child: Text(
          //               topTutup,
          //               style: TextStyle(
          //                 fontSize: 12.0,
          //                 fontFamily: 'Poppins',
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
