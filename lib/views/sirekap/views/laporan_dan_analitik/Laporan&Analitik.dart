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
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/logo.png', fit: BoxFit.cover),
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
                child: Text('Admin', style: TextStyle(color: Colors.black)),
              ),
            ],
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

class LaporanKompensasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Laporan Kompensasi',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.yellow,
                        child: Text('SP1'),
                      ),
                      SizedBox(width: 10),
                      Text('2')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange,
                        child: Text('SP2'),
                      ),
                      SizedBox(width: 10),
                      Text('3')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                        child: Text('SP3'),
                      ),
                      SizedBox(width: 10),
                      Text('2')
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 500,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tahun'),
                  DropdownButton<String>(
                    value: '2023-2024',
                    items: <String>['2023-2024', '2022-2023', '2021-2022']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kelas'),
                  DropdownButton<String>(
                    value: 'C',
                    items: <String>['A', 'B', 'C'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Angkatan'),
                  DropdownButton<String>(
                    value: '22',
                    items: <String>['21', '22', '23'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Semester'),
                  DropdownButton<String>(
                    value: '4',
                    items: <String>['1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nama atau nim',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('NO')),
                      DataColumn(label: Text('Nama Mahasiswa')),
                      DataColumn(label: Text('NIM')),
                      DataColumn(label: Text('Kelas')),
                      DataColumn(label: Text('Semester')),
                      DataColumn(label: Text('Angkatan')),
                      DataColumn(label: Text('Tahun')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('Siti Sabrina Oktavia')),
                          DataCell(Text('3202216002')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('2')),
                          DataCell(Text('Rizwanda')),
                          DataCell(Text('3202216001')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('3')),
                          DataCell(Text('Yajid')),
                          DataCell(Text('3202216004')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('4')),
                          DataCell(Text('Haykal')),
                          DataCell(Text('3202216006')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('5')),
                          DataCell(Text('Lalu Nicholas')),
                          DataCell(Text('3202216007')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CicilanKompensasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Cicilan Kompensasi',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: 46 / (46 + 19),
                            backgroundColor: Colors.red,
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                            strokeWidth: 25,
                          ),
                        ),
                        Text(
                          '46',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            const SizedBox(width: 5),
                            Text('Selesai'),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text('Belum'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bulan'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: 'Januari',
                            items: <String>['Januari', 'Februari', 'Maret']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kelas'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: 'C',
                            items: <String>['A', 'B', 'C', 'D', 'E']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Semester'),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            value: '4',
                            items: <String>['1', '2', '3', '4', '5', '6']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 300, // Adjust this value to your preference
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari nama atau nim',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('NO')),
                      DataColumn(label: Text('Nama Mahasiswa')),
                      DataColumn(label: Text('NIM')),
                      DataColumn(label: Text('Kelas')),
                      DataColumn(label: Text('Semester')),
                      DataColumn(label: Text('Angkatan')),
                      DataColumn(label: Text('Bulan')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('Siti Sabrina Oktavia')),
                          DataCell(Text('3202216002')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('2')),
                          DataCell(Text('Rizwanda')),
                          DataCell(Text('3202216001')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('3')),
                          DataCell(Text('Yajid')),
                          DataCell(Text('3202216004')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('4')),
                          DataCell(Text('Haykal')),
                          DataCell(Text('3202216006')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('5')),
                          DataCell(Text('Lalu Nicholas')),
                          DataCell(Text('3202216007')),
                          DataCell(Text('C')),
                          DataCell(Text('4')),
                          DataCell(Text('22')),
                          DataCell(Text('2023-2024')),
                          DataCell(Text('40')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
