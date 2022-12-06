import 'package:e_commerce_app_riverpod/core/constants/app_strings.dart';
import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/core/constants/icons.dart';
import 'package:e_commerce_app_riverpod/models/product_model.dart';
import 'package:e_commerce_app_riverpod/providers/product.dart';
import 'package:e_commerce_app_riverpod/screens/details_page.dart';
import 'package:e_commerce_app_riverpod/widgets/category_view.dart';
import 'package:e_commerce_app_riverpod/widgets/icon_button.dart';
import 'package:e_commerce_app_riverpod/widgets/product_card.dart';
import 'package:e_commerce_app_riverpod/widgets/top_category_title.dart';
import 'package:e_commerce_app_riverpod/widgets/top_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_riverpod/core/utils/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.0.hp,
        actions: [
          Padding(
            padding: EdgeInsets.all(2.0.wp),
            child: IconButtonWithBg(
              icon: AppIcons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloText(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const TopSlide(),
                ),
              ),
              const TopCategoryTitle(),
              SizedBox(
                height: 10.0.hp,
                child: const CategoryView(),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: ref.watch(productProvider).length,
                itemBuilder: (context, index) {
                  Product product =
                      ref.watch(productProvider).getProduct(index);

                  return Consumer(
                    builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: product),
                        )),
                        child: ProductCard(
                          product: product,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.hello,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20.0.sp,
              color: AppColors.black),
        ),
        Text(
          Strings.letsGetSomethings,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.0.sp,
            color: AppColors.black.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
