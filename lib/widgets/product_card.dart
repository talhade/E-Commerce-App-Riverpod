import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0.hp,
        width: 50.0.wp,
        decoration: BoxDecoration(
          color: AppColors.alabaster,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    backgroundColor: AppColors.white,
                    label: Text(
                      Strings.discount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return IconButton(
                        onPressed: () {
                          ref.read(productProvider).updateFav(product);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: ref.watch(productProvider).getIsFav(product)
                              ? AppColors.flamingo
                              : AppColors.schooner,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.0.hp,
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 5.0.hp,
                  width: 40.0.wp,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          product.name,
                          style: TextStyle(
                            fontSize: 10.0.sp,
                          ),
                        ),
                        Text(
                          '\$ ${product.price.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 10.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
