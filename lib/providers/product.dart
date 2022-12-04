import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends ChangeNotifier {
  final List<Product> prdcts = allProducts;
  void updateFav(Product product) {
    for (final i in prdcts) {
      if (i.uid == product.uid) {
        product.isFavorite = !product.isFavorite;
        notifyListeners();
      }
    }
  }

  int get length => prdcts.length;

  int get favProductsLength =>
      prdcts.where((element) => element.isFavorite == true).length;

  Product getProduct(int index) {
    return prdcts[index];
  }

  bool getIsFav(Product product) {
    return product.isFavorite;
  }
}

final productProvider = ChangeNotifierProvider<ProductNotifier>((ref) {
  return ProductNotifier();
});
