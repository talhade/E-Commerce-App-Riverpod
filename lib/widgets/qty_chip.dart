import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class QtyChip extends StatelessWidget {
  const QtyChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0.hp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              size: 10.0.sp,
              color: AppColors.flamingo,
            ),
          ),
          Text(
            '1',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 10.0.sp,
              color: AppColors.flamingo,
            ),
          ),
        ],
      ),
    );
  }
}
