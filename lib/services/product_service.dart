import 'package:dio/dio.dart';
import '../services/auth_service.dart';

class ProductService {
  final Dio _dio = Dio();
  final AuthService _authService = AuthService();

  Future<List<dynamic>> getProducts({
    required String token,
    String? filters,
    int wareID = 0,
    int priceCategoryID = 0,
    int pageIndex = 1,
    int pageSize = 20,
    String orderBy = 'ASC',
    String orderByName = 'ProductID',
  }) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      
      final response = await _dio.get(
        'http://electronics.stoccoz.com/api/v1/GetAllProducts/variants',
        queryParameters: {
          'WareID': wareID,
          'PriceCategoryID': priceCategoryID,
          'pageIndex': pageIndex,
          'pageSize': pageSize,
          'orderBy': orderBy,
          'orderByName': orderByName,
          if (filters != null && filters.isNotEmpty) 'filters': filters,
        },
      );

      if (response.statusCode == 200) {
        if (response.data is List) {
          return response.data;
        } else if (response.data['data'] is List) {
          return response.data['data'];
        }
        return [];
      }
      throw Exception('Failed to load products');
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}