import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = true;
  bool _isAuthenticated = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  bool get hasError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;

  Future<void> initialize() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    await _authService.init();
    final success = await _authService.guestLogin();

    _isAuthenticated = success;
    _isLoading = false;

    if (!success) {
      _errorMessage = 'Unable to authenticate. Please check your connection.';
    }

    notifyListeners();
  }

  Future<void> retry() async {
    await initialize();
  }

  String? getToken() {
    return _authService.getTokenSync();
  }
}