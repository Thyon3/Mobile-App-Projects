import 'package:flutter/material.dart';
import 'package:grocery_items_app/models/category.dart';

class GroceryItem {
  GroceryItem({
    required this.id,
    required this.category,
    required this.quantity,
    required this.name,
  });
  final String id;
  final String name;
  final int quantity;
  final Category category;
}
