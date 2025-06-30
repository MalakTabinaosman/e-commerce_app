import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';
import '../../data/services/api_service.dart';

/// Product State - Represents the different states of product data
/// This class defines all possible states for product-related operations
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Product Initial State - The initial state when the app starts
class ProductInitial extends ProductState {}

/// Product Loading State - When products are being fetched from API
class ProductLoading extends ProductState {}

/// Product Loaded State - When products have been successfully loaded
class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<String> categories;
  final String? selectedCategory;

  const ProductLoaded({
    required this.products,
    required this.categories,
    this.selectedCategory,
  });

  @override
  List<Object?> get props => [products, categories, selectedCategory];

  /// Create a copy of ProductLoaded with updated values
  ProductLoaded copyWith({
    List<Product>? products,
    List<String>? categories,
    String? selectedCategory,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

/// Product Error State - When an error occurs while fetching products
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Product Search State - When products are being searched
class ProductSearching extends ProductState {
  final List<Product> searchResults;
  final String query;

  const ProductSearching({required this.searchResults, required this.query});

  @override
  List<Object?> get props => [searchResults, query];
}

/// Product Event - Represents the different events that can be triggered
/// This class defines all possible events for product-related operations
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

/// Load Products Event - Triggers loading of all products
class LoadProducts extends ProductEvent {}

/// Load Products By Category Event - Triggers loading products for a specific category
class LoadProductsByCategory extends ProductEvent {
  final String category;

  const LoadProductsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

/// Search Products Event - Triggers product search
class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}

/// Clear Search Event - Clears the search results
class ClearSearch extends ProductEvent {}

/// Product Cubit - Manages the state for products, categories, and search
/// This cubit handles all product-related business logic and state management
class ProductCubit extends Cubit<ProductState> {
  final ApiService _apiService;

  /// Constructor - Initializes the cubit with API service
  ProductCubit({required ApiService apiService})
    : _apiService = apiService,
      super(ProductInitial());

  /// Load all products and categories
  /// This method fetches both products and categories from the API
  Future<void> loadProducts() async {
    try {
      // Emit loading state
      emit(ProductLoading());

      // Fetch products and categories concurrently
      final productsFuture = _apiService.getProducts();
      final categoriesFuture = _apiService.getCategories();

      // Wait for both requests to complete
      final results = await Future.wait([productsFuture, categoriesFuture]);

      final products = results[0] as List<Product>;
      final categories = results[1] as List<String>;

      // Emit loaded state with products and categories
      emit(ProductLoaded(products: products, categories: categories));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ProductError(e.toString()));
    }
  }

  /// Load products for a specific category
  /// This method filters products by the selected category
  Future<void> loadProductsByCategory(String category) async {
    try {
      // Emit loading state
      emit(ProductLoading());

      // Fetch products for the specific category
      final products = await _apiService.getProductsByCategory(category);

      // Get current state to preserve categories
      final currentState = state;
      List<String> categories = [];

      if (currentState is ProductLoaded) {
        categories = currentState.categories;
      } else {
        // If no categories loaded yet, fetch them
        categories = await _apiService.getCategories();
      }

      // Emit loaded state with filtered products
      emit(
        ProductLoaded(
          products: products,
          categories: categories,
          selectedCategory: category,
        ),
      );
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ProductError(e.toString()));
    }
  }

  /// Search products by query
  /// This method searches through all products for matching titles
  Future<void> searchProducts(String query) async {
    try {
      // Don't search if query is empty
      if (query.trim().isEmpty) {
        emit(const ProductSearching(searchResults: [], query: ''));
        return;
      }

      // Get current state to access products
      final currentState = state;
      List<Product> allProducts = [];

      if (currentState is ProductLoaded) {
        allProducts = currentState.products;
      } else {
        // If no products loaded, fetch them first
        allProducts = await _apiService.getProducts();
      }

      // Search products locally (case-insensitive)
      final searchResults = allProducts.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList();

      // Emit searching state with results
      emit(ProductSearching(searchResults: searchResults, query: query));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ProductError(e.toString()));
    }
  }

  /// Clear search results and return to normal state
  void clearSearch() {
    // Get current state to preserve products and categories
    final currentState = state;

    if (currentState is ProductLoaded) {
      // Return to loaded state
      emit(currentState);
    } else if (currentState is ProductSearching) {
      // Load products again to return to normal state
      loadProducts();
    }
  }

  /// Get a specific product by ID
  /// This method fetches a single product from the API
  Future<Product?> getProductById(int id) async {
    try {
      return await _apiService.getProductById(id);
    } catch (e) {
      // Return null if product not found or error occurs
      return null;
    }
  }

  /// Get filtered products by category from current state
  /// This method filters products locally without making API calls
  List<Product> getProductsByCategory(String category) {
    final currentState = state;

    if (currentState is ProductLoaded) {
      return currentState.products.where((product) {
        return product.category.toLowerCase() == category.toLowerCase();
      }).toList();
    }

    return [];
  }
}
