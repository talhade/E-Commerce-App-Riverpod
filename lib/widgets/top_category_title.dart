import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TopCategoryTitle extends StatelessWidget {
  const TopCategoryTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Strings.topCategories,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13.0.sp,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            Strings.seeAll.toUpperCase(),
            style: TextStyle(
              color: AppColors.flamingo,
              fontWeight: FontWeight.bold,
              fontSize: 10.0.sp,
            ),
          ),
        ),
      ],
    );
  }
}
