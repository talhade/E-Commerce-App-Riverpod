// import 'package:e_commerce_app_riverpod/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductsNotifier extends StateNotifier<List<Product>> {
//   ProductsNotifier() : super(allProducts);

//   void updateFav(Product product, bool isFavorite) {
//     state = state
//         .map((e) =>
//             e.uid == product.uid ? e.copyWith(isFavorite: isFavorite) : e)
//         .toList();
//   }

//   int get length => allProducts.length;
//   Product getProduct(int index) => allProducts[index];
// }

// final favoriteStatProvider = StateProvider(
//   (ref) {
//     return FavoriteStat.all;
//   },
// );

// final allProductsProvider =
//     StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
//   return ProductsNotifier();
// });

// final favoriteProductsProvider = Provider<Iterable<Product>>((ref) {
//   return ref.watch(allProductsProvider).where((element) => element.isFavorite);
// });

// enum FavoriteStat {
//   all,
//   favorite,
// }

// class Product1Notifier extends ChangeNotifier {
//   final List<Product> products = allProducts;

//   int get length => products.length;
//   Product getProduct(int index) => products[index];

//   void updateFav(Product product) {
//     for (final i in products) {
//       if (i.uid == product.uid) {
//         i.isFavorite = !i.isFavorite;
//         notifyListeners();
//       }
//     }
//   }
// }

// final product1Provider = ChangeNotifierProvider<Product1Notifier>((ref) {
//   return Product1Notifier();
// });
