import 'package:e_commerce_app_riverpod/models/product_model.dart';

class CartProduct {
  final Product product;
  final int qty;

  CartProduct({required this.product, this.qty = 1});
}
