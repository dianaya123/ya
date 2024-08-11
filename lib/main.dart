import 'package:academix_polnep/views/sihadir/navigation.dart';
import 'package:academix_polnep/views/sirekap/master.dart';
import 'package:academix_polnep/views/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
