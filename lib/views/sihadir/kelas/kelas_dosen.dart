import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:async';

class KelasDosen extends StatelessWidget {
  const KelasDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Si Hadir',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Daftar jadwal mingguan
  List<Map<String, String>> _weeklySchedule = [
    {'mata_kuliah': 'JARINGAN KOMPUTER DASAR', 'ruang': 'TI 1', 'hari': 'SENIN', 'tanggal': '30 JULI 2024', 'jam': '07:00 - 15:00'},
    {'mata_kuliah': 'WEB DESIGN', 'ruang': 'LAB TI 11', 'hari': 'SELASA', 'tanggal': '30 JULI 2024', 'jam': '07:00 - 15:00'},
    {'mata_kuliah': 'PEMROGRAMAN MOBILE', 'ruang': 'TI 2', 'hari': 'RABU', 'tanggal': '30 JULI 2024', 'jam': '07:00 - 15:00'},
    {'mata_kuliah': 'BAHASA INGGRIS', 'ruang': 'TI 2', 'hari': 'KAMIS', 'tanggal': '30 JULI 2024', 'jam': '07:00 - 15:00'},
    {'mata_kuliah': 'GRAFIKA KOMPUTER', 'ruang': 'TI 2', 'hari': 'JUMAT', 'tanggal': '30 JULI 2024', 'jam': '07:00 - 15:00'}
  ];

  // Variabel untuk menyimpan token yang dihasilkan
  String? _generatedToken;
  String? _selectedMataKuliah;
  Timer? _timer;

  // Fungsi untuk mengedit jadwal mingguan
  void _editWeeklySchedule(List<Map<String, String>> newSchedule) {
    setState(() {
      _weeklySchedule = newSchedule;
    });
  }

  // Fungsi untuk generate token secara acak
  void _generateToken(String mataKuliah) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String token = String.fromCharCodes(
        Iterable.generate(5, (_) => characters.codeUnitAt(random.nextInt(characters.length))));

