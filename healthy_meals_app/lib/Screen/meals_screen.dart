import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Models/meal.dart';
import 'package:healthy_meals_app/Widgets/mainDrawer.dart';
import 'package:healthy_meals_app/Widgets/meal_item.dart';
import 'package:healthy_meals_app/Screen/meal_detail.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavourite,
  });

  final void Function(Meal meal) onToggleFavourite;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealDetail(
              meal: meal,
              onToggleFavourite: onToggleFavourite,
            )));
  }

  // we want to accept the meals list from our model meals
  final List<Meal> meals;
  // we also need the name or the title of hte category in which the meal is in
  final String? title;

  Widget build(context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMeal(meal, context);
              },
            ));

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Oww oh...You don't have any meals here ",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
