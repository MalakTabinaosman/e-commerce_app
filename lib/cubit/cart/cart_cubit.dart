import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/product_model.dart';
import '../../data/services/database_service.dart';

/// Cart State - Represents the different states of cart data
/// This class defines all possible states for cart-related operations
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

/// Cart Initial State - The initial state when the app starts
class CartInitial extends CartState {}

/// Cart Loading State - When cart items are being loaded from database
class CartLoading extends CartState {}

/// Cart Loaded State - When cart items have been successfully loaded
class CartLoaded extends CartState {
  final List<CartItem> items;
  final double totalPrice;
  final int itemCount;

  const CartLoaded({
    required this.items,
    required this.totalPrice,
    required this.itemCount,
  });

  @override
  List<Object?> get props => [items, totalPrice, itemCount];

  /// Create a copy of CartLoaded with updated values
  CartLoaded copyWith({
    List<CartItem>? items,
    double? totalPrice,
    int? itemCount,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}

/// Cart Error State - When an error occurs while managing cart
class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Cart Event - Represents the different events that can be triggered
/// This class defines all possible events for cart-related operations
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Load Cart Event - Triggers loading of cart items from database
class LoadCart extends CartEvent {}

/// Add To Cart Event - Adds a product to the cart
class AddToCart extends CartEvent {
  final CartItem cartItem;

  const AddToCart(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

/// Update Cart Item Quantity Event - Updates the quantity of a cart item
class UpdateCartItemQuantity extends CartEvent {
  final String cartItemId;
  final int quantity;

  const UpdateCartItemQuantity(this.cartItemId, this.quantity);

  @override
  List<Object?> get props => [cartItemId, quantity];
}

/// Remove From Cart Event - Removes an item from the cart
class RemoveFromCart extends CartEvent {
  final String cartItemId;

  const RemoveFromCart(this.cartItemId);

  @override
  List<Object?> get props => [cartItemId];
}

/// Clear Cart Event - Removes all items from the cart
class ClearCart extends CartEvent {}

/// Cart Cubit - Manages the state for shopping cart operations
/// This cubit handles all cart-related business logic and state management
class CartCubit extends Cubit<CartState> {
  final DatabaseService _databaseService;
  final Uuid _uuid = const Uuid();

  /// Constructor - Initializes the cubit with database service
  CartCubit({required DatabaseService databaseService})
    : _databaseService = databaseService,
      super(CartInitial());

  /// Load cart items from local database
  /// This method fetches all cart items and calculates totals
  Future<void> loadCart() async {
    try {
      // Emit loading state
      emit(CartLoading());

      // Fetch cart items from database
      final items = await _databaseService.getCartItems();

      // Calculate total price and item count
      final totalPrice = _calculateTotalPrice(items);
      final itemCount = _calculateItemCount(items);

      // Emit loaded state
      emit(
        CartLoaded(items: items, totalPrice: totalPrice, itemCount: itemCount),
      );
    } catch (e) {
      // Emit error state if something goes wrong
      emit(CartError(e.toString()));
    }
  }

  /// Add a product to the cart
  /// This method either adds a new item or updates quantity if product already exists
  Future<void> addToCart(CartItem cartItem) async {
    try {
      // Check if product is already in cart
      final existingItem = await _databaseService.getCartItemByProductId(
        cartItem.product.id,
      );

      if (existingItem != null) {
        // Update quantity if product already exists
        final newQuantity = existingItem.quantity + cartItem.quantity;
        await _databaseService.updateCartItemQuantity(
          existingItem.id,
          newQuantity,
        );
      } else {
        // Add new item to cart
        await _databaseService.insertCartItem(cartItem);
      }

      // Reload cart to reflect changes
      await loadCart();
    } catch (e) {
      // Emit error state if something goes wrong
      emit(CartError(e.toString()));
    }
  }

  /// Update the quantity of a cart item
  /// This method updates the quantity and removes item if quantity becomes 0
  Future<void> updateCartItemQuantity(String cartItemId, int quantity) async {
    try {
      if (quantity <= 0) {
        // Remove item if quantity is 0 or negative
        await _databaseService.deleteCartItem(cartItemId);
      } else {
        // Update quantity
        await _databaseService.updateCartItemQuantity(cartItemId, quantity);
      }

      // Reload cart to reflect changes
      await loadCart();
    } catch (e) {
      // Emit error state if something goes wrong
      emit(CartError(e.toString()));
    }
  }

  /// Remove an item from the cart
  /// This method completely removes the item from the cart
  Future<void> removeFromCart(String cartItemId) async {
    try {
      // Remove item from database
      await _databaseService.deleteCartItem(cartItemId);

      // Reload cart to reflect changes
      await loadCart();
    } catch (e) {
      // Emit error state if something goes wrong
      emit(CartError(e.toString()));
    }
  }

  /// Clear all items from the cart
  /// This method removes all cart items
  Future<void> clearCart() async {
    try {
      // Clear all items from database
      await _databaseService.clearCart();

      // Emit empty cart state
      emit(const CartLoaded(items: [], totalPrice: 0.0, itemCount: 0));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(CartError(e.toString()));
    }
  }

  /// Create a cart item from a product
  /// This method creates a CartItem with a unique ID and current timestamp
  CartItem createCartItem({
    required int productId,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required double ratingRate,
    required int ratingCount,
    int quantity = 1,
  }) {
    // Create Product object
    final product = Product(
      id: productId,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: Rating(rate: ratingRate, count: ratingCount),
    );

    // Create CartItem with unique ID
    return CartItem(
      id: _uuid.v4(),
      product: product,
      quantity: quantity,
      addedAt: DateTime.now(),
    );
  }

  /// Check if a product is in the cart
  /// This method checks if a product exists in the current cart state
  bool isProductInCart(int productId) {
    final currentState = state;

    if (currentState is CartLoaded) {
      return currentState.items.any((item) => item.product.id == productId);
    }

    return false;
  }

  /// Get cart item by product ID
  /// This method returns the cart item for a specific product
  CartItem? getCartItemByProductId(int productId) {
    final currentState = state;

    if (currentState is CartLoaded) {
      try {
        return currentState.items.firstWhere(
          (item) => item.product.id == productId,
        );
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  /// Calculate total price of all cart items
  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (total, item) => total + item.totalPrice);
  }

  /// Calculate total number of items in cart
  int _calculateItemCount(List<CartItem> items) {
    return items.fold(0, (total, item) => total + item.quantity);
  }
}
