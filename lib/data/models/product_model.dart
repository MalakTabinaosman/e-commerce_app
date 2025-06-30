/// Product Model - Represents a product in the e-commerce application
/// This model maps to the data structure returned by the FakeStore API
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  /// Constructor for Product model
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  /// Factory constructor to create Product from JSON data
  /// This is used when parsing API responses
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: Rating.fromJson(json['rating'] ?? {}),
    );
  }

  /// Convert Product to JSON format
  /// This is useful for storing in local database or sending to API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  /// Create a copy of Product with some fields updated
  /// This is useful for creating modified versions of a product
  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  /// Override equality operator to compare products
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  /// Override hashCode for proper comparison
  @override
  int get hashCode => id.hashCode;

  /// String representation of Product
  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, category: $category)';
  }
}

/// Rating Model - Represents the rating information for a product
class Rating {
  final double rate;
  final int count;

  /// Constructor for Rating model
  Rating({required this.rate, required this.count});

  /// Factory constructor to create Rating from JSON data
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] ?? 0.0).toDouble(),
      count: json['count'] ?? 0,
    );
  }

  /// Convert Rating to JSON format
  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }

  /// Create a copy of Rating with some fields updated
  Rating copyWith({double? rate, int? count}) {
    return Rating(rate: rate ?? this.rate, count: count ?? this.count);
  }

  /// Override equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Rating && other.rate == rate && other.count == count;
  }

  /// Override hashCode
  @override
  int get hashCode => rate.hashCode ^ count.hashCode;

  /// String representation of Rating
  @override
  String toString() {
    return 'Rating(rate: $rate, count: $count)';
  }
}
