import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Lain'),
      ),
      body: Center(
        child: Text('Ini adalah halaman lain'),
      ),
    );
  }
}