import 'package:academix_polnep/views/helper/getter.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';
import 'package:academix_polnep/views/login/profile.dart';
import 'package:academix_polnep/views/sihadir/dashboard/dashboard.dart';
import 'package:academix_polnep/views/sihadir/kaldik/kaldik.dart';
import 'package:academix_polnep/views/sihadir/kelas/kelas_dosen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedNavbar = 0;
  final _pages = [
    const Dashboard(), // home
    const Text("Presensi"), // presensi
    const KaldikMahasiswa(), // kalender
    const KelasDosen(), // kelas
    const Text("Laporan"), // laporan
  ];

  void changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: TextButton(
            child: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const userProfile();
            })),
          ),
          title: Text(
            userName(),
            style: const TextStyle(fontSize: 20),
          ),
          actions: const [
            // do not touch or you'll accidentally fall of a window
            // TextButton(
            //     onPressed: Placeholder.new,
            //     child: Icon(
            //       Icons.account_circle,
            //       size: 40,
            //     )),
            TextButton(
                onPressed: Placeholder.new,
                child: Icon(
                  Icons.notifications_outlined,
                  size: 40,
                  color: Colors.grey,
                ))
          ],
        ),
        body: Form(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: _pages.elementAt(_selectedNavbar),
        )),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          color: const Color(0xFF25B4D8),
          activeColor: const Color(0xFF25B4D8),
          style: TabStyle.react,
          items: const [
            TabItem(icon: Icons.home_outlined, title: "Home"),
            TabItem(icon: Icons.calendar_today, title: "Presensi"),
            TabItem(icon: Icons.assessment, title: "Kalender"),
            TabItem(icon: Icons.assessment, title: "Kelas"),
            TabItem(icon: Icons.assessment, title: "Laporan"),
          ],
          initialActiveIndex: 0,
          onTap: changeSelectedNavBar,
        ),
      ),
    );
  }
}
