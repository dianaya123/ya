import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      home: MhsDetailSurat(),
    ),
  );
}
class MhsDetailSurat extends StatefulWidget {
  @override
  State<MhsDetailSurat> createState() => _MhsDetailSuratState();
}

class _MhsDetailSuratState extends State<MhsDetailSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF158AD4),
        title:
            Text('DETAIL SURAT', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDetailRow(label: 'Nomor Surat', value: '573/PL16.A3/EP/2024'),
            TextDetailRow(label: 'NIM', value: '3202216000'),
            TextDetailRow(label: 'Nama', value: 'Anggi Nabila Sulistianingsih'),
            TextDetailRow(label: 'Total Ketidakhadiran', value: '25 Jam'),
            TextDetailRow(label: 'Perihal', value: 'Surat Peringatan 2'),
            TextDetailRow(
                label: 'Tindakan', value: 'Konsultasi dosen pembimbing'),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Keterangan: Surat terbaru menggunakan tanda tangan digital '
                'untuk menjamin keasliannya dan telah diverifikasi oleh Wakil '
                'Direktur I, Kepala Jurusan, dan Kepala Program Studi.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Lihat Dokumen" button press
                },
                child: Text('Lihat Dokumen'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextDetailRow extends StatefulWidget {
  final String label;
  final String value;

  TextDetailRow({required this.label, required this.value});

  @override
  State<TextDetailRow> createState() => _TextDetailRowState();
}

class _TextDetailRowState extends State<TextDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            child: Text(
              '${widget.label} :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(widget.value),
          ),
        ],
      ),
    );
  }
}
