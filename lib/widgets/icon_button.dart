import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class IconButtonWithBg extends StatelessWidget {
  final IconData icon;
  const IconButtonWithBg({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: AppColors.alabaster,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 7.0.wp,
          color: AppColors.black,
        ),
      ),
    );
  }
}
