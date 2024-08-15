import 'package:academix_polnep/backend/providers/kaldik_providers.dart';
import 'package:academix_polnep/backend/providers/userProvider.dart';
import 'package:academix_polnep/backend/services/api_services_kaldik.dart';
import 'package:academix_polnep/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => KaldikProvider(KaldikService()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }
}
