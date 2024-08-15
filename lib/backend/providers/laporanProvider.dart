import 'package:flutter/material.dart';
import '../models/laporanModel.dart';
import '../services/laporanService.dart';

class LaporanProvider with ChangeNotifier {
  final LaporanService _laporanService = LaporanService();

  List<LaporanModels> _laporans = [];
  List<LaporanModels> get laporans => _laporans;

  LaporanModels? _singleLaporan;
  LaporanModels? get singleLaporan => _singleLaporan;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchLaporan(int idKelas) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _laporans = await _laporanService.fetchLaporan(idKelas);
      if (_laporans.isEmpty) {
        _errorMessage = 'No data available';
      }
    } catch (e) {
      _errorMessage = 'Error fetching laporan data: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLaporanByNim(String nim) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _singleLaporan = await _laporanService.fetchLaporanByNim(nim);
    } catch (e) {
      _errorMessage = 'Error fetching laporan data: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}