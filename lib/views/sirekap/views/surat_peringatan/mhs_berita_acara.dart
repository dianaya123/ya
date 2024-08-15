import 'package:flutter/material.dart';

TextEditingController thursdayjuly2024Controller = TextEditingController();
TextEditingController safriadamskommkomController = TextEditingController();

void main() {
  runApp(
    MaterialApp(
      home: MhsBeritaAcara(
        title: 'Berita Acara',
      ),
    ),
  );
}
class MhsBeritaAcara extends StatefulWidget {
  final String title;

  const MhsBeritaAcara({Key? key, required this.title}) : super(key: key);

  @override
  _MhsBeritaAcaraState createState() => _MhsBeritaAcaraState();
}

class _MhsBeritaAcaraState extends State<MhsBeritaAcara> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: <Color>[Colors.lightBlue, Colors.cyan],
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 74),
            child: SingleChildScrollView(
              child: Container(
                height: 874,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.10),
                            child: Text(
                              'Tanggal Pertemuan:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.10),
                            child: TextFormField(
                              controller: thursdayjuly2024Controller,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              scrollPadding:
                                  EdgeInsets.fromLTRB(12, 12, 12, 14),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              "Nama Dosen Pembimbing : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 10,
                            ),
                            child: TextFormField(
                              controller: safriadamskommkomController,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              scrollPadding:
                                  EdgeInsets.fromLTRB(12, 12, 12, 14),
                            ),
                          ),
                          SizedBox(height: 32),
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                              horizontal: 38,
                              vertical: 32,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Deskripsi Berita".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Divider(
                                      thickness: 2, color: Colors.blueAccent),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Pada pertemuan konsultasi, saya dan Budi membahas surat peringatan kedua yang diterimanya akibat mengabaikan beberapa tugas penting dan tidak memenuhi tenggat waktu. Saya menjelaskan bahwa surat peringatan ini serius dan bisa berdampak negatif pada studi Budi. Budi mengungkapkan masalah pribadi dan kesulitan dalam mengatur waktu sebagai penyebab penurunan performanya.\n\nSaya menyarankan Budi untuk membuat jadwal belajar yang teratur, memprioritaskan tugas mendesak, dan lebih proaktif dalam berkomunikasi dengan dosen dan teman sekelas. Saya juga meminta Budi untuk mengirimkan laporan perkembangan mingguan dan menyarankannya mengikuti sesi konseling kampus.\n\nPertemuan diakhiri dengan penekanan pentingnya tanggung jawab dan komitmen dalam studi. Budi berjanji untuk mengikuti saran yang diberikan dan berusaha lebih keras memperbaiki kinerjanya.",
                                  maxLines: 24,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 16,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: Text('Lihat Dokumen'),
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    leadingWidth: 63,
    leading: GestureDetector(
      onTap: () {
        // Tambahkan fungsi yang diinginkan di sini
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 33,
          top: 12,
          bottom: 12,
        ),
      ),
    ),
  );
}
