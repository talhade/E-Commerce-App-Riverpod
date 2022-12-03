// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:uuid/uuid.dart';

class Product {
  final String uid;
  final String name;
  final String imagePath;
  final String description;
  final int price;
  final int stars;
  bool isFavorite;

  Product({
    String? uid,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.stars,
    this.isFavorite = false,
  }) : uid = uid ?? const Uuid().v4();

  Product copyWith({
    String? uid,
    String? name,
    String? imagePath,
    String? description,
    int? price,
    int? stars,
    bool? isFavorite,
  }) {
    return Product(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() {
    return 'Product(uid: $uid, name: $name, imagePath: $imagePath, description: $description, price: $price, stars: $stars, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.uid == uid;
  }

  @override
  int get hashCode {
    return uid.hashCode;
  }
}

List<Product> allProducts = [
  Product(
    name: 'Apple Watch - Sr1',
    imagePath: 'assets/apple_watch.png',
    description: Strings.loremLong,
    price: 45,
    stars: 4,
  ),
  Product(
    name: 'Apple Watch - Sr2',
    imagePath: 'assets/apple_watch.png',
    description: Strings.loremLong,
    price: 50,
    stars: 5,
  ),
  Product(
    name: 'Mi Band 1',
    imagePath: 'assets/apple_watch.png',
    description: Strings.loremLong,
    price: 20,
    stars: 3,
  ),
  Product(
    name: 'Mi Band 2',
    imagePath: 'assets/apple_watch.png',
    description: Strings.loremLong,
    price: 32,
    stars: 4,
  ),
];
