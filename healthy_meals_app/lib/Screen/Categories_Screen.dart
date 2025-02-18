import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Widgets/category_grid_item.dart';
import 'package:healthy_meals_app/data/dummy_data.dart';
import 'package:healthy_meals_app/Screen/meals_screen.dart';
import 'package:healthy_meals_app/Models/category.dart';
import 'package:healthy_meals_app/Models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  //adding animation to the categories screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  //lets add a function to push a screen in to the available stack of screens
  void _selectCategory(BuildContext context, Category category) {
    //now we want to get a list of meals with A Category of category

    final filteredMeals = widget.availableMeals
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
