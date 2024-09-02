import 'package:coffee_shop/screens/get_started.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/screens/product_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/home': (context) => const HomeScreen(),
        '/recipes': (context) => ProductDetailsScreen(title: 'Product Details'),
      },
    );
  }
}
