import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/cart_product_model.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/providers/cart.dart';
import 'package:e_commerce_app_riverpod/widgets/qty_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartTile extends ConsumerWidget {
  final CartProduct product;
  const CartTile({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ref.read(cartProvider).removeFromCart(product);
            },
            backgroundColor: AppColors.transparent,
            foregroundColor: AppColors.flamingo,
            icon: Icons.delete_outline,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        width: 100.0.wp,
        height: 20.0.hp,
        decoration: BoxDecoration(
          color: AppColors.alabaster,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Container(
                height: 16.0.hp,
                width: 24.0.wp,
                decoration: BoxDecoration(
                  color: AppColors.linen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(product.product.imagePath),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0.hp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Quantity: ${ref.watch(cartProvider).getQty(product)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11.0.sp,
                      color: AppColors.schooner,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 14.0.wp,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            '\$${ref.read(cartProvider).getProductsPrice(product).toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0.wp,
                        ),
                        QtyChip(cProduct: product),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
