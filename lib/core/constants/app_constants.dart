/// App Constants - Contains all static values used throughout the application
class AppConstants {
  // App Information
  static const String appName = 'ShopEase';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String productsEndpoint = '/products';
  static const String categoriesEndpoint = '/products/categories';
  
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String ordersCollection = 'orders';
  static const String cartCollection = 'cart';
  static const String favoritesCollection = 'favorites';
  
  // Shared Preferences Keys
  static const String themeKey = 'theme_mode';
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String onboardingCompletedKey = 'onboarding_completed';
  
  // Database Configuration
  static const String databaseName = 'shopease.db';
  static const int databaseVersion = 1;
  
  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultIconSize = 24.0;
  
  // Validation Rules
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  
  // Error Messages
  static const String networkErrorMessage = 'No internet connection. Please check your connection and try again.';
  static const String generalErrorMessage = 'Something went wrong. Please try again.';
  static const String authErrorMessage = 'Authentication failed. Please check your credentials.';
} 