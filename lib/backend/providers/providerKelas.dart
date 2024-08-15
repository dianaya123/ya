// lib/providers/jadwal_provider.dart
import 'dart:convert';

import 'package:academix_polnep/backend/models/Kelas.dart';
import 'package:academix_polnep/backend/services/servicesKelas.dart';
import 'package:flutter/material.dart';

class JadwalProvider with ChangeNotifier {
  List<Jadwal> _jadwals = [];
  bool _isLoading = false;
  String? _error;

  List<Jadwal> get jadwals => _jadwals;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchJadwals() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await ApiServicesJadwal.fetchJadwal();
      _jadwals = response;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class KelasProvider with ChangeNotifier {
  final List<Kelas> _kelas = [];
  bool _isLoading = false;
  String? _error;

  List<Kelas> get kelas => _kelas;
  bool get isLoading => _isLoading;
  String? get error => _error;

  get http => null;

  Future<void> fetchKelas() async {
    // Existing code to fetch classes
  }

  Future<void> addKelas(Kelas newKelas) async {
    final url = Uri.parse('https://your-api-url.com/addClass');
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'idKls': newKelas.idKls,
          'abjadKls': newKelas.abjadKls,
          'smt': newKelas.smt,
          'createdAt': newKelas.createdAt.toIso8601String(),
          'updatedAt': newKelas.updatedAt.toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        _kelas.add(newKelas);
        notifyListeners();
      } else {
        _error = 'Failed to add class';
      }
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
