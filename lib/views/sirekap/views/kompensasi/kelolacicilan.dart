import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_service.dart';
import 'model/tablecicil.dart';

class CicilanKompen extends StatefulWidget {
  const CicilanKompen({super.key});

  @override
  State<CicilanKompen> createState() => _CicilanKompenState();
}

class _CicilanKompenState extends State<CicilanKompen> {
  List<CicilKompen> cicilkompenlist = [];
  int totaljamkompensasi = 0;
  @override
  void initState() {
    super.initState();
    fetchdatacicilan();
    fetchTotalJamKompensasi();
  }

  Future<void> fetchTotalJamKompensasi() async {
    try {
      int totalJam = await ApiService.fetchTotalJamKompensasi();
      setState(() {
        totaljamkompensasi = totalJam;
      });
    } catch (e) {
      print('Error fetching total jam kompensasi: $e');
    }
  }

  Future<void> fetchdatacicilan() async {
    try {
      List<CicilKompen> data = await ApiService.fetchdatacicilan();
      setState(() {
        cicilkompenlist = data;
      });
    } catch (e) {
      print('Error fetching kompensasi data: $e');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff158AD4), Color(0xff39EADD)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(
                  "Notifikasi",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Cicilah Kompensasi kerja anda segera! \n Status kompensasi anda saat ini ",
                        style: GoogleFonts.poppins(),
                      ),
                      Text(
                        "Belum tuntas",
                        style: GoogleFonts.poppins(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(
                  "Cicilan Kompensasi anda",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Container(
                          height: 42,
                          decoration: const BoxDecoration(
                              color: Color(0xff158AD4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10))),
                          child: TableCell(
                              child: Text(
                            "Jenis Kompensasi",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 42,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff158AD4), Color(0xff39EADD)]),
                          ),
                          child: TableCell(
                              child: Text(
                            "Tanggal",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 42,
                          decoration: const BoxDecoration(
                              color: Color(0xff39EADD),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10))),
                          child: TableCell(
                              child: Text(
                            "Jumlah jam",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                        )
                      ]),
                      for (var cicilan in cicilkompenlist)
                        TableRow(children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              cicilan.jeniskompen,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(),
                            ),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cicilan.tglcicil,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(),
                            ),
                          )),
                          Container(
                            child: TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${cicilan.jlhjamkompen} Jam',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(),
                              ),
                            )),
                          ),
                        ]),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Kompensasi: ",
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      '$totaljamkompensasi jam',
                      style: GoogleFonts.poppins(),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Cetakkompen');
                  },
                  child: Text(
                    "Selesaikan Kompensasi",
                    style:
                        GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
