import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PengajuanIzin extends StatefulWidget {
  const PengajuanIzin({super.key});

  @override
  _PengajuanIzinState createState() => _PengajuanIzinState();
}

class _PengajuanIzinState extends State<PengajuanIzin> {
  final _formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  String? filePath;
  bool _isChecked = false;
  String _selectedOption = 'Izin'; // Option selection
  String _selectedStatus = 'Izin'; // Updated for dropdown

  Future<void> _pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf'],
    );
    setState(() {
      if (result != null) {
        filePath = result!.files.single.path;
        print('File picked: $filePath'); // Debugging line
      }
    });
  }

  String deadlineIzin() {
    final now = DateTime.now();
    final currentDay = now.weekday;
    if (currentDay == DateTime.sunday || currentDay == DateTime.saturday) {
      return 'Hari ini libur';
    }
    final daysUntilFriday = (DateTime.friday - currentDay + 7) % 7;
    final deadline = daysUntilFriday == 0 ? 0 : daysUntilFriday;
    return 'Waktu yang tersisa untuk mengunggah: $deadline Hari';
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate() && _isChecked && filePath != null) {
      if (_selectedOption == 'Izin') {
        // Handle Pengajuan Izin
        Navigator.pushNamed(context, '/attendance-update');
      } else if (_selectedOption == 'Revisi') {
        // Handle Revisi Presensi
        Navigator.pushNamed(context, '/revisi-presensi');
      }
    } else {
      // Show SnackBar if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Anda harus mengisi semua form fields, dan mencentang checklist"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(''),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1548AD), Color(0xFF39EADD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Pengajuan Perizinan / Revisi Presensi',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                _buildSectionContainer([
                  DropdownButtonFormField<String>(
                    value: _selectedOption,
                    decoration: const InputDecoration(
                      labelText: 'Pilih Opsi',
                      labelStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.black),
                    items: ['Izin', 'Revisi'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                  ),
                ]),
                const SizedBox(height: 16.0),
                _buildSectionContainer([
                  _buildTextField('Keterangan'),
                ]),
                const SizedBox(height: 16.0),
                _buildSectionContainer([
                  const Text(
                      'Ukuran file maksimum: 3MB,\nJumlah maksimum file: 1',
                      style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: Text(filePath != null
                        ? filePath!.split('/').last
                        : 'Unggah file'),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Jenis file yang diizinkan:\njpg, jpeg, pdf',
                      style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 8.0),
                  Text(deadlineIzin(),
                      style: const TextStyle(color: Colors.red)),
                ]),
                const SizedBox(height: 16.0),
                _buildSectionContainer([
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Ubah status kehadiran',
                      labelStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.black),
                    items: ['Izin', 'Sakit', 'Dispensasi'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue!;
                      });
                    },
                  ),
                ]),
                const SizedBox(height: 16.0),
                _buildSectionContainer([
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi',
                      labelStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.black),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ]),
                const SizedBox(height: 16.0),
                CheckboxListTile(
                  title: const Text(
                      'Saya Menyatakan bahwa surat ini dibuat dengan sebenar-benarnya...',
                      style: TextStyle(color: Colors.white)),
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 16.0),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}
