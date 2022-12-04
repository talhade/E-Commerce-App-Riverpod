import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/providers/product.dart';
import 'package:e_commerce_app_riverpod/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> favPrdcts = ref
        .watch(productProvider)
        .prdcts
        .where((element) => element.isFavorite == true)
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(
          builder: (context, ref, child) {
            return Text(
              'You have ${ref.watch(productProvider).favProductsLength.toString()} favorites on your list',
              style: TextStyle(color: AppColors.black),
            );
          },
        ),
      ),

      // appBar: AppBar(
      // title: Text(
      //     'You have: ${ref.watch(productProvider).favProductsLength.toString()} favorites'),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: favPrdcts.length,
          itemBuilder: (context, index) {
            final _prd = favPrdcts[index];
            return ProductCard(product: _prd);
          },
        ),
      ),
    );
  }
}
