import 'api_service.dart';
import 'model/profiledata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int jumlahkompen = 0;
  late Future<String> _namaMahasiswa;

  void initState() {
    super.initState();
    _namaMahasiswa = fetchnamamhs();
    // fetchpresensi();
  }

  Future<String> fetchnamamhs() async {
    try {
      Profiledata data = await ApiService.fetchnamamhs();
      return data.namamhs;
    } catch (e) {
      // Print the error for debugging
      return 'Error: $e';
    }
  }

  // Future<void> fetchpresensi() async {
  //   try {
  //     String presensi = await ApiService.fetchpresensi();
  //     setState(() {
  //       jumlahkompen = presensi;
  //     });
  //   } catch (e) {
  //     print('Error fetching jam kompensasi: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff158AD4), Color(0xff39EADD)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    title(),
                    // const SizedBox(height: 10),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 600,
                          width: 340,
                        ),
                        Positioned(
                          top: -20,
                          left: 140,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100)),
                            // child: IconButton(
                            //     iconSize: 50,
                            //     onPressed: () {},
                            //     icon: const Icon(Icons.person))
                          ),
                        ),
                        nama(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(45, 130, 0, 0),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withAlpha(50),
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Kompensasi",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                Text("$jumlahkompen",
                                    style: GoogleFonts.poppins(fontSize: 12))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(45, 190, 0, 0),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withAlpha(50),
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Absensi (Izin)",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                Text("$jumlahkompen",
                                    style: GoogleFonts.poppins(fontSize: 12))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(45, 250, 0, 0),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withAlpha(50),
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Absensi (Sakit)",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                Text("$jumlahkompen",
                                    style: GoogleFonts.poppins(fontSize: 12))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(45, 310, 0, 0),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withAlpha(50),
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Absensi (Alpha)",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                Text("$jumlahkompen",
                                    style: GoogleFonts.poppins(fontSize: 12))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(20, 370, 10, 0),
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withAlpha(50),
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5))
                              ]),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Text(
                                "Catatan",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff6A6A6A),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff6A6A6A)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container nama() {
    return Container(
      margin: EdgeInsets.fromLTRB(80, 70, 0, 0),
      child: FutureBuilder<String>(
        future: fetchnamamhs(), // Memanggil Future di sini
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Menampilkan indikator loading saat Future belum selesai
          } else if (snapshot.hasError) {
            return Text(
              'Error: ${snapshot.error}',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else if (snapshot.hasData) {
            return Text(
              snapshot.data ?? '',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Text(
              'No data',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            );
          }
        },
      ),
    );
  }

  Container title() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 210, 80),
      child: Text(
        "SiRekap",
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
