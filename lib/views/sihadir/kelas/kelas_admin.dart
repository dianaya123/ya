import 'package:flutter/material.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';

void main() {
  runApp(const KelasAdmin());
}

class KelasAdmin extends StatelessWidget {
  const KelasAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> classList = ['TI 1A', 'TI 1B', 'TI 1C', 'TI 1D', 'TI 1E', 'TI 2A', 'TI 2B', 'TI 2C', 'TI 2D', 'TI 2E', 'TI 3A', 'TI 3B', 'TI 3C', 'TI 3D'];

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
                setState(() {
                  if (newClassName.isNotEmpty) {
                    classList.add(newClassName);
                  }
                });
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
      body: Container(
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
                children: List.generate(classList.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        classList[index],
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
                  foregroundColor: const Color(0xFF00BBD4), backgroundColor: Colors.white,
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
      ),
    );
  }
}