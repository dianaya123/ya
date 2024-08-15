import 'package:flutter/material.dart';
import 'package:academix_polnep/backend/services/api_service_presensi.dart';

class SubmitPresensiScreen extends StatelessWidget {
  final TextEditingController nomorIndukController = TextEditingController();
  final TextEditingController idJdwlController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  SubmitPresensiScreen({super.key});

  void submitPresensi(BuildContext context) async {
    try {
      // Get the input values
      String nomorInduk = nomorIndukController.text;
      String idJdwl = idJdwlController.text;
      String token = tokenController.text;

      // Call the postPresensi method and get the response
      Map<String, dynamic> response = await ApiService.postPresensi(nomorInduk, idJdwl, token);

      // Show a success dialog with the message from the response
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notification'),
            content: Text(response['message'] ?? 'Presensi berhasil disimpan'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Presensi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomorIndukController,
              decoration: const InputDecoration(labelText: 'Nomor Induk'),
            ),
            TextField(
              controller: idJdwlController,
              decoration: const InputDecoration(labelText: 'ID Jadwal'),
            ),
            TextField(
              controller: tokenController,
              decoration: const InputDecoration(labelText: 'Token'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => submitPresensi(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SubmitPresensiScreen(),
  ));
}
