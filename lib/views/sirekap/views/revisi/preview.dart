import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // Package to view PDFs

class SuratPreview extends StatelessWidget {
  final String pdfUrl; // URL of the PDF to preview

  const SuratPreview({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Surat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preview letter container
            Container(
              height: 300, // Adjust height as needed
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: PDFView(
                filePath: pdfUrl, // Path or URL to your PDF
              ),
            ),
            const SizedBox(height: 20),
            // Description container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Keterangan:\n',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                  children: [
                    TextSpan(
                      text:
                          'Isi surat yang ingin dipreview.', // Replace with your description content
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
