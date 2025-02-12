import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Widgets/category_grid_item.dart';
import 'package:healthy_meals_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(context) {
    // if you are building a multi screen app then every screen should use a scaffold widget to return
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        // creates a  grid view element with two columns
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(16),
        children: [
          // availbalbleCategories.map(category) =>( CategoryGridItem(catgory: category)).toList();  we can also use map
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
