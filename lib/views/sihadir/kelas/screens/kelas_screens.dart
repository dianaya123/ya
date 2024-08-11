import 'package:flutter/material.dart';
import 'package:academix_polnep/views/sihadir/kelas/models/kelas_model.dart'; // sesuaikan dengan path model Kelas yang sudah dibuat
import 'package:academix_polnep/views/sihadir/kelas/services/api_service.dart'; // sesuaikan dengan path file yang berisi fungsi fetchKelas

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KelasListScreen(),
    );
  }
}

class KelasListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Kelas'),
      ),
      body: FutureBuilder<List<Kelas>>(
        future: ApiService.fetchKelas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Kelas kelas = snapshot.data![index];
                return ListTile(
                  title: Text(kelas.nama),
                  subtitle: Text(kelas.deskripsi),
                );
              },
            );
          }
        },
      ),
    );
  }
}
