import 'package:academix_polnep/backend/models/kaldik.dart';
import 'package:academix_polnep/backend/services/api_services_kaldik.dart';
import 'package:flutter/material.dart';

class KaldikProvider extends ChangeNotifier {
  final KaldikService apiService;
  List<Kaldik> _kaldiks = [];
  bool _isLoading = false;
  String? _error;

  KaldikProvider(this.apiService);

  List<Kaldik> get kaldiks => _kaldiks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchKaldiks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _kaldiks = await apiService.fetchKaldiks();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _kaldiks = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
