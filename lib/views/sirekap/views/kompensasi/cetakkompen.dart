import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart'; // Import open_file package

class Cetakkompen extends StatefulWidget {
  const Cetakkompen({super.key});

  @override
  State<Cetakkompen> createState() => _CetakkompenState();
}

class _CetakkompenState extends State<Cetakkompen> {
  String? _localPath;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final ByteData data =
          await rootBundle.load('assets/laporanjobsheet11.pdf');
      final Uint8List bytes = data.buffer.asUint8List();
      final Directory tempDir = await getTemporaryDirectory();
      final File file = File('${tempDir.path}/testpdf.pdf');
      await file.writeAsBytes(bytes, flush: true);

      setState(() {
        _localPath = file.path;
      });
    } catch (e) {
      print('Error loading PDF: $e');
    }
  }

  Future<void> _downloadAndOpenPdf() async {
    if (_localPath == null) return;

    try {
      final Directory downloadsDir =
          await getExternalStorageDirectory() ?? await getTemporaryDirectory();
      final File downloadFile =
          File('${downloadsDir.path}/laporanjobsheet11.pdf');

      // Copy the PDF to the Downloads directory
      await File(_localPath!).copy(downloadFile.path);

      // Open the file using the open_file package
      OpenFile.open(downloadFile.path);
    } catch (e) {
      print('Error downloading or opening PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff158AD4), Color(0xff39EADD)],
            ),
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  width: 300,
                  height: 500, // Increase height to accommodate PDF view
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withAlpha(1000),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 150, 0),
                        child: Text(
                          "Surat Bebas Kompensasi",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Adjust font size for readability
                          ),
                        ),
                      ),
                      Expanded(
                        child: _localPath == null
                            ? Center(child: CircularProgressIndicator())
                            : PDFView(
                                filePath: _localPath,
                                enableSwipe: true,
                                swipeHorizontal: true,
                                autoSpacing: false,
                                pageFling: true,
                                pageSnap: true,
                                fitPolicy: FitPolicy.BOTH,
                                onRender: (_pages) {
                                  // Handle when the PDF is rendered
                                },
                                onError: (error) {
                                  // Handle errors
                                  print(error.toString());
                                },
                                onPageError: (page, error) {
                                  // Handle page-specific errors
                                  print('Page $page: ${error.toString()}');
                                },
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            _downloadAndOpenPdf();
                          },
                          child: Text(
                            "DOWNLOAD",
                            style: GoogleFonts.poppins(
                              fontSize: 14, // Adjust font size
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.cyan),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    "Kembali",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
                width: 300,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withAlpha(1000),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Text(
                        "Perhatian",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Anda tidak dapat mencetak surat bebas kompensasi bila anda belum menyelesaikan proses kompensasi kerja.",
                        style: GoogleFonts.poppins(),
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
