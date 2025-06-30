import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';
import '../../core/constants/app_constants.dart';

/// Database Service - Handles local database operations using Sqflite
/// This service manages cart items storage for offline access
class DatabaseService {
  static Database? _database;

  /// Get the database instance (singleton pattern)
  /// Creates the database if it doesn't exist
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the database
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the database and create tables
  Future<Database> _initDatabase() async {
    // Get the database path
    String path = join(await getDatabasesPath(), AppConstants.databaseName);

    // Open/create the database
    return await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// Create database tables
  Future<void> _onCreate(Database db, int version) async {
    // Create cart_items table
    await db.execute('''
      CREATE TABLE cart_items (
        id TEXT PRIMARY KEY,
        product_id INTEGER NOT NULL,
        product_title TEXT NOT NULL,
        product_price REAL NOT NULL,
        product_description TEXT NOT NULL,
        product_category TEXT NOT NULL,
        product_image TEXT NOT NULL,
        product_rating_rate REAL NOT NULL,
        product_rating_count INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        added_at TEXT NOT NULL
      )
    ''');
  }

  /// Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle future database schema changes here
    if (oldVersion < newVersion) {
      // Add migration logic here when needed
    }
  }

  /// Insert a cart item into the database
  Future<void> insertCartItem(CartItem cartItem) async {
    final db = await database;

    // Convert CartItem to database row
    final row = {
      'id': cartItem.id,
      'product_id': cartItem.product.id,
      'product_title': cartItem.product.title,
      'product_price': cartItem.product.price,
      'product_description': cartItem.product.description,
      'product_category': cartItem.product.category,
      'product_image': cartItem.product.image,
      'product_rating_rate': cartItem.product.rating.rate,
      'product_rating_count': cartItem.product.rating.count,
      'quantity': cartItem.quantity,
      'added_at': cartItem.addedAt.toIso8601String(),
    };

    // Insert the row, replacing if it already exists
    await db.insert(
      'cart_items',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get all cart items from the database
  Future<List<CartItem>> getCartItems() async {
    final db = await database;

    // Query all cart items, ordered by when they were added
    final List<Map<String, dynamic>> maps = await db.query(
      'cart_items',
      orderBy: 'added_at DESC',
    );

    // Convert database rows to CartItem objects
    return List.generate(maps.length, (i) {
      final map = maps[i];

      // Reconstruct the Product object
      final product = Product(
        id: map['product_id'],
        title: map['product_title'],
        price: map['product_price'],
        description: map['product_description'],
        category: map['product_category'],
        image: map['product_image'],
        rating: Rating(
          rate: map['product_rating_rate'],
          count: map['product_rating_count'],
        ),
      );

      // Create CartItem object
      return CartItem(
        id: map['id'],
        product: product,
        quantity: map['quantity'],
        addedAt: DateTime.parse(map['added_at']),
      );
    });
  }

  /// Update the quantity of a cart item
  Future<void> updateCartItemQuantity(String cartItemId, int quantity) async {
    final db = await database;

    // Update the quantity for the specified cart item
    await db.update(
      'cart_items',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [cartItemId],
    );
  }

  /// Delete a cart item from the database
  Future<void> deleteCartItem(String cartItemId) async {
    final db = await database;

    // Delete the cart item with the specified ID
    await db.delete('cart_items', where: 'id = ?', whereArgs: [cartItemId]);
  }

  /// Clear all cart items from the database
  Future<void> clearCart() async {
    final db = await database;

    // Delete all cart items
    await db.delete('cart_items');
  }

  /// Get the total number of items in the cart
  Future<int> getCartItemCount() async {
    final db = await database;

    // Count all cart items
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM cart_items',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Check if a product is already in the cart
  Future<CartItem?> getCartItemByProductId(int productId) async {
    final db = await database;

    // Query for cart item with the specified product ID
    final List<Map<String, dynamic>> maps = await db.query(
      'cart_items',
      where: 'product_id = ?',
      whereArgs: [productId],
    );

    if (maps.isEmpty) return null;

    // Convert the first result to CartItem
    final map = maps.first;

    // Reconstruct the Product object
    final product = Product(
      id: map['product_id'],
      title: map['product_title'],
      price: map['product_price'],
      description: map['product_description'],
      category: map['product_category'],
      image: map['product_image'],
      rating: Rating(
        rate: map['product_rating_rate'],
        count: map['product_rating_count'],
      ),
    );

    // Create CartItem object
    return CartItem(
      id: map['id'],
      product: product,
      quantity: map['quantity'],
      addedAt: DateTime.parse(map['added_at']),
    );
  }

  /// Close the database connection
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