    setState(() {
      _generatedToken = token;
      _selectedMataKuliah = mataKuliah;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      String newToken = String.fromCharCodes(
          Iterable.generate(5, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
      setState(() {
        _generatedToken = newToken;
      });
    });
  }

  // Metode untuk membersihkan waktu
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              // Menampilkan tabel jadwal mingguan
              WeeklyScheduleTable(
                schedule: _weeklySchedule,
                onEditWeeklySchedule: _editWeeklySchedule,
                onGenerateToken: _generateToken,
              ),
              if (_generatedToken != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GeneratedTokenDisplay(
                    token: _generatedToken,
                    mataKuliah: _selectedMataKuliah,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Class untuk menampilkan tabel jadwal mingguan
class WeeklyScheduleTable extends StatefulWidget {
  final List<Map<String, String>> schedule;
  final Function(List<Map<String, String>>) onEditWeeklySchedule;
  final Function(String) onGenerateToken;

  const WeeklyScheduleTable({super.key, 
    required this.schedule,
    required this.onEditWeeklySchedule,
    required this.onGenerateToken,
  });

  @override
  _WeeklyScheduleTableState createState() => _WeeklyScheduleTableState();
}

class _WeeklyScheduleTableState extends State<WeeklyScheduleTable> {
  // Fungsi untuk menambahkan kelas baru
  void _addClass() async {
    final newSchedule = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => const EditScheduleDialog(
        schedule: {'mata_kuliah': '', 'ruang': '', 'hari': '', 'tanggal': '', 'jam': ''},
      ),
    );

    if (newSchedule != null) {
      setState(() {
        widget.schedule.add(newSchedule);
      });
      widget.onEditWeeklySchedule(widget.schedule);
    }
  }

  // Fungsi untuk mengedit kelas yang ada
  void _editClass(int index) async {
    final editedSchedule = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => EditScheduleDialog(schedule: widget.schedule[index]),
    );

    if (editedSchedule != null) {
      setState(() {
        widget.schedule[index] = editedSchedule;
      });
      widget.onEditWeeklySchedule(widget.schedule);
    }
  }

  // Fungsi untuk menghapus kelas dari jadwal
  void _deleteClass(int index) {
    setState(() {
      widget.schedule.removeAt(index);
    });
    widget.onEditWeeklySchedule(widget.schedule);
  }

  // Fungsi untuk menampilkan pop up
  void _showDetailsDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.schedule[index]['mata_kuliah']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Ruang: ${widget.schedule[index]['ruang']}"),
            Text("Tanggal: ${widget.schedule[index]['tanggal']}"),
            Text("Jam: ${widget.schedule[index]['jam']}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.onGenerateToken(widget.schedule[index]['mata_kuliah']!);
              Navigator.of(context).pop();
            },
            child: const Text('Start'),
          ),
          TextButton(
            onPressed: () => _editClass(index),
            child: const Text('Edit'),
          ),
          TextButton(
            onPressed: () => _deleteClass(index),
            child: const Text('Remove'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'JADWAL KELAS ANDA MINGGU INI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16.0,
                columns: const [
                  DataColumn(
                      label: Text('MATA KULIAH',
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('HARI',
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
                ],
                rows: widget.schedule.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, String> scheduleItem = entry.value;
                  return DataRow(
                    cells: [
                      DataCell(
                        InkWell(
                          onTap: () => _showDetailsDialog(index),
                          child: Text(scheduleItem['mata_kuliah']!, style: const TextStyle(fontSize: 12.0)),
                        ),
                      ),
                      DataCell(Text(scheduleItem['hari']!, style: const TextStyle(fontSize: 12.0))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Class untuk pengeditan jadwal
class EditScheduleDialog extends StatefulWidget {
  final Map<String, String> schedule;

  const EditScheduleDialog({super.key, required this.schedule});

  @override
  _EditScheduleDialogState createState() => _EditScheduleDialogState();
}

class _EditScheduleDialogState extends State<EditScheduleDialog> {
  // Controller untuk mengelola teks input pengguna pada form
  late TextEditingController _mataKuliahController;
  late TextEditingController _ruangController;
  late TextEditingController _hariController;
  late TextEditingController _tanggalController;
  late TextEditingController _jamController;

  // Menginisialisasi controller dengan nilai-nilai awal dari jadwal yang akan diedit.
  @override
  void initState() {
    super.initState();
    _mataKuliahController = TextEditingController(text: widget.schedule['mata_kuliah']);
    _ruangController = TextEditingController(text: widget.schedule['ruang']);
    _hariController = TextEditingController(text: widget.schedule['hari']);
    _tanggalController = TextEditingController(text: widget.schedule['tanggal']);
    _jamController = TextEditingController(text: widget.schedule['jam']);
  }

  // Membangun UI untuk dialog, termasuk input field dan tombol aksi.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Schedule'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _mataKuliahController,
              decoration: const InputDecoration(labelText: 'Mata Kuliah'),
            ),
            TextField(
              controller: _ruangController,
              decoration: const InputDecoration(labelText: 'Ruang'),
            ),
            TextField(
              controller: _hariController,
              decoration: const InputDecoration(labelText: 'Hari'),
            ),
            TextField(
              controller: _tanggalController,
              decoration: const InputDecoration(labelText: 'Tanggal'),
            ),
            TextField(
              controller: _jamController,
              decoration: const InputDecoration(labelText: 'Jam'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final updatedSchedule = {
              'mata_kuliah': _mataKuliahController.text,
              'ruang': _ruangController.text,
              'hari': _hariController.text,
              'tanggal': _tanggalController.text,
              'jam': _jamController.text,
            };
            Navigator.of(context).pop(updatedSchedule);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

// Kelas untuk menampilkan token yang dihasilkan
class GeneratedTokenDisplay extends StatelessWidget {
  final String? token;
  final String? mataKuliah;

  const GeneratedTokenDisplay({super.key, this.token, this.mataKuliah});

  @override
  Widget build(BuildContext context) {
    return token != null && mataKuliah != null
        ? Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MATA KULIAH: $mataKuliah',
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black, decoration: TextDecoration.none),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'GENERATED TOKEN : $token',
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black, decoration: TextDecoration.none),
                ),
              ],
            ),
          )
        : Container();
  }
}