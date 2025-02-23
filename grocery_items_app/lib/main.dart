import 'package:flutter/material.dart';
import 'package:grocery_items_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(context) {
    return MaterialApp(
      title: 'Thyon Groceries',
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 147, 227, 250),
              brightness: Brightness.dark,
              surface: Color.fromARGB(255, 42, 51, 59)),
          scaffoldBackgroundColor: Color.fromARGB(250, 50, 58, 60)),
      home: GroceryList(),
    );
  }
}
