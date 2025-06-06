import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/models/shop.dart';
import 'package:minimart_ecommerce_preview_app/screens/cart_page.dart';
import 'package:minimart_ecommerce_preview_app/screens/homepage.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Shop(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}


