import 'package:e_commerce_app_riverpod/screens/cart_page.dart';
import 'package:e_commerce_app_riverpod/screens/details_page.dart';
import 'package:e_commerce_app_riverpod/screens/favorites_page.dart';
import 'package:e_commerce_app_riverpod/screens/home_page.dart';
import 'package:e_commerce_app_riverpod/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      home: const MainScreen(),
    );
  }
}
