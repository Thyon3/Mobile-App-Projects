import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Widgets/category_grid_item.dart';
import 'package:healthy_meals_app/data/dummy_data.dart';
import 'package:healthy_meals_app/Screen/meals_screen.dart';
import 'package:healthy_meals_app/Models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //lets add a function to push a screen in to the available stack of screens
  // we want to display hte meal details in each category so on _selectcategory function we accept the type of category that was tapped
  void _selectCategory(BuildContext context, Category category) {
    //now we want to get a list of meals with A Category of category

    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(context) {
    // if you are building a multi screen app then every screen should use a scaffold widget to return
    return GridView(
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
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
