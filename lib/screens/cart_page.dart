import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/cart_product_model.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/providers/cart.dart';
import 'package:e_commerce_app_riverpod/widgets/cart_tile.dart';
import 'package:e_commerce_app_riverpod/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartProduct> cart = ref.watch(cartProvider).cartProducts;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.myCart,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17.0.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.0.hp),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final CartProduct _prd = cart[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0.hp),
                    child: CartTile(
                      product: _prd,
                    ),
                  );
                },
              ),
            ),
            Container(
              color: AppColors.white,
              width: 100.0.wp,
              height: 10.0.hp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Strings.total}:',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0.sp,
                    ),
                  ),
                  Text(
                    '\$${ref.watch(cartProvider).getTotalPrice().toString()}',
                    style: TextStyle(
                      color: AppColors.schooner,
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            WideButton(
              text: 'Buy Now',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
