import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontFamily: "loto",
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
                titleMedium:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        home: const HomePage(),
      ),
    );
  }
}
