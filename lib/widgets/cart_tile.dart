import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/widgets/qty_chip.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset('assets/apple_watch.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apple Watch',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Size: 12',
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
                      Text(
                        '\$ 30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0.sp,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10.0.wp,
                      ),
                      QtyChip(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
