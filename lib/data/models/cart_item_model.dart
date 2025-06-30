import 'product_model.dart';

/// Cart Item Model - Represents an item in the shopping cart
/// This model includes the product and quantity information
class CartItem {
  final String id;
  final Product product;
  final int quantity;
  final DateTime addedAt;

  /// Constructor for CartItem model
  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.addedAt,
  });

  /// Factory constructor to create CartItem from JSON data
  /// This is used when loading cart items from local database
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      product: Product.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] ?? 1,
      addedAt: DateTime.parse(
        json['addedAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  /// Convert CartItem to JSON format
  /// This is useful for storing in local database
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  /// Create a copy of CartItem with some fields updated
  /// This is useful for updating quantity or other properties
  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  /// Calculate the total price for this cart item
  /// Returns the product price multiplied by quantity
  double get totalPrice => product.price * quantity;

  /// Check if this cart item is the same as another
  /// Two cart items are considered the same if they have the same product
  bool isSameProduct(CartItem other) {
    return product.id == other.product.id;
  }

  /// Override equality operator to compare cart items
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem && other.id == id;
  }

  /// Override hashCode for proper comparison
  @override
  int get hashCode => id.hashCode;

  /// String representation of CartItem
  @override
  String toString() {
    return 'CartItem(id: $id, product: ${product.title}, quantity: $quantity, totalPrice: $totalPrice)';
  }
}
