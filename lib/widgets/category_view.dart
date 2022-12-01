import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:e_commerce_app_riverpod/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: generatePadding(index),
          child: IconButtonWithBg(icon: generateIcon(index)),
        );
      },
    );
  }
}

generateIcon(int index) {
  if (index == 0) {
    return Icons.watch_outlined;
  } else if (index == 1) {
    return Icons.abc;
  } else if (index == 2) {
    return Icons.ac_unit;
  } else if (index == 3) {
    return Icons.add_alarm_outlined;
  } else if (index == 4) {
    return Icons.add_to_queue;
  } else if (index == 5) {
    return Icons.wine_bar;
  } else {
    return Icons.water_drop_outlined;
  }
}

generatePadding(int index) {
  if (index == 0) {
    return EdgeInsets.only(right: 5.0.wp);
  } else if (index == 6) {
    return EdgeInsets.only(left: 5.0.wp);
  } else {
    return EdgeInsets.symmetric(horizontal: 5.0.wp);
  }
}
