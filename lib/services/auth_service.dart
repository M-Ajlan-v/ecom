import 'package:dio/dio.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  late Dio _dio;
  String? _token;
  DateTime? _tokenExpiry;

  Future<void> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://electronics.stoccoz.com',
      connectTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ));
  }

  Future<bool> guestLogin() async {
    try {
      final response = await _dio.post(
        '/api/v1/login',
        data: {
          'username': 'admin@stoccoz.com',
          'passwordHash': 'admin@123',
        },
      );
      print('Login Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        _token = response.data['token'];
        print('Your Token: $_token'); 
        final expiresStr = response.data['expires'];
        _tokenExpiry = DateTime.parse(expiresStr);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool isTokenValid() {
    if (_token == null) return false;
    if (_tokenExpiry == null) return false;
    return DateTime.now().isBefore(_tokenExpiry!);
  }

  String? getTokenSync() {
    return _token;
  }
}