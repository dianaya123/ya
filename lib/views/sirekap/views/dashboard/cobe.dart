import 'package:academix_polnep/views/sirekap/views/dashboard/halaman.dart';
import 'package:academix_polnep/views/sirekap/views/dashboard/cobe.dart';
// import 'package:academix_polnep/views/sirekap/views/dashboard/mahasiswa.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'dart:async';

class mahasiswa extends StatefulWidget {
  const mahasiswa({super.key});

  @override
  State<mahasiswa> createState() => _mahasiswaState();
}

class _mahasiswaState extends State<mahasiswa> {
  String? selectedValue = '2023/2024'; 
  final List<String> items = ['2022/2023','2023/2024'];
   final PageController _pageController = PageController(viewportFraction: 0.85);
  // int _jumlahKehadiran = 0;
  // int _sakit = 0;
  // int _alpa = 0;
  // int _izin = 0;
  // int _jumlahKompensasi = 0;
 
  @override
  void initState() {
    super.initState();
  }

  

  Stream<int> getJumlahStream() async* {
    int jumlah = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 1000));
      jumlah++;
      yield jumlah; // Data dari backend
    }
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
                    const Positioned(
                      top: 10,
                      right: 70,
                      child: Icon(
                        Icons.notifications,
                        size: 50,
                        color: Color.fromARGB(255, 245, 242, 242),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 18,
                      child: Container(
                        height: 95,
                        width: 394,
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
           const SizedBox(height: 60.0),
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
                            child: StreamBuilder<int>(
                              stream: getJumlahStream(), // Ganti dengan stream dari backend
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator(color: Colors.white);
                                } else if (snapshot.hasError) {
                                  return const Text(
                                    'Error',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 223,
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
                        left: 270,
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
                            child: StreamBuilder<int>(
                              stream: getJumlahStream(), // Ganti dengan stream dari backend
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator(color: Colors.white);
                                } else if (snapshot.hasError) {
                                  return const Text(
                                    'Error',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 230,
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
                        top: 305,
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
                        top: 250,
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
                            child: StreamBuilder<int>(
                              stream: getJumlahStream(), // Ganti dengan stream dari backend
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator(color: Colors.white);
                                } else if (snapshot.hasError) {
                                  return const Text(
                                    'Error',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 230,
                        left: 223,
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
                        top: 305,
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
                        top: 250,
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
                            child: StreamBuilder<int>(
                              stream: getJumlahStream(), // Ganti dengan stream dari backend
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator(color: Colors.white);
                                } else if (snapshot.hasError) {
                                  return const Text(
                                    'Error',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
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
                              child: StreamBuilder<int>(
                                stream: getJumlahStream(), // Ganti dengan stream dari backend
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator(color: Colors.white);
                                  } else if (snapshot.hasError) {
                                    return const Text(
                                      'Error',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      '${snapshot.data}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
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
                                top: 20,
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
                        left: 30,
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
                        ),
                      ),
                      Positioned(
                        top: 575,
                        left: 30,
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
                        announcements: [
                          AnnouncementCard(
                            date: '11 Jul',
                            topText: 'Lorem ipsum dolor sit amet.',
                            topTutup: 'Tutup',
                          ),
                        ],
                      ),
                      AnnouncementPage(
                        announcements: [
                          AnnouncementCard(
                            date: '12 Jul',
                            topText: 'More updates coming soon.',
                            topTutup: 'Buka',
                          ),
                        ],
                      ),
                      AnnouncementPage(
                        announcements: [
                          AnnouncementCard(
                            date: '13 Jul',
                            topText: 'Lorem ipsum dolor sit amet.',
                            topTutup: 'Tutup',
                          ),
                        ],
                      ),
                      AnnouncementPage(
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
  final List<AnnouncementCard> announcements;

  AnnouncementPage({required this.announcements});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: announcements
                  .map((card) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0), // Mengatur jarak horizontal
                          child: card,
                        ),
                      ))
                  .toList(),
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Row(
              children: announcements
                  .map((card) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0), // Mengatur jarak horizontal
                          child: card,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
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
              height:45.0,
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
            // right: 20,
            child: Text(
              topText,
              textAlign: TextAlign.left, 
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                
                double offsetX = constraints.maxWidth * 0.1; 
              

                return Padding(
                  padding: EdgeInsets.only(
                    right: offsetX,
                    top: 20,
                  ),
                  child: Container(
                    height: 20.0,
                    width: 60.0,
                    color: Color(0xFFC81212),
                    child: Center(
                      child: Text(
                        topTutup,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },

              
            ),
            ),

        ],
      ),
      );

  }
}
