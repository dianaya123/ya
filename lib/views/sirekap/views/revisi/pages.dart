import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PagesFormRevisi extends StatefulWidget {
  const PagesFormRevisi({super.key});

  @override
  State<PagesFormRevisi> createState() => _PagesFormRevisiState();
}

class _PagesFormRevisiState extends State<PagesFormRevisi> {
  String? _selectedValue;
  final List<String> _option = ['izin', 'sakit', 'alpha'];

  bool checked = false;
  bool uploud = false;

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
    );

    if (result != null) {
      setState(() {
        uploud = !false;
      });
      print('file picked : ${result.files.single.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.hardEdge,
        children: [
          header(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Nim(),
                NamaMahasiswa(),
                Makul(),
                Keterangan(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                          'Ukuran file maksimum: 3 mb, Jumlah maksimum file: 1'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffE7E7E7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    child: uploud == false ? UploudFile() : DoneUploud(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                persyaratan(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Waktu yang tersisa untuk mengunggah: ",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '5 Hari',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _Status(),
                const SizedBox(
                  height: 20,
                ),
                deskirpsi(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checked,
                      onChanged: (e) {
                        setState(() {
                          checked = e!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Saya Menyatakan bahwa surat ini dibuat dengan sebenar-benarnya, saya siap menerima sanksi yang ada jika terdapat kecurangan",
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff158AD4),
                          Color(0xFF39EADD),
                        ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Kirim",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row DoneUploud() {
    return Row(
      children: [
        Icon(
          Icons.edit_document,
          size: 40,
        ),
        // TextFormField(
        //   readOnly: true,
        //   // controller: ,
        //   decoration: const InputDecoration(
        //     hintText: 'Upload File',
        //     hintStyle: TextStyle(color: Colors.grey),
        //   ),
        // )
        const SizedBox(
          width: 20,
        ),
        Text("File Sudah Teruploud")
      ],
    );
  }

  Container UploudFile() {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),

      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: TextButton(
        onPressed: () {
          selectFile();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_upload,
              // color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            const Text(
              'Upload File',
              // style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Row _Status() {
    return Row(
      children: [
        Text(
          "Ubah Status Kehadiran :",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xffe7e7e7),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton(
              hint: Text("Status"),
              value: _selectedValue,
              items: _option
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (String? e) {
                setState(() {
                  _selectedValue = e;
                });
              }),
        )
      ],
    );
  }

  Column persyaratan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis File yang Diterima :"),
        Text(".png .jpg .jpeg .pdf"),
      ],
    );
  }

  Padding Keterangan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Keterangan :",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Masukkan NIM",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding Makul() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mata Kuliah :",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Masukkan NIM",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding NamaMahasiswa() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nama Mahasiswa :",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Masukkan NIM",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding deskirpsi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Deskripsi :",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              // hintText: "Masukkan NIM",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding Nim() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("NIM :",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Masukkan NIM",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Container header() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Text(
          "Revisi Presensi",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
