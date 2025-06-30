/// User Model - Represents a user in the e-commerce application
/// This model is used for authentication, profile management, and user data storage
class User {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? profileImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEmailVerified;

  /// Constructor for User model
  User({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.address,
    this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    this.isEmailVerified = false,
  });

  /// Factory constructor to create User from JSON data
  /// This is used when parsing data from Firestore or local storage
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      profileImage: json['profileImage'],
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
      isEmailVerified: json['isEmailVerified'] ?? false,
    );
  }

  /// Convert User to JSON format
  /// This is useful for storing in Firestore or local database
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isEmailVerified': isEmailVerified,
    };
  }

  /// Create a copy of User with some fields updated
  /// This is useful for updating user profile information
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    String? address,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  /// Override equality operator to compare users
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  /// Override hashCode for proper comparison
  @override
  int get hashCode => id.hashCode;

  /// String representation of User
  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name)';
  }
}
