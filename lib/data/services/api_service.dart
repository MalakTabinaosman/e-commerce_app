import 'package:dio/dio.dart';
import '../models/product_model.dart';
import '../../core/constants/app_constants.dart';

/// API Service - Handles all HTTP requests to external APIs
/// This service uses Dio for network requests and provides methods for fetching products
class ApiService {
  late final Dio _dio;

  /// Constructor - Initializes Dio with base configuration
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging and error handling
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print(obj),
      ),
    );
  }

  /// Fetch all products from the API
  /// Returns a list of Product objects
  Future<List<Product>> getProducts() async {
    try {
      // Make GET request to products endpoint
      final response = await _dio.get(AppConstants.productsEndpoint);

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse the response data as a list
        final List<dynamic> data = response.data;

        // Convert each item to Product object
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        // Throw exception if response is not successful
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Request timeout. Please try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Fetch products by category
  /// Returns a list of Product objects filtered by category
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      // Make GET request to category-specific endpoint
      final response = await _dio.get(
        '${AppConstants.productsEndpoint}/category/$category',
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse the response data as a list
        final List<dynamic> data = response.data;

        // Convert each item to Product object
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        // Throw exception if response is not successful
        throw Exception(
          'Failed to load products for category $category: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Request timeout. Please try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Fetch a single product by ID
  /// Returns a Product object
  Future<Product> getProductById(int id) async {
    try {
      // Make GET request to specific product endpoint
      final response = await _dio.get('${AppConstants.productsEndpoint}/$id');

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse the response data and convert to Product object
        return Product.fromJson(response.data);
      } else {
        // Throw exception if response is not successful
        throw Exception(
          'Failed to load product with ID $id: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Request timeout. Please try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Fetch all available categories
  /// Returns a list of category names
  Future<List<String>> getCategories() async {
    try {
      // Make GET request to categories endpoint
      final response = await _dio.get(AppConstants.categoriesEndpoint);

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse the response data as a list of strings
        final List<dynamic> data = response.data;
        return data.map((category) => category.toString()).toList();
      } else {
        // Throw exception if response is not successful
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Request timeout. Please try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Search products by title
  /// Returns a list of Product objects that match the search query
  Future<List<Product>> searchProducts(String query) async {
    try {
      // First get all products
      final allProducts = await getProducts();

      // Filter products by title (case-insensitive)
      return allProducts.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } catch (e) {
      // Re-throw the error
      throw Exception('Failed to search products: $e');
    }
  }
}
