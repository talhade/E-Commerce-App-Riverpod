// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import 'package:e_commerce_app_riverpod/models/product_model.dart';

class CartProduct {
  final String uid;
  final Product product;
  int qty;

  CartProduct({String? uid, required this.product, this.qty = 1})
      : uid = uid ?? const Uuid().v4();

  @override
  String toString() => 'CartProduct(uid: $uid, product: $product, qty: $qty)';

  CartProduct copyWith({
    String? uid,
    Product? product,
    int? qty,
  }) {
    return CartProduct(
      uid: uid ?? this.uid,
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) {
      return true;
    }

    return other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
