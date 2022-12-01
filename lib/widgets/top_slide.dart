import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSlide extends StatelessWidget {
  const TopSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return SlideCard(
          index: index,
        );
      },
    );
  }
}

class SlideCard extends StatelessWidget {
  final int index;
  const SlideCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0.wp),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: generateGradient(index)),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

List<Color> generateGradient(int index) {
  List<Color> gradientColors = [];
  if (index == 0) {
    gradientColors = const [
      Color.fromARGB(255, 250, 146, 72),
      Color.fromARGB(255, 244, 67, 54)
    ];
  } else if (index == 1) {
    gradientColors = const [
      Color.fromARGB(255, 131, 184, 228),
      Color.fromARGB(255, 15, 129, 223)
    ];
  } else {
    gradientColors = const [
      Color.fromARGB(255, 157, 228, 159),
      Color.fromARGB(255, 62, 199, 67)
    ];
  }

  return gradientColors;
}
