import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/cart_product_model.dart';
import 'package:e_commerce_app_riverpod/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QtyChip extends ConsumerWidget {
  final CartProduct cProduct;
  const QtyChip({required this.cProduct, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 4.0.hp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              ref.read(cartProvider).decrementQty(cProduct);
            },
            icon: Icon(
              Icons.remove,
              size: 10.0.sp,
              color: AppColors.flamingo,
            ),
          ),
          SizedBox(
            width: 5.0.wp,
            child: Center(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.visible,
                ref.watch(cartProvider).getQty(cProduct),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(cartProvider).incrementQty(cProduct);
            },
            icon: Icon(
              Icons.add,
              size: 10.0.sp,
              color: AppColors.flamingo,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
