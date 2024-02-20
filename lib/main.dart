import 'package:ecommerce_exam/view/screens/cartscreen.dart';
import 'package:ecommerce_exam/view/screens/homescreen.dart';
import 'package:ecommerce_exam/view/screens/productscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => HomeScreen(),
        '/product' : (context) => ProductScreen(),
        '/cart' : (context) => CartScreen(),
      },
    );
  }
}
