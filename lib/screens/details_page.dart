import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerWidget {
  final Product product;
  const DetailsScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50.0.hp,
                  decoration: BoxDecoration(
                    color: AppColors.alabaster,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0.wp),
                      bottomRight: Radius.circular(100.0.wp),
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 60.0.wp,
                      child: Image.asset(product.imagePath),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5.0.wp, vertical: 1.0.wp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 20.0.sp),
                      ),
                      Text(
                        '⭐' * product.stars,
                        style: TextStyle(fontSize: 13.0.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${product.price}',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              Strings.availableInStoc,
                              style: TextStyle(
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        Strings.about,
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                        child: Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      WideButton(
                        text: Strings.addToCart,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0.wp,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: AppColors.black,
                    size: 22.0.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
