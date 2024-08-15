import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/tabledatakompen.dart';
import 'api_service.dart';

class Kompensasi extends StatefulWidget {
  const Kompensasi({super.key});

  @override
  State<Kompensasi> createState() => _KompensasiState();
}

class _KompensasiState extends State<Kompensasi> {
  List<Kompendata> kompendatalist = [];
  int jamkompen = 0;
  int totaljamkompen = 0;

  void initState() {
    super.initState();
    fetchdatakompen();
    fetchjamkompen();
    fetchtotaljamkompen();
  }

  Future<void> fetchdatakompen() async {
    try {
      List<Kompendata> data = await ApiService.fetchdatakompen();
      setState(() {
        kompendatalist = data;
      });
    } catch (e) {
      print('Error fetching kompensasi data: $e');
    }
  }

  Future<void> fetchjamkompen() async {
    try {
      int jumlahJam = await ApiService.fetchjamkompen();
      setState(() {
        jamkompen = jumlahJam;
      });
    } catch (e) {
      print('Error fetching jam kompensasi: $e');
    }
  }

  Future<void> fetchtotaljamkompen() async {
    try {
      int totaljam = await ApiService.fetchtotaljamkompen();
      setState(() {
        totaljamkompen = totaljam;
      });
    } catch (e) {
      print('Error fetching total jam kompensasi: $e');
    }
  }

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
          appBar: AppBar(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            actions: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh)),
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(10, 110, 0, 0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff158AD4), Color(0xff39EADD)]),
                  ),
                  child: Text(
                    "SIREKAP",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Informasi Kompensasi",
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  title: Text(
                    "Cetak Dokumen Kompensasi",
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Cetakkompen');
                  },
                ),
                ListTile(
                  title: Text(
                    "Kelola cicilan kompensasi",
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/CicilanKompen');
                  },
                ),
                ListTile(
                  title: Text(
                    "Revisi Absensi",
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Informasi Pengajuan Revisi",
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3))
                        ]),
                    margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          "Perhatian",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Segera Lakukan Kompensasi menuju ke Kepala Lab. Agar anda bisa Mengikuti UTS atau UAS anda",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Container(
                          height: 60,
                          child: TableCell(
                              child: Container(
                                  // padding: EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6)),
                                      color: Color(0xff158AD4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Mata \n Kuliah",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                        ),
                        Container(
                          height: 60,
                          child: TableCell(
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xff158AD4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Jam Kompen",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                        ),
                        Container(
                          height: 60,
                          child: TableCell(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6)),
                                      color: Color(0xff158AD4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Tanggal",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                        ),
                      ]),
                      for (var data in kompendatalist)
                        TableRow(children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              data.mataKuliah,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 13),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${data.jamKompen} jam',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 13),
                            ),
                          )),
                          Container(
                            child: TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data.tanggal,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            )),
                          ),
                        ])
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 8, 5, 10),
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                width: 100,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Kompensasi ",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "$totaljamkompen jam",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
