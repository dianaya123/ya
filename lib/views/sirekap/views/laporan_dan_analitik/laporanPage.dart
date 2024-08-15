import 'package:academix_polnep/views/sirekap/views/laporan_dan_analitik/cicilanKompensasi.dart';
import 'package:academix_polnep/views/sirekap/views/laporan_dan_analitik/laporanKompensasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laporan Kompensasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LaporanPages(),
    );
  }
}

class LaporanPages extends StatelessWidget {
  const LaporanPages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          flexibleSpace: Container(
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
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Image.asset('images/SIREKAP.png',
                        fit: BoxFit.contain),
                  ),
                  const Spacer(),
                  const Text(
                    'Hi, Siti Sarah',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications, color: Colors.white),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: const Text('Admin',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Menu'),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text('Laporan dan analitik'),
                selected: true,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Kompensasi'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.blue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Laporan Kompensasi',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Cicilan Kompensasi',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LaporanKompensasi(),
                  CicilanKompensasi(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}