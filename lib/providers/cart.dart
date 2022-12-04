import 'package:e_commerce_app_riverpod/models/cart_product_model.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends ChangeNotifier {
  final List<CartProduct> cartProducts = [];
  final List<Product> addedProducts = [];

  void addToCart(Product product) {
    if (!addedProducts.contains(product)) {
      //!  we are adding the product for the first time:
      final CartProduct prdct = CartProduct(product: product);
      cartProducts.add(prdct);
      addedProducts.add(product);
      print('${product.toString()} added to cart');
      notifyListeners();
    }
  }

  void incrementQty(CartProduct cProduct) {
    for (final i in cartProducts) {
      if (i.uid == cProduct.uid && i.qty < 5) {
        cProduct.qty++;
        // print(cProduct.qty);
        notifyListeners();
      }
    }
  }

  void decrementQty(CartProduct cProduct) {
    for (final i in cartProducts) {
      if (i.uid == cProduct.uid && i.qty > 1) {
        cProduct.qty--;
        // print(cProduct.qty);
        notifyListeners();
      }
    }
  }

  String getQty(CartProduct cProduct) {
    String text = '';
    for (final i in cartProducts) {
      if (i.uid == cProduct.uid) {
        text = cProduct.qty.toString();
      }
    }
    return text;
  }

  int getProductsPrice(CartProduct cProduct) {
    return cProduct.qty * cProduct.product.price;
  }

  int getTotalPrice() {
    int total = 0;
    for (final i in cartProducts) {
      total += i.qty * i.product.price;
      print(total);
    }
    return total;
  }

  //todo ADD DELETE,
  //todo IF TRYING TO DECREMENT WHEN LESS THAN 1 ADD REMOVE,
  //todo IF MORE THAN 5 SHOW DIALOGBOX
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
