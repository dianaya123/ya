import 'package:academix_polnep/views/sirekap/views/kompensasi/kompensasipage.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BotNav extends StatefulWidget {
  const BotNav({super.key});

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int selected = 0;
  final pages = [
    const Kompensasi(),
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
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff158AD4),
            Color(0xFF39EADD),
          ],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: pages.elementAt(selected),
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
        ));
  }
}
