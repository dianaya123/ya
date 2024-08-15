import 'package:academix_polnep/views/sirekap/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/test.pdf'),
    );
  }

  @override
  void dispose() {
    pdfControllerPinch.dispose();
    super.dispose();
  }

  void _konfir() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.yellow,
                  size: 70.0,
                )
              ],
            ),
            content: Text(
              'Apakah Anda Yakin untuk menyetujui surat ini?',
              style: GoogleFonts.poppins(
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      child: Text(
                        'Ya',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        _acc();
                      },
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text(
                        'Kembali',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ]);
      },
    );
  }

  void _reject() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.red,
                  size: 70.0,
                )
              ],
            ),
            content: Text(
              'Apakah Anda Yakin untuk tidak menyetujui surat ini?',
              style: GoogleFonts.poppins(
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      child: Text(
                        'Ya',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/dosen');
                      },
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text(
                        'Kembali',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ]);
      },
    );
  }

  void _acc() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xff158AD4), Color(0xFF39EADD)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 70.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pembaruan Berhasil',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 150,
                width: 300,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff158AD4), Color(0xFF39EADD)],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Detail Pemberitahuan',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 16.0),
                      ),
                      const SizedBox(height: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_sharp,
                                size: 24.0,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                'Hari, Tanggal',
                                style: GoogleFonts.poppins(fontSize: 14.0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 24.0,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                'Jam',
                                style: GoogleFonts.poppins(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff158AD4), Color(0xFF39EADD)],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Set primary color to transparent
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  child: Text('Kembali',
                      style: GoogleFonts.poppins(
                          fontSize: 16.0, color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff158AD4), Color(0xFF39EADD)],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: PdfViewPinch(controller: pdfControllerPinch),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keterangan:',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Mohon maaf pak, saya baru mengirim surat dikarenakan tidak ada yang mengantarkan surat. terima kasih pak.',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              _reject();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Tolak',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _konfir();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Konfirmasi',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
