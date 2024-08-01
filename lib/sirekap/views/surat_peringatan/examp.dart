import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampPage extends StatefulWidget {
  const ExampPage({Key? key}) : super(key: key);

  @override
  State<ExampPage> createState() => _ExampPageState();
}

class _ExampPageState extends State<ExampPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 128,
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 10),
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
              Positioned(
                top: 10,
                right: 0,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 408,
                height: 774,
                margin: const EdgeInsets.all(51),
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
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30), // Padding untuk konten
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 168,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monitor_rounded,
                            size: 50,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10), // Jarak antara ikon dan teks
                          Text(
                            'Dashboard',
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70), // Jarak antara baris ikon
                      Row(
                        children: [
                          Icon(
                            Icons.report_gmailerrorred_outlined,
                            size: 50,
                            color: Colors.black,
                          ),
                          const SizedBox(
                              width: 10), // Jarak antara ikon dan teks
                          Text(
                            'Laporan dan Analitik',
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70), // Jarak antara baris ikon
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 50,
                            color: Colors.black,
                          ),
                          const SizedBox(
                              width: 10), // Jarak antara ikon dan teks
                          Text(
                            'Kompensasi',
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70), // Jarak antara baris ikon
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 50,
                            color: Colors.black,
                          ),
                          const SizedBox(
                              width: 10), // Jarak antara ikon dan teks
                          Text(
                            'Logout',
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(top: 51),
              //       width: 530,
              //       height: 100,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF33DCDB),
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(15),
              //           topRight: Radius.circular(15),
              //         ),
              //       ),
              //       padding: EdgeInsets.only(left: 15, top: 15),
              //       child: Text.rich(
              //         TextSpan(
              //             text: "Selamat datang,di ",
              //             style: GoogleFonts.poppins(
              //                 fontSize: 35,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.bold),
              //             children: <TextSpan>[
              //               TextSpan(
              //                 text: "Si REKAP",
              //                 style: GoogleFonts.poppins(
              //                     fontSize: 35,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color(0xFF158AD4)),
              //               )
              //             ]),
              //       ),
              //     ),
              //     Container(
              //       width: 916,
              //       height: 156,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFFFFFFFF),
              //       ),
              //       child: Row(
              //         children: [
              //           Container(
              //             margin: EdgeInsets.only(left: 33),
              //             width: 85,
              //             height: 85,
              //             color: Color(0xFFFFE603),
              //           ),
              //           Container(
              //             width: 112,
              //             height: 85,
              //             color: Color(0xFFD9D9D9),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(left: 22),
              //             width: 85,
              //             height: 85,
              //             color: Color(0xFFF77700),
              //           ),
              //           Container(
              //             width: 112,
              //             height: 85,
              //             color: Color(0xFFD9D9D9),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(left: 22),
              //             width: 85,
              //             height: 85,
              //             color: Color(0xFFF70000),
              //           ),
              //           Container(
              //             width: 112,
              //             height: 85,
              //             color: Color(0xFFD9D9D9),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(left: 22),
              //             width: 85,
              //             height: 85,
              //             color: Color(0xFF575757),
              //           ),
              //           Container(
              //             width: 112,
              //             height: 85,
              //             color: Color(0xFFD9D9D9),
              //           )
              //         ],
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top: 50),
              //       width: 916,
              //       height: 218,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFFEFEFEF),
              //       ),
              //       child: Column(
              //         children: [
              //           Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(padding: EdgeInsets.only(left: 360)),
              //                 Text(
              //                   "Pengumuman",
              //                   style: GoogleFonts.poppins(
              //                       fontSize: 25, color: Color(0xFF121111)),
              //                 ),
              //                 SizedBox(
              //                   width: 190,
              //                 ),
              //                 Text(
              //                   "Lihat semua",
              //                   style: GoogleFonts.poppins(
              //                       fontSize: 18,
              //                       color: Color(0xFF1D9FD6),
              //                       decoration: TextDecoration.underline,
              //                       decorationColor: Color(0xFF1D9FD6)),
              //                 ),
              //                 Icon(
              //                   Icons.arrow_forward,
              //                   color: Color(0xFF1D9FD6),
              //                   size: 30,
              //                 ),
              //               ]),
              //           Divider(
              //             color: Color(0xFF39EADD),
              //             thickness: 5,
              //           ),
              //           Row(
              //             children: [
              //               Container(
              //                 margin: EdgeInsets.all(8.0),
              //                 width: 54,
              //                 height: 130,
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFAAA1A1),
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //               ),
              //               Container(
              //                 width: 138,
              //                 height: 130,
              //                 padding: EdgeInsets.only(top: 10),
              //                 decoration: BoxDecoration(
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'Bersihkan papan tulis di kelas 11 - 15',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                       ),
              //                     ),
              //                     SizedBox(height: 5),
              //                     Text(
              //                       '11 Jul',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.all(8.0),
              //                 width: 54,
              //                 height: 130,
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFAAA1A1),
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //               ),
              //               Container(
              //                 width: 138,
              //                 height: 130,
              //                 padding: EdgeInsets.only(top: 10),
              //                 decoration: BoxDecoration(
              //                   border: Border(
              //                       bottom: BorderSide(
              //                           color: Colors.green, width: 15),
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'Bersihkan papan tulis di kelas 11 - 15',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                       ),
              //                     ),
              //                     SizedBox(height: 5),
              //                     Text(
              //                       '11 Jul',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.all(8.0),
              //                 width: 54,
              //                 height: 130,
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFAAA1A1),
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //               ),
              //               Container(
              //                 width: 138,
              //                 height: 130,
              //                 padding: EdgeInsets.only(top: 10),
              //                 decoration: BoxDecoration(
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'Bersihkan papan tulis di kelas 11 - 15',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                       ),
              //                     ),
              //                     SizedBox(height: 5),
              //                     Text(
              //                       '11 Jul',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.all(8.0),
              //                 width: 54,
              //                 height: 130,
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFAAA1A1),
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //               ),
              //               Container(
              //                 width: 138,
              //                 height: 130,
              //                 padding: EdgeInsets.only(top: 10),
              //                 decoration: BoxDecoration(
              //                   border: Border(
              //                       top: BorderSide(color: Colors.black)),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'Bersihkan papan tulis di kelas 11 - 15',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                       ),
              //                     ),
              //                     SizedBox(height: 5),
              //                     Text(
              //                       '11 Jul',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       alignment: Alignment.center,
              //       margin: EdgeInsets.only(top: 50),
              //       width: 916,
              //       height: 46,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF39EADD),
              //       ),
              //       child: Text(
              //         "Jumlah mahasiswa yang ingin kompensasi",
              //         style: GoogleFonts.poppins(
              //           fontSize: 24,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: 916,
              //       height: 150,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFFFFFFFF),
              //       ),
              //       child: Center(
              //         child: Text(
              //           "10",
              //           style: GoogleFonts.poppins(
              //             fontSize: 48,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
