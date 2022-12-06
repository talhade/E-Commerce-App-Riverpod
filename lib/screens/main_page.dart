import 'package:e_commerce_app_riverpod/core/constants/colors.dart';
import 'package:e_commerce_app_riverpod/screens/account_page.dart';
import 'package:e_commerce_app_riverpod/screens/cart_page.dart';
import 'package:e_commerce_app_riverpod/screens/favorites_page.dart';
import 'package:e_commerce_app_riverpod/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
          child: GNav(
            onTabChange: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: AppColors.white,
            gap: 8,
            tabBorderRadius: 15,
            color: AppColors.schooner,
            activeColor: AppColors.flamingo,
            tabBackgroundColor: AppColors.flamingo.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
