import 'package:bubble_tea/models/shop.dart';
import 'package:bubble_tea/views/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_page.dart';
import 'views/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
