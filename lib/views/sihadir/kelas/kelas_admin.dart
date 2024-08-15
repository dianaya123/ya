import 'package:academix_polnep/backend/models/Kelas.dart';
import 'package:academix_polnep/backend/providers/providerKelas.dart';
import 'package:flutter/material.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';
import 'package:provider/provider.dart';

class KelasAdmin extends StatelessWidget {
  const KelasAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KelasProvider()..fetchKelas(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<KelasProvider>(context, listen: false).fetchKelas();
  }

  void _showAddClassDialog() {
    String newClassName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Kelas'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Nama Kelas',
            ),
            onChanged: (value) {
              newClassName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                if (newClassName.isNotEmpty) {
                  final newKelas = Kelas(
                    idKls: 0, // Should be properly set according to your API or logic
                    abjadKls: newClassName,
                    smt: 1, // Adjust the semester accordingly
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  Provider.of<KelasProvider>(context, listen: false).addKelas(newKelas);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<KelasProvider>(
        builder: (context, kelasProvider, child) {
          if (kelasProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (kelasProvider.error != null) {
            return Center(child: Text('Error: ${kelasProvider.error}'));
          }

          List<Kelas> kelasList = kelasProvider.kelas;
          return Container(
            decoration: BoxDecoration(gradient: bgGradient),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar Kelas',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Senin, 13 Oktober 2023',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(16.0),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(kelasList.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '${kelasList[index].smt}${kelasList[index].abjadKls}', // Combining smt and abjadKls
                            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF00BBD4),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: _showAddClassDialog,
                    child: const Text('Tambah'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
