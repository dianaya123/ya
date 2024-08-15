import 'package:academix_polnep/views/sirekap/views/dashboard.dart';
import 'package:academix_polnep/views/sirekap/views/surat_peringatan/admin_ti_ori.dart';
import 'package:academix_polnep/views/sirekap/views/surat_peringatan/dsn_pembimbing.dart';
import 'package:academix_polnep/views/sirekap/views/surat_peringatan/verif_ori.dart';
// import 'package:academix_polnep/views/sirekap/views/dashboard/cobe.dart';
// // import 'package:academix_polnep/views/sirekap/views/dashboard/notifikasi.dart';
// // import 'package:academix_polnep/views/sirekap/views/dashboard/nt.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavbarSiRekap extends StatefulWidget {
  const NavbarSiRekap({super.key});

  @override
  State<NavbarSiRekap> createState() => _NavbarSiRekapState();
  
}

class _NavbarSiRekapState extends State<NavbarSiRekap> {
  int selected = 0;

  final page = [
    Dashboard(),
    const Text("Presensi"),
    const Text("Test"),
    const Text("Halo"),
    const Text("Dragon"),
  ];

  void changeSelectedNavBar(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: page.elementAt(selected),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF25B4D8),
        activeColor: const Color(0xFF25B4D8),
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_today, title: "Presensi"),
          TabItem(icon: Icons.assessment, title: "Kalender"),
          TabItem(icon: Icons.assessment, title: "Kelas"),
          TabItem(icon: Icons.assessment, title: "Laporan"),
        ],
        onTap: changeSelectedNavBar,
        initialActiveIndex: 0,
      ),
    );
  }
}
