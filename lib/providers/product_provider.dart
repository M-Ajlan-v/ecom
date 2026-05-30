import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import 'auth_provider.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService = ProductService();
  
  List<ProductVariant> _products = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;
  int _totalProducts = 0;
  String? _error;
  String _currentSearchQuery = '';

  List<ProductVariant> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
  String? get error => _error;
  int get productCount => _products.length;

  Future<void> loadProducts({
    required BuildContext context,
    bool refresh = false,
    String? searchQuery,
  }) async {
    if (refresh) {
      _currentPage = 1;
      _products.clear();
      _hasMore = true;
      _error = null;
    }
    
    if (_isLoading || _isLoadingMore) return;
    if (!_hasMore && !refresh) return;
    
    if (refresh || _currentPage == 1) {
      _isLoading = true;
    } else {
      _isLoadingMore = true;
    }
    
    _currentSearchQuery = searchQuery ?? _currentSearchQuery;
    notifyListeners();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.getToken();

    if (token == null) {
      _error = 'No authentication token';
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
      return;
    }

    try {
      final response = await _productService.getProducts(
        token: token,
        filters: _currentSearchQuery.isNotEmpty ? _currentSearchQuery : null,
        pageIndex: _currentPage,
        pageSize: 20,
      );

      final List<ProductVariant> newProducts = response
          .map((json) => ProductVariant.fromJson(json))
          .toList();

      if (refresh || _currentPage == 1) {
        _products = newProducts;
      } else {
        _products.addAll(newProducts);
      }

      if (newProducts.length < 20) {
        _hasMore = false;
      } else {
        _hasMore = true;
        _currentPage++;
      }

      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    _isLoadingMore = false;
    notifyListeners();
  }

  void searchProducts(BuildContext context, String query) {
    _currentPage = 1;
    _hasMore = true;
    loadProducts(context: context, refresh: true, searchQuery: query);
  }

  void loadMore(BuildContext context) {
    if (!_isLoading && !_isLoadingMore && _hasMore) {
      loadProducts(context: context);
    }
  }

  void clearSearch(BuildContext context) {
    if (_currentSearchQuery.isNotEmpty) {
      _currentSearchQuery = '';
      _currentPage = 1;
      _hasMore = true;
      loadProducts(context: context, refresh: true);
    }
  }
}