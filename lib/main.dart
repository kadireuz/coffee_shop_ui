import 'package:coffee_shop/screens/get_started.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/screens/product_details.dart';
import 'package:coffee_shop/screens/coffee_shop_details.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
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
        '/product-details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailsScreen(
            title: args['title'],
            description: args['description'],
            image: args['image'],
            price: args['price'],
            ingredients: List<String>.from(args['ingredients']),
            preparation: args['preparation'],
          );
        },
        '/shop-details': (context) {
          final shop = ModalRoute.of(context)?.settings.arguments as CoffeeShop;
          return CoffeeShopDetailsScreen(shop: shop);
        },
      },
    );
  }
}
